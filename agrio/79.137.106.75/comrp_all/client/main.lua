local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

RegisterCommand("tw", function(source)
    TeleportToWaypoint()
end)

TeleportToWaypoint = function()
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end

                ESX.ShowNotification("Has sido ~o~Teletransportado~s~ ~b~Correctamente~s~.")
            else
                ESX.ShowNotification("Pon una ~g~Ubicación~s~.")
            end
        else
            ESX.ShowNotification("~r~No tienes suficientes permisos!~s~")
        end
    end)
end
--[[local tiempo = 2000 -- 1000 ms = 1s
local isTaz = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		if IsPedBeingStunned(GetPlayerPed(-1)) then
			
			SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
			
		end
		
		if IsPedBeingStunned(GetPlayerPed(-1)) and not isTaz then
			
			isTaz = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			
		elseif not IsPedBeingStunned(GetPlayerPed(-1)) and isTaz then
			isTaz = false
			Wait(5000)
			
			SetTimecycleModifier("hud_def_desat_Trevor")
			
			Wait(10000)
			
      SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
	end
end)--]]
-----------------------------------------------------------------
--TakeHostage by Robbster, do not redistrbute without permission--
------------------------------------------------------------------


--[[Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 82) then --Start holding g
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)--]]
local mp_pointing = false
local keyPressed = false
function snowiOP2()
    stop = false
    Citizen.CreateThread(function()while true do 
        Citizen.Wait(0)
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            stopPointing()
        end
        if stop == false then print('Retorno thread 2')
            return
        end 
    end
    end)
    end

function snowiOP()
Citizen.CreateThread(function()while true do 
    Citizen.Wait(0)
    if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
        if not IsPedOnFoot(PlayerPedId()) then
            stopPointing()
            print('no food')
        else
            local ped = GetPlayerPed(-1)
            local camPitch = GetGameplayCamRelativePitch()
            if camPitch < -70.0 then
                camPitch = -70.0
            elseif camPitch > 42.0 then
                camPitch = 42.0
            end
            camPitch = (camPitch + 70.0) / 112.0

            local camHeading = GetGameplayCamRelativeHeading()
            local cosCamHeading = Cos(camHeading)
            local sinCamHeading = Sin(camHeading)
            if camHeading < -180.0 then
                camHeading = -180.0
            elseif camHeading > 180.0 then
                camHeading = 180.0
            end
            camHeading = (camHeading + 180.0) / 360.0

            local blocked = 0
            local nn = 0

            local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
            local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
            nn,blocked,coords,coords = GetRaycastResult(ray)

            Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
            Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
            Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
            Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

        end
    end
    if apunta == false then print('Retorno thread 2')
        return
    end 
end
end)
end
function startPointing()
    apunta = true
    snowiOP()
    ssss = true
    Citizen.CreateThread(function()while ssss do 
        Citizen.Wait(0)
        if apunta == false then print('Retorno thread 2')
            return
        end 
   
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
    ssss= false
end end)
end

function stopPointing()
    apunta = false
    --snowiOP2()
    sasdsad =true
    Citizen.CreateThread(function()while sasdsad do 
        Citizen.Wait(0)
        if stop == false then 
            print('Retorno thread 2')
            return
        end 
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
    sasdsad=false
end end)
end
local once = true
local oldval = false
local oldvalped = false

RegisterCommand('apuntardedo', function() 
    if once then
        once = false
    end
    if not keyPressed then
        if IsPedOnFoot(PlayerPedId()) then
            Wait(200)
            print('apunta')
            
                keyPressed = true
                startPointing()
                mp_pointing = true
        end
    else
        if  IsPedOnFoot(PlayerPedId()) then
        print('deja apuntar')
        stopPointing()
        keyPressed = false
        end
    end
    
    
    
    
end)
RegisterKeyMapping('apuntardedo', 'Señalar con el dedo', 'keyboard', 'B' )
local crouched = false
RegisterCommand('id', function()
    TriggerEvent('chat:addMessage', { template = "", args = { "Eres el ^4ID:^2"..GetPlayerServerId(PlayerId()) } })
end)
--[[Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 5 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                        Citizen.Wait( 100 )
                    end 

                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
                end
            end 
        else
            Citizen.Wait(3000)
        end 
    end
end )--]]
RegisterCommand('agacharse', function() 
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

        if ( not IsPauseMenuActive() ) then 
            --if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                RequestAnimSet( "move_ped_crouched" )

                while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                    Citizen.Wait( 100 )
                end 

                if ( crouched == true ) then 
                    ResetPedMovementClipset( ped, 0 )
                    crouched = false 
                elseif ( crouched == false ) then
                    SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                    crouched = true 
                end 
            --end
        end 
    else
        Citizen.Wait(3000)
    end 
end)

RegisterKeyMapping('agacharse', 'Agacharte', 'keyboard', 'LCONTROL' )
RegisterKeyMapping('abrirveh', 'Abrir maletero de vehiculo', 'keyboard', 'l' )