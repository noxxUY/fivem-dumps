ESX                           = nil
PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject' , function(obj)
			ESX = obj
		end)
		Citizen.Wait(360)
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

local WeaponBlacklisted = {
	'WEAPON_BZGAS',
	'WEAPON_COMBATPISTOL',
	'WEAPON_GRENADELAUNCHER_SMOKE',
	'WEAPON_STUNGUN',
	'WEAPON_NIGHTSTICK',
	'WEAPON_FLASHLIGHT',
}

Citizen.CreateThread(function()
	while true do
		if PlayerData ~= nil and PlayerData.job ~= nil then
			if IsPedArmed(PlayerPedId() , 6) then
				local nothing, weapon = GetCurrentPedWeapon(PlayerPedId(), true)
				if IsWeaponBlacklisted(weapon) then
					if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'psg' and PlayerData.job.name ~= 'ambulance' then
						SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
						TriggerEvent('inventory:changeWeaponStatus')
						exports['mythic_notify']:DoCustomHudText('cajaverde' , 'Este armamento es uso exclusivo policial.' , 2500)
					end
				end
			end
		end
		Wait(math.random(1000, 2000))
	end
end)

function IsWeaponBlacklisted(model)
	for _, blWeapon in pairs(WeaponBlacklisted) do
		if model == GetHashKey(blWeapon) then
			return true
		end
	end

	return false
end