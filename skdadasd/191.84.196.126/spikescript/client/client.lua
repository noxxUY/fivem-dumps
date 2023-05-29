ESX = nil
QBCore = nil

if Config.UseESX then
	Citizen.CreateThread(function()
		while not ESX do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(500)
		end
	end)

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        if ESX.PlayerData.job and listcontains(Config.JobNames, ESX.PlayerData.job.name) then
            TriggerEvent('SpikeScript:CanUseSpikes', true)
        else 
            TriggerEvent('SpikeScript:CanUseSpikes', false)
        end
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        ESX.PlayerData.job = job
        if ESX.PlayerData.job and listcontains(Config.JobNames, ESX.PlayerData.job.name) then
            TriggerEvent('SpikeScript:CanUseSpikes', true)
        else
            TriggerEvent('SpikeScript:CanUseSpikes', false)
        end
    end)
elseif Config.UseQBUS then
    QBCore = exports['qb-core']:GetCoreObject()
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        local PlayerJob = QBCore.Functions.GetPlayerData().job
        if listcontains(Config.JobNames, PlayerJob.name) then
            TriggerEvent('SpikeScript:CanUseSpikes', true)
        else
            TriggerEvent('SpikeScript:CanUseSpikes', false)
        end
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate')
    AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
        local PlayerJob = job
        if listcontains(Config.JobNames, PlayerJob.name) then
            TriggerEvent('SpikeScript:CanUseSpikes', true)
        else
            TriggerEvent('SpikeScript:CanUseSpikes', false)
        end
    end)
else
    --Gives The Player Spike Perms
    if Config.UseWhitelist then
        TriggerServerEvent('SpikeScript:RequestPermissions')
    else
        TriggerEvent('SpikeScript:CanUseSpikes', true)
    end
end

RegisterNetEvent('SpikeScript:RequestPermissions')
AddEventHandler('SpikeScript:RequestPermissions', function(allowed)
    TriggerEvent('SpikeScript:CanUseSpikes', allowed)
end)

function listcontains(list, var)
	for i = 1, #list do
        if list[i] == var then
            return true
        end
    end
	return false
end