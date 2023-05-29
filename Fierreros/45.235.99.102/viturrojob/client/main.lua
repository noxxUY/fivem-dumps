local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local CurrentlyTowedVehicle   = nil
local Blips                   = {}
local NPCOnJob                = false
local NPCTargetTowable        = nil
local NPCTargetTowableZone    = nil
local NPCHasSpawnedTowable    = false
local NPCLastCancel           = GetGameTimer() - 5 * 60000
local NPCHasBeenNextToTowable = false
local NPCTargetDeleterZone    = false
local IsDead                  = false
local IsBusy                  = false

ESX = exports["es_extended"]:getSharedObject()


local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	{title="Taller Mecanica Viturro", colour=-1, id=446, x =-542.16, y = -929.76, z = 23.91,}, -- Location to obtain supplies needed to make cocaine at Drug Processing Location
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end) 
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf

function SelectRandomTowable()
	local index = GetRandomIntInRange(1,  #Config.Towables)

	for k,v in pairs(Config.Zones) do
		if v.Pos.x == Config.Towables[index].x and v.Pos.y == Config.Towables[index].y and v.Pos.z == Config.Towables[index].z then
			return k
		end
	end
end

function StartNPCJob()
	NPCOnJob = true

	NPCTargetTowableZone = SelectRandomTowable()
	local zone       = Config.Zones[NPCTargetTowableZone]

	Blips['NPCTargetTowableZone'] = AddBlipForCoord(zone.Pos.x,  zone.Pos.y,  zone.Pos.z)
	SetBlipRoute(Blips['NPCTargetTowableZone'], true)

	ESX.ShowNotification(_U('drive_to_indicated'))
end
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
function StopNPCJob(cancel)
	if Blips['NPCTargetTowableZone'] ~= nil then
		RemoveBlip(Blips['NPCTargetTowableZone'])
		Blips['NPCTargetTowableZone'] = nil
	end

	if Blips['NPCDelivery'] ~= nil then
		RemoveBlip(Blips['NPCDelivery'])
		Blips['NPCDelivery'] = nil
	end

	Config.Zones.VehicleDelivery.Type = -1

	NPCOnJob                = false
	NPCTargetTowable        = nil
	NPCTargetTowableZone    = nil
	NPCHasSpawnedTowable    = false
	NPCHasBeenNextToTowable = false

	if cancel then
		ESX.ShowNotification(_U('mission_canceled'))
	else
		--TriggerServerEvent('esx_viturrojob:onNPCJobCompleted')
	end
end

function OpenviturroActionsMenu()

	local elements = {
		{label = _U('vehicle_list'),   value = 'vehicle_list'},
		--{label = _U('work_wear'),      value = 'cloakroom'},
		--{label = _U('civ_wear'),       value = 'cloakroom2'},
		{label = _U('deposit_stock'),  value = 'put_stock'},
		{label = _U('withdraw_stock'), value = 'get_stock'}		
	}

	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'viturro_actions', {
		css		= 'mechanic',
		title    = _U('mechanic'),
		align    = 'left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'vehicle_list' then

			if Config.EnableSocietyOwnedVehicles then

				local elements = {}

				ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
					for i=1, #vehicles, 1 do
						table.insert(elements, {
							label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']',
							value = vehicles[i]
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
						css		= 'viturro',
						title    = _U('service_vehicle'),
						align    = 'left',
						elements = elements
					}, function(data, menu)
						menu.close()
						local vehicleProps = data.current.value

						ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
							ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
							local playerPed = PlayerPedId()
							local plate = 'WORK' .. math.random(100, 900)
							TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
							SetVehicleNumberPlateText(vehicle, plate)
							table.insert(myPlate, plate)
							plate = string.gsub(plate, " ", "")
							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						end)

						TriggerServerEvent('esx_society:removeVehicleFromGarage', 'viturro', vehicleProps)
					end, function(data, menu)
						menu.close()
					end)
				end, 'viturro')

			else

				local elements = {					
					{label = 'Rebal', value = 'rebel'},
					{label = 'Sultan', value = 'sultan'},						
					{label = 'Moto', value = 'manchez'},	
					{label = 'Camion', value = 'burrito'},	
					{label = 'Mule', value = 'mule'},						
					{label = 'Flatbed', value = 'flatbed'},					
				}

				if Config.EnablePlayerManagement and PlayerData.job ~= nil and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'chef' or PlayerData.job.grade_name == 'experimente') then
					table.insert(elements, {label = 'Sultan RS', value = 'sultanrs'})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
					css		= 'viturro',
					title    = _U('service_vehicle'),
					align    = 'left',
					elements = elements
				}, function(data, menu)
					if Config.MaxInService == -1 then
						ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
						end)
					else
						ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
							if canTakeService then
								ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
									local playerPed = PlayerPedId()
									TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
								end)
							else
								ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
							end
						end, 'viturro')
					end

					menu.close()
				end, function(data, menu)
					menu.close()
					OpenviturroActionsMenu()
				end)

			end		

		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'viturro', function(data, menu)
				menu.close()
			end, {wash = false})
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'viturro_actions_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	end)
end
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
function OpentestActionsMenu()

	local elements = {
		{label = _U('vehicle_list'),   value = 'vehicle_list'},
		--{label = _U('work_wear'),      value = 'cloakroom'},
		--{label = _U('civ_wear'),       value = 'cloakroom2'},
		--{label = _U('deposit_stock'),  value = 'put_stock'},
		--{label = _U('withdraw_stock'), value = 'get_stock'}
	}

	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'test_actions', {
		css		= 'viturro',
		title    = _U('mechanic'),
		align    = 'left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'vehicle_list' then

			if Config.EnableSocietyOwnedVehicles then

				local elements = {}

				ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
					for i=1, #vehicles, 1 do
						table.insert(elements, {
							label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']',
							value = vehicles[i]
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
						css		= 'viturro',
						title    = _U('service_vehicle'),
						align    = 'left',
						elements = elements
					}, function(data, menu)
						menu.close()
						local vehicleProps = data.current.value

						ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
							ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
							local playerPed = PlayerPedId()
							local plate = 'WORK' .. math.random(100, 900)
							TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
							SetVehicleNumberPlateText(vehicle, plate)
							table.insert(myPlate, plate)
							plate = string.gsub(plate, " ", "")
							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						end)

						TriggerServerEvent('esx_society:removeVehicleFromGarage', 'viturro', vehicleProps)
					end, function(data, menu)
						menu.close()
					end)
				end, 'viturro')

			else

				local elements = {
					{label = 'rebel', value = 'rebel'},
				}

				if Config.EnablePlayerManagement and PlayerData.job ~= nil and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'chef' or PlayerData.job.grade_name == 'experimente') then
					table.insert(elements, {label = 'Sultan RS', value = 'sultanrs'})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
					css		= 'viturro',
					title    = _U('service_vehicle'),
					align    = 'left',
					elements = elements
				}, function(data, menu)
					if Config.MaxInService == -1 then
						ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
						end)
					else
						ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
							if canTakeService then
								ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
									local playerPed = PlayerPedId()
									TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
								end)
							else
								ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
							end
						end, 'viturro')
					end

					menu.close()
				end, function(data, menu)
					menu.close()
					OpenviturroActionsMenu()
				end)

			end

		elseif data.current.value == 'cloakroom' then

			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			TriggerServerEvent("player:serviceOn", "viturro")
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)

		elseif data.current.value == 'cloakroom2' then

			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				TriggerServerEvent("player:serviceOff", "viturro")
			end)

		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'viturro', function(data, menu)
				menu.close()
			end, {wash = true})
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'viturro_actions_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	end)
end

function OpenviturroHarvestMenu()

	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name ~= 'recrue' then

		local elements = {
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'viturro_harvest', {
			css		= 'viturro',
			title    = _U('harvest'),
			align    = 'left',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'gaz_bottle' then
				menu.close()
				TriggerServerEvent('esx_viturrojob:startHarvest')
			elseif data.current.value == 'fix_tool' then
				menu.close()
				TriggerServerEvent('esx_viturrojob:startHarvest2')
			elseif data.current.value == 'caro_tool' then
				menu.close()
				TriggerServerEvent('esx_viturrojob:startHarvest3')
			end

		end, function(data, menu)
			menu.close()
			CurrentAction     = 'viturro_harvest_menu'
			CurrentActionMsg  = _U('harvest_menu')
			CurrentActionData = {}
		end)

	else
		ESX.ShowNotification(_U('not_experienced_enough'))
	end
end

function OpenviturroCraftMenu()
	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name ~= 'recrue' then

		local elements = {		
			{label = _U('blowtorch'),  value = 'blow_pipe'},
			{label = _U('repair_kit'), value = 'fix_kit'},
			{label = _U('body_kit'),   value = 'caro_kit'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'viturro_craft', {
			css		= 'viturro',
			title    = _U('craft'),
			align    = 'left',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'blow_pipe' then
				menu.close()
				TriggerServerEvent('esx_viturrojob:startCraft')
			elseif data.current.value == 'fix_kit' then
				menu.close()
				TriggerServerEvent('esx_viturrojob:startCraft2')
			elseif data.current.value == 'caro_kit' then
				menu.close()
				TriggerServerEvent('esx_viturrojob:startCraft3')
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'viturro_craft_menu'
			CurrentActionMsg  = _U('craft_menu')
			CurrentActionData = {}
		end)

	else
		ESX.ShowNotification(_U('not_experienced_enough'))
	end
end
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
function OpenMobileviturroActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_viturro_actions', {
		css		= 'metier',
		title    = _U('mechanic'),
		align    = 'left',
		elements = {
			{label = '📝 Factura',       value = 'billing'},
			{label = '👨‍🏭 Llamar a un Mecanico',       value = 'meca1'},					
			{label = '🔨 Forzar cerradura',        value = 'hijack_vehicle'},
			{label = '🛠️ Reparacion de Bici/Camion',        value = 'fix_vehicle'},
			{label = '🔧 Reparar vehiculo',        value = 'fix_vehicle1'},	
			{label = '🚗 Reparar rueda',        value = 'fix_wheel'},			
			{label = '🧽 Limpiar',         value = 'clean_vehicle'},
			{label = '🔐 Incautar',       value = 'del_vehicle'},
			{label = '⚙️ Flatbed',      value = 'dep_vehicle'},
			{label = '📦 Objetos', value = 'object_spawner'}			
		}
	}, function(data, menu)
	
			if data.current.value == 'fix_vehicle1' then
				TriggerEvent('nk_repair:MenuRipara')	
				menu.close()
        end			
			if data.current.value == 'meca1' then
				TriggerEvent('knb:mech')	
				menu.close()
        end	
			if data.current.value == 'fix_wheel' then
				TriggerEvent('gln_oponazapasowa:uzyj')	
				menu.close()
        end			
			
		if data.current.value == 'billing' then

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
				title = _U('invoice_amount')
			}, function(data, menu)

				local amount = tonumber(data.value)
				if amount == nil then
					ESX.ShowNotification(_U('amount_invalid'))
				else
					menu.close()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification(_U('no_players_near'))
					else
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_viturro', 'viturro', amount)
						ESX.ShowNotification(_U('billing_sent'))
					end

				end

			end, function(data, menu)
				menu.close()
			end)

		elseif data.current.value == 'hijack_vehicle' then

		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		if DoesEntityExist(vehicle) then
			IsBusy = true
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
			Citizen.CreateThread(function()
				exports['progressBars']:startUI(10000, "Lock picking")
				Citizen.Wait(12000)

				SetVehicleDoorsLocked(vehicle, 1)
				SetVehicleDoorsLockedForAllPlayers(vehicle, false)
				ClearPedTasksImmediately(playerPed)

				ESX.ShowNotification(_U('vehicle_unlocked'))
				IsBusy = false
			end)
		else
			ESX.ShowNotification(_U('no_vehicle_nearby'))
		end

	elseif data.current.value == 'fix_vehicle' then

		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		if DoesEntityExist(vehicle) then
			IsBusy = true
			TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
			Citizen.CreateThread(function()
				exports['progressBars']:startUI(20000, "Repair")
				Citizen.Wait(20000)

				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleUndriveable(vehicle, false)
				SetVehicleEngineOn(vehicle, true, true)
				ClearPedTasksImmediately(playerPed)

				ESX.ShowNotification(_U('vehicle_repaired'))
				IsBusy = false
			end)
		else
			ESX.ShowNotification(_U('no_vehicle_nearby'))
		end

	elseif data.current.value == 'clean_vehicle' then

		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		if DoesEntityExist(vehicle) then
			IsBusy = true
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
			Citizen.CreateThread(function()
				exports['progressBars']:startUI(10000, "Cleaning")
				Citizen.Wait(12000)

				SetVehicleDirtLevel(vehicle, 0)
				ClearPedTasksImmediately(playerPed)

				ESX.ShowNotification(_U('vehicle_cleaned'))
				IsBusy = false
			end)
		else
			ESX.ShowNotification(_U('no_vehicle_nearby'))
		end

	elseif data.current.value == 'del_vehicle' then

		local playerPed = PlayerPedId()

		if IsPedSittingInAnyVehicle(playerPed) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if GetPedInVehicleSeat(vehicle, -1) == playerPed then
				ESX.ShowNotification(_U('vehicle_impounded'))
				ESX.Game.DeleteVehicle(vehicle)
			else
				ESX.ShowNotification(_U('must_seat_driver'))
			end
		else
			local vehicle = ESX.Game.GetVehicleInDirection()

			if DoesEntityExist(vehicle) then
				ESX.ShowNotification(_U('vehicle_impounded'))
				ESX.Game.DeleteVehicle(vehicle)
			else
				ESX.ShowNotification(_U('must_near'))
			end
		end

	elseif data.current.value == 'dep_vehicle' then

		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, true)

		local towmodel = GetHashKey('flatbed')
		local isVehicleTow = IsVehicleModel(vehicle, towmodel)

		if isVehicleTow then
			local targetVehicle = ESX.Game.GetVehicleInDirection()

			if CurrentlyTowedVehicle == nil then
				if targetVehicle ~= 0 then
					if not IsPedInAnyVehicle(playerPed, true) then
						if vehicle ~= targetVehicle then
							AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
							CurrentlyTowedVehicle = targetVehicle
							ESX.ShowNotification(_U('vehicle_success_attached'))

							if NPCOnJob then
								if NPCTargetTowable == targetVehicle then
									ESX.ShowNotification(_U('please_drop_off'))
									Config.Zones.VehicleDelivery.Type = 1

									if Blips['NPCTargetTowableZone'] ~= nil then
										RemoveBlip(Blips['NPCTargetTowableZone'])
										Blips['NPCTargetTowableZone'] = nil
									end

									Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x, Config.Zones.VehicleDelivery.Pos.y, Config.Zones.VehicleDelivery.Pos.z)
									SetBlipRoute(Blips['NPCDelivery'], true)
								end
							end
						else
							ESX.ShowNotification(_U('cant_attach_own_tt'))
						end
					end
				else
					ESX.ShowNotification(_U('no_veh_att'))
				end
			else

				AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
				DetachEntity(CurrentlyTowedVehicle, true, true)

				if NPCOnJob then
					if NPCTargetDeleterZone then

						if CurrentlyTowedVehicle == NPCTargetTowable then
							ESX.Game.DeleteVehicle(NPCTargetTowable)
							TriggerServerEvent('esx_viturrojob:onNPCJobMissionCompleted')
							StopNPCJob()
							NPCTargetDeleterZone = false
						else
							ESX.ShowNotification(_U('not_right_veh'))
						end

					else
						ESX.ShowNotification(_U('not_right_place'))
					end
				end

				CurrentlyTowedVehicle = nil
				ESX.ShowNotification(_U('veh_det_succ'))

			end
		else
			ESX.ShowNotification(_U('imp_flatbed'))
		end

	elseif data.current.value == 'object_spawner' then

		local playerPed = PlayerPedId()

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_viturro_actions_spawn', {
			css		= 'metier',
			title    = _U('objects'),
			align    = 'left',
			elements = {			
				{label = 'Machine water', value = 'prop_watercooler_dark'},				
				{label = 'Fence', value = 'prop_barrier_work06a'},				
				{label = 'Repair', value = 'imp_prop_impexp_postlift'},	
				{label = 'Trolley', value = 'prop_cs_trolley_01'},					
				{label = 'Wall Wheel', value = 'imp_prop_impexp_hub_rack_01a'},				
				{label = 'Chair', value = 'v_ret_gc_chair02'},			
				{label = _U('roadcone'), value = 'prop_roadcone02a'},
				{label = _U('toolbox'),  value = 'prop_toolchest_01'}
			}
		}, function(data2, menu2)
			local model   = data2.current.value
			local coords  = GetEntityCoords(playerPed)
			local forward = GetEntityForwardVector(playerPed)
			local x, y, z = table.unpack(coords + forward * 1.0)

			if model == 'prop_roadcone02a' then
				z = z - 2.0
			elseif model == 'prop_toolchest_01' then
				z = z - 2.0
            end				

			ESX.Game.SpawnObject(model, {
				x = x,
				y = y,
				z = z
			}, function(obj)
				SetEntityHeading(obj, GetEntityHeading(playerPed))
				PlaceObjectOnGroundProperly(obj)
			end)

		end, function(data2, menu2)
			menu2.close()
		end)

	end

	end, function(data, menu)
		menu.close()
	end)
end
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_viturrojob:getStockItems', function(items)

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			css		= 'viturro',
			title    = _U('mechanic_stock'),
			align    = 'left',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_viturrojob:getStockItem', itemName, count)

					Citizen.Wait(2000)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)

		end, function(data, menu)
			menu.close()
		end)

	end)

end
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_viturrojob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css		= 'viturro',
			title    = _U('inventory'),
			align    = 'left',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_viturrojob:putStockItems', itemName, count)

					Citizen.Wait(2000)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)

	end)

end


RegisterNetEvent('esx_viturrojob:onHijack')
AddEventHandler('esx_viturrojob:onHijack', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = nil

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		local chance = math.random(100)
		local alarm  = math.random(100)

		if DoesEntityExist(vehicle) then
			if alarm <= 33 then
				SetVehicleAlarm(vehicle, true)
				StartVehicleAlarm(vehicle)
			end

			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)

			Citizen.CreateThread(function()
				exports['progressBars']:startUI(10000, "Lock picking")
				Citizen.Wait(12000)
				if chance <= 66 then
					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)
					ESX.ShowNotification(_U('veh_unlocked'))
				else
					ESX.ShowNotification(_U('hijack_failed'))
					ClearPedTasksImmediately(playerPed)
				end
			end)

		end
	end
end)
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
RegisterNetEvent('esx_viturrojob:onCarokit')
AddEventHandler('esx_viturrojob:onCarokit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = nil

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification(_U('body_repaired'))
			end)
		end
	end
end)
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
RegisterNetEvent('esx_viturrojob:onFixkit')
AddEventHandler('esx_viturrojob:onFixkit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = nil

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(25000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleUndriveable(vehicle, false)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification(_U('veh_repaired'))
			end)
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

AddEventHandler('esx_viturrojob:hasEnteredMarker', function(zone)
	if zone == NPCJobTargetTowable then

	elseif zone =='VehicleDelivery' then
		NPCTargetDeleterZone = true
	elseif zone == 'viturroActions' then
		CurrentAction     = 'viturro_actions_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'Garage' then
		CurrentAction     = 'viturro_harvest_menu'
		CurrentActionMsg  = _U('harvest_menu')
		CurrentActionData = {}
	elseif zone == 'Craft' then
		CurrentAction     = 'viturro_craft_menu'
		CurrentActionMsg  = _U('craft_menu')
		CurrentActionData = {}
	elseif zone == 'VehicleDeleter' then
		local playerPed = PlayerPedId()

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed,  false)

			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('veh_stored')
			CurrentActionData = {vehicle = vehicle}
		end
	end
end)

AddEventHandler('esx_viturrojob:hasExitedMarker', function(zone)
	if zone =='VehicleDelivery' then
		NPCTargetDeleterZone = false
	elseif zone == 'Craft' then
		TriggerServerEvent('esx_viturrojob:stopCraft')
		TriggerServerEvent('esx_viturrojob:stopCraft2')
		TriggerServerEvent('esx_viturrojob:stopCraft3')
	elseif zone == 'Garage' then
		TriggerServerEvent('esx_viturrojob:stopHarvest')
		TriggerServerEvent('esx_viturrojob:stopHarvest2')
		TriggerServerEvent('esx_viturrojob:stopHarvest3')
	end

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

AddEventHandler('esx_viturrojob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job ~= nil and PlayerData.job.name == 'viturro' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('press_remove_obj')
		CurrentActionData = {entity = entity}
	end
end)

AddEventHandler('esx_viturrojob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('mechanic'),
		number     = 'viturro',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAAA4BJREFUWIXtll9oU3cUx7/nJA02aSSlFouWMnXVB0ejU3wcRteHjv1puoc9rA978cUi2IqgRYWIZkMwrahUGfgkFMEZUdg6C+u21z1o3fbgqigVi7NzUtNcmsac40Npltz7S3rvUHzxQODec87vfD+/e0/O/QFv7Q0beV3QeXqmgV74/7H7fZJvuLwv8q/Xeux1gUrNBpN/nmtavdaqDqBK8VT2RDyV2VHmF1lvLERSBtCVynzYmcp+A9WqT9kcVKX4gHUehF0CEVY+1jYTTIwvt7YSIQnCTvsSUYz6gX5uDt7MP7KOKuQAgxmqQ+neUA+I1B1AiXi5X6ZAvKrabirmVYFwAMRT2RMg7F9SyKspvk73hfrtbkMPyIhA5FVqi0iBiEZMMQdAui/8E4GPv0oAJkpc6Q3+6goAAGpWBxNQmTLFmgL3jSJNgQdGv4pMts2EKm7ICJB/aG0xNdz74VEk13UYCx1/twPR8JjDT8wttyLZtkoAxSb8ZDCz0gdfKxWkFURf2v9qTYH7SK7rQIDn0P3nA0ehixvfwZwE0X9vBE/mW8piohhl1WH18UQBhYnre8N/L8b8xQvlx4ACbB4NnzaeRYDnKm0EALCMLXy84hwuTCXL/ExoB1E7qcK/8NCLIq5HcTT0i6u8TYbXUM1cAyyveVq8Xls7XhYrvY/4n3gC8C+dsmAzL1YUiyfWxvHzsy/w/dNd+KjhW2yvv/RfXr7x9QDcmo1he2RBiCCI1Q8jVj9szPNixVfgz+UiIGyDSrcoRu2J16d3I6e1VYvNSQjXpnucAcEPUOkGYZs/l4uUhowt/3kqu1UIv9n90fAY9jT3YBlbRvFTD4fw++wHjhiTRL/bG75t0jI2ITcHb5om4Xgmhv57xpGOg3d/NIqryOR7z+r+MC6qBJB/ZB2t9Om1D5lFm843G/3E3HI7Yh1xDRAfzLQr5EClBf/HBHK462TG2J0OABXeyWDPZ8VqxmBWYscpyghwtTd4EKpDTjCZdCNmzFM9k+4LHXIFACJN94Z6FiFEpKDQw9HndWsEuhnADVMhAUaYJBp9XrcGQKJ4qFE9k+6r2+MG3k5N8VQ22TVglbX2ZwOzX2VvNKr91zmY6S7N6zqZicVT2WNLyVSehESaBhxnOALfMeYX+K/S2yv7wmMAlvwyuR7FxQUyf0fgc/jztfkJr7XeGgC8BJJgWNV8ImT+AAAAAElFTkSuQmCC'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
Citizen.CreateThread(function()
	while true do

		local sleep = 1300

		if NPCTargetTowableZone ~= nil and not NPCHasSpawnedTowable then
			sleep = 4
			local coords = GetEntityCoords(PlayerPedId())
			local zone   = Config.Zones[NPCTargetTowableZone]

			if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCSpawnDistance then
				sleep = 4
				local model = Config.Vehicles[GetRandomIntInRange(1,  #Config.Vehicles)]

				ESX.Game.SpawnVehicle(model, zone.Pos, 0, function(vehicle)
					NPCTargetTowable = vehicle
				end)

				NPCHasSpawnedTowable = true
			end
		end

		if NPCTargetTowableZone ~= nil and NPCHasSpawnedTowable and not NPCHasBeenNextToTowable then
			sleep = 4
			local coords = GetEntityCoords(PlayerPedId())
			local zone   = Config.Zones[NPCTargetTowableZone]

			if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCNextToDistance then
				sleep = 4
				ESX.ShowNotification(_U('please_tow'))
				NPCHasBeenNextToTowable = true
			end
		end
		Citizen.Wait(sleep)

	end
end)

-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
Citizen.CreateThread(function()
	while true do
		local sleep = 3000
		if PlayerData.job ~= nil and PlayerData.job.name == 'viturro' then
			sleep = 3
			local coords = GetEntityCoords(PlayerPedId())

			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					sleep = 3
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
Citizen.CreateThread(function()
	while true do
		local sleep = 1400

		if PlayerData.job ~= nil and PlayerData.job.name == 'viturro' then
			sleep = 3

			local coords      = GetEntityCoords(PlayerPedId())
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					sleep = 3
				isInMarker  = true
				currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				sleep = 3
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_viturrojob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_viturrojob:hasExitedMarker', LastZone)
			end

		end
		Citizen.Wait(sleep)
	end
end)
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
Citizen.CreateThread(function()
	 local trackedEntities = {
		'prop_watercooler_dark',	
		'prop_barrier_work06a',
		'imp_prop_impexp_postlift',
		'imp_prop_impexp_hub_rack_01a',	
		'v_ret_gc_chair02',	
		'prop_roadcone02a',
		'prop_cs_trolley_01',		
		'prop_toolchest_01'
	 }

	while true do
		local sleep = 20000

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			sleep = 5000
			local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				sleep = 5000
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, objCoords.x, objCoords.y, objCoords.z, true)

				if closestDistance == -1 or closestDistance > distance then
					sleep = 5000
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			sleep = 5000
			if LastEntity ~= closestEntity then
				sleep = 5000
				TriggerEvent('esx_viturrojob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity ~= nil then
				sleep = 5000
				TriggerEvent('esx_viturrojob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
		Citizen.Wait(sleep)
	end
end)

-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(20)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'viturro' then

				if CurrentAction == 'viturro_actions_menu' then
					OpenviturroActionsMenu()
				elseif CurrentAction == 'viturro_harvest_menu' then
					OpenviturroHarvestMenu()
				elseif CurrentAction == 'viturro_craft_menu' then
					OpenviturroCraftMenu()
				elseif CurrentAction == 'delete_vehicle' then

					if Config.EnableSocietyOwnedVehicles then

						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage', 'viturro', vehicleProps)

					else

						if
							--GetEntityModel(vehicle) == GetHashKey('flatbed')   or
							GetEntityModel(vehicle) == GetHashKey('cara') or
							GetEntityModel(vehicle) == GetHashKey('s500w222')
						then
							TriggerServerEvent('esx_service:disableService', 'viturro')
						end

					end

					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Keys['F6']) and not IsDead and PlayerData.job ~= nil and PlayerData.job.name == 'viturro' then
			OpenMobileviturroActionsMenu()
		end

		if IsControlJustReleased(0, Keys['DELETE']) and not IsDead and PlayerData.job ~= nil and PlayerData.job.name == 'viturro' then

			if NPCOnJob then

				if GetGameTimer() - NPCLastCancel > 5 * 60000 then
					StopNPCJob(true)
					NPCLastCancel = GetGameTimer()
				else
					ESX.ShowNotification(_U('wait_five'))
				end

			else

				local playerPed = PlayerPedId()

				if IsPedInAnyVehicle(playerPed, false) and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey("flatbed")) then
					StartNPCJob()
				else
					ESX.ShowNotification(_U('must_in_flatbed'))
				end

			end

		end

	end
end)



AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)

RegisterNetEvent('NB:openMenuviturro')
AddEventHandler('NB:openMenuviturro', function()
	OpenMobileviturroActionsMenu()
end)
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
