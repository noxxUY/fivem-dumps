ESX = nil
local PlayerData              = {}
local DrawDistance = 50.0
local this_Garage             = {}

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)		
		local playerCoords = GetEntityCoords(PlayerPedId())		
		for k,i in pairs(Config.Mansion) do
			if k == PlayerData.identifier then
				for _,v in pairs(i) do				
					if _ ~= 'FastTravelsPrompt' then
						local distance = #(playerCoords - v.Marker)
						if distance < 20 then
							DrawMarker(v.Type, v.Marker.x, v.Marker.y, v.Marker.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
							if distance < v.Size.x then
								ESX.Game.Utils.DrawText3D(v.Marker, v.Label, 1.0)
								if IsControlJustPressed(1, 38) then
									if _ == "Baul" then
										OpenStorage(k)
									elseif _ == "Ropa" then
										outfit()
									elseif _ == "Garage" then
										ListOwnedCarsMenu(v.Spawner)
									elseif _ == "Guardar_Garage" then
										StoreOwnedCarsMenu()
									elseif _ == "Helicoptero" then
										ListOwnedAircraftsMenu(v.Spawner)
									elseif _ == "Guardar_Helicoptero" then
										GuardarHeli()
									end
								end
							end
						end
					elseif _ ~= nil then
						for k,v in ipairs(Config.Mansion[k].FastTravelsPrompt) do
							local distance = #(playerCoords - v.From)
							if distance < 20 then
								DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
								if distance < v.Marker.x then
									ESX.Game.Utils.DrawText3D(v.Marker, v.Prompt, 1.0)
									if IsControlJustPressed(1, 38) then
										--ESX.ShowNotification("DONDE QUERES IR ATORRANTE!")
										FastTravel(v.To.coords, v.To.heading)
									end
								end
							end
						end
					end
				end	
			end
		end
	end
end)

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

function GuardarHeli()
	local playerPed  = GetPlayerPed(-1)
	if IsPedInFlyingVehicle(playerPed,  false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetPedInVehicleSeat(vehicle, -1 ) == playerPed then
			local playerPed = GetPlayerPed(-1)
			local coords = GetEntityCoords(playerPed)
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
			local engineHealth = GetVehicleEngineHealth(current)
			local plate = vehicleProps.plate
			
			vehicleProps.fuelLevel = exports["LegacyFuel"]:GetFuel(vehicle)

			ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
				if valid then
					StoreVehicle(vehicle, vehicleProps)					
				elseif valid == 2 then
					DeleteEntity(vehicle)
				else
					ESX.ShowNotification('No eres dueño del Helicoptero!')
				end
			end, vehicleProps)
		else
			ESX.ShowNotification('~r~Tu no eres el Piloto!')
		end
	else
		ESX.ShowNotification('No hay ningun HELICOPTERO para guardar!')
	end
end

-- List Owned Cars Menu
function ListOwnedCarsMenu(coords)
	--print(coords)
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
					--local Fuel = v.vehicle.fuelLevel
					
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
				SpawnVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.vehicle.fuelLevel, coords)
				ESX.UI.Menu.CloseAll()
			else
				ESX.ShowNotification('Tu coche está secuestrado')
			end
		end, function(data, menu)
			menu.close()
		end)
	end
end) end

function SpawnVehicle(vehicle, plate, fuelLevel, coords)
	ESX.UI.Menu.CloseAll()
	ESX.Game.SpawnVehicle(vehicle.model, coords, coords.w, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		exports["LegacyFuel"]:SetFuel(callback_vehicle, fuelLevel)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
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

function OpenStorage(owner)
ESX.UI.Menu.CloseAll()
 
     ESX.UI.Menu.Open(
         'default', GetCurrentResourceName(), 'storage',
     {
         title = 'Inventario',
         align = 'bottom-right',
         elements = {
             {label = "Guardar Cosas", value = 's'},
             {label = "Retirar Cosas", value = 'w'}
         },
     },
     function(data, menu)
         if data.current.value == 's' then
 
             ESX.TriggerServerCallback('1974_mansiones:getInventory', function(inv)
 
                 local elements = {}
 				
 				if (inv['black_money']) > 0 then
 					table.insert(elements, {
 						label =  'Dinero Sucio: <span style="color:red;">$'..ESX.Math.GroupDigits(inv['black_money'])..'</span>',
 						type  = 'item_account',
 						value = 'black_money'
 					})
 				end
				
				if (inv['money']) > 0 then
 					table.insert(elements, {
 						label =  'Dinero: <span style="color:green;">$'..ESX.Math.GroupDigits(inv['money'])..'</span>',
 						type  = 'item_money',
 						value = 'money'
 					})
 				end
         
                 for k, v in pairs(inv['weapons']) do
                     table.insert(elements, {label = ('%s | x%s %s'):format(ESX.GetWeaponLabel(v['name']), v['ammo'], 'Balas'), weapon = v['name'], ammo = v['ammo'], type = 'weapon'})        
                 end
 				
 				for k, v in pairs(inv['items']) do
 					if v['count'] >= 1 then
 						table.insert(elements, {label = ('x%s %s'):format(v['count'], v['label']), type = 'item', value = v['name']})
 					end
 				end
 
                 ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'storeItem', {
                     title = 'Inventario',
                     align = 'bottom-right',
                     elements = elements
                 }, function(data2, menu2)
 					if data2.current.type == 'weapon' then
 						--ESX.ShowNotification(data2.current.type)
 						TriggerServerEvent('1974_mansiones:storeItem', data2.current.type , data2.current.weapon, data2.current.ammo, owner)
 						menu2.close()
 					else
 						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', {title = 'Cantidad: '}, function(data3, menu3)
 							local amount = tonumber(data3.value)
 
 							if amount == nil then
 								ESX.ShowNotification('~r~Debes ingresar cantidad!')
 							else
                             if amount >= 0 then
 									TriggerServerEvent('1974_mansiones:storeItem', data2.current.type, data2.current.value, tonumber(data3.value), owner)
 									menu3.close()
 									menu2.close()
 								else
 									ESX.ShowNotification('~r~Cantidad invalida!')
 								end
 							end
 							end, function(data3, menu3)
 							menu3.close()
 						end)
 					end
                 end, function(data2, menu2)
                     menu2.close()
end)

      end)

  elseif data.current.value == 'w' then
				
      ESX.TriggerServerCallback('1974_mansiones:getMotelInv', function(inv)

local elements = {}
				
	if (inv['black_money']) > 0 then
    table.insert(elements, {
        label =  'Dinero Sucio: <span style="color:red;">$'..ESX.Math.GroupDigits(inv['black_money'])..'</span>',
        type  = 'item_account',
        value = 'black_money'
    })
	end
	
	if (inv['money']) > 0 then
    table.insert(elements, {
        label =  'Dinero: <span style="color:green;">$'..ESX.Math.GroupDigits(inv['money'])..'</span>',
        type  = 'item_money',
        value = 'money'
    })
	end
	
				
				for k, v in pairs(inv['weapons']) do
    table.insert(elements, {label = ('%s | x%s %s'):format(ESX.GetWeaponLabel(v['name']), v['ammo'], 'Balas'), weapon = v['name'], ammo = v['ammo'], type = 'weapon'})
end

for k, v in pairs(inv['items']) do
    if v['count'] > 0 then
        table.insert(elements, {label = ('x%s %s'):format(v['count'], v['label']), type = 'item', value = v['name']})
    end
end
         

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdrawItem', {
    title = 'Armario Mansion',
    align = 'bottom-right',
    elements = elements
}, function(data2, menu2)
				
					if data2.current.type == 'weapon' then
						TriggerServerEvent('1974_mansiones:withdrawItem', 'weapon', data2.current.weapon, data2.current.ammo, owner)
						menu2.close()
					else
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', {title = 'Cantidad:'}, function(data3, menu3)
							local amount = tonumber(data3.value)

							if amount == nil then
								ESX.ShowNotification("~r~Debe ingresar una cantidad!")
							else
								if amount >= 0 then
									TriggerServerEvent('1974_mansiones:withdrawItem', data2.current.type, data2.current.value, tonumber(data3.value), owner)
									menu3.close()
									menu2.close()
								else
									ESX.ShowNotification('~r~Cantidad invalida!')
								end
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end	
end, function(data2, menu2)
    menu2.close()
end)

      end, owner)

  end

    end, function(data, menu)
  menu.close()
    end)
end


function outfit()
	local elements = {}
		table.insert(elements, {label = 'Cambiar de Ropa', value = 'player_dressing'})
		table.insert(elements, {label = 'Eliminar Ropa', value = 'remove_cloth'})
								
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = 'Guardarropas',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'player_dressing' then
				cambiar_ropa()
			elseif data.current.value == 'remove_cloth' then

			ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = 'Eliminar Ropa',
					align    = 'bottom-right',
					elements = elements
				}, function(data, menu)
					menu.close()
					TriggerServerEvent('esx_eden_clotheshop:removeOutfit', data.current.value)
					ESX.ShowNotification('~r~Outfit Eliminado')
				end, function(data, menu)
					menu.close()
				end)
			end)
			end
			end, function(data, menu)
			menu.close()
		end)
end

function cambiar_ropa()
	
	ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = 'Ropa',
					align    = 'bottom-right',
					elements = elements
				}, function(data, menu)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data.current.value)
					end)
				end, function(data, menu)
					menu.close()
				end)
			end)

end

function ListOwnedAircraftsMenu(coords)
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format('PATENTE', 'AERONAVE', 'LUGAR')
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format('PATENTE', 'AERONAVE')
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedAircrafts', function(ownedAircrafts)
		if #ownedAircrafts == 0 then
			ESX.ShowNotification('No tienes Aeronaves!')
		else
			for _,v in pairs(ownedAircrafts) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
				local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format('GARAGE')
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format('DEPOSITO')
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_aircraft', {
			title = 'Aeronaves',
			align = Config.AlignMenu,
			elements = elements
		}, function(data, menu)
			if data.current.value == nil then
			else
				if data.current.value.stored then
					menu.close()
					SpawnVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.vehicle.fuelLevel, coords)
				else
					ESX.ShowNotification('La Aeronave esta en Deposito!')
				end
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end