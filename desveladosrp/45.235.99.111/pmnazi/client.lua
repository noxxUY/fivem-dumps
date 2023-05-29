local oldPrint = print
print = function(trash)
	oldPrint('^7[^2Kyk Private Messages^7] '..trash..'^0')
end

--[[
    Variables
]]
local lastSender = ""

--[[
    Reply Commands
]]
RegisterCommand("r", function(source, args, rawCommand) --[[ Reply Command ]]
    if lastSender == nil then
        TriggerEvent('kyk_privatemessages:error', 'You haven\'t yet gotten any private messages.')
    else
        TriggerServerEvent('kyk_privatemessages:reply', lastSender, args)
    end
end, false)
RegisterCommand("reply", function(source, args, rawCommand) --[[ Reply Command ]]
    if lastSender == nil then
        TriggerEvent('kyk_privatemessages:error', 'You haven\'t yet gotten any private messages.')
    else
        TriggerServerEvent('kyk_privatemessages:reply', lastSender, args)
    end
end, false)

--[[
    Chat Suggestions
]]
if Config.chatSuggestions then
    AddEventHandler('onClientResourceStart', function (resourceName)
        if (GetCurrentResourceName() == resourceName) then
            TriggerEvent('chat:addSuggestion', '/mp', 'Mandale un mensaje privado a alguien', {
                { name="id", help="Ingresar ID de la persona." },
                { name="message", help="Escribir mensaje." }
            })
            TriggerEvent('chat:addSuggestion', '/r', 'Responder ultimo mensaje privado', {
                { name="message", help="Escribir mensaje." }
            })
            TriggerEvent('chat:addSuggestion', '/reply', 'Responder ultimo mensaje privado', {
                { name="message", help="Escribir mensaje." }
            })
        end
    end)
    AddEventHandler('onClientResourceStop', function(resourceName)
        if (GetCurrentResourceName() == resourceName) then
            TriggerEvent('chat:removeSuggestion', '/mp')
            TriggerEvent('chat:removeSuggestion', '/r')
            TriggerEvent('chat:removeSuggestion', '/reply')
        end
    end)
end


--[[
    Registered Events
]]
RegisterNetEvent('kyk_privatemessages:error')
AddEventHandler('kyk_privatemessages:error', function(err)
    TriggerEvent("chatMessage", "^7[^1Error^7]", {255,0,0}, err )
end)

RegisterNetEvent('kyk_privatemessages:lastSender')
AddEventHandler('kyk_privatemessages:lastSender', function(sender)
    lastSender = sender
end)

--[[ Taken from mythic_notify (https://github.com/wowpanda/mythic_notify) ]]
RegisterNetEvent("kyk_privatemessages:SendAlert")
AddEventHandler("kyk_privatemessages:SendAlert", function(data)
    SendNUIMessage({
		action = 'notif',
		type = data.type,
		text = data.text
	})
end)