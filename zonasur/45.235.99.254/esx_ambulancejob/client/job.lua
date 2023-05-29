local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false

function OpenAmbulanceActionsMenu()
	local elements = {{label = _U('cloakroom'), value = 'cloakroom'}}
	--[[
	if Config.EnablePlayerManagement and PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end
	]]
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBossActionsMenu()
	local elements = {{label = _U('boss_actions'), value = 'boss_actions'}}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu_zs', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenMobileAmbulanceActionsMenu()
	ESX.UI.Menu.CloseAll()
	local grade = PlayerData.job.grade_name
	local elements = {}
	
	table.insert(elements, {label = 'Auto Ayuda', value = 'autocurado'})
	table.insert(elements, {label = _U('ems_menu'), value = 'citizen_interaction'})
	table.insert(elements, {label = 'Colocar Objetos', value = 'objetos'})
	
	if grade ~= 'ambulance' then
		table.insert(elements, {label = '📋 Facturacion 📋', value = 'fine'})
	end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'bottom-right',
		elements = elements
		
		}, function(data, menu)
		if data.current.value == 'fine' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer ~= -1 and closestDistance <= 3.0 then
				OpenFineMenu(closestPlayer)
			else
				ESX.ShowNotification('~r~Ninguna persona cerca!')
			end
		elseif data.current.value == 'autocurado' then
			ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
				if quantity > 0 then
					ESX.UI.Menu.CloseAll()
					TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
					local playerPed = PlayerPedId()
					RequestAnimDict("clothingshirt")
					while not HasAnimDictLoaded("clothingshirt") do
						Citizen.Wait(100)
					end
					TaskPlayAnim(GetPlayerPed(PlayerId()), "clothingshirt", "try_shirt_positive_d", 1.0, -1, -1, 50, 0, 0, 0, 0)
					Citizen.Wait(10000)
					ClearPedTasks(GetPlayerPed(-1))
					local maxHealth = GetEntityMaxHealth(playerPed)
					SetEntityHealth(playerPed, maxHealth)
				else
					ESX.ShowNotification(_U('not_enough_medikit'))
				end
			end, 'medikit')
		elseif data.current.value == 'objetos' then
			ESX.UI.Menu.Open(
							'default', GetCurrentResourceName(), 'citizen_interaction',
						{
							title    = 'Objetos',
							align    = 'bottom-right',
							elements = {
								{label = 'Cono',		value = 'prop_mp_cone_01'},
							}
						}, function(data2, menu2)
							local model     = data2.current.value
							local playerPed = PlayerPedId()
							local coords    = GetEntityCoords(playerPed)
							local forward   = GetEntityForwardVector(playerPed)
							local x, y, z   = table.unpack(coords + forward * 1.0)
				
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
		elseif data.current.value == 'citizen_interaction' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('ems_menu_title'),
				align    = 'bottom-right',
				elements = {
					{label = _U('ems_menu_revive'), value = 'revive'},
					--{label = _U('ems_menu_small'), value = 'small'},
					{label = 'Curar Heridas', value = 'big'},
					--{label = 'Encerrar Sujeto', value = 'encerrar'},
					{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'}
			}}, function(data, menu)
				if isBusy then return end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification(_U('no_players'))
				else
					if data.current.value == 'revive' then
						revivePlayer(closestPlayer)
					elseif data.current.value == 'encerrar' then
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'steal_inventory_item_standard', {
								title = 'Tiempo:'
							}, function(data3, menu3)
								local quantity = tonumber(data3.value)
								local src = GetPlayerServerId(closestPlayer)
								TriggerServerEvent('esx_jail:sendToJailHospital_zs', src, quantity * 60)
								menu3.close()
								menu.close()
							end, function(data3, menu3)
							menu3.close()
						end)
					elseif data.current.value == 'small' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')
					elseif data.current.value == 'big' then
						ESX.UI.Menu.Open(
							'default', GetCurrentResourceName(), 'citizen_interaction_buy_free',
						{
							title    = 'Objetos',
							align    = 'bottom-right',
							elements = {
								{label = 'Cobrar',		value = 'pay'},
								{label = 'Gratis',		value = 'free'}
							}
						}, function(data4, menu4)
							if data4.current.value == 'pay' then
								ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
									if quantity > 0 then
										local closestPlayerPed = GetPlayerPed(closestPlayer)
										local health = GetEntityHealth(closestPlayerPed)

										if health > 0 then
											--ESX.TriggerServerCallback('esx_ambulancejob:getMoney', function(money)
										
												--if money then
													local playerPed = PlayerPedId()
												
													isBusy = true
													ESX.ShowNotification(_U('heal_inprogress'))
													TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
													Citizen.Wait(10000)
													ClearPedTasks(playerPed)
													TriggerServerEvent('esx_ambulancejob:getMoney', GetPlayerServerId(closestPlayer))
													TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
													TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
													ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
													isBusy = false
												--else
													--ESX.ShowNotification(GetPlayerName(closestPlayer)..'~r~ no tiene suficiente efectivo!')
												--end
											--end, GetPlayerServerId(closestPlayer))	
										else
											ESX.ShowNotification(_U('player_not_conscious'))
										end
									else
										ESX.ShowNotification(_U('not_enough_medikit'))
									end
								end, 'medikit')
							else
								ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
									if quantity > 0 then
										local closestPlayerPed = GetPlayerPed(closestPlayer)
										local health = GetEntityHealth(closestPlayerPed)

										if health > 0 then
											local playerPed = PlayerPedId()
												
											isBusy = true
											ESX.ShowNotification(_U('heal_inprogress'))
											TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
											Citizen.Wait(10000)
											ClearPedTasks(playerPed)
	
											TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
											TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
											ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
											isBusy = false
										else
											ESX.ShowNotification(_U('player_not_conscious'))
										end
									else
										ESX.ShowNotification(_U('not_enough_medikit'))
									end
								end, 'medikit')
							end
						end, function(data4, menu4)
							menu4.close()
						end)
					elseif data.current.value == 'put_in_vehicle' then
						TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(_U('revive_inprogress'))

				for i=1, 15 do
					Citizen.Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

				TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
				TriggerServerEvent('esx_ambulancejob:revive_zs', GetPlayerServerId(closestPlayer))
			else
				ESX.ShowNotification(_U('player_not_unconscious'))
			end
		else
			ESX.ShowNotification(_U('not_enough_medikit'))
		end
		isBusy = false
	end, 'medikit')
end

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

-- Draw markers & Marker logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

			local playerCoords = GetEntityCoords(PlayerPedId())
			local letSleep, isInMarker, hasExited = true, false, false
			local currentHospital, currentPart, currentPartNum
			
			for hospitalNum,hospital in pairs(Config.Hospitals) do
				if PlayerData.job and PlayerData.job.name == 'ambulance' then
				-- Ambulance Actions
				for k,v in ipairs(hospital.AmbulanceActions) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'AmbulanceActions', k
						end
					end
				end
				
				-- Pharmacies
				for k,v in ipairs(hospital.Pharmacies) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Pharmacy', k
						end
					end
				end
				
				-- Jefe
				if PlayerData.job.grade_name == 'boss' then
					for k,v in ipairs(hospital.BossActions) do
						local distance = #(playerCoords - v)

						if distance < Config.DrawDistance then
							DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
							letSleep = false

							if distance < Config.Marker.x then
								isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'BossActions', k
							end
						end
					end
				end	

				-- Vehicle Spawners
				for k,v in ipairs(hospital.Vehicles) do
					local distance = #(playerCoords - v.Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
						end
					end
				end
				
				-- Vehicle Delete
				for k,v in ipairs(hospital.VehiclesDelete) do
					local distance = #(playerCoords - v.Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'VehiclesDelete', k
						end
					end
				end
				
				-- Helicopters Spawners
				--if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'subboss' or PlayerData.job.grade_name == 'instructor' then
					for k,v in ipairs(hospital.Helicopters) do
						local distance = #(playerCoords - v.Spawner)

						if distance < Config.DrawDistance then
							DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
							letSleep = false

							if distance < v.Marker.x then
								isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helicopters', k
							end
						end
					end
				--end	

				-- Helicopters Delete
				--if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'subboss' or PlayerData.job.grade_name == 'instructor' then
					for k,v in ipairs(hospital.HelicoptersDelete) do
						if v.Name ~= nil then
							--ESX.ShowNotification(v.Name)
							local distance = #(playerCoords - v.Spawner)
							if distance < Config.DrawDistance then
								DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
								letSleep = false

								if distance < v.Marker.x then
									isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'VehiclesDelete', k
								end
							end
						end
					end	
				--end	
				end
				-- Fast Travels (Prompt)
				for k,v in ipairs(hospital.FastTravelsPrompt) do
					local distance = #(playerCoords - v.From)
					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'FastTravelsPrompt', k
						end
					end
				end
			end
			
			-- Logic for exiting & entering markers
			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum = true, currentHospital, currentPart, currentPartNum

				TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentHospital, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
	end
end)

-- Fast travels
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

		for hospitalNum,hospital in pairs(Config.Hospitals) do
			-- Fast Travels
			for k,v in ipairs(hospital.FastTravels) do
				local distance = #(playerCoords - v.From)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false

					if distance < v.Marker.x then
						FastTravel(v.To.coords, v.To.heading)
					end
				end
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(hospital, part, partNum)
	if part == 'AmbulanceActions' then
		CurrentAction = part
		CurrentActionMsg = _U('actions_prompt')
		CurrentActionData = {}
	elseif part == 'Pharmacy' then
		CurrentAction = part
		CurrentActionMsg = _U('open_pharmacy')
		CurrentActionData = {}
	elseif part == 'BossActions' then
		CurrentAction = part
		CurrentActionMsg = 'Presione ~INPUT_CONTEXT~ para abrir Menu JEFE'
		CurrentActionData = {}
	elseif part == 'Vehicles' then
		CurrentAction = part
		CurrentActionMsg = _U('garage_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'VehiclesDelete' then
		local playerPed = PlayerPedId()
		local coords	= GetEntityCoords(playerPed)
		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle, distance = ESX.Game.GetClosestVehicle({
				x = coords.x,
				y = coords.y,
				z = coords.z
			})
			if distance ~= -1 and distance <= 1.0 then
				CurrentAction		= 'VehiclesDelete'
				CurrentActionMsg	= _U('store_veh')
				CurrentActionData	= {vehicle = vehicle}
			end
		end
	elseif part == 'Helicopters' then
		CurrentAction = part
		CurrentActionMsg = _U('helicopter_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'FastTravelsPrompt' then
		local travelItem = Config.Hospitals[hospital][part][partNum]
		CurrentAction = part
		CurrentActionMsg = travelItem.Prompt
		CurrentActionData = {to = travelItem.To.coords, heading = travelItem.To.heading}
	end
end)

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end
	CurrentAction = nil
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)
			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'AmbulanceActions' then
					OpenAmbulanceActionsMenu()
				elseif CurrentAction == 'Pharmacy' then
					OpenPharmacyMenu()
				elseif CurrentAction == 'BossActions' then
					OpenBossActionsMenu()
				elseif CurrentAction == 'Vehicles' then
					OpenVehicleSpawnerMenu('car', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				elseif CurrentAction == 'Helicopters' then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							if hasDriversLicense then
								OpenVehicleSpawnerMenu('helicopter', CurrentActionData.hospital, 'Helicopters', CurrentActionData.partNum)
							else
								ESX.ShowNotification('~r~No tienes Permiso para sacar Helicoptero!')
							end
						end, GetPlayerServerId(PlayerId()), 'drive_heli')
				elseif CurrentAction == 'FastTravelsPrompt' then
					FastTravel(CurrentActionData.to, CurrentActionData.heading)
				elseif CurrentAction == 'VehiclesDelete' then
					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage_zs', 'ambulance', vehicleProps)
					else
						ESX.ShowNotification('Se vehiculo ah sido ~g~guardado!')
						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
					end
					
				end

				CurrentAction = nil
			end

		elseif PlayerData.job and PlayerData.job.name == 'ambulance' and not isDead then
			if IsControlJustReleased(0, 167) then
				OpenMobileAmbulanceActionsMenu()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
			end
		end
	end
end)


function OpenCloakroomMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'bottom-right',
		elements = {
			{label = _U('ems_clothes_civil'), value = 'citizen_wear'},
			{label = _U('ems_clothes_ems'), value = 'ambulance_wear'},
	}}, function(data, menu)
		local grade = PlayerData.job.grade_name
		
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				isOnDuty = false
				exports["rp-radio"]:RemovePlayerAccessToFrequency(2)
				for playerId,v in pairs(deadPlayerBlips) do
					RemoveBlip(v)
					deadPlayerBlips[playerId] = nil
				end
			end)
		elseif data.current.value == 'ambulance_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[grade].male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[grade].female)
				end
			end)
			isOnDuty = true
			exports["rp-radio"]:GivePlayerAccessToFrequency(2)
			--TriggerEvent('esx_ambulancejob:setDeadPlayers', deadPlayers)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = _U('pharmacy_menu_title'),
		align    = 'bottom-right',
		elements = {
			{label = 'Comer Vianda', value = 'comer'},
			{label = _U('pharmacy_take', _U('medikit')), item = 'medikit', type = 'slider', value = 1, min = 1, max = 100},
			--{label = _U('pharmacy_take', _U('bandage')), item = 'bandage', type = 'slider', value = 1, min = 1, max = 100},
			{label = _U('pharmacy_take', _U('xanax')), item = 'xanax', type = 'slider', value = 1, min = 1, max = 100},
			--{label = _U('pharmacy_take', _U('buceo')), item = 'plongee2', type = 'slider', value = 1, min = 1, max = 100},
			{label = 'Guardar Objetos', value = 'put_stock'},
			{label = 'Retirar Objetos', value = 'get_stock'}
	}}, function(data, menu)
		if data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'comer' then
			Comer()
		else		
			TriggerServerEvent('esx_ambulancejob:giveItem', data.current.item, data.current.value)
		end	
	end, function(data, menu)
		menu.close()
	end)
end

function Comer()
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
    TriggerEvent('esx_basicneeds:onEat')
	ESX.ShowNotification('Comista tu Vianda!')
end

function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_ambulancejob:getStockItems', function(inventory)


		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name)..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				index = i
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = 'Armario Same',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.type == 'item_weapon' then
				menu.close()

				TriggerServerEvent('esx_ambulancejob:getStockItem', data.current.type, data.current.value, data.current.index)
				ESX.SetTimeout(300, function()
					OpenGetStocksMenu()
				end)
			else

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = 'Cantidad'
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('Cantidad invalida')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_ambulancejob:getStockItem', data.current.type, data.current.value, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
		end, function(data, menu)
			menu.close()
		end)

	end)

end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_ambulancejob:getPlayerInventory', function(inventory)

		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type  = 'item_account',
				value = 'black_money'
			})
		end

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

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label .. ' [' .. weapon.ammo .. ']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = 'Inventario',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
		
			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_ambulancejob:putStockItems', data.current.type, data.current.value, data.current.ammo)
				ESX.SetTimeout(300, function()
					OpenPutStocksMenu()
				end)
			else
			
			local itemName = data.current.value
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = 'Cantidad'
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('Cantidad invalida')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_ambulancejob:putStockItems', data.current.type, itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
		end, function(data, menu)
			menu.close()
		end)
	end)

end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job ~= 'ambulance' then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
	end
end)

function BorroPed(ped)
	Wait(60000 * 7)
	if DoesEntityExist(ped) then
		DeleteEntity(ped)
	end
end

function ClonoPed(ped)	
	while not NetworkDoesEntityExistWithNetworkId(ped) do
        Wait(0)
    end

	local PlayerNetID = PedToNet(GetPlayerPed(-1)) -- checks the current clients' PlayerPedNetID
	
	if ped ~= PlayerPedNetID then	
		local clon = NetworkGetEntityFromNetworkId(ped)
		local playerDummy = ClonePed(clon, false, false, true)
		BorroPed(playerDummy)
	end
end

--[[
RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers
	
	--ClonoPed(ped)
	
	if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if status == 'distress' then
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)
]]--

function OpenFineMenu(player)
	local grade = PlayerData.job.grade_name
	local elements = {}
	table.insert(elements, {label = 'Medico', value = 3})
	if grade == 'psiquiatra' then
		table.insert(elements, {label = 'Psiquiatra', value = 4})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine',
	{
		title    = '📋 Facturacion 📋',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)

end

function OpenFineCategoryMenu(player, category)

	ESX.TriggerServerCallback('esx_ambulancejob:getFineList', function(fines)

		local elements = {}

		for i=1, #fines, 1 do
			table.insert(elements, {
				label     = fines[i].label .. ' <span style="color: green;">$' .. fines[i].amount .. '</span>',
				value     = fines[i].id,
				amount    = fines[i].amount,
				fineLabel = fines[i].label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category',
		{
			title    = '📋 Facturacion 📋',
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)

			local label  = data.current.fineLabel
			local amount = data.current.amount

			menu.close()

			TriggerServerEvent('esx_billing:sendBill_zs', GetPlayerServerId(player), 'same', 'Factura SAME: $', amount)

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, 3)
			end)

		end, function(data, menu)
			menu.close()
		end)

	end, category)

end
