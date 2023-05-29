local open = false
RegisterCommand('openassets', function()
    if not open then 
        SendNUIMessage({
            action = 'openAssets',
        })
        SetNuiFocus(true, true)
        open = true
    end
end)

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
  open = false
end)

RegisterNUICallback('ChooseOption', function(data, cb)
    local option = data.option
    if option == 'mapas' then 
        DownloadMaps()
    elseif option == 'ropas' then 
        DownloadClothes()
    elseif option == 'vehiculos' then 
        DownloadVehicles()
        print('Descargando vehiculos')
    end
end)


