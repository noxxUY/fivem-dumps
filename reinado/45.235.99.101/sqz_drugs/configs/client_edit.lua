if Config.ESXVersion == 'old' then
	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent(Config.customEvents['esx:getSharedObject'], function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end

		ESX.PlayerData = ESX.GetPlayerData()
	end)
elseif Config.ESXVersion == 'legacy' then
	ESX = exports["es_extended"]:getSharedObject()
	Citizen.CreateThread(function()
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end

		ESX.PlayerData = ESX.GetPlayerData()
	end)
end

function showNotification(message)
	ESX.ShowNotification(message)
	-- Default GTA es_extended notifications, change it fou want to use if differently
end

function VehicleSpawned(vehicle)
	-- This function is called when a vehicle is spawned
end

function OpenPlantStatus(plant)
	SendNUIMessage({
		action = 'update',
		fertilizer = plant.Fertilizer,
		water = plant.Water,
		status = plant.Status,
		quality = plant.Quality
	})
	SendNUIMessage({
		action = 'open'
	})
end

RegisterNetEvent('sqz_drugs:drugUsedCustom')
AddEventHandler('sqz_drugs:drugUsedCustom', function(drugName)

	-- This event is triggered on every use of drug (registered item (Config.Drugs))
	-- drugName is name of the drug, can be used as a index of the Config.DrugsTable
	-- You can call here whatever you want to

end)

RegisterNetEvent('sqz_drugs:drugSoldCustom')
AddEventHandler('sqz_drugs:drugSoldCustom', function(drugName, count)

	-- This event is triggered on every successfull sell of drug (registered item (Config.Drugs))
	-- drugName is name of the drug, can be used as a index of the Config.DrugsTable
	-- You can call here whatever you want to
	-- The count is obviously the count of drug sold

end)

RegisterNetEvent('sqz_drugs:DispatchCall', function(type)
	-- When a player tries to do an illegal activity and cops get called
	-- type: 'itemSell'
end)

function Draw3DText(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 85)
    ClearDrawOrigin()
end

function debugMessage(message)
    --print('^2[sqz_drugs]^0 '..message) -- Turned off by default
	-- Lines used to print debug in case of errors, if you want to, you can remove the print using --print(...)
end

function ProgressBar(name, duration, label) -- you can put here any progressbar export/trigger you want to use
	TriggerEvent("mythic_progbar:client:progress", {
		name = name,
		duration = duration,
		label = label,
		useWhileDead = false,
		canCancel = false,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}
		}, function(status)
	end)
end
function CanStartProcessingDrugs()
	return true
end