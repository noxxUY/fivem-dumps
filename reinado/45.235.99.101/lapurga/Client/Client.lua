ESX = exports['es_extended']:getSharedObject()
purgaStarted = false
inPurge = false

CreateThread(function()
    while true do
        Wait(200)
        if NetworkIsSessionStarted() then
            TriggerServerEvent('lapurga:requestState')
            return -- break the loop
        end
    end
end)

CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
            local dist = #(pedC - Config.Point)
            if dist < 10 then
                wait = 0
                DrawMarker(2, Config.Point.x, Config.Point.y, Config.Point.z + 0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                if dist < 3 then
                    ESX.ShowFloatingHelpNotification('Presiona ~r~E~w~ para iniciar la purga.', vector3(Config.Point.x, Config.Point.y, Config.Point.z + 0.50))
                    if dist < 2 then
                        if IsControlJustPressed(0, 38) then
                            if purgaStarted then
                                print('Accedes a la purga')
                                ShowHtml(true)
                            else
                                print('No hay purga en curso')
                                ShowHtml(false)
                            end
                            print('E Pressed')
                        end
                    end
                end
            end
        Wait(wait)
    end
end)


RegisterNetEvent('lapurga:purgaState')
AddEventHandler('lapurga:purgaState', function (state)
    purgaStarted = state
    if purgaStarted then
        print('Purga iniciada')
    else
        print('Purga terminada')
    end
end)


RegisterCommand('salirpurga', function()
    ExitPurge()
    print('Saliste de la purga')
end)

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
end)

RegisterNUICallback('joinpurga', function(data, cb)
    if purgaStarted then
        print('Accedes a la purga')
        JoinPurge()
    else
        print('hacker detected')
    end
end)

function InPurge()
    return inPurge
end