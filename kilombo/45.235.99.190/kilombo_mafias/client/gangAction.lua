enPropiedad = false

local enZonaSegura = false

AddEventHandler('nui:on', function() enZonaSegura = true end)
AddEventHandler('nui:off', function() enZonaSegura = false end)

RegisterNetEvent('myProperties:enterProperty')
AddEventHandler('myProperties:enterProperty', function()
	enPropiedad = true
end)

RegisterNetEvent('myProperties:leaveProperty')
AddEventHandler('myProperties:leaveProperty', function()
	enPropiedad = false
end)

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

function getClosetPlayer()
	local closestEntity, closestEntityDistance = -1, -1
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	local players, myPlayer = {}, PlayerId()

	--print(json.encode(GetActivePlayers()))
	for k,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		if player ~= myPlayer then
			if DoesEntityExist(ped) then
				local distance = #(coords - GetEntityCoords(ped))

				if closestEntityDistance == -1 or distance < closestEntityDistance then
					closestEntity, closestEntityDistance =  player , distance
				end
			end
		end
	end
	return closestEntity, closestEntityDistance
end

function getClosetVehicle1()
	local closestEntity, closestEntityDistance = -1, -1
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	for vehicle in EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle) do
		local distance = #(coords - GetEntityCoords(vehicle))

		if closestEntityDistance == -1 or distance < closestEntityDistance then
			closestEntity, closestEntityDistance =  vehicle , distance
		end
	end
	return closestEntity, closestEntityDistance
end

function getClosetVehicle()
	local playerPed    = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local inDirection  = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
	local rayHandle    = StartShapeTestRay(playerCoords, inDirection, 10, playerPed, 0)
	local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

	if hit == 1 and GetEntityType(entityHit) == 2 then
		return entityHit
	end

	return nil
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
					local player , distance = getClosetPlayer()
					abrirMenuMafia()
				end
				Citizen.Wait(0)
			end
		end)
	end 
end

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {
			{label = '<i class="fa-solid fa-user"></i> Nombre: '..data.name}
		}

		if data.dob == "male" then
			table.insert(elements, {label = '<i class="fa-solid fa-venus-mars"></i> Sexo: Masculino'})
		else
			table.insert(elements, {label = '<i class="fa-solid fa-venus-mars"></i> Sexo: Femenino'})
		end
		table.insert(elements, {label = '<i class="fa-solid fa-calendar"></i> Nacimiento: '..data.dob})
		table.insert(elements, {label = '<i class="fa-solid fa-circle-info"></i> Altura: '..data.height})

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sacar_info', {
			title    = '<i class="fa-solid fa-person fa-bounce"></i> Información de persona',
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function abrirMenuMafia()

		if not enZonaSegura then


				local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()

				local rango = exports['kilombo_mafias']:getGangGradeName(source)

				ESX.UI.Menu.CloseAll() -- We close all the menus that may be open and open a new one.
				ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menu_mafia_general', -- Change menu name
				{
				title    = ('Menu Mafia | <span style="color:red;">'..activeGangs[myGangId].gangName..'</span> (<span style="color:cyan;">'..rango..'</span>)'),        -- Menu title
				align = 'top-left',                    -- Menu position
				elements ={
					{label = _U('search_player'), value = 'cachear'},
					{label = _U('sacar_info'), value = 'sacar_info'},
					{label = _U('cuff_uncuff'), value = 'esposas'},
					{label = _U('drag_person'), value = 'escoltar'},
					{label = _U('Put_in_vehicle'), value = 'auto_meter'},
					{label = _U('Put_out_vehicle'), value = 'auto_sacar'},
					--{label = _U('open_vehicle_door'), value = 'auto_forzar'}
				} 
				
				},
				function(data, menu) -- This part contains the code that executes when you press enter
					if data.current.value  == 'cachear' then -- This detects which element you have pressed

					if not enZonaSegura then

							if activeGangs[myGangId].canSearch == 1 then
					
								local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
					
								local target_id = GetPlayerServerId(closestPlayer)
					
								local target = PlayerPedId(target_id)
					
								if closestPlayer == -1 or closestPlayerDistance > 3.0 then
									exports['okokNotify']:Alert("SERVIDOR", _U("no_player_nearby"), 3500, 'error')
								else
									-- exports.ox_inventory:openInventory('player', target)
									ExecuteCommand("me Lo cachea / Le roba.")
									TriggerServerEvent('Erfan:gang:GetActiveMember', target_id)
								end
					
							end

						else
							exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
						end
					end
				if data.current.value  == 'sacar_info' then -- This detects which element you have pressed

					if not enZonaSegura then

						local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestPlayerDistance > 3.0 then
							exports['okokNotify']:Alert("SERVIDOR", _U("no_player_nearby"), 3500, 'error')
						else
							ExecuteCommand("me Mira el DNI de la persona para sacarle información.")
							OpenIdentityCardMenu(closestPlayer)
						end
					else
						exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
					end
				end
				if data.current.value  == 'esposas' then

					if not enZonaSegura then

						if activeGangs[myGangId].canCuff == 1 then

							local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()

							if closestPlayer == -1 or closestPlayerDistance > 3.0 then
								exports['okokNotify']:Alert("SERVIDOR", _U("no_player_nearby"), 3500, 'error')
							else
								if ( Config.handCuffAnimation ) then
									ExecuteCommand("me Le pone / Le saca las esposas.")
									TriggerServerEvent('Erfan:gang:handcuffAnimation', GetPlayerServerId(closestPlayer))
									Citizen.Wait(3100)
								end
								TriggerServerEvent('Erfan:gang:handcuff',GetPlayerServerId(closestPlayer))
							end
						end
					else
						exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
					end
				end
				if data.current.value  == 'escoltar' then

					if not enZonaSegura then

						if activeGangs[myGangId].canMove == 1 then

							local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()

							if closestPlayer == -1 or closestPlayerDistance > 3.0 then
								exports['okokNotify']:Alert("SERVIDOR", _U("no_player_nearby"), 3500, 'error')
							else
								ExecuteCommand("me Lo toma con fuerza del brazo.")
								TriggerServerEvent('Erfan:gang:drag',GetPlayerServerId(closestPlayer))
							end
						end
					else
						exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
					end
				end
				if data.current.value  == 'auto_meter' then

					if not enZonaSegura then
						
						local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestPlayerDistance > 3.0 then
							exports['okokNotify']:Alert("SERVIDOR", _U("no_player_nearby"), 3500, 'error')
						else
							ExecuteCommand("me Mete al sujeto en el auto, le abrocha el cinturón y cierra la puerta.")
							TriggerServerEvent('Erfan:gang:putInVehicle',GetPlayerServerId(closestPlayer))
						end
					else
						exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
					end

				end
				if data.current.value  == 'auto_sacar' then

					if not enZonaSegura then
						
						local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestPlayerDistance > 3.0 then
							exports['okokNotify']:Alert("SERVIDOR", _U("no_player_nearby"), 3500, 'error')
						else
							ExecuteCommand("me Abre la puerta, desabrocha el cinturon y saca al sujeto del auto.")
							TriggerServerEvent('Erfan:gang:OutVehicle',GetPlayerServerId(closestPlayer))
						end
					else
						exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
					end

				end
				--[[if data.current.value  == 'auto_forzar' then
					if not enZonaSegura then
						local playerPed  = PlayerPedId()
						local coords  = GetEntityCoords(playerPed)
						local vehicle = getClosetVehicle()
						if vehicle ~= nil then
							if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
								whileGoActionMenu = false
								TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
								Citizen.Wait(math.random(10000,25000))
								ClearPedTasksImmediately(playerPed)

								SetVehicleDoorsLocked(vehicle, 1)
								SetVehicleDoorsLockedForAllPlayers(vehicle, false)
								TriggerEvent('Erfan:gang:sendNotficationFromPlayer', GetPlayerServerId(playerPed) , activeGangs[myGangId].gangName, ''  , _U('vehicle_Unlocked') , 'CHAR_BLOCKED' , 1 )
							end
						else
							exports['okokNotify']:Alert("SERVIDOR", _U("no_vehicle_nearby"), 3500, 'error')
						end

					else
						exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
					end
				end]]
				end,
				function(data, menu)
					menu.close() -- Action when closing the menu 
				end
			)

		else
			exports['okokNotify']:Alert("SERVIDOR", "No podes usar menu de mafia en Zona Segura", 6500, 'error')
		end
end

local isHandcuffed = false
RegisterNetEvent('Erfan:gang:handcuffAnimation')
AddEventHandler('Erfan:gang:handcuffAnimation', function(gangMemberId)
	if gangMemberId ~= nil then
		local playerPed = PlayerPedId()
		local targetPed = GetPlayerPed(GetPlayerFromServerId(gangMemberId))
		RequestAnimDict('mp_arrest_paired')
		while not HasAnimDictLoaded('mp_arrest_paired') do
			Citizen.Wait(10)
		end

		AttachEntityToEntity(PlayerPedId(), targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
		TaskPlayAnim(playerPed, 'mp_arrest_paired', 'crook_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)

		Citizen.Wait(950)
		DetachEntity(PlayerPedId(), true, false)
	else
		local playerPed = PlayerPedId()
		RequestAnimDict('mp_arrest_paired')
		while not HasAnimDictLoaded('mp_arrest_paired') do
			Citizen.Wait(10)
		end
		TaskPlayAnim(playerPed, 'mp_arrest_paired', 'cop_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)
	end
end)

RegisterNetEvent('Erfan:gang:handcuff')
AddEventHandler('Erfan:gang:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()
	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end
		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, true)
		DisplayRadar(false)
		Citizen.CreateThread(function()
			while isHandcuffed do
				Citizen.Wait(0)
				DisableAllControlActions(0)
				EnableControlAction(0, 47, true)
				EnableControlAction(0, 245, true)
				EnableControlAction(0, 38, true)
			end
		end)
	else
		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
		isDraged = false
		DetachEntity(playerPed, true, false)
	end
end)


local isDraged = false
RegisterNetEvent('Erfan:gang:drag')
AddEventHandler('Erfan:gang:drag', function(gangId)
	if isHandcuffed then
		isDraged = not isDraged
		Citizen.CreateThread(function()
			local wasDragged = false
			local playerPed = PlayerPedId()
			local targetPed = GetPlayerPed(GetPlayerFromServerId(gangId))
			while isHandcuffed and isDraged do
				Citizen.Wait(1)

				if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
					if not wasDragged then
						AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
						wasDragged = true
					else
						Citizen.Wait(1000)
					end
				else
					wasDragged = false
					isDraged = false
					DetachEntity(playerPed, true, false)
				end
				
			end
			
			wasDragged = false
			isDraged = false
			DetachEntity(playerPed, true, false)
		end)
	end
end)


RegisterNetEvent('Erfan:gang:putInVehicle')
AddEventHandler('Erfan:gang:putInVehicle', function(gangId)
	if isHandcuffed then
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
					isDraged = false
				end
			end
		end
	end
end)

RegisterNetEvent('Erfan:gang:OutVehicle')
AddEventHandler('Erfan:gang:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
	end
end)

