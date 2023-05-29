RegisterNetEvent('skeexsNotify:client:SendAlert')
AddEventHandler('skeexsNotify:client:SendAlert', function(DATA)
	TriggerNotification(DATA)
	PlaySoundFrontend(-1, 'Click', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 0)
end)



function TriggerNotification(DATA) 
    SendNUIMessage({
        createNew = true,
        data = DATA
    })
end
