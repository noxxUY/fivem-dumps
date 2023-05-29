-- Simple 911 Command (With Location & Blip) -- 
		-- Made By Chezza --

-- Code --

RegisterCommand('ayuda', function()
    msg("Discord: https://discord.gg/AvMw8He")
end, false)

-- We declare this 'msg' function on the bottom due to better practices.
function msg(text)
    -- TriggerEvent will send a chat message to the client in the prefix as red
    TriggerEvent("chatMessage",  "[Servidor]", {255,0,0}, text)
end

RegisterCommand('discord', function()
    msg("Discord: https://discord.gg/AvMw8He")
end, false)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/entorno', 'Envía una llamada al 911 a los servicios de emergencia.', {
    { name="Report", help="¡Ingrese el incidente / informe aquí!" }
})
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/auxilio', 'Envía una llamada al EMS para informar su problema!', {
    { name="Report", help="¡Ingrese el incidente / informe aquí!" }
})
end)

--[[
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/anon', 'Mensaje para preguntar algo?', {
    { name="Mensaje", help="¡Ingrese el mensaje que desea enviar!" }
})
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/taxi', 'Pedir un taxi', {
    { name="Mensaje", help="¡Ingrese el mensaje que desea enviar!" }
})
end)
]]
RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, x, y, z)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 66)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Entorno')
    EndTextCommandSetBlipName(blip)
	Wait(60000)
	RemoveBlip(blip)
end)

RegisterNetEvent('taxi:setBlip')
AddEventHandler('taxi:setBlip', function(name, x, y, z)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	local blips = AddBlipForCoord(x, y, z)
	SetBlipSprite(blips, 56)
	SetBlipScale(blips, 0.8)
	SetBlipColour(blips, 5)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Cliente Taxi')
    EndTextCommandSetBlipName(blips)
	Wait(60000)
	RemoveBlip(blips)
end)

RegisterNetEvent('auxilio:setBlip')
AddEventHandler('auxilio:setBlip', function(x, y, z)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	local blips = AddBlipForCoord(x, y, z)
	SetBlipSprite(blips, 153)
	SetBlipScale(blips, 1.5)
	SetBlipColour(blips, 1)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Auxilio')
    EndTextCommandSetBlipName(blips)
	Wait(60000)
	RemoveBlip(blips)
end)

RegisterNetEvent('taxi:killBlip')
AddEventHandler('taxi:killBlip', function()
    RemoveBlip(blip)
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
        TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Ingrese su ^1informe/problema.')
    else
		--TriggerServerEvent('DiscordBot:ToChat', source, name, '/entorno '..msg)	
        TriggerServerEvent('911', location, msg, x, y, z, name)
    end
end)

RegisterCommand('auxilio', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^2AUXILIO', {255,255,255}, ' ^7Ingrese su ^1informe/problema.')
    else
        TriggerServerEvent('auxilio', location, msg, x, y, z, name)
    end
end)
--[[
RegisterCommand('taxi', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^3TAXI', {255,255,255}, ' ^7Ingrese su ^1Mensaje.')
    else
        TriggerServerEvent('taxi', location, msg, x, y, z, name)
    end
end)

RegisterCommand('anon', function(source, args)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^5INFO', {255,255,255}, ' ^7Ingrese su ^1mensaje!.')
    else
        TriggerServerEvent('anon', msg)
    end
end)
]]--