RegisterNetEvent('inventory:openHouseInventory')
AddEventHandler('inventory:openHouseInventory', function (property)
    OpenInventory({
        type = 'house',
        title = 'Casa #'..property,
        id = property,
        maxWeight = 50000,
        save = true
    })
end)