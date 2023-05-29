RegisterNetEvent('sqz_unijob:sendClientNotify')
AddEventHandler('sqz_unijob:sendClientNotify', function(notify_text)
    ESX.ShowNotification(notify_text)
    -- Here you can replace the notification to your custom
end)

function DrawText3Ds(pos, text)
	local onScreen,_x,_y=World3dToScreen2d(pos.x,pos.y,pos.z + 0.4)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.5, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 200
	DrawRect(_x,_y+0.0105, 0.003+ factor, 0.03, 0, 0, 0, 200)
end

function DrawMarkerE(type, pos, size, color, bouncing, rotating)
	DrawMarker(type, pos, 0, 0, 0, 0, 0, 0, size.x, size.y, size.z, color.r, color.g, color.b, 100, bouncing, true, 2, rotating, nil, nil, false)
end

function OpenArmoryMenu(station)
	local elements = {}

	if Config.Jobs[ESX.PlayerData.job.name].Zones[station].BuyWeapon and ESX.PlayerData.job.grade >= Config.Jobs[ESX.PlayerData.job.name].Zones[station].BuyWeaponGrade then
		table.insert(elements, {label = _U('buy_weapon'),     value = 'buy_weapons'})
	end

	 if ESX.PlayerData.job.grade >= Config.Jobs[ESX.PlayerData.job.name].Zones[station].GetWeaponGrade then
	-- 	table.insert(elements, {label = _U('put_weapon'),     value = 'put_weapon'})
	-- 	table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
	--	 table.insert(elements, {label = 'Deposito',     value = 'inventario'})
	 end

	 if ESX.PlayerData.job.grade >= Config.Jobs[ESX.PlayerData.job.name].Zones[station].GetStockGrade then
	  table.insert(elements, {label = 'Deposito',     value = 'inventario'})
	-- 	table.insert(elements, {label = _U('deposit_object'),     value = 'put_stock'})
	--	table.insert(elements, {label = _U('get_stock'),     value = 'get_stock'})
	 end

	-- table.insert(elements, {label = 'Deposito',     value = 'inventario'})

	if Config.Jobs[ESX.PlayerData.job.name].Zones[station].BuyItems then
		table.insert(elements, {label = _U('buy_items'),     value = 'buy_items'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = _U('armory'),
		align    = Config.MenuAlign,
		elements = elements
	}, function(data, menu)
		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu(station)
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenu(station)
		elseif data.current.value == 'inventario' then 
			AbrirChezza(ESX.PlayerData.job.name, ESX.PlayerData.job.label)
		elseif data.current.value == 'buy_weapons' then
			OpenBuyWeaponsMenu(station)
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu(station)
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu(station)
		elseif data.current.value == 'buy_items' then
			OpenBuyItemsMenu(station)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionData = {station = station}
	end)
end


function AbrirChezza(job, label)
TriggerEvent('inventory:UniJobs', job, label)
end


function OpenF6ControlMenu()
	ESX.UI.Menu.CloseAll()
	local elements = {}
		for k, v in pairs(Config.Jobs) do
			if ESX.PlayerData.job.name == k then
				if Config.Jobs[ESX.PlayerData.job.name].AllowedActions.HasBodyActions then
					table.insert(elements, {label = _U('citizen_interaction'), value = 'citizen_interaction'})
				end

				if Config.Jobs[ESX.PlayerData.job.name].AllowedActions.HasMechanicActions then
					table.insert(elements, {label = _U('vehicle_interaction'), value = 'vehicle_interaction'})
				end

				if Config.Jobs[ESX.PlayerData.job.name].AllowedActions.Billing then
					table.insert(elements, {label = _U('billing'), value = 'billing'})
				end

				table.insert(elements, {label = 'Activar Radio', value = 'activarradio'})
				
			end
		end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'f6_actions', {
				title    = _U('job_actions_menu'),
				align    = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
			if data.current.value == 'billing' then
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billingsqwaefwa', {
						title = _U('billing_amount')
						}, function(data, menu)
							ESX.UI.Menu.CloseAll()
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing1507', {
								title = _U('billing_label')
								}, function(data3, menu3)

								local amount = tonumber(data.value)
								local billinglabel = data3.value
								if billinglabel == nil then
									TriggerEvent('sqz_unijob:sendClientNotify', _U('billing_label_empty'))
								elseif amount == nil then
									TriggerEvent('sqz_unijob:sendClientNotify', _U('billing_ammount_empty'))
								else
									menu.close()
									local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
									if closestPlayer == -1 or closestDistance > 3.0 then
										TriggerEvent('sqz_unijob:sendClientNotify', _U('no_players_near'))
									else
										ESX.UI.Menu.CloseAll()
										local playerPed        = GetPlayerPed(-1)
										if Config.UseAnimations then
											TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
										end
										if Config.UseAnimations and not Config.UseMythic_Progressbar then
											Citizen.Wait(5000)
											ClearPedTasks(playerPed)
										end
										if Config.UseMythic_Progressbar then
											TriggerEvent(Config.customEvents["mythic_progressbar:client:progress"], {
												name = "faktura_not_fine_sqz_unijob",
												duration = 20000,
												label = _U("proggbar_writing_bill"),
												useWhileDead = false,
												canCancel = false,
												controlDisables = {
													disableMovement = true,
													disableCarMovement = true,
													disableMouse = false,
													disableCombat = true,
													}
												}, function(status)
											end)
										end
										if Config.UseMythic_Progressbar then
											Citizen.Wait(5000)
											ClearPedTasks(playerPed)
										end
										TriggerServerEvent(Config.customEvents['esx_billing:sendBill'], GetPlayerServerId(closestPlayer), 'society_'..ESX.PlayerData.job.name, billinglabel, amount)
										TriggerEvent('sqz_unijob:sendClientNotify', _U('bill_sent'))
									end
								end
						end, function(data3, menu3)
							menu3.close()
						end)
					end, function(data, menu)
						menu.close()
					end)	
				else
					TriggerEvent('sqz_unijob:sendClientNotify', _U("no_players_near"))
				end
			end

		if data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('search'), value = 'search'},
				{label = _U('handcuff'), value = 'handcuff'},
			--	{label = _U('un_hadncuff'), value = 'uncuff'},
				{label = _U('drag'), value = 'drag'},
			--	{label = _U('put_in_vehicle'), value = 'put_in_vehicle'},
			--	{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
			}
			for k, v in pairs(Config.Jobs) do
				if ESX.PlayerData.job.name == k then
					if Config.Jobs[ESX.PlayerData.job.name].AllowedActions.CanRevive then
						table.insert(elements, {label = _U('revive'), value = 'revive'})
					end
				end
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('citizen_interaction'),
				align    = Config.MenuAlign,
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if closestPlayer ~= -1 and closestDistance <= 3.0 then
			local action = data2.current.value
				if action == 'search' then
					if GetResourceState('ox_inventory') == 'started' then
						ExecuteCommand('steal')
					elseif GetResourceState('qs-inventory') == 'started' then
						TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", GetPlayerServerId(closestPlayer))
					else
						local searchPlayerPed = GetPlayerPed(closestPlayer)
						if IsEntityPlayingAnim(searchPlayerPed, 'missminuteman_1ig_2', 'handsup_enter', 3) or IsEntityPlayingAnim(searchPlayerPed, 'random@mugging3', 'handsup_standing_base', 3) or IsEntityPlayingAnim(searchPlayerPed, 'mp_arresting', 'idle', 3) or IsEntityDead(searchPlayerPed) then
							if Config.UseMythic_Progressbar then

								ExecuteCommand( "me lo cachea" )
								TriggerEvent(Config.customEvents["mythic_progressbar:client:progress"], {
									name = "stealing",
									duration = 8000,
									label = _U('searching_player'),
									useWhileDead = false,
									canCancel = true,
									controlDisables = {
										disableMovement = true,
										disableCarMovement = true,
										disableMouse = false,
										disableCombat = true,
									},
				
									animation = {
										animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
										anim = "machinic_loop_mechandplayer",
										flags = 49,
									},

									}, function(cancelled)
										if not cancelled then
											ESX.TriggerServerCallback('sqz_unijob:CheckOpenInventory', function(canBeOpened)
												if canBeOpened then
													TriggerServerEvent('sqz_unijob:InventoryOpenedSuccesfully', GetPlayerServerId(closestPlayer))
													--OpenBodySearchMenu(closestPlayer)
													TriggerEvent('inventory:openPlayerInventory', GetPlayerServerId(closestPlayer))
													TriggerServerEvent('sqz_unijob:db_log', 'Search', GetPlayerServerId(closestPlayer), Config.DiscordLoggingActionsMenu)
												else
												
													TriggerServerEvent('sqz_unijob:InventoryOpenedSuccesfully', GetPlayerServerId(closestPlayer))
													--OpenBodySearchMenu(closestPlayer)
													TriggerEvent('inventory:openPlayerInventory', GetPlayerServerId(closestPlayer))
													TriggerServerEvent('sqz_unijob:db_log', 'Search', GetPlayerServerId(closestPlayer), Config.DiscordLoggingActionsMenu)
													-- TriggerEvent('sqz_unijob:sendClientNotify', _U('already_searched'))
												end
											end, GetPlayerServerId(closestPlayer))

										else
											TriggerEvent('sqz_unijob:sendClientNotify', 'stopped_searching_player')
										end
									end)
							elseif not Config.UseMythic_Progressbar then
								ESX.TriggerServerCallback('sqz_unijob:CheckOpenInventory', function(canBeOpened)
									if canBeOpened then
										TriggerServerEvent('sqz_unijob:InventoryOpenedSuccesfully', GetPlayerServerId(closestPlayer))
										-- OpenBodySearchMenu(closestPlayer)
										TriggerEvent('inventory:openPlayerInventory', GetPlayerServerId(closestPlayer))
										TriggerServerEvent('sqz_unijob:db_log', 'Search', GetPlayerServerId(closestPlayer), Config.DiscordLoggingActionsMenu)
									else
										TriggerEvent('sqz_unijob:sendClientNotify', _U('already_searched'))
									end
								end, GetPlayerServerId(closestPlayer))
							end
						else
							TriggerEvent('sqz_unijob:sendClientNotify', _U('not_hands_up'))
						end
					end
				elseif action == 'handcuff' then
				
					local target, distance = ESX.Game.GetClosestPlayer()
					playerheading = GetEntityHeading(GetPlayerPed(-1))
					playerlocation = GetEntityForwardVector(PlayerPedId())
					playerCoords = GetEntityCoords(GetPlayerPed(-1))
					local target_id = GetPlayerServerId(target)
					if distance <= 2.0 then
						-- TriggerServerEvent('sqz_unijob:requestarrest', target_id, playerheading, playerCoords, playerlocation)
						-- TriggerServerEvent('sqz_unijob:db_log', 'HandCuff', target_id, Config.DiscordLoggingActionsMenu)
					
						ExecuteCommand( "me lo esposa" )
							TriggerServerEvent('esx_cuffanimation:startArrest',
							GetPlayerServerId(closestPlayer))
							Citizen.Wait(3100)
							TriggerServerEvent('esx_policejob:handcuff',
							GetPlayerServerId(closestPlayer))
							
					else
						TriggerEvent('sqz_unijob:sendClientNotify', _U('no_players_near'))
					end
					TriggerServerEvent('sqz_unijob:handcuff', GetPlayerServerId(closestPlayer))



				elseif action == 'uncuff' then
					ExecuteCommand( "me le saca las esposas" )
					local target, distance = ESX.Game.GetClosestPlayer()
					playerheading = GetEntityHeading(GetPlayerPed(-1))
					playerlocation = GetEntityForwardVector(PlayerPedId())
					playerCoords = GetEntityCoords(GetPlayerPed(-1))
					local target_id = GetPlayerServerId(target)
					if distance <= 2.0 then
						TriggerServerEvent('sqz_unijob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
						TriggerServerEvent('sqz_unijob:db_log', 'Uncuff', target_id, Config.DiscordLoggingActionsMenu)
					else
						TriggerEvent('sqz_unijob:sendClientNotify', _U('no_players_near'))
					end	
				elseif action == 'drag' then
				
					ExecuteCommand( "me lo escolta" )
							TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
						--	TriggerServerEvent('sqz_unijob:drag', GetPlayerServerId(closestPlayer))
							TriggerServerEvent('sqz_unijob:db_log', 'Drag', GetPlayerServerId(closestPlayer), Config.DiscordLoggingActionsMenu)
				elseif action == 'put_in_vehicle' then
							TriggerServerEvent('sqz_unijob:putInVehicle', GetPlayerServerId(closestPlayer))
							TriggerServerEvent('sqz_unijob:db_log', 'Put in Vehicle', GetPlayerServerId(closestPlayer), Config.DiscordLoggingActionsMenu)
				elseif action == 'out_the_vehicle' then
							TriggerServerEvent('sqz_unijob:OutVehicle', GetPlayerServerId(closestPlayer))
				elseif action == 'revive' then	
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						local closestPlayerPed = GetPlayerPed(closestPlayer)
						local health = GetEntityHealth(closestPlayerPed)
						TriggerServerEvent('sqz_unijob:db_log', 'SmallInjuries Heal', GetPlayerServerId(closestPlayer), Config.DiscordLoggingActionsMenu)
						if health == 0 then
							local playerPed = GetPlayerPed(-1)
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							ExecuteCommand ("militar Asistiendo a sujeto abatido.")
							Wait(10000)
							ClearPedTasks(playerPed)
							TriggerServerEvent('sqz_unijob:revive', GetPlayerServerId(closestPlayer))
						end	
				else
					TriggerEvent('sqz_unijob:sendClientNotify', _U('no_players_near'))
				end
			else
				TriggerEvent('sqz_unijob:sendClientNotify', _U('no_players_near'))
			end


		end, function(data2, menu2)
			menu2.close()
		end)
	end

	
	if data.current.value == 'activarradio' then
		local groupid = ESX.PlayerData.job.name
		groupid = string.gsub(groupid, "mafia", "")
		exports["rp-radio"]:GivePlayerAccessToFrequencies(700 + tonumber(groupid))
		
		TriggerEvent('sqz_unijob:sendClientNotify', 'Acceso a la radio concedida')
	end


	if data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()
			if Config.Jobs[ESX.PlayerData.job.name].AllowedActions.HasMechanicActions then
				table.insert(elements, {label = _U('fix_vehicle'), value = 'fix_vehicle'})
				table.insert(elements, {label = _U('clean_vehicle'), value = 'clean_vehicle'})
			--	table.insert(elements, {label = _U('impound'), value = 'impound'})
			--	table.insert(elements, {label = _U('dep_vehicle'), value = 'dep_vehicle'})
			--	table.insert(elements, {label = _U('lock_pick_vehicle'), value = 'hijack_vehicle'})
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = _U('vehicle_interaction'),
				align    = Config.MenuAlign,
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
			if data2.current.value == 'hijack_vehicle' then
				local playerPed = PlayerPedId()
				local vehicle   = ESX.Game.GetVehicleInDirection()

				NetworkRequestControlOfEntity(vehicle)
				local tick = 0
				while not NetworkHasControlOfEntity(vehicle) and tick < 50 do NetworkRequestControlOfEntity(vehicle) Wait(10) end

				local coords    = GetEntityCoords(playerPed)
				if IsPedSittingInAnyVehicle(playerPed) then
					TriggerEvent('sqz_unijob:sendClientNotify', _U('not_in_veh'))
					return
				end
				if DoesEntityExist(vehicle) then
					if not isBussy then
						if not Config.Jobs[ESX.PlayerData.job.name].NeededLockPickItem or (Config.Jobs[ESX.PlayerData.job.name].NeededLockPickItem and ItemCheck(Config.Jobs[ESX.PlayerData.job.name].LockPickItemName)) then
							isBussy = true
							if Config.UseAnimations then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							end
							if Config.UseAnimations and not Config.UseMythic_Progressbar then
								Citizen.Wait(10000)
								ClearPedTasks(playerPed)
							end
							if Config.UseMythic_Progressbar then
							TriggerEvent(Config.customEvents["mythic_progressbar:client:progress"], {
								name = "vehicle_hijack_unlock_sqz_unijob:11",
								duration = 10000,
								label = _U("unlocking_vehicle"),
								useWhileDead = false,
								canCancel = false,
								controlDisables = {
									disableMovement = true,
									disableCarMovement = true,
									disableMouse = false,
									disableCombat = true,
									}
								}, function(status)
							end)
								Citizen.Wait(10000)
							end
							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ClearPedTasks(playerPed)
							TriggerEvent('sqz_unijob:sendClientNotify', _U('vehicle_opened'))
							TriggerServerEvent('sqz_unijob:db_log', 'Hijack Vehicle', '', Config.DiscordLoggingActionsMenu)
							isBussy = false
						else
							TriggerEvent('sqz_unijob:sendClientNotify', _U('no_lockpick'))
						end
					end
				end
		
			elseif data2.current.value == 'fix_vehicle' then
				local playerPed = PlayerPedId()
				local vehicle   = ESX.Game.GetVehicleInDirection()
				local coords    = GetEntityCoords(playerPed)

				
				NetworkRequestControlOfEntity(vehicle)
				local tick = 0
				while not NetworkHasControlOfEntity(vehicle) and tick < 50 do NetworkRequestControlOfEntity(vehicle) Wait(10) end

				if IsPedSittingInAnyVehicle(playerPed) then
						TriggerEvent('sqz_unijob:sendClientNotify', _U('not_in_veh'))
					return
				end
				if DoesEntityExist(vehicle) then
					if not isBussy then
						isBussy = true
						if Config.UseAnimations then
							TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
						end
						if Config.UseAnimations and not Config.UseMythic_Progressbar then
							Citizen.Wait(10000)
							ClearPedTasks(playerPed)
						end
						if Config.UseMythic_Progressbar then
							TriggerEvent(Config.customEvents["mythic_progressbar:client:progress"], {
								name = "repair_vehicle_sqz_unijob:11",
								duration = 20000,
								label = _U("repairing_vehicle"),
								useWhileDead = false,
								canCancel = false,
									controlDisables = {
										disableMovement = true,
										disableCarMovement = true,
										disableMouse = false,
										disableCombat = true,
										}
								}, function(status)
							end)
							Citizen.Wait(10000)
						end
							SetVehicleFixed(vehicle)
							SetVehicleDeformationFixed(vehicle)
							SetVehicleUndriveable(vehicle, false)
							SetVehicleEngineOn(vehicle, true, true)
							ClearPedTasks(playerPed)
							TriggerEvent('sqz_unijob:sendClientNotify', _U('repaired_veh'))
							TriggerServerEvent('sqz_unijob:db_log', 'Fix Vehicle', '', Config.DiscordLoggingActionsMenu)
							isBussy = false
					end
				end
		elseif data2.current.value == 'clean_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)
			
			NetworkRequestControlOfEntity(vehicle)
			local tick = 0
			while not NetworkHasControlOfEntity(vehicle) and tick < 50 do NetworkRequestControlOfEntity(vehicle) Wait(10) end
			if IsPedSittingInAnyVehicle(playerPed) then
				TriggerEvent('sqz_unijob:sendClientNotify', _U('not_in_veh'))
				return
			end

			if DoesEntityExist(vehicle) then
				if not isBussy then
					isBussy = true
					if Config.UseAnimations then
						TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
					end
					if Config.UseAnimations and not Config.UseMythic_Progressbar then
						Citizen.Wait(20000)
						ClearPedTasks(playerPed)
					end
					if Config.UseMythic_Progressbar then
					TriggerEvent(Config.customEvents["mythic_progressbar:client:progress"], {
						name = "clean_vehicle_15rwajobs:11",
						duration = 20000,
						label = _U("cleaning_vehicle"),
						useWhileDead = false,
						canCancel = false,
						controlDisables = {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}
						}, function(status)
						end)
						Citizen.Wait(20000)
					end
					SetVehicleDirtLevel(vehicle, 0)
					ClearPedTasks(playerPed)
					TriggerEvent('sqz_unijob:sendClientNotify', _U('veh_clean'))
					TriggerServerEvent('sqz_unijob:db_log', 'Clean Vehicle', '', Config.DiscordLoggingActionsMenu)
					isBussy = false
				end
			end
		elseif data2.current.value == 'impound' then
			local Ped = PlayerPedId()

			if IsPedSittingInAnyVehicle(Ped) then

				local vehicleImpound = GetVehiclePedIsIn(Ped, false)

				if GetPedInVehicleSeat(vehicleImpound, -1) == Ped then
					
					NetworkRequestControlOfEntity(vehicleImpound)
					local tick = 0
					while not NetworkHasControlOfEntity(vehicleImpound) and tick < 50 do NetworkRequestControlOfEntity(vehicleImpound) Wait(10) end

					TriggerEvent('sqz_unijob:sendClientNotify', _U('vehicle_impounded'))
					ESX.Game.DeleteVehicle(vehicleImpound)
					TriggerServerEvent('sqz_unijob:db_log', 'Impound vehicle', '', Config.DiscordLoggingActionsMenu)
				else
					TriggerEvent('sqz_unijob:sendClientNotify', _U('must_seat_driver'))
				end
			else
				local vehicleImpound = ESX.Game.GetVehicleInDirection()

				if DoesEntityExist(vehicleImpound) then
					
					NetworkRequestControlOfEntity(vehicleImpound)
					local tick = 0
					while not NetworkHasControlOfEntity(vehicleImpound) and tick < 50 do NetworkRequestControlOfEntity(vehicleImpound) Wait(10) end

					if Config.ShowImpoundNotification then
						showImpoundAnimation()
					end
					TriggerEvent('sqz_unijob:sendClientNotify', _U('vehicle_impounded'))
					ESX.Game.DeleteVehicle(vehicleImpound)
					TriggerServerEvent('sqz_unijob:db_log', 'Impound vehicle', '', Config.DiscordLoggingActionsMenu)
				else
					TriggerEvent('sqz_unijob:sendClientNotify', _U('must_near'))
				end
			end
		elseif data2.current.value == 'dep_vehicle' then
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			local towmodel = GetHashKey('flatbed')
			local isVehicleTow = IsVehicleModel(vehicle, towmodel)

			if isVehicleTow then
				local targetVehicle = ESX.Game.GetVehicleInDirection()

				if CurrentlyTowedVehicle == nil then
					if targetVehicle ~= 0 then
						if not IsPedInAnyVehicle(playerPed, true) then
							
							NetworkRequestControlOfEntity(targetVehicle)
							local tick = 0
							while not NetworkHasControlOfEntity(targetVehicle) and tick < 50 do NetworkRequestControlOfEntity(targetVehicle) Wait(10) end

							if vehicle ~= targetVehicle then
								AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
								CurrentlyTowedVehicle = targetVehicle
								TriggerEvent('sqz_unijob:sendClientNotify', _U('veh_attached'))
							else
								TriggerEvent('sqz_unijob:sendClientNotify', _U('can_not_self_veh'))
							end
						end
					end
				else
					NetworkRequestControlOfEntity(CurrentlyTowedVehicle)
					local tick = 0
					while not NetworkHasControlOfEntity(CurrentlyTowedVehicle) and tick < 50 do NetworkRequestControlOfEntity(CurrentlyTowedVehicle) Wait(10) end

					AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
					DetachEntity(CurrentlyTowedVehicle, true, true)

					CurrentlyTowedVehicle = nil
					TriggerEvent('sqz_unijob:sendClientNotify', _U('veh_attached'))
				end
			else
				TriggerEvent('sqz_unijob:sendClientNotify', _U('no_veh_near'))	
			end
		else
			TriggerEvent('sqz_unijob:sendClientNotify', _U('no_veh_near'))	
		end
		end, function(data2, menu2)
			menu2.close()
		end)
	end
	end, function(data, menu)
		menu.close()
	end)
end

-- KeyMapping, you can let it be as it is
RegisterKeyMapping('epressed', 'E pressed', 'keyboard', 'e')
RegisterKeyMapping('jobactions', 'Job Actions', 'keyboard', 'f6')

function VehicleSpawned(vehicle)
	Wait(100)
	vehicle = GetVehiclePedIsIn(PlayerPedId())

	-- This function is called when a society (non owned vehicle spawns)
	if Config.UseLegacyFuel then
		exports["LegacyFuel"]:SetFuel(vehicle, 100)
	end
	if GetResourceState('sqz_carkeys') == 'started' then
		TriggerServerEvent('sqz_unijob:SetVehicleKeys', GetVehicleNumberPlateText(vehicle), 1)
	end
end

function OpenCloakRoomMenu()
	local elements = {}

	local ready = false
	local attempt = 0

	local playerPed = PlayerPedId()
	ESX.TriggerServerCallback('sqz_unijob:GetPlayerDressing', function(dressing)

		for i=1, #dressing, 1 do
			table.insert(elements, {label = dressing[i], value = i})
				
		end

		ready = true

	end)

	while not ready and attempt < 100 do
		attempt = attempt + 1
		Wait(1)
	end

	if Config.Jobs[ESX.PlayerData.job.name].DefaultClothes then

		for k, v in pairs(Config.Jobs[ESX.PlayerData.job.name].DefaultClothes) do
			if type(v) == 'table' and (v.JobGrades == 'all' or v.JobGrades[ESX.PlayerData.job.grade_name]) then
				if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
					table.insert(elements, {label = k, value = v.male, isNpc = true})
					SetPedArmour(playerPed, 100)
				else
					table.insert(elements, {label = k, value = v.female, isNpc = true})
					SetPedArmour(playerPed, 100)
				end
			end
		end

		if Config.Jobs[ESX.PlayerData.job.name].DefaultClothes.ReloadSkin then
			table.insert(elements, {label = Config.Jobs[ESX.PlayerData.job.name].DefaultClothes.ReloadSkin, isNpc = 'reload'})
			SetPedArmour(playerPed, 100)
		end

	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
		title    = _U('player_clothes'),
		align    = Config.MenuAlign,
		elements = elements,
		}, function(data, menu)

			if data.current.isNpc == 'reload' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
					
			SetPedArmour(playerPed, 100)
				end)
			elseif data.current.isNpc then
				TriggerEvent('skinchanger:getSkin', function(skin)
					TriggerEvent('skinchanger:loadClothes', skin, data.current.value)
			SetPedArmour(playerPed, 100)
				end)
			else
				TriggerEvent('skinchanger:getSkin', function(skin)

			SetPedArmour(playerPed, 100)
					ESX.TriggerServerCallback('sqz_unijob:GetPlayerOutfit', function(clothes)

						TriggerEvent('skinchanger:loadClothes', skin, clothes)
						TriggerEvent('esx_skin:setLastSkin', skin)

						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
						end)
						
			SetPedArmour(playerPed, 100)
						TriggerEvent('sqz_unijob:sendClientNotify', _U('loaded_outfit'))
					end, data.current.value)
				end)
			end

		end, function(data, menu)
			menu.close()
			
			CurrentAction     = 'menu_cloakroom'
			CurrentActionData = {}
	end)

end