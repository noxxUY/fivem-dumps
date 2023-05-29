ESX = nil
local ouvrirNUI = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


AfficherProgressbar = function(time)
	SendNUIMessage({['action'] = 'afficher_progressbar', ['seconds'] = time})
end

CacherProgressbar = function()
	SendNUIMessage({['action'] = 'cacher_progressbar'})
end

RegisterNUICallback('done', function(data, cb)
	if ouvrirNUI ~= nil then
		ouvrirNUI['function']()
		ouvrirNUI = nil
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		SendNUIMessage({action = 'cacher_progressbar'})
	end
end)


