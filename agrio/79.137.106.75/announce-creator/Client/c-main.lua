ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
RegisterCommand('ad', function()
    local jobname = ESX.GetPlayerData().job.name
    if jobname == "police" or jobname == "ambulance"  or jobname == "mechanic"  or jobname == "sheriff"  or jobname == "mechanic3"  or jobname == "mechanic4"  or jobname == "unicorn"  or jobname == "yellow"  or jobname == "skybar" or jobname == "tequila" or jobname == "uwucat" or jobname == "armasNorte" or jobname == "armasmenor" or jobname == "armeriaSandy" or jobname == "armeriaSur" or jobname == "armasStraw" or jobname == "bahamas" then --Aqui puedes ir añadiendo los trabajos.
        SendNUIMessage({
            action = "anuncio",
            presets = presets,
            job = jobname
        })
        SetNuiFocus(true, true)
    else
        ESX.ShowNotification('No tienes acceso a esto.')
    end
end)
RegisterNUICallback('exit', function()
    SetNuiFocus(false, false)
end)
RegisterNUICallback('send', function(data)
    TriggerServerEvent('announce:send', data.obj)
end)
RegisterNetEvent('announce:sendForAll', function(data)
    SendNUIMessage({
        action = 'execute',
        content = data
    })
end)