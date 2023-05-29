local knockedOut = false
local wait = 15
local count = 25

Citizen.CreateThread(function()
	while true do
		Wait(1)
		local myPed = GetPlayerPed(-1)
		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 115 then
				SetPlayerInvincible(PlayerId(), true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				ShowNotification("~r~Fuiste Noqueado!")
				wait = 15
				knockedOut = true
				SetEntityHealth(myPed, 116)
			end
		end
		if knockedOut == true then
			SetPlayerInvincible(PlayerId(), true)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			mancando()
			
			if wait >= 0 then
				count = count - 1
				if count == 0 then
					count = 25
					wait = wait - 1
					SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
				end
			else
				SetPlayerInvincible(PlayerId(), false)
				knockedOut = false
			end
		end
	end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function mancando()
    local playerPed = GetPlayerPed(-1)
	
    Citizen.CreateThread(function()	
    RequestAnimSet("move_injured_generic")
    while not HasAnimSetLoaded("move_injured_generic") do
    Citizen.Wait(0)
    end
    SetPedMovementClipset(playerPed, "move_injured_generic", true)
	StartScreenEffect('DrugsMichaelAliensFightOut', 0, true)
    Citizen.Wait(10000)
	StartScreenEffect('DrugsMichaelAliensFightIn', 0, true)
	Citizen.Wait(30000)
	StopAllScreenEffects(GetPlayerPed(-1))
    ResetPedMovementClipset(playerPed, 0)
	end)
end  
