blip = nil

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/entorno', '¡Crea una llamada de entorno a la policia!', {
    { name="Report", help="Escribe tu incidencia!" }
})
end)

RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 66)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Entorno - Alerta policía - ' .. name)
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('911:killBlip')
AddEventHandler('911:killBlip', function()
    RemoveBlip(blip)
end)

-- Command -- 

RegisterCommand('entorno', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Por favor inserta la ^1incidencia.')
    else
        TriggerServerEvent('911', location, msg, x, y, z, name)
    end
end)

