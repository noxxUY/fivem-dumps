ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            TriggerServerEvent('Roda_GiveJib:SetupDiscord')
            break
        end
    end
end)
