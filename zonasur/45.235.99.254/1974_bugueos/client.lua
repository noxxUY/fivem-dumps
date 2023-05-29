ESX = nil

local rola = false
local hud = true
local ping = 0
local color  = '~g~'

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(5)
		
		local playerPed = PlayerPedId()
		local currentWeaponHash = GetSelectedPedWeapon(playerPed)
		local letSleep = true
		local car = GetVehiclePedIsIn(playerPed, false)

		if IsPedInCover(playerPed, 0) and not IsPedAimingFromCover(playerPed) then
			letSleep = false
			HideHudComponentThisFrame(14)
		end
		
		if currentWeaponHash ~= -1569615261 then
			letSleep = false
        	SetPlayerLockon(playerPed, false)
        else
        	SetPlayerLockon(playerPed, true)
		end
		
		if IsEntityDead(playerPed) then
			letSleep = false
			SetPedDropsWeaponsWhenDead(playerPed, false)
		end
		
		if IsPedArmed(playerPed,4) then
            letSleep = false
            SetPlayerLockonRangeOverride(playerPed, 2.0)
        end
		
		if IsPedArmed(playerPed, 6) then
			letSleep = false
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
        end
				
		if car then
			letSleep = false
			DisablePlayerVehicleRewards(PlayerId())
			if GetPedInVehicleSeat(car, -1) == playerPed then
				--SetCurrentPedWeapon(playerPed,GetHashKey("WEAPON_UNARMED"),true)
				SetPlayerCanDoDriveBy(PlayerId(), false)
			else
				SetPlayerCanDoDriveBy(PlayerId(), true)
			end
		end

		if IsVehicleTyreBurst(car, 0, true) or IsVehicleTyreBurst(car, 1, true) or IsVehicleTyreBurst(car, 4, true) or IsVehicleTyreBurst(car, 5, true) or IsVehicleTyreBurst(car, 2, true) or IsVehicleTyreBurst(car, 3, true) or IsVehicleTyreBurst(car, 45, true) or IsVehicleTyreBurst(car, 47, true) then --2, 3, 45, 47
			letSleep = false
			SetVehicleUndriveable(car, true)
		end
		
		if letSleep then
            Wait(500)
        end
	end
end)

local hpcar = 100.0

RegisterNetEvent("1974_borrar:borrar_auto")
AddEventHandler("1974_borrar:borrar_auto", function ()
	local vehs = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehs) do
        --if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
		if GetVehicleEngineHealth(vehicle) <= hpcar or RuedaPinchada(vehicle) then
			if NetworkGetEntityIsNetworked(vehicle) then
				if not IsEntityAttached(vehicle) then
					NetWorkDelete(vehicle)
					if (DoesEntityExist(vehicle)) then 
						DeleteVehicle(vehicle) 
					end
				end
            else
				if not IsEntityAttached(vehicle) then
					SetVehicleHasBeenOwnedByPlayer(vehicle, false)
					SetEntityAsMissionEntity(vehicle, false, false)
					DeleteEntity(vehicle)
				end
            end
		end
    end
end)

RegisterNetEvent("1974_borrar:borrar_auto2")
AddEventHandler("1974_borrar:borrar_auto2", function ()
	local vehs = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehs) do
        if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
			if NetworkGetEntityIsNetworked(vehicle) then
				if not IsEntityAttached(vehicle) then
					NetWorkDelete(vehicle)
					if (DoesEntityExist(vehicle)) then 
						DeleteVehicle(vehicle) 
					end
				end
            else
				if not IsEntityAttached(vehicle) then
					SetVehicleHasBeenOwnedByPlayer(vehicle, false)
					SetEntityAsMissionEntity(vehicle, false, false)
					DeleteEntity(vehicle)
				end
            end
		end
    end
end)

function RuedaPinchada(car)
	if IsVehicleTyreBurst(car, 0, false) or IsVehicleTyreBurst(car, 1, false) or IsVehicleTyreBurst(car, 4, false) or IsVehicleTyreBurst(car, 5, false) or IsVehicleTyreBurst(car, 2, false) or IsVehicleTyreBurst(car, 3, false) or IsVehicleTyreBurst(car, 45, false) or IsVehicleTyreBurst(car, 47, false) then --2, 3, 45, 47
		return true
	else
		return false
	end
end

RegisterNetEvent("1974_borrar:delallveh")
AddEventHandler("1974_borrar:delallveh", function ()
	local vehs = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehs) do
		if GetVehicleEngineHealth(vehicle) <= hpcar then
			if NetworkGetEntityIsNetworked(vehicle) then
                NetWorkDelete(vehicle)
				if (DoesEntityExist(vehicle)) then 
					DeleteVehicle(vehicle) 
				end
            else
                SetVehicleHasBeenOwnedByPlayer(vehicle, false)
                SetEntityAsMissionEntity(vehicle, false, false)
                DeleteEntity(vehicle)
            end
		end
    end
end)

function NetWorkDelete(entity)
	local intento = 0
	while not NetworkHasControlOfEntity(entity) and intento < 50 and DoesEntityExist(entity) do
		NetworkRequestControlOfEntity(entity)
		intento = intento + 1
	end
	if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
		SetEntityAsMissionEntity(entity, false, true)
		DeleteEntity(entity)
	end
end

RegisterNetEvent("1974_borrar:delallobj")
AddEventHandler("1974_borrar:delallobj", function ()
	local objs = GetGamePool('CObject') 
	for _, obj in ipairs(objs) do
        if NetworkGetEntityIsNetworked(obj) then
            NetWorkDelete(obj)
        else
            DeleteEntity(obj)
        end
    end
end)

RegisterNetEvent("1974_borrar:delallobjNet")
AddEventHandler("1974_borrar:delallobjNet", function ()
	objst = 0
	for objeto in EnumerateObjetos() do
		objst = objst + 1
		NetWorkDelete1(objeto)
		Networkingdelete(objeto)
    end
end)

function NetWorkDelete1(entity)
	local c5 = 0
	while not NetworkHasControlOfEntity(entity) and c5 < 50 and DoesEntityExist(entity) do
		NetworkRequestControlOfEntity(entity)
		c5 = c5 + 1
	end
	if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
		SetEntityAsMissionEntity(entity, false, true)
		DeleteEntity(entity)
	end
end

function Networkingdelete(entity)
	if DoesEntityExist(entity) then
		NetworkRequestControlOfEntity(entity)
		local c4 = 2000
		while c4 > 0 and not NetworkHasControlOfEntity(entity) do
			Wait(100)
			c4 = c4 - 100
		end
		DeleteEntity(entity)
	end
end

RegisterNetEvent("1974_borrar:ped")
AddEventHandler("1974_borrar:ped", function()
    local peds = GetGamePool('CPed')
    for _, ped in ipairs(peds) do
        if not (IsPedAPlayer(ped)) then
            RemoveAllPedWeapons(ped, true)
            if NetworkGetEntityIsNetworked(ped) then
                NetWorkDelete(ped)
            else
                DeleteEntity(ped)
            end
        end
    end
end)

RegisterNetEvent("1974_time:hud")
AddEventHandler("1974_time:hud", function(bool)
	hud = bool
end)

Citizen.CreateThread(function()
    while true do
		
		--[[
		local year, month, dayOfWeek, hour, minute = GetLocalTime()
		if hud then
			drawLevel(185, 185, 185, 255)
			--miid(0.815, 1.435, 1.0,1.0,0.40, "~w~FECHA: "..GetClockDayOfMonth()..'/'..GetClockMonth()..'/'..GetClockYear()..' - '..GetClockHours()..':'..GetClockMinutes(), 255, 255, 255, 255)
			--miid(0.815, 1.435, 1.0,1.0,0.40, "~w~FECHA: "..dayOfWeek..'/'..month..'/'..year..' - '..hour..':'..minute, 255, 255, 255, 255)
			miid(0.815, 1.435, 1.0,1.0,0.40, "~w~FECHA: "..dayOfWeek..'/'..month..'/'..year..' - '..GetClockHours()..':'..GetClockMinutes(), 255, 255, 255, 255)
		end
		
		SetWeaponDamageModifier(`WEAPON_NIGHTSTICK`, 0.0)
		SetWeaponDamageModifier(`WEAPON_HEAVYSNIPER`, 0.4)
		SetWeaponDamageModifier(-1553120962, 0.0)	
		]]
		if IsControlJustReleased(0, 121) then
			TriggerServerEvent('1974_borrar:sendDiscord')
		end
		
        Wait(0)
    end
end)

RegisterNetEvent("1974_time:ping")
AddEventHandler("1974_time:ping", function(p)
	ping = p
	if ping >= 40 then
		color = '~y~'
	elseif ping >= 80 then
		color = '~r~'
	else
		color = '~g~'
	end
end)

function miid(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
 	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
 	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2 - 0.138, y - height/2 + 0.015)
end

function drawLevel(r, g, b, a)
	SetTextFont(4)
	SetTextScale(0.5, 0.5)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	local id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
	BeginTextCommandDisplayText('STRING')
	--AddTextComponentSubstringPlayerName(' ~y~ID: ~b~'.. id.. '~w~ PING: '..color..''..ping)
	AddTextComponentSubstringPlayerName(' ~y~ID: ~b~'.. id)
	EndTextCommandDisplayText(0.175, 0.92)
end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)

		local ped = PlayerPedId()
		local car = GetVehiclePedIsIn(ped, false)
		local Sleep = true
		
		if IsPedArmed(ped, 6) then
			Sleep = false
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
        end
				
		if car then
			Sleep = false
			DisablePlayerVehicleRewards(PlayerId())
			if GetPedInVehicleSeat(car, -1) == ped then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			else
				SetPlayerCanDoDriveBy(PlayerId(), true)
			end
		end

		if IsVehicleTyreBurst(car, 0, true) or IsVehicleTyreBurst(car, 1, true) or IsVehicleTyreBurst(car, 4, true) or IsVehicleTyreBurst(car, 5, true) or IsVehicleTyreBurst(car, 2, true) or IsVehicleTyreBurst(car, 3, true) or IsVehicleTyreBurst(car, 45, true) or IsVehicleTyreBurst(car, 47, true) then --2, 3, 45, 47
			Sleep = false
			SetVehicleUndriveable(car, true)
		end
		
		if Sleep then
			Wait(500)
		end
    end
end)


Config = {} 
Config.DamageNeeded = 100.0 -- 100.0 being broken and 1000.0 being fixed a lower value than 100.0 will break it
Config.MaxWidth = 5.0 -- Will complete soon
Config.MaxHeight = 5.0
Config.MaxLength = 5.0

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


--EMPUJAR VEHICULO ROTO
local First = vector3(0.0, 0.0, 0.0)
local Second = vector3(5.0, 5.0, 5.0)

local Vehicle = {Coords = nil, Vehicle = nil, Dimension = nil, IsInFront = false, Distance = nil}

Citizen.CreateThread(function()
    Citizen.Wait(200)
    while true do
        local ped = PlayerPedId()
        local closestVehicle, Distance = ESX.Game.GetClosestVehicle()
        local vehicleCoords = GetEntityCoords(closestVehicle)
        local dimension = GetModelDimensions(GetEntityModel(closestVehicle), First, Second)
        if Distance < 6.0  and not IsPedInAnyVehicle(ped, false) then
            Vehicle.Coords = vehicleCoords
            Vehicle.Dimensions = dimension
            Vehicle.Vehicle = closestVehicle
            Vehicle.Distance = Distance
            if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
                Vehicle.IsInFront = false
            else
                Vehicle.IsInFront = true
            end
        else
            Vehicle = {Coords = nil, Vehicle = nil, Dimensions = nil, IsInFront = false, Distance = nil}
        end
        Citizen.Wait(500)
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if Vehicle.Vehicle ~= nil then
 
                if IsVehicleSeatFree(Vehicle.Vehicle, -1) and GetVehicleEngineHealth(Vehicle.Vehicle) <= Config.DamageNeeded then
                    ESX.Game.Utils.DrawText3D({x = Vehicle.Coords.x, y = Vehicle.Coords.y, z = Vehicle.Coords.z}, 'Presiona [~g~E~w~] para empujar el vehiculo', 0.4)
                end
     

            if IsControlPressed(0, Keys["E"]) and IsVehicleSeatFree(Vehicle.Vehicle, -1) and not IsEntityAttachedToEntity(ped, Vehicle.Vehicle) and IsControlJustPressed(0, Keys["E"])  and GetVehicleEngineHealth(Vehicle.Vehicle) <= Config.DamageNeeded then
                NetworkRequestControlOfEntity(Vehicle.Vehicle)
                local coords = GetEntityCoords(ped)
                if Vehicle.IsInFront then    
                    AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y * -1 + 0.1 , Vehicle.Dimensions.z + 1.0, 0.0, 0.0, 180.0, 0.0, false, false, true, false, true)
                else
                    AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y - 0.3, Vehicle.Dimensions.z  + 1.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, true)
                end

                ESX.Streaming.RequestAnimDict('missfinale_c2ig_11')
                TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
                Citizen.Wait(200)

                local currentVehicle = Vehicle.Vehicle
                 while true do
                    Citizen.Wait(5)
                    if IsDisabledControlPressed(0, Keys["A"]) then
                        TaskVehicleTempAction(PlayerPedId(), currentVehicle, 11, 1000)
                    end

                    if IsDisabledControlPressed(0, Keys["D"]) then
                        TaskVehicleTempAction(PlayerPedId(), currentVehicle, 10, 1000)
                    end

                    if Vehicle.IsInFront then
                        SetVehicleForwardSpeed(currentVehicle, -1.0)
                    else
                        SetVehicleForwardSpeed(currentVehicle, 1.0)
                    end

                    if HasEntityCollidedWithAnything(currentVehicle) then
                        SetVehicleOnGroundProperly(currentVehicle)
                    end

                    if not IsDisabledControlPressed(0, Keys["E"]) then
                        DetachEntity(ped, false, false)
                        StopAnimTask(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0)
                        FreezeEntityPosition(ped, false)
                        break
                    end
                end
            end
        end
    end
end)

local crouched = false
local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
	
    local handsup = false
	
	while true do
		Citizen.Wait(5)
		
		local ped = PlayerPedId()
		
		if IsControlJustReleased(1, 74) then --Start holding g
            if not handsup and not IsPedInAnyVehicle(ped) then
                TaskPlayAnim(ped, dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            elseif handsup then
                handsup = false
                --ClearPedTasks(GetPlayerPed(-1))
				ClearPedSecondaryTask(ped)
            end
        end
		if IsControlPressed(1, 311) then
			if not IsPedInAnyVehicle(ped) then
				ExecuteCommand('e whistle2')
			end
		end

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK  
            if (not IsPauseMenuActive()) then 
                if (IsDisabledControlJustPressed(0, 36)) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while (not HasAnimSetLoaded("move_ped_crouched")) do 
                        Citizen.Wait( 100 )
                    end 

                    if (crouched == true) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif (crouched == false) then
                        SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
                        crouched = true 
                    end 
                end
            end 
        end 
		
		 if once then
            once = false
        end
        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
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
    end
end)

local preso = false

function Preso(bool)
	preso = bool
end

RegisterNetEvent("faint_script:preso")
AddEventHandler("faint_script:preso", function(bool)
	preso = bool
end)

local mp_pointing = false
local keyPressed = false

function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

function stopPointing()
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
end

--[[
local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(5)
        if once then
            once = false
        end
        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
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
    end
end)
]]--

----------------------------------------------
-- External Vehicle Commands, Made by FAXES --
----------------------------------------------

--- Config ---

usingKeyPress = false -- Allow use of a key press combo (default Ctrl + E) to open trunk/hood from outside
togKey = 38 -- E

engineoff = false
IsEngineOn = true


--- Code ---

function ShowInfo(text)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandThefeedPostTicker(false, false)
end

RegisterCommand("baul", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            --ShowInfo("[Vehicle] ~g~Trunk Closed.")
			exports['mythic_notify']:DoHudText('success', 'Baul cerrado')
        else	
            SetVehicleDoorOpen(veh, door, false, false)
           -- ShowInfo("[Vehicle] ~g~Trunk Opened.")
			exports['mythic_notify']:DoHudText('success', 'Baul abierto')
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                --ShowInfo("[Vehicle] ~g~Trunk Closed.")
				exports['mythic_notify']:DoHudText('success', 'Baul cerrado')
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
               -- ShowInfo("[Vehicle] ~g~Trunk Opened.")
				exports['mythic_notify']:DoHudText('success', 'Baul abierto')
            end
        else
            --ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
			exports['mythic_notify']:DoHudText('error', 'Estas muy lejos del vehiculo')
        end
    end
end)

RegisterCommand("capot", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
           -- ShowInfo("[Vehicle] ~g~Hood Closed.")
			exports['mythic_notify']:DoHudText('success', 'Capot cerrado')
        else	
            SetVehicleDoorOpen(veh, door, false, false)
           -- ShowInfo("[Vehicle] ~g~Hood Opened.")
			exports['mythic_notify']:DoHudText('success', 'Capot abierto')
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
               -- ShowInfo("[Vehicle] ~g~Hood Closed.")
				exports['mythic_notify']:DoHudText('success', 'Capot cerrado')
            else	
                SetVehicleDoorOpen(vehLast, door, false, false)
                --ShowInfo("[Vehicle] ~g~Hood Opened.")
				exports['mythic_notify']:DoHudText('success', 'Capot abierto')
            end
        else
            --ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
			exports['mythic_notify']:DoHudText('error', 'Estas muy lejos del vehiculo')
        end
    end
end)

RegisterCommand("puerta", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    
    if args[1] == "1" then -- Front Left Door
        door = 0
    elseif args[1] == "2" then -- Front Right Door
        door = 1
    elseif args[1] == "3" then -- Back Left Door
        door = 2
    elseif args[1] == "4" then -- Back Right Door
        door = 3
    else
        door = nil
		exports['mythic_notify']:DoHudText('error', 'Uso: /puerta [nro de puerta]')
		exports['mythic_notify']:DoHudText('error', 'Puertas posibles:')
		exports['mythic_notify']:DoHudText('error', '1: Puerta derecha delantera | 2: Puerta izquierda delantera')
		exports['mythic_notify']:DoHudText('error', '3: Puerta derecha trasera | 4: Puerta izquierda trasera')
		
       -- ShowInfo("Usage: ~n~~b~/door [door]")
        --ShowInfo("~y~Possible doors:")
       -- ShowInfo("1: Front Left Door~n~2: Front Right Door")
        --ShowInfo("3: Back Left Door~n~4: Back Right Door")
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
                --ShowInfo("[Vehicle] ~g~Door Closed.")
				exports['mythic_notify']:DoHudText('success', 'Puerta cerrada')
            else	
                SetVehicleDoorOpen(veh, door, false, false)
                --ShowInfo("[Vehicle] ~g~Door Opened.")
				exports['mythic_notify']:DoHudText('success', 'Puerta abierta')
            end
        else
            if distanceToVeh < 4 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                    --ShowInfo("[Vehicle] ~g~Door Closed.")
					exports['mythic_notify']:DoHudText('success', 'Puerta cerrada')
                else	
                    SetVehicleDoorOpen(vehLast, door, false, false)
                    --ShowInfo("[Vehicle] ~g~Door Opened.")
					exports['mythic_notify']:DoHudText('success', 'Puerta abierta')
                end
            else
                --ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
				exports['mythic_notify']:DoHudText('error', 'Estas muy lejos del vehiculo')
            end
        end
    end
end)


--[[
if usingKeyPress then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsUsing(ped)
            local vehLast = GetPlayersLastVehicle()
            local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
            local door = 5
            if IsControlPressed(1, 224) and IsControlJustPressed(1, togKey) then
                if not IsPedInAnyVehicle(ped, false) then
                    if distanceToVeh < 4 then
                        if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                            SetVehicleDoorShut(vehLast, door, false)
                            --ShowInfo("[Vehicle] ~g~Trunk Closed.")
							exports['mythic_notify']:DoHudText('success', 'Baul cerrado')
                        else	
                            SetVehicleDoorOpen(vehLast, door, false, false)
                            --ShowInfo("[Vehicle] ~g~Trunk Opened.")
							exports['mythic_notify']:DoHudText('success', 'Baul abierto')
                        end
                    else
                        --ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
						exports['mythic_notify']:DoHudText('error', 'Estas muy lejos del vehiculo')
                    end
                end
            end
        end
    end)
end
]]--

--  V A R I A B L E S --
engineoff = false
IsEngineOn = true

RegisterCommand("engine", function(source)
	local player = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		local fuelLevel = exports["LegacyFuel"]:GetFuel(vehicle)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
		else
			IsEngineOn = true
			if fuelLevel > 2 then
				SetVehicleUndriveable(vehicle,false)
				SetVehicleEngineOn(vehicle,true,false,false)
			else
				ShowNotification("No tienes nafta")
			end
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

local kmh = 3.6
local mph = 2.23693629
local carspeed = 0
local driftmode = true -- on/off speed
local speed = kmh -- or mph
local drift_speed_limit = 100.0 
local toggle = 118 -- Numpad 9

RegisterCommand("drift", function(source)
	driftmode = not driftmode
 	if driftmode then
 		ESX.ShowNotification('DRIFT: ~g~ACTIVADO')
 	else
 		ESX.ShowNotification('DRIFT: ~r~APAGADO')
 	end
	
end)
Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(5)
		local Sleep = true
 		if driftmode then
			Sleep = false
 			if IsPedInAnyVehicle(GetPed(), false) then
				CarSpeed = GetEntitySpeed(GetCar()) * speed
 				if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then
 					if CarSpeed <= drift_speed_limit then  
 						if IsControlPressed(1, 21) then
 							SetVehicleReduceGrip(GetCar(), true)
 						else
 							SetVehicleReduceGrip(GetCar(), false)
 						end
 					end
 				end
 			end
 		end
		if Sleep then
			Wait(1000)
		end
 	end
 end)


function GetPed() 
	return GetPlayerPed(-1) 
end

function GetCar()
	return GetVehiclePedIsIn(GetPlayerPed(-1),false) 
end