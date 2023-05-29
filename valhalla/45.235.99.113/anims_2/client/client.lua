local handsup = false

RegisterCommand('crossarms', function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    handsup = not handsup
    if (handsup) then
        TaskPlayAnim(PlayerPedId(), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
    else
        ClearPedTasks(PlayerPedId())
    end
end)
RegisterKeyMapping('crossarms', 'Cross Arms', 'keyboard', 'G')