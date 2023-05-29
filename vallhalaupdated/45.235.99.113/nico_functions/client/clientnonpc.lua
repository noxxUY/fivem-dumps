Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1) -- prevent crashing

		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
		SetPedDensityMultiplierThisFrame(0.0) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(0.0) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);

		SetPlayerHealthRechargeMultiplier(PlayerId() , 0)

		if IsPedArmed(PlayerPedId() , 6) then
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_PISTOL50"), 0.5) -- 5 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_HEAVYPISTOL"), 0.38) -- 8 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_SNSPISTOL"), 0.4) -- 11 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_VINTAGEPISTOL"), 0.4) -- 9 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_REVOLVER"), 0.2) -- 4 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_PISTOL_MK2"), 0.58) -- 6 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_COMBATPISTOL"), 0.58) -- 8 tiros
			
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_APPISTOL"), 0.4) -- 10 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_MACHINEPISTOL"), 0.5) -- 9 tiros
			
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_MICROSMG"), 0.82) -- 12 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_SMG"), 0.85) -- 10 tiros
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_ASSAULTSMG"), 0.82) -- 8 tiros
			
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_BULLPUPSHOTGUN"), 0.1) -- broken
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_SAWNOFFSHOTGUN"), 0.1) -- broken
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_PUMPSHOTGUN"), 0.1) -- broken
			SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), 0.1) -- broken
			DisableControlAction(1 , 140 , true) -- R
			DisableControlAction(1 , 141 , true) -- Q
			DisableControlAction(1 , 142 , true) -- LEFT MOUSE BUTTON
		end
		SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_UNARMED"), 0.2)
		SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_KNUCKLE"), 0.2)
		SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_KNIFE"), 0.4)
		SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_NIGHTSTICK"), 0.1)
		SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_FLASHLIGHT"), 0.1)
		SetWeaponDamageModifierThisFrame(GetHashKey("WEAPON_EXPLOSION"), 0.0)
		SetWeaponDamageModifierThisFrame(-1553120962, 0.0) -- CAR KILL
	end
end)
