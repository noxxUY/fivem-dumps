-- Damaged Walk Mode --
-----------------------
local hurt = false
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if GetEntityHealth(PlayerPedId()) <= 139 then
			setHurt()
		elseif hurt and GetEntityHealth(PlayerPedId()) > 140 then
			setNotHurt()
		end
	end
end)

function setHurt()
	hurt = true
	RequestAnimSet("move_m@injured")
	SetPedMovementClipset(PlayerPedId() , "move_m@injured" , true)
	SetPlayerHealthRechargeMultiplier(PlayerId() , 0.0)
	DisableControlAction(0 , 21)
	DisableControlAction(0 , 22)
end

function setNotHurt()
	hurt = false
	SetPlayerHealthRechargeMultiplier(PlayerId() , 0.0)
	ResetPedMovementClipset(PlayerPedId())
	ResetPedWeaponMovementClipset(PlayerPedId())
	ResetPedStrafeClipset(PlayerPedId())
end
----- CAM SHAKE

playerMoving = false
Citizen.CreateThread(function()
	while true do
		local msec = 700

		if (IsPedInAnyVehicle(PlayerPedId())) then
			msec = 0
		end

		if not IsPedInAnyVehicle(PlayerPedId() , false) and GetEntitySpeed(PlayerPedId()) >= 0.5 and GetFollowPedCamViewMode() ~= 4 then
			if playerMoving == false then
				ShakeGameplayCam("ROAD_VIBRATION_SHAKE" , 0.55)
				playerMoving = true
			end
		else
			if playerMoving == true then
				StopGameplayCamShaking(false)
				playerMoving = false
			end
		end
		Wait(msec)
	end
end)