ESX = nil

local isRunningWorkaround = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
		print(vehicle..'Estado 1')  
	else
		vehicle = GetClosestVehicle(coords, 18.0, 0, 71)
		if vehicle == 0 or vehicle == nil then
			vehicle = exports['esx_advancedgarage']:GetSpawnedVehicle()
			print(vehicle..'Estado 2')
		end
		
	end

	if not DoesEntityExist(vehicle) then
		return
	end

	ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 1 then -- unlocked
			-- TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, "carlock", 1.0)			
			SetVehicleDoorsLocked(vehicle, 2)			
			exports['mythic_notify']:DoHudText('Inform', 'Vehiculo Cerrado 🔒', { ['background-color'] = '#ff0000', ['color'] = '#FFFFFF' })

			Wait(300)
			PlayVehicleDoorCloseSound(vehicle, 1)
			StartVehicleHorn(vehicle, 100, 1, false)
			           
            SetVehicleLights(vehicle, 2)
            Wait(100)
            SetVehicleLights(vehicle, 0)
            Wait(100)
            SetVehicleLights(vehicle, 2)
            Wait(100)
            SetVehicleLights(vehicle, 0)                                    

        elseif lockStatus == 2 then -- locked
			SetVehicleDoorsLocked(vehicle, 1)
			exports['mythic_notify']:DoHudText('Inform', 'Vehiculo Abierto 🔓', { ['background-color'] = '#00ff00', ['color'] = '#000000' })
			PlayVehicleDoorOpenSound(vehicle, 0)            
            SetVehicleLights(vehicle, 2)
            Wait(100)
            SetVehicleLights(vehicle, 0)
            Wait(100)
            SetVehicleLights(vehicle, 2)
            Wait(100)
            SetVehicleLights(vehicle, 0)                			
				
			end
		end

	end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 303) and IsInputDisabled(0) then
			ToggleVehicleLock()
			-- Citizen.Wait(300)
	
		-- D-pad down on controllers works, too!
		elseif IsControlJustReleased(0, 173) and not IsInputDisabled(0) then
			ToggleVehicleLock()
			-- Citizen.Wait(300)
		end
	end
end)

Citizen.CreateThread(function()
    local dict = "anim@mp_player_intmenu@key_fob@"
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

	while true do
		
        Citizen.Wait(0)
        if IsControlJustPressed(1, 303) then -- When you press "U"
               TaskPlayAnim(GetPlayerPed(-1), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
        end
    end
end)
