
addCommas = function(n)
	return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
								  :gsub(",(%-?)$","%1"):reverse()
end

AddEventHandler('interactivo:sellItem', function(data)
    local data = data
    local input = lib.inputDialog('¿Cuántos te gustaría vender?', {'Cantidad'})
    if input then
        data.quantity = math.floor(tonumber(input[1]))
        if data.quantity < 1 then
            lib.notify({
                title = 'Error',
                description = 'Ingrese una cantidad valida!',
                type = 'error'
            })
        else
            local done = lib.callback.await('interactivo:sellItem', 100, data)
            if not done then
                lib.notify({
                    title = 'Error',
                    description = 'No tienes esa cantidad!',
                    type = 'error'
                })
            else
                lib.notify({
                    title = 'Correcto!',
                    description = 'Obtuviste $'..addCommas(done),
                    type = 'success'
                })
            end
        end
    else
        lib.notify({
            title = 'Error',
            description = 'Ingresa una cantidad valida!',
            type = 'error'
        })
    end
end)

AddEventHandler('interactivo:interact', function(data)
    local storeData = data.store
    local items = storeData.items
    local Options = {}
    for i=1, #items do
        table.insert(Options, {
            title = items[i].label,
            description = 'Precio: $'..items[i].price,
            event = 'interactivo:sellItem',
            args = { item = items[i].item, price = items[i].price, currency = items[i].currency }
        })
    end
    lib.registerContext({
        id = 'storeInteract',
        title = storeData.label,
        options = Options
    })
    lib.showContext('storeInteract')
end)
