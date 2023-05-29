
-- NO DISPARA DE CONDUCTOR !!!!
-- CONFIG --
local passengerDriveBy = true

-- CODE --
Citizen.CreateThread(function()
	while true do
		Wait(1000)
		playerPed = PlayerPedId()
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)
