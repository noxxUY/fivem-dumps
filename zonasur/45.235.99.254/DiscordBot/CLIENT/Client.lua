RegisterNetEvent('DiscordBot:3dText')
AddEventHandler('DiscordBot:3dText', function(coords, text)
	local display = true
	local x, y, z = table.unpack(coords)
    z = z + 1		
	coords = vector3(x, y, z)
	
    Citizen.CreateThread(function()
        Wait(15000)
        display = false
    end)
	
	while display do 
        Wait(0)

		local camCoords = GetGameplayCamCoord()
		local dist = #(coords - camCoords)
    
		-- Experimental math to scale the text down
		local scale = 200 / (GetGameplayCamFov() * dist)

		-- Format the text
		local c = { r = 255, g = 0, b = 0, a = 255 }
		--SetTextColour(c.r, c.g, c.b, c.a)
		SetTextScale(0.0, 0.5 * scale)
		SetTextFont(0)
		SetTextDropshadow(0, 0, 0, 0, 55)
		SetTextDropShadow()
		SetTextCentre(true)

		-- Diplay the text
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringPlayerName(text)
		SetDrawOrigin(coords, 0)
		EndTextCommandDisplayText(0.0, 0.0)
		ClearDrawOrigin()
    end
end)

Citizen.CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do
		Citizen.Wait(0)
		if IsEntityDead(PlayerPedId()) then
			Citizen.Wait(500)
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())
			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
			Weapon = WeaponNames[tostring(DeathCauseHash)]

			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end
			
			if (Killer == PlayerId()) then
				DeathReason = 'se suicido'
			elseif (Killer == nil) then
				DeathReason = 'murio'
			else
				if IsMelee(DeathCauseHash) then
					DeathReason = '**Mato a golpes a**'
				elseif IsTorch(DeathCauseHash) then
					DeathReason = '**Incendio hasta la muerte a**'
				elseif IsKnife(DeathCauseHash) then
					DeathReason = '**Mato con cuchillo a**'
				elseif IsPistol(DeathCauseHash) then
					DeathReason = '**Mato con una Pistola a**'
				elseif IsSub(DeathCauseHash) then
					DeathReason = '**Mato con SMG a**'
				elseif IsRifle(DeathCauseHash) then
					DeathReason = '**Mato con un Rifle a**'
				elseif IsLight(DeathCauseHash) then
					DeathReason = '**Mato con una Machine Gun a**'
				elseif IsShotgun(DeathCauseHash) then
					DeathReason = '**Mato con una Escopeta a**'
				elseif IsSniper(DeathCauseHash) then
					DeathReason = '**Mato con un Sniper a**'
				elseif IsHeavy(DeathCauseHash) then
					DeathReason = '**Mato con un Tanque de Guerra a**'
				elseif IsMinigun(DeathCauseHash) then
					DeathReason = '**Mato con una Mini Gun a**'
				elseif IsBomb(DeathCauseHash) then
					DeathReason = '**Mato con una Bomba a**'
				elseif IsVeh(DeathCauseHash) then
					DeathReason = '**Mato con las helices a**'
				elseif IsVK(DeathCauseHash) then
					DeathReason = '**Mato con un Vehiculo a**'
				else
					DeathReason = '**Mato a**'
				end
			end
			local src = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
			local src2 = GetPlayerServerId(NetworkGetEntityOwner(PedKiller, -1))
			
			if DeathReason == 'se suicido' or DeathReason == 'murio' then
				TriggerServerEvent('DiscordBot:PlayerDied_zs', { autor = GetPlayerName(PlayerId()), idautor = src, causa = DeathReason, weapon = Weapon })
			else
				TriggerServerEvent('DiscordBot:PlayerDied_zs', { autor = GetPlayerName(Killer), idautor = src2, causa = DeathReason, victima = GetPlayerName(PlayerId()), victimaid = src, weapon = Weapon })
			end
			Killer = nil
			DeathReason = nil
			DeathCauseHash = nil
			Weapon = nil
		end
		while IsEntityDead(PlayerPedId()) do
			Citizen.Wait(0)
		end
	end
end)

function IsMelee(Weapon)
	local Weapons = {'WEAPON_UNARMED', 'WEAPON_CROWBAR', 'WEAPON_BAT', 'WEAPON_GOLFCLUB', 'WEAPON_HAMMER', 'WEAPON_NIGHTSTICK'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsTorch(Weapon)
	local Weapons = {'WEAPON_MOLOTOV'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsKnife(Weapon)
	local Weapons = {'WEAPON_DAGGER', 'WEAPON_KNIFE', 'WEAPON_SWITCHBLADE', 'WEAPON_HATCHET', 'WEAPON_BOTTLE'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsPistol(Weapon)
	local Weapons = {'WEAPON_SNSPISTOL', 'WEAPON_HEAVYPISTOL', 'WEAPON_VINTAGEPISTOL', 'WEAPON_PISTOL', 'WEAPON_APPISTOL', 'WEAPON_COMBATPISTOL'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsSub(Weapon)
	local Weapons = {'WEAPON_MICROSMG', 'WEAPON_SMG'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsRifle(Weapon)
	local Weapons = {'WEAPON_CARBINERIFLE', 'WEAPON_MUSKET', 'WEAPON_ADVANCEDRIFLE', 'WEAPON_ASSAULTRIFLE', 'WEAPON_SPECIALCARBINE', 'WEAPON_COMPACTRIFLE', 'WEAPON_BULLPUPRIFLE'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsLight(Weapon)
	local Weapons = {'WEAPON_MG', 'WEAPON_COMBATMG'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsShotgun(Weapon)
	local Weapons = {'WEAPON_BULLPUPSHOTGUN', 'WEAPON_ASSAULTSHOTGUN', 'WEAPON_DBSHOTGUN', 'WEAPON_PUMPSHOTGUN', 'WEAPON_HEAVYSHOTGUN', 'WEAPON_SAWNOFFSHOTGUN'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsSniper(Weapon)
	local Weapons = {'WEAPON_MARKSMANRIFLE', 'WEAPON_SNIPERRIFLE', 'WEAPON_HEAVYSNIPER', 'WEAPON_ASSAULTSNIPER', 'WEAPON_REMOTESNIPER'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsHeavy(Weapon)
	local Weapons = {'WEAPON_GRENADELAUNCHER', 'WEAPON_RPG', 'WEAPON_FLAREGUN', 'WEAPON_HOMINGLAUNCHER', 'WEAPON_FIREWORK', 'VEHICLE_WEAPON_TANK'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsMinigun(Weapon)
	local Weapons = {'WEAPON_MINIGUN'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsBomb(Weapon)
	local Weapons = {'WEAPON_GRENADE', 'WEAPON_PROXMINE', 'WEAPON_EXPLOSION', 'WEAPON_STICKYBOMB'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsVeh(Weapon)
	local Weapons = {'VEHICLE_WEAPON_ROTORS'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsVK(Weapon)
	local Weapons = {'WEAPON_RUN_OVER_BY_CAR', 'WEAPON_RAMMED_BY_CAR'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

