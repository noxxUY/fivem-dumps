-- CONFIG --

-- Allow passengers to shoot
local passengerDriveBy = true

local handsup = false

local crouched = false

RegisterCommand('+agacharse', function()
	local ped = PlayerPedId()
	RequestAnimSet( "move_ped_crouched" )
	DisableControlAction( 0, 36, true )
	if crouched then 
		ResetPedMovementClipset( ped, 0 )
		crouched = false 
	elseif not crouched then
		SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
		crouched = true 
	end 
	
end, false)

RegisterCommand('-agacharse', function()
    
end, false)
RegisterKeyMapping('+agacharse', 'Agacharse', 'keyboard', 'lcontrol')

RegisterCommand('+brazos', function()
	local ped = PlayerPedId()
	local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
	
	if not handsup then
		TaskPlayAnim(ped, dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
		handsup = true
	else
		handsup = false
		ClearPedTasks(ped)
	end	
end, false)

RegisterCommand('-brazos', function()
    
end, false)
RegisterKeyMapping('+brazos', 'Cruzar Brazos', 'keyboard', 'z')

RegisterCommand('señalar', function()
    local ped = PlayerPedId()
    repeat RequestAnimDict('anim@mp_point') Wait(0)
    until HasAnimDictLoaded('anim@mp_point')
    TaskMoveNetworkByName(ped, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
    RemoveAnimDict('anim@mp_point')
    while IsControlPressed(0, 29) do
        SetTaskMoveNetworkSignalFloat(ped, 'Pitch', (GetGameplayCamRelativePitch() + 70) / 110)
        SetTaskMoveNetworkSignalFloat(ped, 'Heading', (GetGameplayCamRelativeHeading() + 180) / 360 * -1.0 + 1.0)
        Wait(16)
    end
    RequestTaskMoveNetworkStateTransition(ped, 'Stop')
    ClearPedSecondaryTask(ped)
end)

RegisterKeyMapping('señalar', 'Señalar con el dedo', 'keyboard', 'b')




-- CARGAR
-- CARGAR
-- CARGAR
-- CARGAR
-- CARGAR
-- CARGAR
-- CARGAR

local carryingBackInProgress = false
local carryAnimNamePlaying = ""
local carryAnimDictPlaying = ""
local carryControlFlagPlaying = 0

RegisterCommand("cargar",function(source, args)

	local ply = PlayerPedId()

	if IsPedDeadOrDying(ply, true) then return exports['okokNotify']:Alert("SERVIDOR", 'No podés cargar estando muerto.', 4500, 'error') end

	if IsPedOnFoot(ply) then

		if not carryingBackInProgress then
			local player = PlayerPedId()	
			lib = 'missfinale_c2mcs_1'
			anim1 = 'fin_c2_mcs_1_camman'
			lib2 = 'nm'
			anim2 = 'firemans_carry'
			distans = 0.15
			distans2 = 0.27
			height = 0.63
			spin = 0.0		
			length = 100000
			controlFlagMe = 49
			controlFlagTarget = 33
			animFlagTarget = 1
			local closestPlayer = GetClosestPlayer(3)
			target = GetPlayerServerId(closestPlayer)
			if closestPlayer ~= -1 and closestPlayer ~= nil then
				carryingBackInProgress = true
				TriggerServerEvent('CarryPeople:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
			else
				exports['okokNotify']:Alert("SERVIDOR", 'No hay nadie cerca para cargar', 3500, 'error')
			end
		else
			carryingBackInProgress = false
			ClearPedSecondaryTask(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
			local closestPlayer = GetClosestPlayer(3)
			target = GetPlayerServerId(closestPlayer)
			if target ~= 0 then 
				TriggerServerEvent("CarryPeople:stop",target)
			end
		end
	else
		exports['okokNotify']:Alert("SERVIDOR", 'No podés cargar desde arriba de un auto.', 4500, 'error')
	end
end,false)

RegisterNetEvent('CarryPeople:syncTarget')
AddEventHandler('CarryPeople:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation2
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:syncMe')
AddEventHandler('CarryPeople:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = PlayerPedId()
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:cl_stop')
AddEventHandler('CarryPeople:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

Citizen.CreateThread(function()
	while true do
		if carryingBackInProgress then 
			while not IsEntityPlayingAnim(PlayerPedId(), carryAnimDictPlaying, carryAnimNamePlaying, 3) do
				TaskPlayAnim(PlayerPedId(), carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
				Citizen.Wait(0)
			end
		end
		Wait(0)
	end
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end