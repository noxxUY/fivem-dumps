local JSX = {}

TriggerEvent('esx:getSharedObject', function(obj)
    JSX = obj
end)


function OpenActionsMenu()
    elements = {}

    table.insert(elements, {label = 'Comprar licencia <span style = "color:gold">$50000</span>', val = 'buy_license', price = 50000})
    table.insert(elements, {label = 'Comprar venda <span style = "color:gold">$500</span>', val = 'buy', item = 'bandage', price = 500})

    JSX.UI.Menu.Open('default',GetCurrentResourceName(), tostring(math.random(200,400)) ,{ 
        title = 'Pami', 
        align = 'bottom-right', 
        elements = elements 
    }, function(data, menu)
        
        local e = data.current

        if (e.val == 'buy') then
            JSX.TriggerServerCallback('esx_license:checkLicense', function(hasBandageLicense)
                if (hasBandageLicense) then
                    JSX.TriggerServerCallback('jsx_bandagesystem:server:buyBandage', function()
                    end,e.item, e.price)
                else
                    JSX.ShowNotification('Necesitas una licencia para poder comprar las vendas.')
                end
            end, GetPlayerServerId(PlayerId()), 'pami')
        end

        if (e.val == 'buy_license') then
            JSX.TriggerServerCallback('esx_license:checkLicense', function(hasBandageLicense)
                if (not hasBandageLicense) then
                    JSX.TriggerServerCallback('jsx_bandagesystem:server:buyLicense', function()
                        TriggerEvent('mythic_progressbar:client:progress',{
                            label = 'Registrandose en PAMI',
                            duration = 10000
                        })

                        ExecuteCommand('e clipboard')

                        JSX.UI.Menu.CloseAll()

                        SetTimeout(10000, function()
                            JSX.TriggerServerCallback('jsx_bandagesystem:server:notify', function()
                                ClearPedTasks(PlayerPedId())
                            end)
                        end)
                    end, e.price)
                else
                    JSX.ShowNotification('Ya estas Afiliado en pami.')
                end
            end, GetPlayerServerId(PlayerId()), 'pami')
        end

        end, function(data, menu) 

        menu.close() 
    end)
end