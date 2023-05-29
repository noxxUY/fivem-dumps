local usado = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local player = PlayerPedId()
		if GetPedParachuteState(player) == 1 and not usado then
			exports["esx_holster"]:bypass(true)
			SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			usado = true			
			print("ABRIENDO PARACAIDAS!")
			TriggerServerEvent('1974_parachute:remove')
		end
		if GetPedParachuteState(player) == 2 and usado then
			usado = false
			print("PARACAIDAS ABIERTO!")
			exports["esx_holster"]:bypass(false)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if GetPedParachuteState(ped) == 2 then			
			DisableControlAction(1, 25, true )
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 23, true)
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
			DisableControlAction(1, 182, true)  -- Disables L
			DisablePlayerFiring(ped, true) -- Disable weapon firing
		end
	end
end)


--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, false) then
			local currentVehicle = GetVehiclePedIsIn((ped, false)
			local class = GetVehicleClass(currentVehicle)
			if class == 15 or class == 16 then
				if IsControlJustReleased(0, 23) then
					exports["esx_holster"]:bypass(true)
					SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
					exports["esx_holster"]:bypass(false)
				end
			end
		end	
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, false) then
			local currentVehicle = GetVehiclePedIsUsing(ped)
			local class = GetVehicleClass(currentVehicle)
			local speed = GetEntitySpeed(currentVehicle) * 3.6
			if class == 8 then
				if IsControlJustReleased(0, 23) then
					if speed < 30 then
						ClearPedTasksImmediately(ped)
						--TaskLeaveVehicle(ped, currentVehicle, 16)
					end
				end
			end
		end	
	end
end)
]]--