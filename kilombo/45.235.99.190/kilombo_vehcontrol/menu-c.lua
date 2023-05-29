local vehMenuPressed = false
local enMenu = false



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if(IsPedSittingInAnyVehicle(PlayerPedId())) then -- Make sure player is in vehicle
            if vehMenuPressed then -- If F1 pressed
                SendNUIMessage({
                    type = 'open'
                })
                SetCursorLocation(0.5, 0.5) -- Set cursor to centre
                SetNuiFocus(true, true)
                vehMenuPressed = false
                enMenu = true
            end
        end

        if enMenu then
            DisableAllControlActions(0)
        end
    end
end)

RegisterNUICallback('close', function(data, cb) -- Return focus on close
    SetNuiFocus(false, false)
    enMenu = false
end)

RegisterNUICallback('command', function(data, cb) -- Execute command from block clicked
    local itemId = data.itemId
    ExecuteCommand(itemId)
end)


RegisterCommand("vehmenu", function()
    if IsPedSittingInAnyVehicle(PlayerPedId()) and not IsPauseMenuActive() then 
        vehMenuPressed = true;
    end
end, false)

RegisterKeyMapping('vehmenu', 'Menu funciones de vehículo', 'keyboard', 'L')