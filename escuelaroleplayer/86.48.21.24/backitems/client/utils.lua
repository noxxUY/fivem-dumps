QBCore = exports['qb-core']:GetCoreObject()

CheckJob = function()
    local PlayerData = QBCore.Functions.GetPlayerData()

    return PlayerData.job.name
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(200)
    TriggerEvent('cortex_backitems:AttachBackItems')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerEvent('cortex_backitems:DeleteAttachedBackItems')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    TriggerEvent('cortex_backitems:AttachBackItems')
end)

AddEventHandler('onResourceStop', function(resourceName)
	if resourceName == GetCurrentResourceName() then
        TriggerEvent('cortex_backitems:DeleteAttachedBackItems')
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() then
        if LocalPlayer.state.isLoggedIn then
            TriggerEvent('cortex_backitems:AttachBackItems') 
        end
	end
end)