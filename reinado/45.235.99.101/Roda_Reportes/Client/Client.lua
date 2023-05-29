ESX = exports['es_extended']:getSharedObject()
RegisterCommand('report', function()
    local input = lib.inputDialog('Menú de Reportes', {
        {type = 'select', label = 'Asunto', description = 'Selecciona el asunto', options = Config.Asuntos},
        {type = 'textarea', label = 'Descripcion del Reporte', description = 'Inserta la descripcion'}
    })
    if not input then return end
    print(input[1], input[2])
    TriggerServerEvent('Roda_Reportes:SendReport', input[1], input[2])
end)


RegisterNetEvent('Roda_Reportes:showReportes')
AddEventHandler('Roda_Reportes:showReportes', function (reportes)
    ESX.UI.Menu.CloseAll()
	local elements = {}
    for k,v in pairs(reportes) do
        table.insert(elements, {label = v.title, value = v.id, asunto = v.asunto, descripcion = v.descripcion, pid = v.playerId})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_reportes', {
		title    = 'Lista de Reportes',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local accion = data.current
		if accion.value then
            ShowDetalles(accion.label, accion.asunto, accion.descripcion, accion.pid)
        end
    end, function(data, menu)
        menu.close()
    end)
end)

function ShowDetalles(title, asunto, descripcion, pid)  
    local elements = {
        {label = 'Ver detalles', value = 'detalles'},
        {label = 'Ir al jugador', value = 'goto', pid = pid},
        {label = 'Revivir al Jugador', value = 'revive', pid = pid},
        {label = 'Cerrar Reporte', value = 'delete'},
     --   {label = 'Cerrar Reporte <span style="color:red">sin log</span>', value = 'deleteempty'}
    }
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_detalles_reporte', {
        title    = title,
        align    = 'bottom-right',
        elements = elements
    }, function(data, menu)
        local accion = data.current
        if accion.value == 'detalles' then
            ShowReportInfo(title, asunto, descripcion, pid)
        elseif accion.value == 'goto' then
            TriggerServerEvent('Roda_Reportes:GotoPlayer', accion.pid, title)
        elseif accion.value == 'revive' then
            TriggerServerEvent('Roda_Reportes:RevivePlayer', accion.pid)
        elseif accion.value == 'delete' then
            ESX.UI.Menu.CloseAll()
            TriggerServerEvent('Roda_Reportes:DeleteReport', title, asunto, descripcion, pid)
        -- elseif accion.value == 'deleteempty' then
        --     ESX.UI.Menu.CloseAll()
        --     TriggerServerEvent('Roda_Reportes:DeleteReportEmpty', title, asunto, descripcion, pid)
        end
    end, function(data, menu)
        menu.close()
    end)
end

function ShowReportInfo(title, asunto, descripcion, pid)
    local input = lib.inputDialog(title, {
        {type = 'input', label = 'Asunto', placeholder = asunto, disabled = true},
        {type = 'textarea', label = 'Descripcion del Reporte', placeholder = descripcion, disabled = true, autosize = true}
    })
    if not input then return end
end


RegisterNetEvent('Roda_Reportes:CloseMenu')
AddEventHandler('Roda_Reportes:CloseMenu', function ()
    ESX.UI.Menu.CloseAll()
end)