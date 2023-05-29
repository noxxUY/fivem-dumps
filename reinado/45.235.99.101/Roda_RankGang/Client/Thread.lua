
  local isInFFA = false

CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon
	while true do
		Wait(200)
		
		isInFFA = exports['hex_ffa']:isInZone()


		if IsEntityDead(GetPlayerPed(PlayerId()))  then
			Wait(0)
			local PedKiller = GetPedSourceOfDeath(GetPlayerPed(PlayerId()))
			local killername = GetPlayerName(PedKiller)
			DeathCauseHash = GetPedCauseOfDeath(GetPlayerPed(PlayerId()))
			-- local FoundLastDamagedBone, LastDamagedBone = GetPedLastDamageBone(PlayerPedId())
			-- if FoundLastDamagedBone then
			-- 	bonehash = tonumber(LastDamagedBone)
			-- 	if bonehash == 31086 then 
			-- 		headshot = 1
			-- 	else
			-- 		headshot = 0
			-- 	end
			-- end
			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end
				if isInFFA then
					print('No cuenta muerte en FFA')
				else
					TriggerServerEvent('Roda_RankGang:DeadAndKills',GetPlayerServerId(PlayerId()),GetPlayerServerId(Killer))
				end
			Killer = nil
			DeathReason = nil
			Weapon = nil
		end
		while IsEntityDead(PlayerPedId()) do
			Wait(0)
		end
	end
end)