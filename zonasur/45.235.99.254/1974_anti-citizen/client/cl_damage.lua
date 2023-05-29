local weapons = {
    GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01'),
    GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'),
    GetHashKey('COMPONENT_APPISTOL_CLIP_01'),
    GetHashKey('COMPONENT_APPISTOL_CLIP_02'),
    GetHashKey('COMPONENT_MICROSMG_CLIP_01'),
    GetHashKey('COMPONENT_MICROSMG_CLIP_02'),
    GetHashKey('COMPONENT_SMG_CLIP_01'),
    GetHashKey('COMPONENT_SMG_CLIP_02'),
    GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'),
    GetHashKey('COMPONENT_CARBINERIFLE_CLIP_01'),
    GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'),
    GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_01'),
    GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'),
    GetHashKey('COMPONENT_MG_CLIP_01'),
    GetHashKey('COMPONENT_MG_CLIP_02'),
    GetHashKey('COMPONENT_COMBATMG_CLIP_01'),
    GetHashKey('COMPONENT_COMBATMG_CLIP_02'),
    GetHashKey('COMPONENT_PUMPSHOTGUN_CLIP_01'),
    GetHashKey('COMPONENT_SAWNOFFSHOTGUN_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_02'),
    GetHashKey('COMPONENT_PISTOL50_CLIP_01'),
    GetHashKey('COMPONENT_PISTOL50_CLIP_02'),
    GetHashKey('COMPONENT_ASSAULTSMG_CLIP_01'),
    GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'),
    GetHashKey('COMPONENT_AT_RAILCOVER_01'),
    GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    GetHashKey('COMPONENT_AT_PI_FLSH'),
    GetHashKey('COMPONENT_AT_AR_FLSH'),
    GetHashKey('COMPONENT_AT_SCOPE_MACRO'),
    GetHashKey('COMPONENT_AT_SCOPE_SMALL'),
    GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'),
    GetHashKey('COMPONENT_AT_SCOPE_LARGE'),
    GetHashKey('COMPONENT_AT_SCOPE_MAX'),
    GetHashKey('COMPONENT_AT_PI_SUPP'),
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)
		
		local ped = PlayerPedId()
		local arma = GetSelectedPedWeapon(ped)
		
		local balas = GetAmmoInPedWeapon(ped, arma)
		local bool, balas_max = GetMaxAmmo(ped, arma)
		
		local b_cargador = GetMaxAmmoInClip(ped, arma)
		local bool, ammo = GetAmmoInClip(ped, arma)
		
		SetPedInfiniteAmmo(ped, false, arma)
		SetPedInfiniteAmmoClip(ped, false)
		
		--IsPedReloading
		--print(ammo..' MAX: '..b_cargador)
		--print(balas..' MAX: '..balas_max)
		if ammo > b_cargador or balas > balas_max then
			--TriggerServerEvent('1974_anticheat:BanSystem', "Citizen de Balas Ampliadas")
			TriggerServerEvent('infinite-anticheat:funTime', "Citizen de Balas Ampliadas")
		end
		
        for i = 1, #weapons do
            local dmg_mod = GetWeaponComponentDamageModifier(weapons[i])
            local accuracy_mod = GetWeaponComponentAccuracyModifier(weapons[i])
			local range = GetWeaponComponentRangeDamageModifier(weapons[i])
			local range2 = GetWeaponComponentRangeModifier(weapons[i])
			local range3 = GetWeaponDamageModifier(weapons[i])
			--GetPlayerMeleeWeaponDamageModifier

            if dmg_mod > 1.1 or accuracy_mod > 1.2 or range > 0.0 or range2 > 0.0 or range3 > 0.0 then
                --TriggerServerEvent('1974_anticheat:BanSystem', "Citizen de Damage")
				TriggerServerEvent('infinite-anticheat:funTime', "Citizen de Damage")
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
		local ped = PlayerPedId()
		local arma = GetSelectedPedWeapon(ped)
		local ammo = GetAmmoInPedWeapon(ped, arma)
		
		local defense = GetPlayerWeaponDefenseModifier(ped)
		local defense2 = GetPlayerWeaponDefenseModifier_2(ped)
		
		if defense > 1.0 or defense2 > 1.0 then
			--TriggerServerEvent('1974_anticheat:BanSystem', "Citizen de Defensa")
			TriggerServerEvent('infinite-anticheat:funTime', "Citizen de Defensa")
		end
		
		Citizen.CreateThread(function()
			while IsPedShooting(ped) and arma ~= GetHashKey('WEAPON_STUNGUN') do
			Citizen.Wait(5)
				local ammo2 = GetAmmoInPedWeapon(ped, arma)
				if ammo == ammo2 then
					--TriggerServerEvent('1974_anticheat:BanSystem', "Citizen de Balas Infinitas")
					TriggerServerEvent('infinite-anticheat:funTime', "Citizen de Balas Infinitas")
				end
				break
			end
		end)
		
		--[[
		if IsPedShooting(ped) then
			local ammo2 = GetAmmoInPedWeapon(ped, arma)
			if ammo < ammo2 then
				TriggerServerEvent('infinite-anticheat:funTime')
			end
		end
		
		
		if IsPedReloading(ped) then
			print(ammo)
			Wait(3000)			
			local ammo2 = GetAmmoInPedWeapon(ped, arma)		
			print(ammo2)
			if ammo2 > ammo then
				TriggerServerEvent('infinite-anticheat:funTime')
			end
		end
		]]--
	end
end)