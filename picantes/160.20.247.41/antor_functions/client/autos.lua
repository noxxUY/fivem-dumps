local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(PlayerPedId() , false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId() , false) , 0) == PlayerPedId() then
				if GetIsTaskActive(PlayerPedId() , 165) then
					SetPedIntoVehicle(PlayerPedId() , GetVehiclePedIsIn(PlayerPedId() , false) , 0)
				end
			end
		end
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
		Wait(1)
		
		playerPed = PlayerPedId()
		car       = GetVehiclePedIsIn(playerPed , false)
		if car then
			if GetPedInVehicleSeat(car , -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId() , false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId() , true)
			else
				SetPlayerCanDoDriveBy(PlayerId() , false)
			end
		end
	end
end)