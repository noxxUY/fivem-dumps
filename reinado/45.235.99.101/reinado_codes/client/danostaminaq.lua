
Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.21)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_DOUBLEACTION"), 0.45)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_DBSHOTGUN"), 0.26)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MINISMG"), 0.26)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GUSENBERG"), 0.39)
	
	 N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL50"), 0.6)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"), 0.01)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.01)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_WRENCH"), 0.01)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.01)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.04)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GRENADE"), 0.02)
		Wait(1000)
    end
end)


-- Desabilita disparo rapido "Q"
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		if IsPedInCover(ped, 1) and not IsPedAimingFromCover(ped, 1) then 
			DisableControlAction(2, 24, true) 
			DisableControlAction(2, 142, true)
			DisableControlAction(2, 257, true)
		end	
	end
end)
Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(10)
		if IsControlJustPressed(1, 20) then --Start holding g
            if not handsup then
                TaskPlayAnim(PlayerPedId(), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(PlayerPedId())
				
            end
        end
    end
end)