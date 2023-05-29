Citizen.CreateThread(function()
    while true do
        local soundId = GetSoundId()

        if soundId > 0 then
            StopSound(soundId)
            if soundId == 99 then
                break
            end
        else
            Wait(math.random(500, 800))
        end

        Wait(math.random(500, 1000))
    end
end)