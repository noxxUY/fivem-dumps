-- @vars
local deadPreviously = false

-- @threads
CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if (IsEntityDead(playerPed) or IsPedDeadOrDying(playerPed)) then
            if (not deadPreviously) then
                deadPreviously = true
                TriggerServerEvent('bm_deathloot:status', true)
            end
        else
            deadPreviously = false
            TriggerServerEvent('bm_deathloot:status', false)
        end

        Wait(2500)
    end
end)