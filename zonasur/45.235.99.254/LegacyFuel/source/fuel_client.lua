ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


local isNearPump = false
local isFueling = false
local currentFuel = 0.0
local currentCost = 0.0
local currentCash = 1000
local fuelSynced = false
local inBlacklisted = false

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

function ManageFuelUsage(vehicle)
	if not DecorExistOn(vehicle, Config.FuelDecor) then
		SetFuel(vehicle, math.random(200, 800) / 10)
	elseif not fuelSynced then
		SetFuel(vehicle, GetFuel(vehicle))

		fuelSynced = true
	end

	if IsVehicleEngineOn(vehicle) then
		SetFuel(vehicle, GetVehicleFuelLevel(vehicle) - Config.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (Config.Classes[GetVehicleClass(vehicle)] or 1.0) / 10)
	end
end

Citizen.CreateThread(function()
	DecorRegister(Config.FuelDecor, 1)

	for index = 1, #Config.Blacklist do
		if type(Config.Blacklist[index]) == 'string' then
			Config.Blacklist[GetHashKey(Config.Blacklist[index])] = true
		else
			Config.Blacklist[Config.Blacklist[index]] = true
		end
	end

	for index = #Config.Blacklist, 1, -1 do
		table.remove(Config.Blacklist, index)
	end

	while true do
		Citizen.Wait(1000)

		local ped = PlayerPedId()

		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)

			if Config.Blacklist[GetEntityModel(vehicle)] then
				inBlacklisted = true
			else
				inBlacklisted = false
			end

			if not inBlacklisted and GetPedInVehicleSeat(vehicle, -1) == ped then
				ManageFuelUsage(vehicle)
			end
		else
			if fuelSynced then
				fuelSynced = false
			end

			if inBlacklisted then
				inBlacklisted = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(250)

		local pumpObject, pumpDistance = FindNearestFuelPump()

		if pumpDistance < 2.5 then
			isNearPump = pumpObject

			if Config.UseESX then
				local playerData = ESX.GetPlayerData()
				for i=1, #playerData.accounts, 1 do
					if playerData.accounts[i].name == 'money' then
						currentCash = playerData.accounts[i].money
						break
					end
				end
			end
		else
			isNearPump = false

			Citizen.Wait(math.ceil(pumpDistance * 20))
		end
	end
end)

AddEventHandler('fuel:startFuelUpTick', function(pumpObject, ped, vehicle)
	currentFuel = GetVehicleFuelLevel(vehicle)

	while isFueling do
		Citizen.Wait(500)

		local oldFuel = DecorGetFloat(vehicle, Config.FuelDecor)
		local fuelToAdd = math.random(10, 20) / 10.0
		local extraCost = fuelToAdd / 1.5 * Config.CostMultiplier

		if not pumpObject then
			if GetAmmoInPedWeapon(ped, 883325847) - fuelToAdd * 100 >= 0 then
				currentFuel = oldFuel + fuelToAdd

				SetPedAmmo(ped, 883325847, math.floor(GetAmmoInPedWeapon(ped, 883325847) - fuelToAdd * 100))
			else
				isFueling = false
			end
		else
			currentFuel = oldFuel + fuelToAdd
		end

		if currentFuel > 100.0 then
			currentFuel = 100.0
			isFueling = false
		end

		currentCost = currentCost + extraCost

		if currentCash >= currentCost then
			SetFuel(vehicle, currentFuel)
		else
			isFueling = false
		end
	end

	if pumpObject then
		ESX.TriggerServerCallback('LegacyFuel:check', function(pay)
			if pay then
				TriggerServerEvent('fuel:pay', currentCost, pay)
				currentCost = 0.0
			end
		end)
	else
		currentCost = 0.0
	end
	
	--Wait(2000)
	--currentCost = 0.0
end)

AddEventHandler('fuel:refuelFromPump', function(pumpObject, ped, vehicle)
	TaskTurnPedToFaceEntity(ped, vehicle, 1000)
	Citizen.Wait(1000)
	SetCurrentPedWeapon(ped, -1569615261, true)
	LoadAnimDict("timetable@gardener@filling_can")
	TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)

	TriggerEvent('fuel:startFuelUpTick', pumpObject, ped, vehicle)

	while isFueling do
		for _, controlIndex in pairs(Config.DisableKeys) do
			DisableControlAction(0, controlIndex)
		end

		local vehicleCoords = GetEntityCoords(vehicle)

		if pumpObject then
			local stringCoords = GetEntityCoords(pumpObject)
			local extraString = ""

			if Config.UseESX then
				extraString = "\n" .. Config.Strings.TotalCost .. ": ~g~$" .. Round(currentCost, 1)
			end

			DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.CancelFuelingPump .. extraString)
			DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, Round(currentFuel, 1) .. "%")
		else
			DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, Config.Strings.CancelFuelingJerryCan .. "\nBidon: ~g~" .. Round(GetAmmoInPedWeapon(ped, 883325847) / 4500 * 100, 1) .. "% | Vehiculo: " .. Round(currentFuel, 1) .. "%")
		end

		if not IsEntityPlayingAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 3) then
			TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
		end

		if IsControlJustReleased(0, 38) or DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) or (isNearPump and GetEntityHealth(pumpObject) <= 0) then
			isFueling = false
		end

		Citizen.Wait(0)
	end

	ClearPedTasks(ped)
	RemoveAnimDict("timetable@gardener@filling_can")
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()

		if not isFueling and ((isNearPump and GetEntityHealth(isNearPump) > 0) or (GetSelectedPedWeapon(ped) == 883325847 and not isNearPump)) then
			if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped), -1) == ped then
				local pumpCoords = GetEntityCoords(isNearPump)

				DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, Config.Strings.ExitVehicle)
			else
				local vehicle = GetPlayersLastVehicle()
				local vehicleCoords = GetEntityCoords(vehicle)

				if DoesEntityExist(vehicle) and GetDistanceBetweenCoords(GetEntityCoords(ped), vehicleCoords) < 2.5 then
					if not DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) then
						local stringCoords = GetEntityCoords(isNearPump)
						local canFuel = true

						if GetSelectedPedWeapon(ped) == 883325847 then
							stringCoords = vehicleCoords

							if GetAmmoInPedWeapon(ped, 883325847) < 100 then
								canFuel = false
							end
						end

						if GetVehicleFuelLevel(vehicle) < 95 and canFuel then
							if currentCash > 0 then
								DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.EToRefuel)

								if IsControlJustReleased(0, 38) then
									isFueling = true

									TriggerEvent('fuel:refuelFromPump', isNearPump, ped, vehicle)
									LoadAnimDict("timetable@gardener@filling_can")
								end
							else
								DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.NotEnoughCash)
							end
						elseif not canFuel then
							DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.JerryCanEmpty)
						else
							DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.FullTank)
						end
					end
				elseif isNearPump then
					local stringCoords = GetEntityCoords(isNearPump)

					if currentCash >= Config.JerryCanCost then
						if not HasPedGotWeapon(ped, 883325847) then
							DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.PurchaseJerryCan)

							if IsControlJustReleased(0, 38) then
								GiveWeaponToPed(ped, 883325847, 4500, false, true)
								
								ESX.TriggerServerCallback('LegacyFuel:check', function(pay)
									TriggerServerEvent('fuel:pay', Config.JerryCanCost, pay)
								end)
								--TriggerServerEvent('fuel:pay', Config.JerryCanCost)

								currentCash = ESX.GetPlayerData().money
							end
						else
							if Config.UseESX then
								local refillCost = Round(Config.RefillCost * (1 - GetAmmoInPedWeapon(ped, 883325847) / 4500))

								if refillCost > 0 then
									if currentCash >= refillCost then
										DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.RefillJerryCan .. refillCost)

										if IsControlJustReleased(0, 38) then
											ESX.TriggerServerCallback('LegacyFuel:check', function(pay)
												TriggerServerEvent('fuel:pay', refillCost, pay)
											end)
											--TriggerServerEvent('fuel:pay', refillCost)

											SetPedAmmo(ped, 883325847, 4500)
										end
									else
										DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.NotEnoughCashJerryCan)
									end
								else
									DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.JerryCanFull)
								end
							else
								DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.RefillJerryCan)

								if IsControlJustReleased(0, 38) then
									SetPedAmmo(ped, 883325847, 4500)
								end
							end
						end
					else
						DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Config.Strings.NotEnoughCash)
					end
				else
					Citizen.Wait(250)
				end
			end
		else
			Citizen.Wait(250)
		end

		Citizen.Wait(0)
	end
end)

if Config.ShowNearestGasStationOnly then
	Citizen.CreateThread(function()
		local currentGasBlip = 0

		while true do
			local coords = GetEntityCoords(PlayerPedId())
			local closest = 1000
			local closestCoords

			for k, v in pairs(Config.GasStations) do
				local dstcheck = GetDistanceBetweenCoords(coords, v.blip)

				if dstcheck < closest then
					closest = dstcheck
					closestCoords = v.blip
				end
			end

			if DoesBlipExist(currentGasBlip) then
				RemoveBlip(currentGasBlip)
			end

			currentGasBlip = CreateBlip(closestCoords)

			Citizen.Wait(10000)
		end
	end)
elseif Config.ShowAllGasStations then
	Citizen.CreateThread(function()
		for k, v in pairs(Config.GasStations) do
			if v.owner then
				CreateBlip(v.blip, true, k)
			else
				if v.blip then
					CreateBlip(v.blip, false, k)
				end
			end
		end
	end)
	
	Citizen.CreateThread(function()
		while true do
			local coords = GetEntityCoords(PlayerPedId())

			for k, v in pairs(Config.GasStations) do
				local distance = #(coords - v.blip)
				if distance < 5 then
					Drawing.draw3DText(v.blip.x, v.blip.y, v.blip.z, '~w~GAS Nº ~g~'..k, 1, 0.07, 0.07, 255, 255, 255, 215)
				end
				if v.owner and PlayerData.identifier == v.owner then
					local distance = #(coords - v.menu)
					if distance < 20 then
						DrawMarker(3, v.menu.x, v.menu.y, v.menu.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
						if distance < 1.5 and not isProcessing then
							Drawing.draw3DText(v.menu.x, v.menu.y, v.menu.z - 1.0, '~g~[E]~w~ para abrir menu ~g~DUEÑO~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
							if IsControlJustPressed(1, 38) then
								MenuJefe(k)
							end
						end
					end
				end
			end
			Citizen.Wait(0)
		end
	end)
end

function MenuJefe(gas)
	local options = {
        wash      = true,
    }

    ESX.UI.Menu.CloseAll()

	TriggerEvent('esx_society:openBossMenu_zs', 'gas'..gas, function(data, menu)
		menu.close()
	end,options)
end

if Config.EnableHUD then
	local function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
		SetTextFont(font)
		SetTextProportional(0)
		SetTextScale(sc, sc)
		N_0x4e096588b13ffeca(jus)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x - 0.1+w, y - 0.02+h)
	end

	local mph = 0
	local kmh = 0
	local fuel = 0
	local displayHud = false

	local x = 0.01135
	local y = 0.002

	Citizen.CreateThread(function()
		while true do
			local ped = PlayerPedId()

			if IsPedInAnyVehicle(ped) and not (Config.RemoveHUDForBlacklistedVehicle and inBlacklisted) then
				local vehicle = GetVehiclePedIsIn(ped)
				local speed = GetEntitySpeed(vehicle)

				mph = tostring(math.ceil(speed * 2.236936))
				kmh = tostring(math.ceil(speed * 3.6))
				fuel = tostring(math.ceil(GetVehicleFuelLevel(vehicle)))

				displayHud = true
			else
				displayHud = false

				Citizen.Wait(500)
			end

			Citizen.Wait(50)
		end
	end)

	Citizen.CreateThread(function()
		while true do
			if displayHud then
				DrawAdvancedText(0.130 - x, 0.77 - y, 0.005, 0.0028, 0.6, mph, 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.174 - x, 0.77 - y, 0.005, 0.0028, 0.6, kmh, 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.2195 - x, 0.77 - y, 0.005, 0.0028, 0.6, fuel, 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.148 - x, 0.7765 - y, 0.005, 0.0028, 0.4, "mp/h              km/h              Fuel", 255, 255, 255, 255, 6, 1)
			else
				Citizen.Wait(750)
			end

			Citizen.Wait(0)
		end
	end)
end
