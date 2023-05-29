local HasAlreadyEnteredMarker, LastZone = false, nil
local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local CurrentlyTowedVehicle, Blips, NPCOnJob, NPCTargetTowable, NPCTargetTowableZone = nil, {}, false, nil, nil
local NPCHasSpawnedTowable, NPCLastCancel, NPCHasBeenNextToTowable, NPCTargetDeleterZone = false, GetGameTimer() - 5 * 60000, false, false
local isDead, isBusy = false, false

local function OpenMechanicActionsMenu()
	local elements = {
		{unselectable = true, icon = "fa-solid fa-screwdriver-wrench fa-beat-fade", title = _U('mechanic')},
		{icon = "fas fa-car",   title = _U('vehicle_list'),   value = 'vehicle_list'},
		{icon = "fas fa-shirt", title = _U('work_wear'),      value = 'cloakroom'},
		{icon = "fas fa-shirt", title = _U('civ_wear'),       value = 'cloakroom2'},
		{icon = "fas fa-box",   title = _U('deposit_stock'),  value = 'put_stock'},
		-- {icon = "fas fa-box",   title = _U('withdraw_stock'), value = 'get_stock'}
	}

	if Config.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name == 'boss' then
		elements[#elements+1] = {
			icon = 'fa-sharp fa-solid fa-crown fa-bounce',
			title = _U('boss_actions'), 
			value = 'boss_actions'
		}
	end

	ESX.OpenContext("right", elements, function(menu,element)
		if element.value == 'vehicle_list' then
			if Config.EnableSocietyOwnedVehicles then
				local elements2 = {
					{unselectable = true, icon = "fas fa-car", title = _U('service_vehicle')}
				}

				ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
					for i=1, #vehicles, 1 do
						elements2[#elements2+1] = {
							icon = 'fas fa-car',
							title = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']',
							value = vehicles[i]
						}
					end

					ESX.OpenContext("right", elements2, function(menu2,element2)
						ESX.CloseContext()
						local vehicleProps = element2.value

						ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones_Mechanic2.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
							ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						end)

						TriggerServerEvent('esx_society:removeVehicleFromGarage', 'mechanic2', vehicleProps)
					end)
				end, 'mechanic2')
			else
				local elements2 = {
					{unselectable = true, icon = "fas fa-car", title = _U('service_vehicle')},
					{icon = "fas fa-truck", title = _U('flat_bed'),  value = 'flatbed'},
					{icon = "fas fa-truck", title = _U('tow_truck'), value = 'towtruck2'}
				}

				if Config.EnablePlayerManagement and ESX.PlayerData.job and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'experimente') then
					elements2[#elements2+1] = {
						icon = 'fas fa-truck',
						title = 'Slamvan', 
						value = 'slamvan3'
					}
				end

				ESX.OpenContext("right", elements2, function(menu2,element2)
					if Config.MaxInService == -1 then
						ESX.CloseContext()
						ESX.Game.SpawnVehicle(element2.value, Config.Zones_Mechanic2.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
						end)
					else
						ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
							if canTakeService then
								ESX.CloseContext()
								ESX.Game.SpawnVehicle(element2.value, Config.Zones_Mechanic2.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
									local playerPed = PlayerPedId()
									TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
								end)
							else
								ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
							end
						end, 'mechanic2')
					end
				end)
			end
		elseif element.value == 'cloakroom' then
			ESX.CloseContext()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		elseif element.value == 'cloakroom2' then
			ESX.CloseContext()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif Config.OxInventory and (element.value == 'put_stock' or element.value == 'get_stock') then
			exports.ox_inventory:openInventory('stash', 'society_mechanic2')
			return ESX.CloseContext()
		elseif element.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif element.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif element.value == 'boss_actions' then
			ESX.CloseContext()
			TriggerEvent('esx_society:openBossMenu', 'mechanic2')
		end
	end, function(menu)
		CurrentAction     = 'mechanic_actions_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	end)
end

local function OpenMechanicHarvestMenu()
	if Config.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name ~= 'recrue' then
		local elements = {
			{unselectable = true, icon = "fas fa-gear", title = "Mechanic Harvest Menu"},
			{icon = "fas fa-gear", title = _U('gas_can'), value = 'gaz_bottle'},
			{icon = "fas fa-gear", title = _U('repair_tools'), value = 'fix_tool'},
			{icon = "fas fa-gear", title = _U('body_work_tools'), value = 'caro_tool'}
		}

		ESX.OpenContext("right", elements, function(menu,element)
			if element.value == 'gaz_bottle' then
				TriggerServerEvent('esx_mechanicjob2:startHarvest')
			elseif element.value == 'fix_tool' then
				TriggerServerEvent('esx_mechanicjob2:startHarvest2')
			elseif element.value == 'caro_tool' then
				TriggerServerEvent('esx_mechanicjob2:startHarvest3')
			end
		end, function(menu)
			CurrentAction     = 'mechanic_harvest_menu'
			CurrentActionMsg  = _U('harvest_menu')
			CurrentActionData = {}
		end)
	else
		ESX.ShowNotification(_U('not_experienced_enough'))
	end
end

local function OpenMechanicCraftMenu()
	if Config.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name ~= 'recrue' then
		local elements = {
			{unselectable = true, icon = "fa-solid fa-gear fa-beat-fade", title = "Ensamble de objetos"},
			-- {icon = "fas fa-gear", title = _U('blowtorch'),  value = 'blow_pipe'},
			{icon = "fa-solid fa-toolbox", title = _U('repair_kit'), value = 'fix_kit'},
			-- {icon = "fas fa-gear", title = _U('body_kit'),   value = 'caro_kit'}
		}

		ESX.OpenContext("right", elements, function(menu,element)
			if element.value == 'blow_pipe' then
				TriggerServerEvent('esx_mechanicjob2:startCraft')
			elseif element.value == 'fix_kit' then
				TriggerServerEvent('esx_mechanicjob2:startCraft2')
			elseif element.value == 'caro_kit' then
				TriggerServerEvent('esx_mechanicjob2:startCraft3')
			end
		end, function(menu)
			CurrentAction     = 'mechanic_craft_menu'
			CurrentActionMsg  = _U('craft_menu')
			CurrentActionData = {}
		end)
	else
		ESX.ShowNotification(_U('not_experienced_enough'))
	end
end

local function OpenMobileMechanicActionsMenu()
	local elements = {
		{unselectable = true, icon = "fa-solid fa-screwdriver-wrench fa-beat-fade", title = _U('mechanic')},
		{icon = "fa-solid fa-clipboard", title = _U('billing'),       value = 'billing'},
		-- {icon = "fas fa-gear", title = _U('hijack'),        value = 'hijack_vehicle'},
		{icon = "fa-solid fa-toolbox", title = _U('repair'),        value = 'fix_vehicle'},
		{icon = "fa-solid fa-pump-soap", title = _U('clean'),         value = 'clean_vehicle'},
		{icon = "fa-solid fa-warehouse", title = _U('imp_veh'),       value = 'del_vehicle'},
		{icon = "fa-solid fa-gear fa-spin", title = _U('flat_bed'),      value = 'dep_vehicle'}
		-- {icon = "fas fa-gear", title = _U('place_objects'), value = 'object_spawner'}
	}

	ESX.OpenContext("right", elements, function(menu,element)
		if isBusy then return end

		if element.value == "billing" then
			local elements2 = {
				{unselectable = true, icon = "fas fa-scroll", title = element.title},
				{title = "Importe", input = true, inputType = "number", inputMin = 1, inputMax = 1000000000000, inputPlaceholder = "Importe de la factura.."},
				{icon = "fas fa-check-double", title = "Confirmar", value = "confirm"}
			}

			ESX.OpenContext("right", elements2, function(menu2,element2)
				local amount = tonumber(menu2.eles[2].inputValue)

				if amount == nil or amount < 0 then
					ESX.ShowNotification(_U('amount_invalid'), "error")
				else
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification(_U('no_players_nearby'), "error")
					else
						ESX.CloseContext()
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_mechanic2', _U('mechanic'), amount)
					end
				end
			end)
		elseif element.value == "hijack_vehicle" then
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()
			local coords = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
				CreateThread(function()
					Wait(10000)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification(_U('vehicle_unlocked'))
					isBusy = false
				end)
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		elseif element.value == "fix_vehicle" then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
				CreateThread(function()
					Wait(20000)

					SetVehicleFixed(vehicle)
					SetVehicleDeformationFixed(vehicle)
					SetVehicleUndriveable(vehicle, false)
					SetVehicleEngineOn(vehicle, true, true)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification(_U('vehicle_repaired'))
					isBusy = false
				end)
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		elseif element.value == "clean_vehicle" then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end

			if DoesEntityExist(vehicle) then
				ESX.CloseContext()
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				if lib.progressCircle({
					duration = 10000,
					label = "Limpiando Vehículo",
					position = 'middle',
					useWhileDead = false,
					canCancel = true,
					disable = {
						move = true,
						combat = true
					},
					--[[anim = {
						dict = 'mp_player_intdrink',
						clip = 'loop_bottle'
					},
					prop = {
						model = `prop_ld_flow_bottle`,
						pos = vec3(0.03, 0.03, 0.02),
						rot = vec3(0.0, 0.0, -1.5)
					},]]
				}) then 
					SetVehicleDirtLevel(vehicle, 0)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification(_U('vehicle_cleaned'))
					isBusy = false
				end
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end
		elseif element.value == "del_vehicle" then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)

					if GetPedInVehicleSeat(vehicle, -1) == playerPed then
						ESX.CloseContext()
						if lib.progressCircle({
							duration = 12000,
							label = "Confiscando Vehículo",
							position = 'middle',
							useWhileDead = false,
							canCancel = true,
							disable = {
								car = true,
							},
							--[[anim = {
								dict = 'mp_player_intdrink',
								clip = 'loop_bottle'
							},
							prop = {
								model = `prop_ld_flow_bottle`,
								pos = vec3(0.03, 0.03, 0.02),
								rot = vec3(0.0, 0.0, -1.5)
							},]]
						}) then 

							ExecuteCommand("do Se vería a la grúa llevarse al auto al confiscado")
							ESX.ShowNotification(_U('vehicle_impounded'), 'success')
							ESX.Game.DeleteVehicle(vehicle)
						end
					else
						ESX.ShowNotification(_U('must_seat_driver'))
					end
			else
				local vehicle = ESX.Game.GetVehicleInDirection()
				ESX.CloseContext()
				if DoesEntityExist(vehicle) then
					if lib.progressCircle({
						duration = 12000,
						label = "Confiscando Vehículo",
						position = 'middle',
						useWhileDead = false,
						canCancel = true,
						disable = {
							move = true,
							combat = true
						},
						anim = {
							dict = 'amb@medic@standing@kneel@base',
							clip = 'base'
						},
						--[[prop = {
							model = `prop_ld_flow_bottle`,
							pos = vec3(0.03, 0.03, 0.02),
							rot = vec3(0.0, 0.0, -1.5)
						},]]
					}) then
						ExecuteCommand("do Se vería a la grúa llevarse al auto al confiscado")
						ESX.ShowNotification(_U('vehicle_impounded'), 'success')
						ESX.Game.DeleteVehicle(vehicle)
					end
				else
					ESX.ShowNotification(_U('must_near'))
				end
			end
		elseif element.value == "dep_vehicle" then
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			local towmodel = `flatbed`
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
								ESX.CloseContext()
								if NPCOnJob then
									if NPCTargetTowable == targetVehicle then
										ESX.ShowNotification(_U('please_drop_off'))
										Config.Zones_Mechanic2.VehicleDelivery.Type = 1

										if Blips['NPCTargetTowableZone'] then
											RemoveBlip(Blips['NPCTargetTowableZone'])
											Blips['NPCTargetTowableZone'] = nil
										end

										Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones_Mechanic2.VehicleDelivery.Pos.x, Config.Zones_Mechanic2.VehicleDelivery.Pos.y, Config.Zones_Mechanic2.VehicleDelivery.Pos.z)
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
					ESX.CloseContext()
					if NPCOnJob then
						if NPCTargetDeleterZone then

							if CurrentlyTowedVehicle == NPCTargetTowable then
								ESX.Game.DeleteVehicle(NPCTargetTowable)
								TriggerServerEvent('esx_mechanicjob2:onNPCJobMissionCompleted')
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
		elseif element.value == "object_spawner" then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end

			local elements2 = {
				{unselectable= true, icon = "fas fa-object", title = _U('objects')},
				{icon = "fas fa-object", title = _U('roadcone'), value = 'prop_roadcone02a'},
				{icon = "fas fa-object", title = _U('toolbox'),  value = 'prop_toolchest_01'}
			}

			ESX.OpenContext("right", elements2, function(menuObj,elementObj)
				local model   = elementObj.value
				local coords  = GetEntityCoords(playerPed)
				local forward = GetEntityForwardVector(playerPed)
				local x, y, z = table.unpack(coords + forward * 1.0)

				if model == 'prop_roadcone02a' then
					z = z - 2.0
				elseif model == 'prop_toolchest_01' then
					z = z - 2.0
				end

				ESX.Game.SpawnObject(model, {x = x, y = y, z = z}, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)
			end)
		end
	end)
end

local function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob2:getStockItems', function(items)
		local elements = {
			{unselectable = true, icon = "fas fa-box", title = _U('mechanic_stock')}
		}

		for i=1, #items, 1 do
			elements[#elements+1] = {
				icon = 'fas fa-box',
				title = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			}
		end

		ESX.OpenContext("right", elements, function(menu,element)
			local itemName = element.value

			local elements2 = {
				{unselectable = true, icon = "fas fa-box", title = element.title},
				{title = "Amount", input = true, inputType = "number", inputMin = 1, inputMax = 100, inputPlaceholder = "Amount to withdraw.."},
				{icon = "fas fa-check-double", title = "Confirmar", value = "confirm"}
			}

			ESX.OpenContext("right", elements2, function(menu2,element2)
				local count = tonumber(menu2.eles[2].inputValue)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					ESX.CloseContext()
					TriggerServerEvent('esx_mechanicjob2:getStockItem', itemName, count)

					Wait(1000)
					OpenGetStocksMenu()
				end
			end)
		end)
	end)
end

local function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob2:getPlayerInventory', function(inventory)
		local elements = {
			{unselectable = true, icon = "fas fa-box", title = _U('inventory')}
		}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				elements[#elements+1] = {
					icon = 'fas fa-box',
					title = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				}
			end
		end

		ESX.OpenContext("right", elements, function(menu,element)
			local itemName = element.value

			local elements2 = {
				{unselectable = true, icon = "fas fa-box", title = element.title},
				{title = "Amount", input = true, inputType = "number", inputMin = 1, inputMax = 100, inputPlaceholder = "Amount to deposit.."},
				{icon = "fas fa-check-double", title = "Confirmar", value = "confirm"}
			}

			ESX.OpenContext("right", elements2, function(menu2,element2)
				local count = tonumber(menu2.eles[2].inputValue)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					ESX.CloseContext()
					TriggerServerEvent('esx_mechanicjob2:putStockItems', itemName, count)

					Wait(1000)
					OpenPutStocksMenu()
				end
			end)
		end)
	end)
end

RegisterNetEvent('esx_mechanicjob2:onHijack')
AddEventHandler('esx_mechanicjob2:onHijack', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

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

			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)

			CreateThread(function()
				Wait(10000)
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

RegisterNetEvent('esx_mechanicjob2:onCarokit')
AddEventHandler('esx_mechanicjob2:onCarokit', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_HAMMERING', 0, true)
			CreateThread(function()
				Wait(10000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification(_U('body_repaired'))
			end)
		end
	end
end)

RegisterNetEvent('esx_mechanicjob2:onFixkit')
AddEventHandler('esx_mechanicjob2:onFixkit', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
			CreateThread(function()
				Wait(20000)
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
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('esx_mechanicjob2:hasEnteredMarker', function(zone)

	if zone == 'Craft' then return end

	if zone == 'NPCJobTargetTowable' then

	elseif zone =='VehicleDelivery' then
		NPCTargetDeleterZone = true
	elseif zone == 'MechanicActions' then
		CurrentAction     = 'mechanic_actions_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'Garage' then
		CurrentAction     = 'mechanic_harvest_menu'
		CurrentActionMsg  = _U('harvest_menu')
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
	ESX.TextUI(CurrentActionMsg)
end)

AddEventHandler('esx_mechanicjob2:hasExitedMarker', function(zone)
	if zone =='VehicleDelivery' then
		NPCTargetDeleterZone = false
	elseif zone == 'Craft' then
		TriggerServerEvent('esx_mechanicjob2:stopCraft')
		TriggerServerEvent('esx_mechanicjob2:stopCraft2')
		TriggerServerEvent('esx_mechanicjob2:stopCraft3')
	elseif zone == 'Garage' then
		TriggerServerEvent('esx_mechanicjob2:stopHarvest')
		TriggerServerEvent('esx_mechanicjob2:stopHarvest2')
		TriggerServerEvent('esx_mechanicjob2:stopHarvest3')
	end

	CurrentAction = nil
	ESX.CloseContext()
	ESX.HideUI()
end)

AddEventHandler('esx_mechanicjob2:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic2' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('press_remove_obj')
		CurrentActionData = {entity = entity}
		ESX.TextUI(CurrentActionMsg)
	end
end)

AddEventHandler('esx_mechanicjob2:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
	ESX.HideUI()
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('mechanic'),
		number     = 'mechanic2',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAAA4BJREFUWIXtll9oU3cUx7/nJA02aSSlFouWMnXVB0ejU3wcRteHjv1puoc9rA978cUi2IqgRYWIZkMwrahUGfgkFMEZUdg6C+u21z1o3fbgqigVi7NzUtNcmsac40Npltz7S3rvUHzxQODec87vfD+/e0/O/QFv7Q0beV3QeXqmgV74/7H7fZJvuLwv8q/Xeux1gUrNBpN/nmtavdaqDqBK8VT2RDyV2VHmF1lvLERSBtCVynzYmcp+A9WqT9kcVKX4gHUehF0CEVY+1jYTTIwvt7YSIQnCTvsSUYz6gX5uDt7MP7KOKuQAgxmqQ+neUA+I1B1AiXi5X6ZAvKrabirmVYFwAMRT2RMg7F9SyKspvk73hfrtbkMPyIhA5FVqi0iBiEZMMQdAui/8E4GPv0oAJkpc6Q3+6goAAGpWBxNQmTLFmgL3jSJNgQdGv4pMts2EKm7ICJB/aG0xNdz74VEk13UYCx1/twPR8JjDT8wttyLZtkoAxSb8ZDCz0gdfKxWkFURf2v9qTYH7SK7rQIDn0P3nA0ehixvfwZwE0X9vBE/mW8piohhl1WH18UQBhYnre8N/L8b8xQvlx4ACbB4NnzaeRYDnKm0EALCMLXy84hwuTCXL/ExoB1E7qcK/8NCLIq5HcTT0i6u8TYbXUM1cAyyveVq8Xls7XhYrvY/4n3gC8C+dsmAzL1YUiyfWxvHzsy/w/dNd+KjhW2yvv/RfXr7x9QDcmo1he2RBiCCI1Q8jVj9szPNixVfgz+UiIGyDSrcoRu2J16d3I6e1VYvNSQjXpnucAcEPUOkGYZs/l4uUhowt/3kqu1UIv9n90fAY9jT3YBlbRvFTD4fw++wHjhiTRL/bG75t0jI2ITcHb5om4Xgmhv57xpGOg3d/NIqryOR7z+r+MC6qBJB/ZB2t9Om1D5lFm843G/3E3HI7Yh1xDRAfzLQr5EClBf/HBHK462TG2J0OABXeyWDPZ8VqxmBWYscpyghwtTd4EKpDTjCZdCNmzFM9k+4LHXIFACJN94Z6FiFEpKDQw9HndWsEuhnADVMhAUaYJBp9XrcGQKJ4qFE9k+6r2+MG3k5N8VQ22TVglbX2ZwOzX2VvNKr91zmY6S7N6zqZicVT2WNLyVSehESaBhxnOALfMeYX+K/S2yv7wmMAlvwyuR7FxQUyf0fgc/jztfkJr7XeGgC8BJJgWNV8ImT+AAAAAElFTkSuQmCC'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)


-- Create Blips
CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones_Mechanic2.MechanicActions.Pos.x, Config.Zones_Mechanic2.MechanicActions.Pos.y, Config.Zones_Mechanic2.MechanicActions.Pos.z)

	SetBlipSprite (blip, 446)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipColour (blip, 5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('mechanic'))
	EndTextCommandSetBlipName(blip)
end)

-- Display markers
CreateThread(function()
	while true do
		local Sleep = 2000

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic2' then
			Sleep = 500
			local coords, letSleep = GetEntityCoords(PlayerPedId()), true

			for k,v in pairs(Config.Zones_Mechanic2) do
				if v.Type ~= -1 and #(coords - v.Pos) < Config.DrawDistance then
					Sleep = 0
					-- print(json.encode(v))
					if v.Eliminar == true then
						if IsPedInAnyVehicle(PlayerPedId(), false) then
							DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, true, true, 2, true, nil, nil, false)
							letSleep = false
						end
					else
						DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, true, true, 2, true, nil, nil, false)
						letSleep = false
					end
				end
			end
		end
	Wait(Sleep)
	end
end)

-- Enter / Exit marker events
CreateThread(function()
	while true do
		local Sleep = 500

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic2' then

			local coords = GetEntityCoords(PlayerPedId())
			local isInMarker = false
			local currentZone = nil

			for k,v in pairs(Config.Zones_Mechanic2) do
				if(#(coords - v.Pos) < v.Size.x) then
					Sleep = 0
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_mechanicjob2:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_mechanicjob2:hasExitedMarker', LastZone)
			end
		end
	Wait(Sleep)
	end
end)

CreateThread(function()
	local trackedEntities = {
		'prop_roadcone02a',
		'prop_toolchest_01'
	}

	while true do
		Wait(500)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords, 3.0, joaat(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = #(coords - objCoords)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_mechanicjob2:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_mechanicjob2:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

-- Key Controls
CreateThread(function()
	while true do
	local sleep = 500
		if CurrentAction then
			sleep = 0
			if IsControlJustReleased(0, 38) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic2' then
				if CurrentAction == 'mechanic_actions_menu' then
					OpenMechanicActionsMenu()
				elseif CurrentAction == 'mechanic_harvest_menu' then
					OpenMechanicHarvestMenu()
				elseif CurrentAction == 'mechanic_craft_menu' then
					OpenMechanicCraftMenu()
				elseif CurrentAction == 'delete_vehicle' then
			if Config.EnableSocietyOwnedVehicles then

				local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
				TriggerServerEvent('esx_society:putVehicleInGarage', 'mechanic2', vehicleProps)
			else
				local entityModel = GetEntityModel(CurrentActionData.vehicle)

				if entityModel == `flatbed` or	entityModel == `towtruck2` or entityModel == `slamvan3` then
					TriggerServerEvent('esx_service:disableService', 'mechanic2')
				end
			end
		ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
	elseif CurrentAction == 'remove_entity' then
		DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			 end
		 end
		Wait(sleep)
	end
end)
RegisterCommand('mechanicMenuLS', function()
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic2' then
			OpenMobileMechanicActionsMenu()
		end
end, false)


RegisterKeyMapping('mechanicMenuLS', 'Mecánico - Menu General', 'keyboard', 'F6')
-- RegisterKeyMapping('mechanicjob', 'Togggle NPC Job', 'keyboard', 'F6')

AddEventHandler('esx:onPlayerDeath', function(data) isDead = true end)
AddEventHandler('esx:onPlayerSpawn', function(spawn) isDead = false end)
