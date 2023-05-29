
ESX = exports["es_extended"]:getSharedObject()

local isRunningWorkaround = false


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
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end

	ESX.TriggerServerCallback('euk-carlock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)
			
			if lockStatus == 1 then -- unlocked
				lockAnimation()
				--exports['mythic_notify']:SendAlert('Error', 'Locked'..' '..(GetVehicleNumberPlateText(vehicle)))
                
				SetVehicleLights(vehicle, 2)
                Wait(250)
                SetVehicleLights(vehicle, 0)
				Wait(250)
				StartVehicleHorn (vehicle, 500, "NORMAL", -1)
				PlayVehicleDoorCloseSound(vehicle, 1)
				SetVehicleDoorsLocked(vehicle, 2)
				
				Citizen.Wait(450)
				PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
				exports["skeexsNotify"]:TriggerNotification({
					['type'] = "key",
					['message'] = '~r~Locked~w~ ~lb~'..(GetVehicleNumberPlateText(vehicle))..'~w~'
				})
				
			elseif lockStatus == 2 then -- locked
				lockAnimation()
				--exports['mythic_notify']:SendAlert('Success', 'Unlocked'..' '..(GetVehicleNumberPlateText(vehicle)))
				
                SetVehicleLights(vehicle, 2)
                Wait(250)
                SetVehicleLights(vehicle, 0)
				Wait(250)
				StartVehicleHorn (vehicle, 500, "NORMAL", -1)
				PlayVehicleDoorOpenSound(vehicle, 0)
				SetVehicleDoorsLocked(vehicle, 1)
				
				Citizen.Wait(450)
				PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
				exports["skeexsNotify"]:TriggerNotification({
					['type'] = "key",
					['message'] = '~lg~Unlocked~w~ ~lb~'..(GetVehicleNumberPlateText(vehicle))..'~w~'
				})
			end
		end

	end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end

function lockAnimation()
    local ply = PlayerPedId()
    RequestAnimDict("anim@heists@keycard@")
    while not HasAnimDictLoaded("anim@heists@keycard@") do
        Wait(0)
    end
    TaskPlayAnim(ply, "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
    Wait(600)
    ClearPedTasks(ply)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 303) and IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(400)
	
			-- D-pad down on controllers works, too!
		elseif IsControlJustReleased(0, 173) and not IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(400)
		end
	end
end)

