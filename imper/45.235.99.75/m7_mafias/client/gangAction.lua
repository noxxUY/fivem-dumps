local snoing = 0
local code = GetConvar("imperialrp2.venv", 9) -- 9 is the number (!!register in server.cfg!!)

isDragged, isHandcuffed, CopPed = false, false, nil


local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
		local next = true

		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

local TempIAction = 0 
function checkActionMenuPressed()
	if myGangId ~= nil and myGangId > 0 and activeGangs[myGangId] ~= nil and ( activeGangs[myGangId].canSearch == 1 or activeGangs[myGangId].canCuff == 1 or activeGangs[myGangId].canMove == 1 or activeGangs[myGangId].canOpenCarsDoor == 1 )  then
		TempIAction = TempIAction + 1
		local playerId = PlayerPedId() 
		Citizen.CreateThread(function()
			local TempCheckIAction = TempIAction 
			while activeGangs == nil and activeGangs[1] == nil do
				Citizen.Wait(1000)
			end
			while TempCheckIAction == TempIAction do
				if IsControlJustReleased(0, Config.OpenActionMenu) and GetEntityHealth(playerId) then
					openGangAction()
				end
				Citizen.Wait(5)
			end
		end)
	end 
end

--[[function openGangAction(closestPlayer , closestPlayerDistance)
	local gangActionMenu = RageUI.CreateMenu(_U('gang_action_menu'), _U('gang_action_menu'))
	gangActionMenu:DisplayGlare(true)
	gangActionMenu:DisplayPageCounter(true)
	gangActionMenu.EnableMouse = false
	Citizen.CreateThread(function()
		local whileGoActionMenu = true 
		while whileGoActionMenu do
			Citizen.Wait(1.0)
			gangActionMenu.Closed = function()
				whileGoActionMenu = false
			end
			RageUI.IsVisible(gangActionMenu, function()
				if activeGangs[myGangId].canSearch == 1 then
					RageUI.Button( _U('search_player'), _U('search_player_help') , {}, true, {
						onSelected = function()
							if ( closestPlayerDistance <= Config.MaxGangActionDistance ) then
								whileGoActionMenu = false
								TriggerServerEvent('m7_mafias:searchBody',GetPlayerServerId(closestPlayer))
								RageUI.Visible(gangActionMenu, false)
							else
								TriggerEvent('m7_mafias:sendNotfication', activeGangs[myGangId].gangName, ''  , _U('no_player_nearby') , 'CHAR_BLOCKED' , 2 )
							end
						end,
					});
				end
				if activeGangs[myGangId].canCuff == 1 then
					RageUI.Button( _U('cuff_uncuff'), _U('cuff_uncuff_help') , {}, true, {
						onSelected = function()
							if ( closestPlayerDistance <= Config.MaxGangActionDistance ) then
								RageUI.Visible(gangActionMenu, false)
								whileGoActionMenu = false
								if ( Config.handCuffAnimation ) then
									TriggerServerEvent('m7_mafias:handcuffAnimation', GetPlayerServerId(closestPlayer))
									Citizen.Wait(3100)
								end
								TriggerServerEvent('m7_mafias:handcuff',GetPlayerServerId(closestPlayer))
							else
								TriggerEvent('m7_mafias:sendNotfication', activeGangs[myGangId].gangName, ''  , _U('no_player_nearby') , 'CHAR_BLOCKED' , 2 )
							end
						end,
					});
				end
				if activeGangs[myGangId].canMove == 1 then
					RageUI.Button( _U('drag_person'), _U('drag_person_help') , {}, true, {
						onSelected = function()
							if ( closestPlayerDistance <= Config.MaxGangActionDistance ) then
								whileGoActionMenu = false
								TriggerServerEvent('m7_mafias:drag',GetPlayerServerId(closestPlayer))
								RageUI.Visible(gangActionMenu, false)
							else
								TriggerEvent('m7_mafias:sendNotfication', activeGangs[myGangId].gangName, ''  , _U('no_player_nearby') , 'CHAR_BLOCKED' , 2 )
							end
						end,
					});
					RageUI.Button( _U('Put_in_vehicle'), _U('Put_in_vehicle_help') , {}, true, {
						onSelected = function()
							if ( closestPlayerDistance <= Config.MaxGangActionDistance ) then
								whileGoActionMenu = false
								TriggerServerEvent('m7_mafias:putInVehicle',GetPlayerServerId(closestPlayer))
								RageUI.Visible(gangActionMenu, false)
							else
								TriggerEvent('m7_mafias:sendNotfication', activeGangs[myGangId].gangName, ''  , _U('no_player_nearby') , 'CHAR_BLOCKED' , 2 )
							end
						end,
					});
					RageUI.Button( _U('Put_out_vehicle'), _U('Put_out_vehicle_help') , {}, true, {
						onSelected = function()
							if ( closestPlayerDistance <= Config.MaxGangActionDistance ) then
								whileGoActionMenu = false
								TriggerServerEvent('m7_mafias:OutVehicle',GetPlayerServerId(closestPlayer))
								RageUI.Visible(gangActionMenu, false)
							else
								TriggerEvent('m7_mafias:sendNotfication', activeGangs[myGangId].gangName, ''  , _U('no_player_nearby') , 'CHAR_BLOCKED' , 2 )
							end
						end,
					});
				end
				if activeGangs[myGangId].canOpenCarsDoor == 1 then
					RageUI.Button( _U('open_vehicle_door'), _U('open_vehicle_door_help') , {}, true, {
						onSelected = function()
							local playerPed  = PlayerPedId()
							local coords  = GetEntityCoords(playerPed)
							local vehicle = getClosetVehicle()
							if vehicle ~= nil then
								if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
									whileGoActionMenu = false
									RageUI.Visible(gangActionMenu, false)
									TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
									Citizen.Wait(math.random(10000,25000))
									ClearPedTasksImmediately(playerPed)

									SetVehicleDoorsLocked(vehicle, 1)
									SetVehicleDoorsLockedForAllPlayers(vehicle, false)
									TriggerEvent('m7_mafias:sendNotficationFromPlayer', GetPlayerServerId(playerPed) , activeGangs[myGangId].gangName, ''  , _U('vehicle_Unlocked') , 'CHAR_BLOCKED' , 1 )
								end
							else
								TriggerEvent('m7_mafias:sendNotfication', activeGangs[myGangId].gangName, ''  , _U('no_vehicle_nearby') , 'CHAR_BLOCKED' , 2 )
							end
						end,
					});
				end
			end, function() end)
		end
	end)
	RageUI.Visible(gangActionMenu, not RageUI.Visible(gangActionMenu))
end]]

local muerto = false
RegisterNetEvent('ambulance:setmuerto', function(data)
    muerto = data
end)
function openGangAction()
if muerto then return end

	ESX.UI.Menu.CloseAll()

	local elements = {{label = _U('citizen_interaction'), value = 'citizen_interaction', icon = "fas fa-user-tie"}}
	local elements2 = {{label = _U('search_player'), value = 'body_search', icon = "fas fa-search"}, {label = 'Buscar documento', value = 'dni_search', icon = "fas fa-id-card"}} 

	if activeGangs[myGangId].canOpenCarsDoor == 1 then
	end
	if activeGangs[myGangId].canCuff == 1 then
		table.insert(elements2, {label = ('Poner Esposas'),    value = 'handcuff', icon = "fas fa-user-check"})
		table.insert(elements2, {label = ('Sacar Esposas'), value = 'uncuff', icon = "fas fa-user-shield"}) 
	end
	if activeGangs[myGangId].canMove == 1 then 
		table.insert(elements2, {label = _U('drag_person'),      value = 'drag', icon = "fas fa-user-injured"}) 
		table.insert(elements2, {label = _U('Put_in_vehicle'),  value = 'put_in_vehicle', icon = "fas fa-user-alt-slash"})
		table.insert(elements2, {label = _U('Put_out_vehicle'), value = 'out_the_vehicle', icon = "fas fa-car-side"}) 
	end
	if activeGangs[myGangId].haveGPS == 1 then
		table.insert(elements, {label = "Enviar señal de pánico", value = 'panicbutton'})
	end
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'mafia_actions',
	  {
		title    = '<span style="color:#F44336;">Menú de acción',
		align    = 'bottom-right',
		elements = elements
	  },
	  function(data, menu)
  
		if data.current.value == 'citizen_interaction' then
		  ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
			  title    = '<span style="color:#F44336;">Interaccion Ciudadana',
			  align    = 'bottom-right',
			  elements = elements2
			},
			function(data2, menu2)
  
			  local player, distance = ESX.Game.GetClosestPlayer()
  
			  if distance ~= -1 and distance <= 3.0 then
  
				local action = data2.current.value
  
				if action == 'body_search' then
					local target_id = GetPlayerServerId(player)
					ESX.TriggerServerCallback('mafias:server:GetGangID', function(targetGangID)
						if not targetGangID then
				  			OpenBodySearchMenu(player)
						else
							local mygangid = getGangID()
							if mygangid ~= targetGangID then
								OpenBodySearchMenu(player)
							else
								exports['mythic_notify']:SendAlert('inform', 'No puedes cachear a alguien de tu mismo grupo', 3000, { ['background-color'] = '#FF2D00',['color'] = '#FFFFFF' })
							end
						end
					end, target_id)
				elseif action == 'dni_search' then
					OpenIdentityCardMenu(player)
				elseif action == 'handcuff' then
				  local target, distance = ESX.Game.GetClosestPlayer()
				  playerheading = GetEntityHeading(PlayerPedId())
				  playerlocation = GetEntityForwardVector(PlayerPedId())
				  playerCoords = GetEntityCoords(PlayerPedId())
				  local target_id = GetPlayerServerId(target)
				  if distance <= 2.0 then
					TriggerServerEvent('m7_mafias:requestarrest', target_id, playerheading, playerCoords, playerlocation, code)
					ExecuteCommand('me le pone los precintos')
				  else
					ESX.ShowNotification('No estás lo suficientemente cerca')
				  end
				elseif action == 'uncuff' then
				  local target, distance = ESX.Game.GetClosestPlayer()
				  playerheading = GetEntityHeading(PlayerPedId())
				  playerlocation = GetEntityForwardVector(PlayerPedId())
				  playerCoords = GetEntityCoords(PlayerPedId())
				  local target_id = GetPlayerServerId(target)
				  if distance <= 2.0 then
					TriggerServerEvent('m7_mafias:requestrelease', target_id, playerheading, playerCoords, playerlocation, code)
					ExecuteCommand('me le saca los precintos')
					if esta_agarrando then
						TriggerServerEvent('m7_mafias:drag', GetPlayerServerId(player), code)
						esta_agarrando = not esta_agarrando
					end
				  else
					ESX.ShowNotification('No estás lo suficientemente cerca')
				  end
				elseif action == 'drag' then
				  TriggerServerEvent('m7_mafias:drag', GetPlayerServerId(player), code)
				  if esta_agarrando then
					ExecuteCommand('me lo suelta')
				  else
					ExecuteCommand('me lo agarra')
				  end
				  esta_agarrando = not esta_agarrando
				elseif action == 'put_in_vehicle' then
				  TriggerServerEvent('m7_mafias:putInVehicle', GetPlayerServerId(player), code)
				  ExecuteCommand('me abre la puerta y lo mete en el vehiculo')
				  if esta_agarrando then
					TriggerServerEvent('m7_mafias:drag', GetPlayerServerId(player), code)
					esta_agarrando = not esta_agarrando
				  end
				elseif action == 'out_the_vehicle' then
				  TriggerServerEvent('m7_mafias:OutVehicle', GetPlayerServerId(player), code)
				  ExecuteCommand('me abre la puerta y lo saca del vehiculo')
				elseif action == 'poner_sacar_bolsa' then
				  PonerBolsaEnLaCabeza()
				  if not puso_bolsa then
					ExecuteCommand('me le pone una bolsa en la cabeza')
				  else
					ExecuteCommand('me le saca la bolsa de la cabeza')
				  end
				  puso_bolsa = not puso_bolsa               
				end
			  else
				ESX.ShowNotification(_U('no_players_nearby'))
			  end
  
			end,
			function(data2, menu2)
			  menu2.close()
			end
		  )
  
		elseif data.current.value == 'vehicle_interaction' then
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)  
			if DoesEntityExist(vehicle) then	
				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
					local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
					if DoesEntityExist(vehicle) then
						Citizen.CreateThread(function()
							TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
							Wait(20000)
							ClearPedTasksImmediately(playerPed)
							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							TriggerEvent('esx:showNotification', _U('vehicle_Unlocked'))
						end)
					end
				end	
			else
				ESX.ShowNotification(_U('no_vehicle_nearby'))
			end  
		elseif data.current.value == 'panicbutton' then
		  --TriggerEvent('esx_rpchat:sendMessageDo', GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId())), 'apretaria un botón de pánico')
		  SendPoliceDistressSignal()
		  ExecuteCommand('me presiona el botón de pánico')
		end
	  end,
	  function(data, menu)
  
		menu.close()
  
	  end
	)
  
end

function SendPoliceDistressSignal()
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	TriggerServerEvent('esx_panicmenu:panicShoutMafias', {
		x = ESX.Math.Round(playerCoords.x, 1),
		y = ESX.Math.Round(playerCoords.y, 1),
		z = ESX.Math.Round(playerCoords.z, 1)
	}, getGangID())
	ESX.ShowNotification('Apretaste el botón de pánico')
end

function OpenBodySearchMenu(player)
	ExecuteCommand('me lo cachea y le roba')
	ESX.TriggerServerCallback('m7_mafias:getOtherPlayerData', function(data)
		local elements = {}
		local blackMoney = 0
		table.insert(elements, {label = '-- Dinero --'})
			for i=1, #data.accounts, 1 do
				if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
					table.insert(elements, {
						label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
						value    = 'black_money',
						itemType = 'item_account',
						amount   = data.accounts[i].money
					})
					break
				end      
			end
			for i=1, #data.accounts, 1 do
				if data.accounts[i].name == 'money' and data.accounts[i].money > 0 then
					table.insert(elements, {
						label    = _U('confiscate_money', ESX.Math.Round(data.accounts[i].money)),
						value    = 'money',
						itemType = 'item_account',
						amount   = data.accounts[i].money
					})
					break
				end
			end
			table.insert(elements, {label = '-- Armas --'})
			for i=1, #data.weapons, 1 do
				table.insert(elements, {
					label          = 'Robar ' .. ESX.GetWeaponLabel(data.weapons[i].name),
					value          = data.weapons[i].name,
					itemType       = 'item_weapon',
					amount         = data.ammo,
				})
			end
			table.insert(elements, {label = '-- Inventario --'})
			for i=1, #data.inventory, 1 do
				if data.inventory[i].count > 0 then
					table.insert(elements, {
						label          = 'Robar x' .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
						value          = data.inventory[i].name,
						itemType       = 'item_standard',
						amount         = data.inventory[i].count,
					})
				end
			end
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'body_search',
			{
				title    = 'Buscar',
				align    = 'bottom-right',
				elements = elements,
			},
			function(data, menu)
				local itemType = data.current.itemType
				local itemName = data.current.value
				local amount   = data.current.amount
				if data.current.value ~= nil then
					local player, distance = ESX.Game.GetClosestPlayer()
					if snoing == 0 then
						snoing = 1
						RequestAnimDict("amb@medic@standing@kneel@exit")
						RequestAnimDict("anim@gangops@facility@servers@bodysearch@")
						RequestAnimDict("amb@medic@standing@kneel@base")
						while not HasAnimDictLoaded("amb@medic@standing@kneel@exit") do
							Citizen.Wait(5)
						end
						while not HasAnimDictLoaded("anim@gangops@facility@servers@bodysearch@") do
							Citizen.Wait(5)
						end
						while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
							Citizen.Wait(5)
						end
						if IsEntityDead(GetPlayerPed(player)) then
							TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
						end
						TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
						Citizen.Wait(1000)
						snoing = 0
						local target, distance = ESX.Game.GetClosestPlayer()
						if IsEntityPlayingAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search", 3) and distance ~= -1 and distance <= 3.0 then
						TriggerServerEvent('m7_mafias:confiscatePlayerItem', GetPlayerServerId(target), itemType, itemName, amount, code)
						menu.close()
						OpenBodySearchMenu(player) 
						Citizen.Wait(800)
						else
							menu.close()
						end 
						if IsEntityPlayingAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base", 3) then
							TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@exit" ,"exit" ,8.0, -8.0, -1, 0, 0, false, false, false )
						end
					end
				end
				end,
			function(data, menu)
				menu.close()
			end
			)
	end, GetPlayerServerId(player))
end

function PonerBolsaEnLaCabeza() --This function send to server closestplayer
	local player, distance = ESX.Game.GetClosestPlayer()
  
	  if distance ~= -1 and distance <= 3.0 then
		TriggerServerEvent('jsfour-blindfold', GetPlayerServerId(player))
	  else
		ESX.ShowNotification(_U('no_players_nearby'))
	end
end

RegisterNetEvent('m7_mafias:doarrested')
AddEventHandler('m7_mafias:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)
end) 

RegisterNetEvent('m7_mafias:getarrested')
AddEventHandler('m7_mafias:getarrested', function(playerheading, playercoords, playerlocation)
	playerPed = PlayerPedId()
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(PlayerPedId(), x, y, z - 1)
	SetEntityHeading(PlayerPedId(), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)	
	isHandcuffed = true
	TriggerEvent('m7_mafias:handcuff')
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

RegisterNetEvent('m7_mafias:douncuffing')
AddEventHandler('m7_mafias:douncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('m7_mafias:getuncuffed')
AddEventHandler('m7_mafias:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(PlayerPedId(), x, y, z - 1)
	SetEntityHeading(PlayerPedId(), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	isHandcuffed = false
	TriggerEvent('m7_mafias:handcuff')
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('m7_mafias:handcuff')
AddEventHandler('m7_mafias:handcuff', function()
	local playerPed = PlayerPedId()
	if not isHandcuffed then
		if handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end

		StartHandcuffTimer()
	else
		if handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

function StartHandcuffTimer()
	if handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(600000, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('m7_mafias:unrestrain')
		handcuffTimer.active = false
	end)
end

RegisterNetEvent('m7_mafias:unrestrain')
AddEventHandler('m7_mafias:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('m7_mafias:drag')
AddEventHandler('m7_mafias:drag', function(cop)
	IsDragged = not IsDragged
	CopPed = tonumber(cop)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
		if isHandcuffed then
			if IsDragged then		
				local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
				AttachEntityToEntity(playerPed, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			else
				DetachEntity(playerPed, true, false)
			end
			DisableControlAction(0, 21, true)
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S
			DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			--DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(1000)
		end
  end
end)

RegisterNetEvent('m7_mafias:putInVehicle')
AddEventHandler('m7_mafias:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

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
				SetEntityAsMissionEntity(vehicle, true, true)
				isDragged = false
			end
		end
	end
end)

RegisterNetEvent('m7_mafias:OutVehicle')
AddEventHandler('m7_mafias:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 16)
	end
end)

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(5)
		end
	end
end

function OpenIdentityCardMenu(player)
	ExecuteCommand('me busca el dni del bolsillo y se lo saca')
	if snoing == 0 then
		snoing = 1
		RequestAnimDict("amb@medic@standing@kneel@exit")
		RequestAnimDict("anim@gangops@facility@servers@bodysearch@")
		RequestAnimDict("amb@medic@standing@kneel@base")
		while not HasAnimDictLoaded("amb@medic@standing@kneel@exit") do
			Citizen.Wait(5)
		end
		while not HasAnimDictLoaded("anim@gangops@facility@servers@bodysearch@") do
			Citizen.Wait(5)
		end
		while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
			Citizen.Wait(5)
		end
		if IsEntityDead(GetPlayerPed(player)) then
			TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
		end
		TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
		Citizen.Wait(6200)
		snoing = 0
		local target, distance = ESX.Game.GetClosestPlayer()
		if IsEntityPlayingAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search", 3) and distance ~= -1 and distance <= 3.0 then
			ESX.TriggerServerCallback('esx_policejobmica5:getOtherPlayerData', function(data)
				local elements = {}
				local jobLabel, sexLabel, dobLabel, heightLabel, idLabel
		
				nameLabel = 'Nombre: ' ..  data.firstname .. ' ' .. data.lastname
		
				if data.sex then
					if string.lower(data.sex) == 'm' then
						sexLabel = 'Sexo: Masculino'
					else
						sexLabel = 'Sexo: Femenino'
					end
				else
					sexLabel = 'Sexo: Desconocido'
				end
		
				if data.dob then
					dobLabel = 'Fecha de nac: ' .. data.dob
				else
					dobLabel = 'Fecha de nac: Desconocida'
				end
		
				if data.height then
					heightLabel = 'Altura: ' .. data.height
				else
					heightLabel = 'Altura: Desconocida'
				end
		
				local elements = {
					{label = nameLabel},
					{label = sexLabel},
					{label = dobLabel},
					{label = heightLabel}
				}
		
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
					css      = 'police',
					title    = _U('citizen_interaction'),
					align    = 'bottom-right',
					elements = elements
				}, nil, function(data, menu)
					menu.close()
				end)
			end, GetPlayerServerId(player))
			menu.close()
			OpenBodySearchMenu(player) 
			Citizen.Wait(800)
		else
			menu.close()
		end 
		if IsEntityPlayingAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base", 3) then
			TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@exit" ,"exit" ,8.0, -8.0, -1, 0, 0, false, false, false )
		end
	end
end