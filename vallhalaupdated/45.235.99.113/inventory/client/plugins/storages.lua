RegisterNetEvent('inventory:openPolInventory')
AddEventHandler('inventory:openPolInventory', function ()

    OpenInventory({
    type = 'police', 
    title = '[PFA] Inventario',
    id = 'police', 
    weight = Config.PolWeight,
    save = true
 })
 
end)