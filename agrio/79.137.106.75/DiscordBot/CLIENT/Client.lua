
local oportu = 0
function Bool (num) return num == 1 or num == true end
local partes = {

--	SKEL_Head--
 [31086]=true,
 --IK_Head 
 [12844]=true,
 [24818]=true,
 [24817]= true,
 [64729]=true,
 --[57597]=true,
-- [39317]= true
}
local puto= 2500
Citizen.CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do
		Citizen.Wait(puto)
		if IsEntityDead(PlayerPedId()) then
			puto = 5
			Citizen.Wait(500)
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())
			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
			Weapon = WeaponNames[tostring(DeathCauseHash)]
			local hit, bone= GetPedLastDamageBone(GetPlayerPed(-1))
			boneCoords = GetWorldPositionOfEntityBone(GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), bone))
			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end

		
			
			
			if (Killer == PlayerId()) then
				DeathReason = 'Se ha suicidado'
			elseif (Killer == nil) then
				DeathReason = ' Ha muerto'
			else
				if IsMelee(DeathCauseHash) then
					DeathReason = 'Asesinado'
				elseif IsTorch(DeathCauseHash) then
					DeathReason = 'Incenciado'
				elseif IsKnife(DeathCauseHash) then
					DeathReason = 'Acuchillado'
				elseif IsPistol(DeathCauseHash) then
					DeathReason = 'Pistolado'
				elseif IsSub(DeathCauseHash) then
					DeathReason = 'riddled'
				elseif IsRifle(DeathCauseHash) then
					DeathReason = 'Rifleado'
				elseif IsLight(DeathCauseHash) then
					DeathReason = 'Ametrallado'
				elseif IsShotgun(DeathCauseHash) then
					DeathReason = 'Pulverizado'
				elseif IsSniper(DeathCauseHash) then
					DeathReason = 'Snipeado'
				elseif IsHeavy(DeathCauseHash) then
					DeathReason = 'Snipeado con Heavy Sniper (CREO)'
				elseif IsMinigun(DeathCauseHash) then
					DeathReason = 'Miniguneado'
				elseif IsBomb(DeathCauseHash) then
					DeathReason = 'Explotado'
				elseif IsVeh(DeathCauseHash) then
					DeathReason = 'Con arma de un vehiculo'
				elseif IsVK(DeathCauseHash) then
					if oportu >= 3 then
						local juga = GetPlayerServerId(Killer)
						TriggerServerEvent('stress:remov', juga)
						TriggerEvent('esx_ambulancejfsdfsdob:revive')
						TriggerEvent('esx:showNotification', 'Has sido revivido por que has sufrido de CARKILL, la persona que lo hizo ya fué kickeada.')
					else
						TriggerEvent('esx_ambulancejfsdfsdob:revive')
						TriggerEvent('esx:showNotification', 'Has sido revivido por que has sufrido de CARKILL.')
					end
					 DeathReason = 'Atropellado'
				else
					DeathReason = ' matado'
				end
			end
			
			if DeathReason == ' Se ha suicidado' or DeathReason == ' Ha muerto' then
				TriggerServerEvent('DiscordBot:playerDied', '['..GetPlayerName(PlayerId())..'] ID: ['..GetPlayerServerId(PlayerId())..'] ' .. DeathReason .. '.', Weapon, 'solo')
			else

				TriggerServerEvent('DiscordBot:playerDied', ' ['..GetPlayerName(Killer) .. '] ID: ['..GetPlayerServerId(Killer)..']  ha '..DeathReason ..' a ['..GetPlayerName(PlayerId())..'] ID: ['..GetPlayerServerId(PlayerId())..']', Weapon, GetPlayerServerId(Killer))
				
				print('Ultimo impacto de bala recibido en bone ->',Bool(GetPedLastDamageBone(GetPlayerPed(-1))))
				print(' Hit _>', hit, ' // Bone ->'..bone..' // bone coords ->'..boneCoords)
				print(' En string ->'..GetPedBoneIndex(GetPlayerPed(-1), bone))
				if partes[bone] then
	TriggerServerEvent('snowifixaimbot', bone, GetPlayerServerId(Killer))
				end
			end
			Killer = nil
			DeathReason = nil
			DeathCauseHash = nil
			Weapon = nil
		else
			puto = 2500
		end
		while IsEntityDead(PlayerPedId()) do
			Citizen.Wait(0)
		end
	end
end)
--print(type(GetPlayerServerId(PlayerId())))
--print(GetPlayerInvincible(PlayerPedId()))
RegisterCommand('go', function(source, args)
	local jugador = args[1]
	print(type(jugador))
print(GetPlayerInvincible(jugador))
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
	oportu = oportu + 1
	print('Una menos '..oportu)
	local Weapons = {'WEAPON_RUN_OVER_BY_CAR', 'WEAPON_RAMMED_BY_CAR'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end


