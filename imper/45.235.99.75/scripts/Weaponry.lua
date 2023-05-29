-- Script by Lyrad for LEFR

local scopedWeapons = 
{

}

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )
    local _, hash = GetCurrentPedWeapon( ped, true )
        if not HashInTable( hash ) then 
            HideHudComponentThisFrame( 1 )
		end 
end 


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed( -1 )
		local weapon = GetSelectedPedWeapon(ped)
		--print(weapon) -- To get the weapon hash by pressing F8 in game
		
		-- Disable reticle
		
		ManageReticle()
		
		-- Disable melee while aiming (may be not working)
		
		if IsPedArmed(ped, 6) then
        	DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
		
		-- Disable ammo HUD
		
		DisplayAmmoThisFrame(false)
		
		-- Shakycam
			-- Pistol
		
		
		
	end
end)

-- recoil script by bluethefurry / Blumlaut https://forum.fivem.net/t/betterrecoil-better-3rd-person-recoil-for-fivem/82894
-- I just added some missing weapons because of the doomsday update adding some MK2.
-- I can't manage to make negative hashes works, if someone make it works, please let me know =)

local recoils = {
       [0x9D1F17E6] = 2.1, -- SMG MK2
       [961495388] = 0.1, -- ASSAULT RIFLE MK2
        [-1075685676] = 0.1, --pistol mk2
		--PISTOLMK2
          [-1063057011] = 0.1,
        [-2084633992] = 0.1,
       [-619010992] = 0.1,
      [-270015777] = 0.1,
    [-1716589765] = 0.1, -- PISTOL50
	[453432689] = 0.1, -- PISTOL
	[3219281620] = 0.1, -- PISTOL MK2
	[1593441988] = 0.1, -- COMBAT PISTOL
	[584646201] = 0.1, -- AP PISTOL
	[2578377531] = 0.1, -- PISTOL .50
	[324215364] = 0.1, -- MICRO SMG
	[736523883] = 0.1, -- SMG
	[4024951519] = 0.1, -- ASSAULT SMG
	[-1074790547] = 0.1, -- ASSAULT RIFLE
	[3220176749] = 0.1, -- ASSAULT RIFLE
	[961495388] = 0.1, -- ASSAULT RIFLE MK2
	[2210333304] = 0.1, -- CARBINE RIFLE
	[4208062921] = 0.1, -- CARBINE RIFLE MK2
	[-1357824103] = 0.1, -- ADVANCED RIFLE
	[2937143193] = 0.1, -- ADVANCED RIFLE
	[2634544996] = 0.1, -- MG
	[2144741730] = 0.1, -- COMBAT MG
	[3686625920] = 0.1, -- COMBAT MG MK2
	[487013001] = 7.4, -- PUMP SHOTGUN
	[1432025498] = 0.1, -- PUMP SHOTGUN MK2
	[2017895192] = 0.6, -- SAWNOFF SHOTGUN
	[3800352039] = 0.1, -- ASSAULT SHOTGUN
	[2640438543] = 0.1, -- BULLPUP SHOTGUN
	[911657153] = 0.1, -- STUN GUN
	[100416529] = 0.9, -- SNIPER RIFLE
	[205991906] = 0.9, -- HEAVY SNIPER
	[177293209] = 0.1, -- HEAVY SNIPER MK2
	[856002082] = 1.9, -- REMOTE SNIPER
	[2726580491] = 0.1, -- GRENADE LAUNCHER
	[1305664598] = 0.1, -- GRENADE LAUNCHER SMOKE
	[2982836145] = 0.9, -- RPG
	[1752584910] = 0.1, -- STINGER
	[1119849093] = 0.1, -- MINIGUN
	[3218215474] = 0.1, -- SNS PISTOL
	[2009644972] = 0.1, -- SNS PISTOL MK2
	[1627465347] = 0.1, -- GUSENBERG
	[3231910285] = 0.1, -- SPECIAL CARBINE
	[-1768145561] = 0.1, -- SPECIAL CARBINE MK2
	[3523564046] = 0.1, -- HEAVY PISTOL
	[2132975508] = 0.1, -- BULLPUP RIFLE
	[-2066285827] = 0.1, -- BULLPUP RIFLE MK2
	[137902532] = 0.1, -- VINTAGE PISTOL
	[-1746263880] = 0.1, -- DOUBLE ACTION REVOLVER
	[2828843422] = 0.1, -- MUSKET
	[984333226] = 0.1, -- HEAVY SHOTGUN
	[3342088282] = 0.1, -- MARKSMAN RIFLE
	[1785463520] = 0.1, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0.1, -- FLARE GUN
	[171789620] = 0.1, -- COMBAT PDW
	[3696079510] = 0.1, -- MARKSMAN PISTOL
  	[1834241177] = 0.1, -- RAILGUN
	[3675956304] = 0.1, -- MACHINE PISTOL
	[3249783761] = 0.1, -- REVOLVER
	[-879347409] = 0.1, -- REVOLVER MK2
	[4019527611] = 0.1, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 0.1, -- COMPACT RIFLE
	[317205821] = 0.1, -- AUTO SHOTGUN
	[125959754] = 0.1, -- COMPACT LAUNCHER
	[3173288789] = 0.1, -- MINI SMG		
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				repeat 
					Wait(0)
					p = GetGameplayCamRelativePitch()
					if GetFollowPedCamViewMode() ~= 4 then
						SetGameplayCamRelativePitch(p+0.1, 0.2)
					end
					tv = tv+0.1
				until tv >= recoils[wep]
			end
			
		end
	end
end)