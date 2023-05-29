local tiempo = 14000 -- milisegundos >> 1000 ms = 1s

Citizen.CreateThread(function()
	while true do
		local sleep = 500

		if IsPedBeingStunned(PlayerPedId()) then
			sleep = 1
			SetPedMinGroundTimeForStungun(PlayerPedId(), tiempo)
			DoScreenFadeOut(1300)
			Wait(2000)
			DoScreenFadeIn(2000)
		end
		Citizen.Wait(sleep)
	end
end)