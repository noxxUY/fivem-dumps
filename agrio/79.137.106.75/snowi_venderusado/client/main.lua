ESX = nil

PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(response)
            ESX = response
        end)
    end
	LoadSellPlace()

    
end)
--RemoveVehicles()

	--	Citizen.Wait(500)

		--LoadSellPlace()
	--	Citizen.Wait(math.random(300, 2000))
		--SpawnVehicles()
RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	--
	
	--LoadSellPlace()
--	Citizen.Wait(math.random(300, 2000))
	--SpawnVehicles()
end)

RegisterNetEvent("snowiRefreshVeh")
AddEventHandler("snowiRefreshVeh", function()
	RemoveVehicles()

	Citizen.Wait(2000)
	SpawnVehicles()
end)
RegisterNetEvent("snowiRefreshVeh2")
AddEventHandler("snowiRefreshVeh2", function()
	refrescao = false
end)

local refrescao= false
local primeravez = false
--Citizen.CreateThread(function()while true do Citizen.Wait(30000) if refrescao == true then refrescao = false end end end)
function LoadSellPlace()
	Citizen.CreateThread(function()

		local SellPos = Config.SellPosition

		local Blip = AddBlipForCoord(SellPos["x"], SellPos["y"], SellPos["z"])
		SetBlipSprite (Blip, 225)
		SetBlipDisplay(Blip, 4)
		SetBlipScale  (Blip, 0.8)
		SetBlipColour (Blip, 27)
		SetBlipAsShortRange(Blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("🚘Coches usados")
		EndTextCommandSetBlipName(Blip)
		--TriggerEvent('snowiRefreshVeh')
		while true do
			local sleepThread = 500

			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)

			local dstCheck = GetDistanceBetweenCoords(pedCoords, SellPos["x"], SellPos["y"], SellPos["z"], true)
			if dstCheck <= 300.0 then
				if primeravez == false then
					primeravez = true
					refrescao = true
					SpawnVehicles()
					print('SPAWNEA PRIMERA VEZ')
				end
				if refrescao == false then
					
TriggerEvent('snowiRefreshVeh')
print(dstCheck)
refrescao = true			
				end
end--]]
			if dstCheck <= 20.0 then
				sleepThread = 5
				DrawMarker(21, SellPos.x, SellPos.y, SellPos.z+1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 1.0, 0, 255, 130, 100, true, true, 2, false, false, false, false)
				if dstCheck <= 4.2 then
					ESX.Game.Utils.DrawText3D(SellPos, "[E] Abrir menu de ~g~venta", 1.4)
					if IsControlJustPressed(0, 38) then
						if IsPedInAnyVehicle(ped, false) then
							OpenSellMenu(GetVehiclePedIsUsing(ped))
						else
							ESX.ShowNotification("Debes estar sentado en un ~g~vehiculo")
						end
					end
				end
			end

			for i = 1, #Config.VehiclePositions, 1 do
				if Config.VehiclePositions[i]["entityId"] ~= nil then
					local pedCoords = GetEntityCoords(ped)
					local vehCoords = GetEntityCoords(Config.VehiclePositions[i]["entityId"])

					local dstCheck = GetDistanceBetweenCoords(pedCoords, vehCoords, true)

					if dstCheck <= 2.0 then
						sleepThread = 5

						ESX.Game.Utils.DrawText3D(vehCoords, "Pulsa [E] para ver la informacion del vehiculo [" .. Config.VehiclePositions[i]["price"] .. "]€", 0.7)
						DrawMarker(20, vehCoords.x, vehCoords.y, vehCoords.z+2.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 1.0, 0, 255, 130, 100, true, true, 2, false, false, false, false)
						if IsControlJustPressed(0, 38) then
							--if IsPedInVehicle(ped, Config.VehiclePositions[i]["entityId"], false) then
								OpenSellMenu(Config.VehiclePositions[i]["entityId"], Config.VehiclePositions[i]["price"], true, Config.VehiclePositions[i]["owner"], i)
							--else
							--	ESX.ShowNotification("Debes estar sentado en un ~g~vehiculo!!")
							--end
						end
					end
				end
			end

			Citizen.Wait(sleepThread)
		end
	end)
end

function OpenSellMenu(veh, price, buyVehicle, owner, index)
	local elements = {}

	if not buyVehicle then
		if price ~= nil then
			table.insert(elements, { ["label"] = "Cambiar precio💵 " .. price, ["value"] = "price" })
			table.insert(elements, { ["label"] = "Poner a la venta📤 ", ["value"] = "sell" })
		else
			table.insert(elements, { ["label"] = "Poner precio💵 ", ["value"] = "price" })
		end
	else
		table.insert(elements, { ["label"] = "Opciones", ["value"] = "buy" })

		if owner then
			table.insert(elements, { ["label"] = "Eliminar vehiculo", ["value"] = "remove" })
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sell_veh',
		{
			title    = "Vehicle Menu",
			align    = 'top-right',
			elements = elements
		},
	function(data, menu)
		local action = data.current.value

		if action == "price" then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sell_veh_price',
				{
					title = "Precio del vehiculo💵"
				},
			function(data2, menu2)

				local vehPrice = tonumber(data2.value)

				menu2.close()
				menu.close()

				OpenSellMenu(veh, vehPrice)
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "sell" then
			local vehProps = ESX.Game.GetVehicleProperties(veh)

			ESX.TriggerServerCallback("snowiValidoVeh", function(valid)
if type(valid) ~= 'boolean' and valid == 'full' then
	ESX.ShowNotification("No tenemos mas espacio para publicar tu vehículo!~s~")
elseif type(valid) ~= 'boolean' and valid == 'nowl' then
	
else
				if valid then
					DeleteVehicle(veh)
					ESX.ShowNotification("Pusiste el  ~g~vehiculo~s~ a la venta - " .. price .. "")
					ESX.UI.Menu.CloseAll()
				else
					ESX.ShowNotification("Debes ser el  ~r~propietario~s~ del ~g~vehiculo!~s~")
					ESX.UI.Menu.CloseAll()
				end
			end
			end, vehProps, price)
		elseif action == "buy" then
			local elements2 = {}
			table.insert(elements2, { label = 'Informacion', value = 'info'})
			table.insert(elements2, {label = 'Compra', value = 'compra'})
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Informasa',
		{
			title    = "Informacion [".."]",
			align    = 'top-right',
			elements =elements2
		},
	function(data2, menu2)
		print(data2.current.value)
		if data2.current.value == 'compra' then
			print('Hola2')
			ESX.TriggerServerCallback("snowiComprarVeh", function(isPurchasable, totalMoney)
				if isPurchasable then
					DeleteVehicle(veh)

					ESX.ShowNotification("Compraste el ~g~vehiculo~s~ por " .. price .. " 💸")
					Config.VehiclePositions[index]['entityId'] = nil
					Config.VehiclePositions[index]["price"]= nil
					Config.VehiclePositions[index]["owner"] = nil
					ESX.UI.Menu.CloseAll()
				else
					ESX.ShowNotification(" ~r~No~s~ tienes suficiente dinero en el banco, necesitas " .. price - totalMoney)
					print(index)
					Config.VehiclePositions[index]['entityId'] = nil
					Config.VehiclePositions[index]["price"]= nil
					Config.VehiclePositions[index]["owner"] = nil
					ESX.UI.Menu.CloseAll()
				end
			end, ESX.Game.GetVehicleProperties(veh), price)
		else
			print('HAHDSJHAG')
			TriggerEvent('segundamanoSnowiInfoLol', veh, ESX.Game.GetVehicleProperties(veh))
			print('Enviado?')
		end
		end, function(data2, menu2)
			menu2.close()
		end)
		elseif action == "remove" then
			ESX.TriggerServerCallback("snowiComprarVeh", function(isPurchasable, totalMoney)
				if isPurchasable then
					DeleteVehicle(veh)
					ESX.ShowNotification("Has ~g~quitado~s~ el vehiculo de venta")
					menu.close()
				end
			end, ESX.Game.GetVehicleProperties(veh), 0)
		end
		
	end, function(data, menu)
		menu.close()
	end)
end

function RemoveVehicles()
	local VehPos = Config.VehiclePositions

	for i = 1, #VehPos, 1 do
		print(json.encode(VehPos[i]))
		local veh, distance = ESX.Game.GetClosestVehicle(VehPos[i])
if veh == GetVehiclePedIsIn(PlayerPedId(), false) then
	print('Bypass esoy subido')
else
	--	if DoesEntityExist(veh) then --and distance <= 30.0 then
			print('Borra coche->'..i..' // '..veh)
			DeleteEntity(veh)
			if VehPos[i]['entityId'] then
				print('Borra entityid')
			DeleteEntity(VehPos[i]['entityId'])
			end
		end
			--	else
	--		print('No borra: '..distance..' Numero ->'..i)
	--	end
	end
end

function SpawnVehicles()
	print('empieza spawnear')
	 VehPos = nil
	 VehPos = Config.VehiclePositions

	ESX.TriggerServerCallback("snowiObtenerveh", function(vehicles)
		for i = 1, #vehicles, 1 do

			local vehicleProps = vehicles[i]["vehProps"]

			LoadModel(vehicleProps["model"])

			VehPos[i]["entityId"] = CreateVehicle(vehicleProps["model"], VehPos[i]["x"], VehPos[i]["y"], VehPos[i]["z"] - 0.975, VehPos[i]["h"], false, false)
			VehPos[i]["price"] = vehicles[i]["price"]
			VehPos[i]["owner"] = vehicles[i]["owner"]

			ESX.Game.SetVehicleProperties(VehPos[i]["entityId"], vehicleProps)
			SetVehicleDoorsLocked(VehPos[i]["entityId"], 2)
			FreezeEntityPosition(VehPos[i]["entityId"], true)
			
			--SetVehicleDirtLevel(VehPos[i]["entityId"], 0.0)
			exports['LegacyFuel']:SetFuel(VehPos[i]["entityId"], 100.0)
			SetVehicleFixed(VehPos[i]["entityId"])
			--SetEntityAsMissionEntity(VehPos[i]["entityId"], true, true)
			
		end
	end)

end

LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)

		Citizen.Wait(1000)
	end
end
