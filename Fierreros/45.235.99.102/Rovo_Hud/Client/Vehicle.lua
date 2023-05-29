local cinturon = false 
local Comandos = Config.Commands

function Cinturon(ped)
    while true do 
        if cinturon then 
            DisableControlAction(0, 75, true)  -- Disable exit vehicle when stop
            DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
        else
            Citizen.Wait(1000)
        end
        Citizen.Wait(0)
    end
end


CreateThread(function ()
    while true do 
        ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            _sleep = 200
            local vehiculo = GetVehiclePedIsUsing(ped)
            local velo = (GetEntitySpeed(vehiculo)* 3.6)
            local gaso = GetVehicleFuelLevel(vehiculo)
            local carhealth = GetVehicleBodyHealth(vehiculo)/10
            local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehiculo)
            SendNUIMessage({
                action = 'showCarhud',
                vel = velo,
                gasolina = gaso,
                carhealth = carhealth,
                cinturon = cinturon,
                vehicleLights = vehicleLights,
                vehicleHighlights = vehicleHighlights
            })
            DisplayRadar(true)
        else
            _sleep = 1000
            SendNUIMessage({
                action = 'hideCarhud'
            })
            DisplayRadar(false)
        end
        Wait(_sleep)
    end
end)


local maxSpeed = true

RegisterCommand(Comandos['limit'], function()
    maxSpeed = not maxSpeed
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed,false)
    if GetPedInVehicleSeat(vehicle, -1) == playerPed and maxSpeed then
        velocidadMax = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
        SetEntityMaxSpeed(vehicle, velocidadMax)
        SendNUIMessage({
            action = 'changeLimit',
            maxSpeed = false
        })
    else
        cruise = GetEntitySpeed(vehicle)
        SetEntityMaxSpeed(vehicle, cruise)
        SendNUIMessage({
            action = 'changeLimit',
            maxSpeed = true
        })
    end
end)

RegisterCommand(Comandos['belt'], function()
    local jugador = PlayerPedId()
    if IsPedInAnyVehicle(jugador) then
        if cinturon then 
            --Notificacion de que se quito cinturon
            cinturon = false
            Cinturon(jugador)
        else
            --Notificacion de que se puso cinturon
            cinturon = true
            Cinturon(jugador)
        end
    end
end)

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
  PanelOpen = false

end)

local PanelOpen = false
RegisterCommand(Comandos['panel'], function()
    SetNuiFocus(true,true)
    SendNUIMessage({
        action = 'showPanel'
    })
    PanelOpen = true
end)

CreateThread(function()
    while true do
        if PanelOpen then
            Wait(200)
            SendNUIMessage({
                action = 'ConfigureHud'
            })
        else
            Wait(1000)
        end
    end
end)

RegisterKeyMapping(Comandos['limit'], 'Car Limit', 'keyboard', Comandos['key2'])
RegisterKeyMapping(Comandos['belt'], 'Car Belt', 'keyboard', Comandos['key'])
RegisterKeyMapping(Comandos['panel'], 'Hud Panel', 'keyboard', Comandos['key3'])