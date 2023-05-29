lib.registerContext({
    id = 'listatrabajos',
    title = 'Centro de Trabajos',
    onExit = function()
     --   print('Hello there')
    end,
    options = {
        {
            title = 'Minero',
            description = 'A romper piedras Rock & Roll',
            event = 'interactivo:minero',
        },
        {
            title = 'Leñador',
            description = 'Toma tu acha y a talar.',
            event = 'interactivo:lenador',
        },
        {
            title = 'Petrolero',
            description = 'Viajes largos juntando petroleo.',
            event = 'interactivo:fueler',
        },
        {
            title = 'Desempleado',
            description = 'Otro vago mas.',
            event = 'interactivo:desempleado',
        }
    }
})


RegisterNetEvent('interactivo:trabajoslist')
AddEventHandler('interactivo:trabajoslist', function()
    lib.showContext('listatrabajos')
end)

RegisterNetEvent('interactivo:minero')
AddEventHandler('interactivo:minero', function()
	TriggerServerEvent('interactivo:setearminero', data)
    ESX.ShowNotification('Recibiste el trabajo de minero.')
end)

RegisterNetEvent('interactivo:lenador')
AddEventHandler('interactivo:lenador', function()
	TriggerServerEvent('interactivo:setearlenador', data)
    ESX.ShowNotification('Recibiste el trabajo de leñador.')
end)


RegisterNetEvent('interactivo:fueler')
AddEventHandler('interactivo:fueler', function()
	TriggerServerEvent('interactivo:setearfueler', data)
    ESX.ShowNotification('Recibiste el trabajo de petrolero.')
end)

RegisterNetEvent('interactivo:desempleado')
AddEventHandler('interactivo:desempleado', function()
	TriggerServerEvent('interactivo:desempleado', data)
    ESX.ShowNotification('Estas desempleado.')
end)

RegisterNetEvent('interactivo:patronminero', function()
    exports['esx_jobs']:OpenMenu()
end)
