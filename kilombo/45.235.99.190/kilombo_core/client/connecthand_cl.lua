local alreadySpawned = false

AddEventHandler('esx:onPlayerSpawn', function(spawn)
    if not alreadySpawned then
        alreadySpawned = true 
        TriggerServerEvent('kilombo_core:cargado') 
    end
end)