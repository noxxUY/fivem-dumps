RegisterNetEvent('inventory:openpsgInventory')
AddEventHandler('inventory:openpsgInventory', function ()

    OpenInventory({
    type = 'psg', 
    title = '[PSG] Inventario',
    id = 'psg', 
    weight = Config.psgWeight,
    save = true
 })
 
end)