local DisableControlAction = DisableControlAction
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		DisableControlAction(0, 140, true) -- Deshabilitar pegar con la R
	end
end)