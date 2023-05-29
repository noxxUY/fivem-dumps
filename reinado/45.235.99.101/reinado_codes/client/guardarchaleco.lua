local citizensave = false

RegisterNetEvent('LRP-Armour:Client:SetPlayerHealthArmour')
AddEventHandler('LRP-Armour:Client:SetPlayerHealthArmour', function(health, armour)
    ESX.SetTimeout(5000, function()
        SetEntityHealth(PlayerPedId(), tonumber(health))
        SetPedArmour(PlayerPedId(), tonumber(armour))
        citizensave = true
    end)
end)

local TimeFreshCurrentArmour = 30000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if citizensave == true then
            TriggerServerEvent('LRP-Armour:Server:RefreshCurrent', GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()))
            Citizen.Wait(TimeFreshCurrentArmour)
        end
    end
end)
