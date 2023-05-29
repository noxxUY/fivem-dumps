Citizen.CreateThread(function()
    local tiendamovilBlip = AddBlipForCoord(-1840.25, -373.77, 49.36)
    SetBlipSprite (tiendamovilBlip, 267)
    SetBlipDisplay(tiendamovilBlip, 4)
    SetBlipScale  (tiendamovilBlip, 0.6)
    SetBlipColour (tiendamovilBlip, 38)
    SetBlipAsShortRange(tiendamovilBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Pami")
    EndTextCommandSetBlipName(tiendamovilBlip)
end)


local _showHelpNotification = nil

local function ConvertToHTML(_text)
    _text = _text:gsub("~r~", "<span style=color:red;>")
    _text = _text:gsub("~b~", "<span style='color:rgb(0, 213, 255);'>")
    _text = _text:gsub("~g~", "<span style='color:rgb(0, 255, 68);'>")
    _text = _text:gsub("~y~", "<span style=color:yellow;>")
    _text = _text:gsub("~p~", "<span style='color:rgb(220, 0, 255);'>")
    _text = _text:gsub("~f~", "<span style=color:grey;>")
    _text = _text:gsub("~m~", "<span style=color:darkgrey;>")
    _text = _text:gsub("~u~", "<span style=color:black;>")
    _text = _text:gsub("~o~", "<span style=color:gold;>")
    _text = _text:gsub("~s~", "</span>")
    _text = _text:gsub("~w~", "</span>")
    _text = _text:gsub("~b~", "<b>")
    _text = _text:gsub("~n~", "<br>")
    _text = _text:gsub("\n", "<br>")
    return _text
end

RegisterNetEvent('jsx_bandagesystem:client:showHelp', function(e)
    while (_showHelpNotification) do
        Wait(500)
    end

    SendNUIMessage({
        message = ConvertToHTML(e.text)
    })
end)


-- Threads

local JSX = {}

TriggerEvent('esx:getSharedObject', function(obj)
    JSX = obj
end)

CreateThread(function()
    while (true) do
        local _playerPed = GetPlayerPed(-1)
		local _pedCoords = GetEntityCoords(_playerPed)

        for k,v in pairs(Config.Zones) do

            local _dist = #(_pedCoords - v)

            if (_dist < 2) then
                TriggerEvent('jsx_bandagesystem:client:showHelp', {
                    text = 'Presiona ~r~[E]~s~ para abrir el menu'
                })
            end
        end
        
        Wait(1000)
    end
end)

CreateThread(function()
    while (true) do
        local _sleepThread = 1000
        local _playerPed = GetPlayerPed(-1)
		local _pedCoords = GetEntityCoords(_playerPed)

        for k,v in pairs(Config.Zones) do
            local _dist = #(_pedCoords - v)

            if (_dist < 5) then
                _sleepThread = 0
                _SpawnPoints.CreateMarker({x = v.x, y = v.y, z = v.z -1, w = 2.5, h = 2.5, d = 0.1, r = 255, g = 0, b = 0, a = 150, finalDistance = 5, coords = v})
            end
        end
        
        Wait(_sleepThread)
    end
end)

RegisterCommand('open_actions_menu_bandage', function()
    local _playerPed = GetPlayerPed(-1)
    local _pedCoords = GetEntityCoords(_playerPed)

    for k,v in pairs(Config.Zones) do
        local _dist = #(_pedCoords - v)

        if (_dist < 2) then
            OpenActionsMenu()
        end
    end
end)

RegisterKeyMapping('open_actions_menu_bandage', 'Pami', 'KEYBOARD', 'e')