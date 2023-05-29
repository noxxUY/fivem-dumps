ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
end)


RegisterNetEvent('cosasvariadas:armor')
AddEventHandler('cosasvariadas:armor', function()

    local playerPed = PlayerPedId()

    AddArmourToPed(playerPed,100)
    SetPedArmour(playerPed, 100)

end)
    