ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function notify(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local display = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)
        DrawMarker(2, 1102.04, 2661.0,  37.96, 0, 0, 0, 0, 0, 0, 1.1, 1.1, 1.1, 255, 0, 0, 145, false, false, 2, false, nil, nil, false)
        if CheckPos(config.positionx, config.positiony, config.positionz, pcoords.x, pcoords.y, pcoords.z, 2) then
            notify('Presiona ~INPUT_CONTEXT~ para entrar a la zona de reanimación')
            if IsControlJustPressed(0, 51) then
                SetDisplay(not display)
            end
        end
    end
end)


RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("btn-revive", function(data)
    TriggerServerEvent('revivestation:revive', data.id)
    SetDisplay(false)
end)

RegisterNUICallback("btn-revivebank", function(data)
    TriggerServerEvent('revivestation:revivebank', data.id)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) 
        DisableControlAction(0, 2, display) 
        DisableControlAction(0, 142, display) 
        DisableControlAction(0, 18, display) 
        DisableControlAction(0, 322, display) 
        DisableControlAction(0, 106, display) 
    end
end)
