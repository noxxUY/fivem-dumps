
----------------------------------------------------------------------------
-- MELEE AND WEAPONS DAMAGE 
----------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
		--N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 2.0)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.0)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYSNIPER"), 0.4)
		N_0x4757f00bc6323cfe(-1553120962, 0.0)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_RUN_OVER_BY_CAR"), 0.0)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_RAMMED_BY_CAR"), 0.0)
    	Wait(0)
    end
end)

----------------------------------------------------------------------------
--stop PISTOL WHIPPING
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)

	local ped = PlayerPedId()
		if IsPedArmed(ped, 6) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
        end
    end
end)
