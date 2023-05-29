ESX = exports["es_extended"]:getSharedObject()

local hurt = false
Citizen.CreateThread(function()
    while true do
        local vr = 1000
        if GetEntityHealth(PlayerPedId()) <= 159 then
            Wait(vr)
            setHurt()
        elseif hurt and GetEntityHealth(PlayerPedId()) > 160 then
            setNotHurt()
        end
        Wait(vr)
    end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(PlayerPedId(), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(PlayerPedId())
    ResetPedWeaponMovementClipset(PlayerPedId())
    ResetPedStrafeClipset(PlayerPedId())
end