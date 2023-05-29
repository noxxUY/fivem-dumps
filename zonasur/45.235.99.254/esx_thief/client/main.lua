ESX = nil

local menuopen = false
local robado = nil
local dead = false
local tron = false
local zroja = false

RegisterNetEvent('esx_thief:tron')
AddEventHandler('esx_thief:tron', function(bool)
	tron = bool
end)

RegisterNetEvent('esx_thief:zroja')
AddEventHandler('esx_thief:zroja', function(bool)
	zroja = bool
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function IsAbleToSteal(targetSID, err)
	ESX.TriggerServerCallback('esx_thief:getValue', function(result)
		local result = result
		if result.value then
			err(false)
		else
			err(_U('no_hands_up'))
		end
	end, targetSID)
end

function LoadAnim(dict)
  while not HasAnimDictLoaded(dict) do
    RequestAnimDict(dict)
    Wait(10)
  end
end

function OpenStealMenu(target, target_id, name)

	ESX.UI.Menu.CloseAll()
	local ped = PlayerPedId()
	
	if not tron then
		local animacion = 'missbigscore2aig_7@driver'
		LoadAnim(animacion)
		ExecuteCommand('me lo cachea')
		TaskPlayAnim(GetPlayerPed(-1), animacion, 'boot_r_loop', 1.0, 1.0, -1, 1, 0, false, false, false)
		Wait(3000)
	end
	ESX.TriggerServerCallback('esx_thief:getOtherPlayerData', function(data)
		local elements = {}

		if Config.EnableCash then
			if data.money > 0 then
				table.insert(elements, {
					label = (('[%s] $%s'):format(_U('cash'), ESX.Math.GroupDigits(data.money))),
					label1 = (('[%s] $%s'):format(_U('cash'), ESX.Math.GroupDigits(data.money))),
					value = 'money',
					type = 'item_money',
					amount = data.money
				})
			end	
		end
		
		if Config.EnableWeapon then
			for i=1, #data.weapons, 1 do
			if data.weapons[i] ~= nil then
				table.insert(elements, {
					label    = ESX.GetWeaponLabel(data.weapons[i].name),
					label1	 = ESX.GetWeaponLabel(data.weapons[i].name),
					value    = data.weapons[i].name,
					type = 'item_weapon',
					amount   = data.weapons[i].ammo
				})
			end
			end
		end
		
		if Config.EnableBlackMoney then
			local blackMoney = 0

			for i=1, #data.accounts, 1 do
				if data.accounts[i].name == 'black_money' then
					blackMoney = data.accounts[i].money
					break
				end
			end
			if blackMoney > 0 then
				table.insert(elements, {
					label = (('[%s] $%s'):format(_U('black_money'), ESX.Math.GroupDigits(blackMoney))),
					label1 = (('[%s] $%s'):format(_U('black_money'), ESX.Math.GroupDigits(blackMoney))),
					value = 'black_money',
					type = 'item_account',
					amount = blackMoney
				})
			end	
		end

		if Config.EnableInventory then
			--table.insert(elements, {label = '--- ' .. _U('inventory') .. ' ---', value = nil})

			for i=1, #data.inventory, 1 do
				if data.inventory[i].count > 0 then
					table.insert(elements, {
						label = data.inventory[i].label .. ' x' .. data.inventory[i].count,
						label1 = data.inventory[i].label,
						value = data.inventory[i].name,
						type  = 'item_standard',
						amount = data.inventory[i].count,
					})
				end
			end
		end
		
		if not tron then
			for i=1, #elements, 1 do
				ExecuteCommand('do se veria '..elements[i].label)
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'steal_inventory', {
			title  = 'Inventario de '..name,
			elements = elements,
			align = 'bottom-right'
		}, function(data, menu)

			if data.current.value ~= nil then

				local itemType = data.current.type
				local itemName = data.current.value
				local amount   = data.current.amount
				local label = data.current.label1
				local elements = {}
				table.insert(elements, {label = _U('steal'), action = 'steal', itemType, itemName, amount, label})
				table.insert(elements, {label = _U('return'), action = 'return'})

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'steal_inventory_item', {
					title = _U('action_choice'),
					align = 'bottom-right',
					elements = elements
				}, function(data2, menu2)
					if data2.current.action == 'steal' then --IsPedArmed(ped, 7)
						if itemType == 'item_standard' then
							if isComida(itemName) and not tron then
								ESX.ShowNotification('~r~No puedes robar esto!')
							else
								ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'steal_inventory_item_standard', {
									title = _U('amount')
								}, function(data3, menu3)
									local quantity = tonumber(data3.value)
									TriggerServerEvent('esx_thief:stealPlayerItem', GetPlayerServerId(target), itemType, itemName, quantity, tron)
									if target ~= robado then
										robado = target
									end
									if not tron then
										ExecuteCommand('me le roba '..label..' x'..quantity)
									end
									
									if name then
										OpenStealMenu(target, GetPlayerServerId(target), name)
									end
									menu3.close()
									menu2.close()
								end, function(data3, menu3)
									menu3.close()
								end)
							end
						else
							if isComida(itemName) and not tron then
								ESX.ShowNotification('~r~No puedes robar esto!')
							else
								if not tron then
									ExecuteCommand('me le roba el '..label)
								end
								TriggerServerEvent('esx_thief:stealPlayerItem', GetPlayerServerId(target), itemType, itemName, amount, tron)
								if target ~= robado then
									robado = target
								end	
								if name then
									OpenStealMenu(target, GetPlayerServerId(target), name)
								end
							end
						end
					elseif data2.current.action == 'return' then
						ESX.UI.Menu.CloseAll()
						if name then
							OpenStealMenu(target, GetPlayerServerId(target), name)
						end
					else
						ESX.ShowNotification('~r~No tienes arma para Robar.')
					end

				end, function(data2, menu2)
					menu2.close()
					menuopen = false
				end)
			end

		end, function(data, menu)
			ClearPedTasks(GetPlayerPed(-1))
			menu.close()
			menuopen = false
		end)
	end, GetPlayerServerId(target))
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		local ped = PlayerPedId()
		
		if tron and IsControlJustPressed(0, 47) and not menuopen then
			local playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(ped), 10.0)
			if #playersNearby > 0 then
					local players = {}
					elements = {}

					for k,playerNearby in ipairs(playersNearby) do
						players[GetPlayerServerId(playerNearby)] = true
					end

					ESX.TriggerServerCallback('esx:getPlayerNames', function(returnedPlayers)
						for playerId,playerName in pairs(returnedPlayers) do
							table.insert(elements, {
								label = playerName..' ['..playerId..']',
								playerId = playerId
							})
						end

						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_item_to', {
							title    = 'Jugadores Cerca',
							align    = 'bottom-right',
							elements = elements
						}, function(data2, menu2)
							local selectedPlayer, selectedPlayerId = GetPlayerFromServerId(data2.current.playerId), data2.current.playerId
							--playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(ped), 3.0)
							playersNearby = ESX.Table.Set(playersNearby)

							if playersNearby[selectedPlayer] then
								OpenStealMenu(selectedPlayer, selectedPlayerId, data2.current.label)
							else
								ESX.ShowNotification(_U('no_players_nearby'))
								menuopen = false
								menu2.close()
							end
						end, function(data2, menu2)
							menu2.close()
						end)
					end, players)
				else
					menuopen = false
					ESX.ShowNotification(_U('no_players_nearby'))
				end
		elseif IsControlJustPressed(0, 47) and not IsEntityDead(ped) and IsPedOnFoot(ped) and not menuopen then --and IsPedArmed(ped, 7)
				menuopen = true
				local target, distance = ESX.Game.GetClosestPlayer()
			
				if target ~= -1 and distance ~= -1 and distance <= 2.0 then
					local target_id = GetPlayerServerId(target)
					local closestPlayerPed = GetPlayerPed(target)
					ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
						if cops >= 1 then
							--local soy_org = exports['tm1_mafias']:GetGroup()
							local zona = exports['zone']:Segura()
							--if soy_org and not zroja then
								--ESX.TriggerServerCallback('tm1_mafias:checkorg', function(org)
									if not zona then
										if IsPedDeadOrDying(closestPlayerPed, false) then
											OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
										else
											IsAbleToSteal(target_id, function(err)
												if(not err) then
													OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
												else
													menuopen = false
													ESX.ShowNotification(err)
												end
											end)
										end
									else
										ESX.ShowNotification('~r~No puedes robar en ZONA SEGURA.')
									end
								--end, target_id)
								
							--[[
							else	
								if IsPedDeadOrDying(closestPlayerPed, false) then
									OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
								else
									IsAbleToSteal(target_id, function(err)
										if(not err) then
											OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
										else
											menuopen = false
											ESX.ShowNotification(err)
										end
									end)
								end
							end
							]]
						else
							ESX.TriggerServerCallback('esx_police2job:getCopsinServicio', function(cops)	
								if cops >= 1 then
									--local soy_org = exports['tm1_mafias']:GetGroup()	
									local zona = exports['zone']:Segura()		
									if not zona then								
										if IsPedDeadOrDying(closestPlayerPed, false) then
											OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
										else
											IsAbleToSteal(target_id, function(err)
												if(not err) then
													OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
												else
													menuopen = false
													ESX.ShowNotification(err)
												end
											end)
										end
									else
										ESX.ShowNotification('~r~No puedes robar en ZONA SEGURA.')
									end
									--[[
									else	
										if IsPedDeadOrDying(closestPlayerPed, false) then
											OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
										else
											IsAbleToSteal(target_id, function(err)
												if(not err) then
													OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
												else
													menuopen = false
													ESX.ShowNotification(err)
												end
											end)
										end
									end
									]]
								else
									ESX.TriggerServerCallback('esx_gendarmeria:getCops', function(cops)	
										if cops >= 1 then
											--local soy_org = exports['tm1_mafias']:GetGroup()							
											local zona = exports['zone']:Segura()		
											if not zona then	
												if IsPedDeadOrDying(closestPlayerPed, false) then
													OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
												else
													IsAbleToSteal(target_id, function(err)
														if(not err) then
															OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
														else
															menuopen = false
															ESX.ShowNotification(err)
														end
													end)
												end
											else
												ESX.ShowNotification('~r~No puedes robar en ZONA SEGURA.')
											end
											--[[
											else	
												if IsPedDeadOrDying(closestPlayerPed, false) then
													OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
												else
													IsAbleToSteal(target_id, function(err)
														if(not err) then
															OpenStealMenu(target, target_id, 'ID: ['..target_id..']')
														else
															menuopen = false
															ESX.ShowNotification(err)
														end
													end)
												end
											end
											]]
										else
											ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ o ~b~1 PFA~s~ o ~b~1 GNA~s~ en la ciudad para robar.")
										end
									end)
								end
							end)
						end
					end)	
				else		
					menuopen = false
					ESX.ShowNotification(_U('no_players_nearby'))
				end
		end
		
		if menuopen and not tron then
			local target, distance = ESX.Game.GetClosestPlayer()
			if target ~= -1 and distance ~= -1 and distance > 2.0 then
				ESX.UI.Menu.CloseAll()
				menuopen = false
			end	
		end
	end
end)

RegisterNetEvent('esx_thief:entorno')
AddEventHandler('esx_thief:entorno', function(msg)
	if not tron then
		ExecuteCommand(msg)
	end
end)

function isComida(item)
	for k, v in pairs(Config.Comidas) do
		if item == v then
			return true
		end
	end
	return false
end
