local caerse = 0.2 -- Posibilidad de que el jugador se caíga

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100) 
		local ped = PlayerPedId()
		if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
			local resultado = math.random()
			if resultado < caerse then 
				Citizen.Wait(600) 
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
				SetPedToRagdoll(ped, 5000, 1, 2)
			else
				Citizen.Wait(3000)
			end
		end
	end
end)