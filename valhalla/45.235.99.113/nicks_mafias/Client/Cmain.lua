ESX = nil 

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end
    getPoints()
end)

function log(txt)
    if txt then
        print("^2[nicks_mafias]^8 " ..txt)
    else
        print("^2[nicks_mafias]^8 Attempting to print a nil value")
    end
end

TriggerEvent("chat:addSuggestion", "/darsog", ("Dar Rango a un usuario de un sog"), {{name = ("Id"), help = ("ID")}, {name = ("Gang"), help = ("Nombre del SOG")}, {name = ("Rank"), help = ("¿Que rango?")}})
TriggerEvent("chat:addSuggestion", "/setgangmember", ("Set gang user if you are boss"), {{name = ("Id"), help = ("Player ID")}, {name = ("Rank"), help = ("Name of the gang")}})
TriggerEvent("chat:addSuggestion", "/crearsog", ("Crear Una SOG"), {})
TriggerEvent("chat:addSuggestion", "/modificarsogs", ("Modificar Sogs"), {})