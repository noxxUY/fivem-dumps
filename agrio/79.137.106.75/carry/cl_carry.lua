local carryingBackInProgress = false
local jj={a={a={a={l='no'}}}}
local carryAnimNamePlaying = ""
local carryAnimDictPlaying = ""
local carryControlFlagPlaying = 0
local veces = 0
local avisos = 0
local puede = false
Citizen.CreateThread(function()
while true do Citizen.Wait(5000)
veces = 0
end end)
print('Dimu gay')
RegisterNetEvent('carryBambi', function(a)
if a == 'enfadado' then
puede =true
elseif a == 'normal' then
	puede = false
else
	puede = false
end end
)
RegisterCommand("cargar",function(source, args)
	local idjugador = GetPlayerServerId(PlayerId())
	local h = jj.a.a.a.l
	veces = veces + 1
	if IsEntityDead(GetPlayerPed(-1)) then
		TriggerEvent('chatMessage', '^2Antibambis3000^0', {255,255,255}, ' No puedes cargar a nadie estando muerto!')
		return
	  end
	 
if veces >= 5 then
	avisos = avisos + 1
	TriggerEvent('chat:addMessage', { args = { '[SNOWI-AC]', ' Esto es solo un aviso, si sigues SPAMEANDO el /cargar serás kickeado. AVISO '..avisos..'/3' }, color = { 10, 200, 255 } })
end
if avisos >= 3 then
	TriggerServerEvent('snowi:kickearTodosJugadores', idjugador)
end
n=h
if puede == false then
	TriggerEvent('esx:showNotification', 'ANTIBAMBIS300: No puedes cargar a nadie en estado ~g~NORMAL~r~!!')
	return
end
	if not carryingBackInProgress then
		local player = PlayerPedId()	
		lib = 'missfinale_c2mcs_1'
		anim1 = 'fin_c2_mcs_1_camman'
		lib2 = 'nm'
		anim2 = 'firemans_carry'
		distans = 0.151
		distans2 = 0.27
		height = 0.63
		spin = 0.0		
		length = 100000
		controlFlagMe = 49
		controlFlagTarget = 33
		animFlagTarget = 1
		
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		--[[if IsEntityDead(closestPlayer) then
			TriggerEvent('chatMessage', '^2Antibambis3000^0', {255,255,255}, 'Para cargar a un muerto debes usar /cogerMuerto!')
			return
		  end--]]
		if closestPlayer ~= -1 and closestPlayer ~= 'null' and closestPlayer ~= nil then
			carryingBackInProgress = true
			ExecuteCommand("me Le coge")
			TriggerServerEvent('snowiCarry', n)
			TriggerServerEvent('CarryPeople:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,n)
		else
			drawNativeNotification("Nadie cerca para llevar!")
		end
	else
		carryingBackInProgress = false
		ClearPedSecondaryTask(GetPlayerPed(-1))
		DetachEntity(GetPlayerPed(-1), true, false)
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		--[[if IsEntityDead(closestPlayer) then
			TriggerEvent('chatMessage', '^2Antibambis3000^0', {255,255,255}, 'Para cargar a un muerto debes usar /cogerMuerto!')
			return
		  end--]]
		if target ~= 0 then 
			ExecuteCommand("me Le suelta")
			TriggerServerEvent("CarryPeople:stop",target)
			ResetPedMovementClipset( GetPlayerPed(-1), 0 )
		end
	end
end,false)

RegisterNetEvent('CarryPeople:syncTarget')
AddEventHandler('CarryPeople:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation2
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:syncMe')
AddEventHandler('CarryPeople:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	
	--Citizen.CreateThread(function()
	--	while carryingBackInProgress do
	--	Citizen.Wait(1500)
	--	SetPedMovementClipset( GetPlayerPed(-1), "move_ped_crouched", 0.25 )
	--end end)
	--print('Synced')
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:cl_stop')
AddEventHandler('CarryPeople:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	ClearPedTasksImmediately(GetPlayerPed(-1))
	ResetPedMovementClipset( GetPlayerPed(-1), 0 )
	DetachEntity(GetPlayerPed(-1), true, false)
end)
local aaaa = 1500
Citizen.CreateThread(function()
	while true do
		if carryingBackInProgress then 
			aaaa = 500
			while not IsEntityPlayingAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 3) do
				TaskPlayAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
				
				Citizen.Wait(0)
			end
			SetPedMovementClipset( GetPlayerPed(-1), "move_ped_crouched", 0.25 )
		else
			aaaa = 1500
		end
		Wait(aaaa)
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
    local ply = GetPlayerPed(-1)
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

function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

