ESX = nil 
seatbelt = false
Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end
end)

local electricVehicles = {
    "neon",
    "cyclone",
    "raiden",
    "caddy",
    "tezeract",
    "dilettante",
    "khamelion",
    "voltic",
    "imorgon",
    "surge",
    "rcbandito"

}

local colorVar = "rgb(218, 124, 56)"
RegisterNetEvent("esx:onChangeVarColour")
AddEventHandler("esx:onChangeVarColour", function(var)
    -- print("Velocimetro", var)
    colorVar = var
end)


local currSpeed = 0.0
local blackoutVariable = false
local sBuffer  	  = {}
local vBuffer  	  = {}  
local vehicleCruiser
local compass = true
local logActivate = true
local seatbeltEjectSpeed = 45.0 
local seatbeltEjectAccel = 100.0
local seatbeltIsOn = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local position = GetEntityCoords(playerPed)
        local vehicleClass = GetVehicleClass(vehicle)
        if IsPedInAnyVehicle(playerPed, false) and GetIsVehicleEngineRunning(vehicle) and IsPauseMenuActive() ~= 1 and display then
            DisplayRadar(true)
            displayRadar = true
            local vehicleSpeedSource = GetEntitySpeed(vehicle)
            local vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6)
            local vehiclemodel = GetEntityModel(vehicle)
            rpm = GetVehicleCurrentRpm(vehicle)
            rpm = math.ceil(rpm * 75, 2)
            local vehicleGear = GetVehicleCurrentGear(vehicle)
            -- LIGHTS
            
            local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)

            local vehicleIsLightsOn
            
			if vehicleLights == 1 and vehicleHighlights == 0 then
				vehicleIsLightsOn = 'normal'
			elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
				vehicleIsLightsOn = 'hight'
			else
				vehicleIsLightsOn = 'off'
            end

            -- LUCES EMERGENCIA

            local vehicleSiren

			if IsVehicleSirenOn(vehicle) then
				vehicleSiren = true
			else
				vehicleSiren = false
            end

            for k, v in pairs(electricVehicles) do
            end

            ---- CINTURON

            if vehicleClass ~= 8 and vehicleClass ~= 16 and vehicleClass ~= 15 and vehicleClass ~= 13 and GetDisplayNameFromVehicleModel(vehiclemodel) ~= "moto1" then

				local prevSpeed = currSpeed
                currSpeed = vehicleSpeedSource

                SetPedConfigFlag(PlayerPedId(), 32, true)

                if not seatbeltIsOn then
                	local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
                    local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                    if (vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed/2.237)) and (vehAcc > (seatbeltEjectAccel*9.81))) then

                        SetEntityCoords(playerPed, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(playerPed, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        SetPedToRagdoll(playerPed, 1000, 1000, 0, 0, 0, 0)
                    else
                        -- Update previous velocity for ejecting player
                        prevVelocity = GetEntityVelocity(vehicle)
                    end
                else
                	DisableControlAction(0, 75, true)
                end
			end
            if GetDisplayNameFromVehicleModel(vehiclemodel) == "moto1" then
                vehicleClass = 8
            end
            
            SendNUIMessage({
                action = "updateVehicleInfo",
                vehicleSpeed = vehicleSpeed,
                vehicleRPM = rpm,
                seatbelt = seatbeltIsOn,
                fuel = ESX.Math.Round(GetVehicleFuelLevel(vehicle)),
                lightvehicle = vehicleIsLightsOn,
                saludCar = ESX.Math.Round(GetVehicleEngineHealth(vehicle) / 10),
                vehicleGear = vehicleGear,
                vehicleSiren = vehicleSiren,
                vehicleCruiser = vehicleCruiser,
                compass = compass,
                -- carKM = roundToNthDecimal(DecorGetFloat(vehicle,'TOTALKM')*20,1),    
                type = vehicleClass,
                colorVar = colorVar
            })

        else
            DisplayRadar(false)
            displayRadar = false
            SendNUIMessage({
                action = "hideHUD"
            })
        end
    end
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)

		-- Vehicle Cruiser
		if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) and IsControlJustPressed(1, 157) and GetPedInVehicleSeat(vehicle, player) then
			local vehicleSpeedSource = GetEntitySpeed(vehicle)

			if vehicleCruiser == 'on' then
				vehicleCruiser = 'off'
				SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
				
			else
				vehicleCruiser = 'on'
				SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
			end
        end

	end
end)


--[[RegisterCommand("-MenuPersonal", function()
   MenuPersonal()
end)]]--

RegisterKeyMapping("cinturonn", "Cinturón", "keyboard", "G")

RegisterCommand("cinturonn", function(source)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local vehicleClass = GetVehicleClass(vehicle)
    local vehiclemodel = GetEntityModel(vehicle)
    if vehicleClass ~= 8 and vehicleClass ~= 16 and vehicleClass ~= 15 and vehicleClass ~= 13 and GetDisplayNameFromVehicleModel(vehiclemodel) ~= "moto1" then
        if IsPedInAnyVehicle(playerPed, false) then
            seatbeltIsOn = not seatbeltIsOn
            if seatbeltIsOn == true then
                ESX.ShowNotification("Te has puesto el cinturón")
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1.2, "seatbelt-buckle", 0.5)
            elseif seatbeltIsOn == false then
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1.2, "seatbelt-unbuckle", 0.5)
                ESX.ShowNotification("Te has quitado el cinturón")
            end
        end
    else
        ESX.ShowNotification("Este vehículo no tiene cinturón")
        return
    end
end)

CreateThread(function()
    while true do
        local msec = 1000
        if seatbeltIsOn then
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                local playerPed = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local vehicleClass = GetVehicleClass(vehicle)
                local vehiclemodel = GetEntityModel(vehicle)
                if vehicleClass ~= 8 and vehicleClass ~= 16 and vehicleClass ~= 15 and vehicleClass ~= 13 and GetDisplayNameFromVehicleModel(vehiclemodel) ~= "moto1" then
                    msec = 0
                    DisableControlAction(0, 75, true)
                end
            else
                seatbeltIsOn = false
            end
        end
        Wait(msec)
    end
end)

local inRaton = false
RegisterCommand("raton", function(source)
    if inRaton then
        inRaton = false
        SetNuiFocus(false, false)
    else
        inRaton = true 
        SetNuiFocus(true, true)
    end
end)

-- CINTURÓN
function blackout()
	-- Only blackout once to prevent an extended blackout if both speed and damage thresholds were met
	if not blackoutVariable then
		blackoutVariable = true
		-- This thread will black out the user's screen for the specified time
		Citizen.CreateThread(function()
			DoScreenFadeOut(100)
			while not IsScreenFadedOut() do
				Citizen.Wait(0)
			end
			Citizen.Wait(2000)
			DoScreenFadeIn(250)
			blackoutVariable = false
			effectBlackout()
		end)
	end
end

function TypeVehicle(veh)
	if lastVehicle == nil or lastVehicle ~= veh then
		lastVehicle = veh
		inHeli = false
		inPlane = false
		inBoat = false 
		inBike = false 
		inCar = false
		inMotorcycle = false
		if GetVehicleClass(veh) >= 0 and GetVehicleClass(veh) <= 7 or GetVehicleClass(veh) >= 9 and GetVehicleClass(veh) <= 12 or GetVehicleClass(veh) >= 17 and GetVehicleClass(veh) <= 20 then
			inCar = true
        elseif GetVehicleClass(veh) == 8 then
			inMotorcycle = true
		elseif GetVehicleClass(veh) == 13 then
			inBike = true
        elseif GetVehicleClass(veh) == 14 then
			inBoat = true
		elseif GetVehicleClass(veh) == 15 then
			inHeli = true
        elseif GetVehicleClass(veh) == 16 then
			inPlane = true
		end
	end
end

function Fov(entity)
    local hr = GetEntityHeading(entity) + 90.0
    if hr < 0.0 then hr = 360.0 + hr end
    hr = hr * 0.0174533
    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(ped, false)
        if IsPedInAnyVehicle(ped, false) then
            TypeVehicle(vehicle)
            sBuffer[2] = sBuffer[1]
            sBuffer[1] = GetEntitySpeed(vehicle)
            
            vBuffer[2] = vBuffer[1]
            vBuffer[1] = GetEntityVelocity(vehicle)
            
            if sBuffer[2] ~= nil and vBuffer[2] ~= nil and sBuffer[2] > 45 / 3.6 and sBuffer[2] - sBuffer[1] > sBuffer[1] * 1.6 or sBuffer[1] > 45 / 7.2 and sBuffer[1] - sBuffer[2] > sBuffer[2] * 1.6 then
                if inMotorcycle == false and inBike == false and inHeli == false and inPlane == false and inBoat == false then
					if not seatbelt then
                        local co = GetEntityCoords(ped)
                        local fw = Fov(ped)
                        if IsVehicleWindowIntact(vehicle, 6) then
                            SmashVehicleWindow(vehicle, 6)
                        end
                        Citizen.Wait(1)
                        SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                        SetEntityVelocity(ped, vBuffer[2].x, vBuffer[2].y, vBuffer[2].z)
					else
                        blackout()
                    end
                end
                if GetPedInVehicleSeat(vehicle, -1) == ped then
                    if not seatbelt then
                        TriggerEvent("ESX_status:add","stress",150000)
                    else
                        TriggerEvent("ESX_status:add","stress",100000)
                    end
                end
            end
        end
    end
end)

function effectBlackout()
    DisableControlAction(1, 244)
	SetTimecycleModifier('BarryFadeOut')
	SetTimecycleModifierStrength(math.min(0.1 / 10, 0.6))
	local myPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsUsing(myPed,false)
	SetVehicleEngineOn(vehicle, false, false, true)
	SetVehicleUndriveable(vehicle, true)
	
	SetTimecycleModifier("REDMIST_blend")
	ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
	Wait(5000)
			
	SetTimecycleModifier("hud_def_desat_Trevor")
	
	Wait(3000)
	
	SetTimecycleModifier("")
	SetTransitionTimecycleModifier("")
	StopGameplayCamShaking()
	SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, false, true)
    EnableControlAction(1, 244)
end

----- COMANDOS VARIABLES
vehicle_fuel = 0

RegisterCommand("motor", function(source)
    local playerPed = GetPlayerPed(-1)
    vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        local engine = not GetIsVehicleEngineRunning(vehicle)

        if not IsPedInAnyHeli(playerPed) then
            SetVehicleEngineOn(vehicle, engine, false, true)
            SetVehicleJetEngineOn(vehicle, engine)
        else
            if engine then
                SetVehicleFuelLevel(vehicle, vehicle_fuel)
            else
                SetVehicleFuelLevel(vehicle, 0)
            end
        end
    end
end)
RegisterCommand("puerta", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local dstVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local puerta = args[1]
    if puerta ~= nil then
        if puerta == "1" then -- Front Left Door
            door = 0
        elseif puerta == "2" then -- Front Right Door
            door = 1
        elseif puerta == "3" then -- Back Left Door
            door = 2
        elseif puerta == "4" then -- Back Right Door
            door = 3
        end

        if door ~= nil then
            if IsPedInAnyVehicle(ped, false) then
                if GetVehicleDoorAngleRatio(veh, door) > 0 then
                    SetVehicleDoorShut(veh, door, false)
                    ESX.ShowNotification("Puerta cerrada")
                else	
                    SetVehicleDoorOpen(veh, door, false, false)
                    ESX.ShowNotification("Puerta abierta")
                end
            else
                if dstVeh < 4 then
                    if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                        SetVehicleDoorShut(vehLast, door, false)
                        ESX.ShowNotification("Puerta cerrada")
                    else	
                        SetVehicleDoorOpen(vehLast, door, false, false)
                        ESX.ShowNotification("Puerta abierta")
                    end
                else
                    ESX.ShowNotification("Muy lejos del vehículo")
                end
            end
        end
    else
        ESX.ShowNotification("Uso del comando: ~n~~b~/puerta (1, 2, 3, 4)")
    end
end)

RegisterNetEvent('velocimetro:update')
AddEventHandler('velocimetro:update', function(value)
    compass = value
end)
display = true
RegisterCommand("togglecontadorcoche", function(source)
    display = not display
end)


RegisterNetEvent('actuEstadoAnimo', function(a)
	if a == 'normal' then
	
	SendNUIMessage({ action = 'estadoAnim', value = 'normal' })
elseif a == 'enfadado' then
	SendNUIMessage({ action = 'estadoAnim', value = 'shout' })
end
end)

local displayRadar = false
RegisterNetEvent('sendchek', function()
	permisos = true end)
Citizen.CreateThread(function()
	Citizen.Wait(30000)
    while true do
        Citizen.Wait(1500)
        if permisos == true then 
            return
        end
        local player = GetPlayerPed(-1)
       if not IsPedInAnyVehicle(player, false) and IsMinimapRendering() and displayRadar == false and not IsPauseMenuActive() then
      print('Detected RADAR')
     -- TriggerServerEvent("snw:banclient",GetPlayerServerId(PlayerId()), "SNOWI-AC | ANTI BLIPS & RADAR DETETECTED")
       else
        --print('no detected',IsPedInAnyVehicle(player, false))
       end
    end
end)