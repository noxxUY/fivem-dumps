-- CONFIG --

-- PERMITIR DISPARAR A PASAJEROS
local passengerDriveBy = true

-- CODIGO --

Citizen.CreateThread(function()
	while true do
		Wait(250)

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