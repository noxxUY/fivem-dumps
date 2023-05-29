ESX = exports["es_extended"]:getSharedObject()
local ox = exports['ox_lib']

RegisterCommand('compra', function()
    local input = ox:inputDialog("Código", {""})

    if (not input) then return end

    TriggerServerEvent('aimcon_rewards:claimCode', input[1])
end)
