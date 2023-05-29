local isInRagdoll = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		local ped = PlayerPedId()
		
		if isInRagdoll then
			ResetPedRagdollTimer(ped)
			SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
		end
		
		if IsEntityDead(ped) then
			isInRagdoll = false
		end
	end
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		if IsControlJustPressed(2, Config.RagdollKeybind) and Config.RagdollEnabled and IsPedOnFoot(PlayerPedId()) then
			if isInRagdoll then
				isInRagdoll = false
			else
				isInRagdoll = true
				Wait(500)
			end
		end
	end
end)

RegisterCommand('removewheelchair', function()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) and not preso and not IsPedDeadOrDying(GetPlayerPed(-1), false) then
		if isInRagdoll then
			isInRagdoll = false
		else
			isInRagdoll = true
			Wait(500)
		end
	end
end, false)

