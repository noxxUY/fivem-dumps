ESX = nil

local DrawDistance = 50.0
local this_Garage             = {}

cachedData = {
	["motels"] = {},
	["insideMotel"] = false
}

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end) 
        Wait(0) 
    end
		
	if ESX.IsPlayerLoaded() then
		Init()
	end

	AddTextEntry("Instructions", Config.HelpTextMessage)
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData

	Init()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

RegisterNetEvent("1974_motel_sandy:eventHandler")
AddEventHandler("1974_motel_sandy:eventHandler", function(response, eventData)
	if response == "update_motels" then
		cachedData["motels"] = eventData
	elseif response == "invite_player" then
		if eventData["player"] == GetPlayerServerId(PlayerId()) then
			Citizen.CreateThread(function()
				local startedInvite = GetGameTimer()

				cachedData["invited"] = true

				while GetGameTimer() - startedInvite < 7500 do
					Citizen.Wait(0)

					ESX.ShowHelpNotification("Has sido invitado a, " .. eventData["motel"]["room"] .. ". ~INPUT_DETONATE~ para entrar.")

					if IsControlJustPressed(0, 47) then
						EnterMotel(eventData["motel"])

						break
					end
				end

				cachedData["invited"] = false
			end)
		end
	elseif response == "knock_motel" then
		local currentInstance = DecorGetInt(PlayerPedId(), "currentInstance")

		if currentInstance and currentInstance == eventData["uniqueId"] then
			ESX.ShowNotification("Alguien esta tocando tu puerta.")
		end
	end
end)

function StartMotel()

	Citizen.Wait(50)

	while ESX.PlayerData == nil do
        Citizen.Wait(50)
	end
	
	--cachedData["lastCheck"] = GetGameTimer() - 4750
	
	for k,v in pairs(Config.LandLord) do
		local pinkCageBlip = AddBlipForCoord(v.Position)

		SetBlipSprite(pinkCageBlip, 475)
		SetBlipScale(pinkCageBlip, 0.8)
		SetBlipColour(pinkCageBlip, 38)
		SetBlipAsShortRange(pinkCageBlip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(k)
		EndTextCommandSetBlipName(pinkCageBlip)
	end

	while true do
		local sleepThread = 500

		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		local yourMotel = GetPlayerMotel()
		
		for k,v in pairs(Config.LandLord) do
			for motelRoom, motelPos in ipairs(v.MotelsEntrances) do
				local dstCheck = GetDistanceBetweenCoords(pedCoords, motelPos, true)
				local dstRange = yourMotel and (yourMotel["room"] == motelRoom and 35.0 or 3.0) or 3.0

				if dstCheck <= dstRange then
					sleepThread = 5
					
					local coords = GetEntityCoords(GetPlayerPed(-1))
					
					if yourMotel and yourMotel["room"] == motelRoom then
						DrawScriptMarker({
							["type"] = 2,
							["pos"] = motelPos,
							["r"] = 155,
							["g"] = 155,
							["b"] = 155,
							["sizeX"] = 0.3,
							["sizeY"] = 0.3,
							["sizeZ"] = 0.3,
							["rotate"] = true
						})
						for i,v in pairs(Config.Garage) do
							local distance = Vdist(coords.x, coords.y, coords.z, v.Marker.x, v.Marker.y, v.Marker.z)	
							if distance < 1.0 then
								DrawText3D(v.Marker.x,v.Marker.y,v.Marker.z, "Presiona ~g~[E]~s~ para abrir el garage.")
								if IsControlJustReleased(0, 38) then
									ListOwnedCarsMenu()
									local coords = {x=v.Spawner.x, y=v.Spawner.y, z=v.Spawner.z, h=v.Heading}
									this_Garage = v
									local coords1 = {x=v.Spawner.x, y=v.Spawner.y, z=v.Spawner.z, h=v.Heading}
								end
							end
						
							local distance = Vdist(coords.x, coords.y, coords.z, v.Deleter.x, v.Deleter.y, v.Deleter.z)	
							DrawMarker(27,v.Deleter.x,v.Deleter.y,v.Deleter.z - 0.95, 0, 0, 0, 0, 0, 0, 2.5, 2.5, 0.6001,255,0,0, 200, 0, 0, 0, 0)
							if distance < 2.5 then	
								DrawText3D(v.Deleter.x,v.Deleter.y,v.Deleter.z, "Presiona ~g~[E]~s~ para guardar tu vehículo personal")
								if IsControlJustReleased(0, 38) then
									if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
										StoreOwnedCarsMenu()
									else
										TriggerEvent('esx:showNotification', "No hay ningun coche para meter")
									end
								end
							end
						end	
					end
					
					if dstCheck <= 0.9 then
						local displayText = yourMotel and (yourMotel["room"] == motelRoom and "[~g~E~s~] Entrar" or "");
						
						if yourMotel and yourMotel["room"] == motelRoom then
							DrawScriptText(motelPos - vector3(0.0, 0.0, 0.20), displayText)
						end
						
						if IsControlJustPressed(0, 38) then
							if yourMotel then
								if yourMotel["room"] == motelRoom and not IsEntityDead(GetPlayerPed(-1)) then
									EnterMotel(yourMotel)
								else
									ESX.ShowNotification("~r~No es tu habitacion o estas muerto!")
								end
							end
						--elseif IsControlJustPressed(0, 73) then
							--OpenMotelRoomMenu(motelRoom)
						end
					end
				end
			end
	
			local dstCheck = GetDistanceBetweenCoords(pedCoords, v.Position, true)

			if dstCheck <= 3.0 then
				sleepThread = 5

				if dstCheck <= 0.9 then
					local displayText = "[~g~E~s~] Alquilar habitación [~g~X~s~] Cancelar alquiler"
					if not cachedData["purchasing"] then
						DrawScriptText(v.Position, displayText)
					end

					if IsControlJustPressed(0, 38) then
						_G["Open" .. v.Key]()
					end
					if IsControlJustPressed(0, 73) then
						ESX.TriggerServerCallback("1974_motel_sandy:deleteMotel", function (confirmed)
							if confirmed then
								cachedData = {
									["motels"] = {},
									["insideMotel"] = false
								}
								ESX.ShowNotification("Alquiler ~g~CANCELADO!")							
							else
								ESX.ShowNotification("~r~No tienes habitación en este motel")
							end
						end)
					end
				end
			end
		end

		Citizen.Wait(sleepThread)
	end
end

-- List Owned Cars Menu
function ListOwnedCarsMenu()
	ESX.UI.Menu.CloseAll()
	local UseVehicleNamesLua = true
	local elements = {
		
	}	
	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedCars', function(ownedCars)
		if #ownedCars == 0 then
			ESX.ShowNotification('No tienes coches')
		else
			for _,v in pairs(ownedCars) do
				if UseVehicleNamesLua == true then
					local hashVehicule = v.vehicle.model
					local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
					local vehicleName  = GetLabelText(aheadVehName)
					local plate = v.plate
					local labelvehicle
					local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
					local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)
					local Fuel = v.vehicle.fuelLevel
					
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format('Garage')
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format('Deposito')
					end
					table.insert(elements, {label = labelvehicle, value = v})
			end
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title    = 'Tus coches',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value.stored then
				menu.close()
				SpawnVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.vehicle.fuelLevel)
				ESX.UI.Menu.CloseAll()
			else
				ESX.ShowNotification('Tu coche está secuestrado')
			end
		end, function(data, menu)
			menu.close()
		end)
	end
end) end

function SpawnVehicle(vehicle, plate, fuelLevel)
	ESX.UI.Menu.CloseAll()
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = this_Garage.Spawner.x,
		y = this_Garage.Spawner.y,
		z = this_Garage.Spawner.z+1,
	},this_Garage.Heading, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		exports["LegacyFuel"]:SetFuel(callback_vehicle, fuelLevel)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

function DrawText3D(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.5*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function StoreOwnedCarsMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetPedInVehicleSeat(vehicle, -1 ) == playerPed then
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			vehicleProps.fuelLevel = exports["LegacyFuel"]:GetFuel(vehicle)
			ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
				if valid then
					StoreVehicle(vehicle, vehicleProps)
				else
					ESX.ShowNotification('No hay vehiculo para guardar!')
				end
			end, vehicleProps)
		else
			ESX.ShowNotification('Debes estar manejando el vehiculo!')
		end	
	else
		ESX.ShowNotification('No puedes guardar este vehiculo!')
	end
end

function StoreVehicle(vehicle, vehicleProps)
	DeleteEntity(vehicle)
	TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true)
	ESX.ShowNotification('Vehículo guardado en el garage')
end