
ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
end)

RegisterNetEvent("cyclus-offduty:notify")
AddEventHandler("cyclus-offduty:notify", function()
    for k,v in pairs(Cyclus.Function) do
        exports['zero-notify']:notification(v.NotifyTitle, v.NotifyText, "info", 5000)
    end
end)