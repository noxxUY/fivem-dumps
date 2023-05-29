local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		local msec = 700
		if IsPedInAnyVehicle(PlayerPedId() , false) and disableShuffle then
			msec = 0
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId() , false) , 0) == PlayerPedId() then
				if GetIsTaskActive(PlayerPedId() , 165) then
					SetPedIntoVehicle(PlayerPedId() , GetVehiclePedIsIn(PlayerPedId() , false) , 0)
				end
			end
		end
		Citizen.Wait(msec)
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle" , function()
	if IsPedInAnyVehicle(PlayerPedId() , false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("manejar" , function(source , args , raw)
	TriggerEvent("SeatShuffle")
end , false)

local passengerDriveBy = true
Citizen.CreateThread(function()
	while true do
		local msec = 1000
		playerPed = PlayerPedId()
		car       = GetVehiclePedIsIn(playerPed , false)
		if car then
			msec = 0
			if GetPedInVehicleSeat(car , -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId() , false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId() , true)
			else
				SetPlayerCanDoDriveBy(PlayerId() , false)
			end
		end
		Wait(msec)
	end
end)