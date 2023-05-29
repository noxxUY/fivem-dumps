Citizen.CreateThread(function()
	while true do
		local msec = 670
		local ped = PlayerPedId()
		local weapon = GetSelectedPedWeapon(ped)
				
		if IsPedArmed(ped, 6) then
			msec = 0
        	DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
		Citizen.Wait(msec)
	end
end)