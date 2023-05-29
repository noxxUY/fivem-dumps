RegisterNetEvent('inventory:openPolInventory')
AddEventHandler('inventory:openPolInventory', function ()

    OpenInventory({
    type = 'police', 
    title = 'Armeria',
    id = 'police', 
    weight = Config.PolWeight,
    save = true
 })
 
end)