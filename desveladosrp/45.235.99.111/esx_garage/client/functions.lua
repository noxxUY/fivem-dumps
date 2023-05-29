OpenGarageMenu = function()
    local currentGarage = cachedData["currentGarage"]

    if not currentGarage then return end

    HandleCamera(currentGarage, true)

    ESX.TriggerServerCallback("garage:fetchPlayerVehicles", function(fetchedVehicles)
        local menuElements = {}

        for key, vehicleData in ipairs(fetchedVehicles) do
            local vehicleProps = vehicleData["props"]

            table.insert(menuElements, {
                ["label"] = '<b><span style="color: red;">🚗 Vehiculo:</b></span> ' .. GetLabelText(GetDisplayNameFromVehicleModel(vehicleProps["model"])) .. ' | <b><span style="color: green;">🔑 Patente:</b></span> ' .. vehicleData["plate"],
                ["vehicle"] = vehicleData
            })
        end

        if #menuElements == 0 then
            table.insert(menuElements, {
                ["label"] = "No has aparcado ningún vehículo aquí."
            })
        elseif #menuElements > 0 then
            SpawnLocalVehicle(menuElements[1]["vehicle"]["props"], currentGarage)
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_garage_menu", {
            ["title"] = "Garage - " .. currentGarage,
            ["align"] = Config.AlignMenu,
            ["elements"] = menuElements
        }, function(menuData, menuHandle)
            local currentVehicle = menuData["current"]["vehicle"]

            if currentVehicle then
                menuHandle.close()

                SpawnVehicle(currentVehicle["props"])
            end
        end, function(menuData, menuHandle)
            HandleCamera(currentGarage, false)

            menuHandle.close()
        end, function(menuData, menuHandle)
            local currentVehicle = menuData["current"]["vehicle"]

            if currentVehicle then
                SpawnLocalVehicle(currentVehicle["props"])
            end
        end)
    end, currentGarage)
end

ChooseVehicleAction = function(vehicleEntity, callback)
    if not cachedData["blips"] then cachedData["blips"] = {} end

    local menuElements = {
        {
            ["label"] = "<b>"..(GetVehicleDoorLockStatus(vehicleEntity) == 1 and "Cerrar" or "Abrir") .. " vehiculo.</b>",
            ["action"] = "change_lock_state"
        },
        {
            ["label"] = "<b>"..(GetIsVehicleEngineRunning(vehicleEntity) and "Apagar" or "Encender") .. " motor.</b>",
            ["action"] = "change_engine_state"
        },
        {
            ["label"] = "<b>Localizar GPS.</b>",
            ["action"] = "change_gps_state"
        },
        {
            ["label"] = "<b>Abrir/cerrar puertas.</b>",
            ["action"] = "change_door_state"
        },
    }

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "second_vehicle_menu", {
        ["title"] = "Gestión del vehículo",
        ["align"] = "right",
        ["elements"] = menuElements
    }, function(menuData, menuHandle)
        local currentAction = menuData["current"]["action"]

        if currentAction then
            menuHandle.close()

            callback(currentAction)
        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end

VehicleAction = function(vehicleEntity, action)
    local dstCheck = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(vehicleEntity))

    while not NetworkHasControlOfEntity(vehicleEntity) do
        Citizen.Wait(0)
    
        NetworkRequestControlOfEntity(vehicleEntity)
    end

    if action == "change_lock_state" then
        if dstCheck >= Config.RangeCheck then return ESX.ShowNotification("Too far away from the vehicle to control it.") end

        PlayAnimation(PlayerPedId(), "anim@mp_player_intmenu@key_fob@", "fob_click", {
            ["speed"] = 8.0,
            ["speedMultiplier"] = 8.0,
            ["duration"] = 1820,
            ["flag"] = 49,
            ["playbackRate"] = false
        })

        for index = 1, 4 do
            if (index % 2 == 0) then
                SetVehicleLights(vehicleEntity, 2)
            else
                SetVehicleLights(vehicleEntity, 0)
            end

            Citizen.Wait(300)
        end

        StartVehicleHorn(vehicleEntity, 50, 1, false)
        
        local vehicleLockState = GetVehicleDoorLockStatus(vehicleEntity)

        if vehicleLockState == 1 then
            SetVehicleDoorsLocked(vehicleEntity, 2)
            PlayVehicleDoorCloseSound(vehicleEntity, 1)
        elseif vehicleLockState == 2 then
            SetVehicleDoorsLocked(vehicleEntity, 1)
            PlayVehicleDoorOpenSound(vehicleEntity, 0)

            local oldCoords = GetEntityCoords(PlayerPedId())
            local oldHeading = GetEntityHeading(PlayerPedId())

            if not IsPedInVehicle(PlayerPedId(), vehicleEntity) and not DoesEntityExist(GetPedInVehicleSeat(vehicleEntity, -1)) then
                SetPedIntoVehicle(PlayerPedId(), vehicleEntity, -1)
                TaskLeaveVehicle(PlayerPedId(), vehicleEntity, 16)
                SetEntityCoords(PlayerPedId(), oldCoords - vector3(0.0, 0.0, 0.99))
                SetEntityHeading(PlayerPedId(), oldHeading)
            end
        end

        ESX.ShowNotification(GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicleEntity))) .. " with plate - " .. GetVehicleNumberPlateText(vehicleEntity) .. " is now " .. (vehicleLockState == 1 and "LOCKED" or "UNLOCKED"))
    elseif action == "change_door_state" then
        if dstCheck >= Config.RangeCheck then return ESX.ShowNotification("Too far away from the vehicle to control it.") end

        ChooseDoor(vehicleEntity, function(doorChosen)
            if doorChosen then
                if GetVehicleDoorAngleRatio(vehicleEntity, doorChosen) == 0 then
                    SetVehicleDoorOpen(vehicleEntity, doorChosen, false, false)
                else
                    SetVehicleDoorShut(vehicleEntity, doorChosen, false, false)
                end
            end
        end)
    elseif action == "change_engine_state" then
        if dstCheck >= Config.RangeCheck then return ESX.ShowNotification("Too far away from the vehicle to control it.") end

        if GetIsVehicleEngineRunning(vehicleEntity) then
            SetVehicleEngineOn(vehicleEntity, false, false)

            cachedData["engineState"] = true

            Citizen.CreateThread(function()
                while cachedData["engineState"] do
                    Citizen.Wait(5)

                    SetVehicleUndriveable(vehicleEntity, true)
                end

                SetVehicleUndriveable(vehicleEntity, false)
            end)
        else
            cachedData["engineState"] = false

            SetVehicleEngineOn(vehicleEntity, true, true)
        end
    elseif action == "change_gps_state" then
        if DoesBlipExist(cachedData["blips"][vehicleEntity]) then
            RemoveBlip(cachedData["blips"][vehicleEntity])
        else
            cachedData["blips"][vehicleEntity] = AddBlipForEntity(vehicleEntity)
    
            SetBlipSprite(cachedData["blips"][vehicleEntity], GetVehicleClass(vehicleEntity) == 8 and 226 or 225)
            SetBlipScale(cachedData["blips"][vehicleEntity], 1.05)
            SetBlipColour(cachedData["blips"][vehicleEntity], 30)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Vehiculo Personal - " .. GetVehicleNumberPlateText(vehicleEntity))
            EndTextCommandSetBlipName(cachedData["blips"][vehicleEntity])
        end
    end
end

ChooseDoor = function(vehicleEntity, callback)
    local menuElements = {
        {
            ["label"] = "<b>Puerta delantera (izquierda).</b>",
            ["door"] = 0
        },
        {
            ["label"] = "<b>Puerta delantera (derecha).</b>",
            ["door"] = 1
        },
        {
            ["label"] = "<b>Puerta trasera (izquierda).</b>",
            ["door"] = 2
        },
        {
            ["label"] = "<b>Puerta trasera (derecha).</b>",
            ["door"] = 3
        },
        {
            ["label"] = "<b>Capo.</b>",
            ["door"] = 4
        },
        {
            ["label"] = "<b>Maletero.</b>",
            ["door"] = 5
        }
    }

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "door_vehicle_menu", {
        ["title"] = "Gestíon del vehúclo",
        ["align"] = "right",
        ["elements"] = menuElements
    }, function(menuData, menuHandle)
        local currentDoor = menuData["current"]["door"]

        if currentDoor then
            callback(currentDoor)
        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end

SpawnLocalVehicle = function(vehicleProps)
	local spawnpoint = Config.Garages[cachedData["currentGarage"]]["positions"]["vehicle"]

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint["position"], 0.0) then 
		ESX.ShowNotification("Todos los puntos de apararición están ocupados, deberás esperar")
		return
	end
	
	if not IsModelValid(vehicleProps["model"]) then
		return
	end

	ESX.Game.SpawnLocalVehicle(vehicleProps["model"], spawnpoint["position"], spawnpoint["heading"], function(yourVehicle)
		cachedData["vehicle"] = yourVehicle

		SetVehicleProperties(yourVehicle, vehicleProps)

		SetModelAsNoLongerNeeded(vehicleProps["model"])
	end)
end

SpawnVehicle = function(vehicleProps)
	local spawnpoint = Config.Garages[cachedData["currentGarage"]]["positions"]["vehicle"]

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint["position"], 0.0) then 
		ESX.ShowNotification("Todos los puntos de apararición están ocupados, deberás esperar")

		return
	end
	
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				ESX.ShowNotification("Este vehículo está en las calles, no puedes sacar 2 de los mismos vehículos.")

				return HandleCamera(cachedData["currentGarage"])
			end
		end
	end

	ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint["position"], spawnpoint["heading"], function(yourVehicle)
		SetVehicleProperties(yourVehicle, vehicleProps)

        NetworkFadeInEntity(yourVehicle, true, true)

		SetModelAsNoLongerNeeded(vehicleProps["model"])

		TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)

        SetEntityAsMissionEntity(yourVehicle, true, true)
        
        ESX.ShowNotification("Acabas de retirar tu vehiculo del Garage.")

        HandleCamera(cachedData["currentGarage"])
	end)
end

PutInVehicle = function()
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())

	if DoesEntityExist(vehicle) then
		local vehicleProps = GetVehicleProperties(vehicle)

		ESX.TriggerServerCallback("garage:validateVehicle", function(valid)
			if valid then
				TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
	
				while IsPedInVehicle(PlayerPedId(), vehicle, true) do
					Citizen.Wait(0)
				end
	
				Citizen.Wait(500)
	
				NetworkFadeOutEntity(vehicle, true, true)
	
				Citizen.Wait(100)
	
				ESX.Game.DeleteVehicle(vehicle)

				ESX.ShowNotification("Vehículo estacionado correctamente.")
			else
				ESX.ShowNotification("Este vehículo no te pertenece.")
			end

		end, vehicleProps, cachedData["currentGarage"])
	end
end

SetVehicleProperties = function(vehicle, vehicleProps)
    ESX.Game.SetVehicleProperties(vehicle, vehicleProps)

    SetVehicleEngineHealth(vehicle, vehicleProps["engineHealth"] and vehicleProps["engineHealth"] + 0.0 or 1000.0)
    SetVehicleBodyHealth(vehicle, vehicleProps["bodyHealth"] and vehicleProps["bodyHealth"] + 0.0 or 1000.0)
    SetVehicleFuelLevel(vehicle, vehicleProps["fuelLevel"] and vehicleProps["fuelLevel"] + 0.0 or 1000.0)

    if vehicleProps["windows"] then
        for windowId = 1, 13, 1 do
            if vehicleProps["windows"][windowId] == false then
                SmashVehicleWindow(vehicle, windowId)
            end
        end
    end

    if vehicleProps["tyres"] then
        for tyreId = 1, 7, 1 do
            if vehicleProps["tyres"][tyreId] ~= false then
                SetVehicleTyreBurst(vehicle, tyreId, true, 1000)
            end
        end
    end

    if vehicleProps["doors"] then
        for doorId = 0, 5, 1 do
            if vehicleProps["doors"][doorId] ~= false then
                SetVehicleDoorBroken(vehicle, doorId - 1, true)
            end
        end
    end
end

GetVehicleProperties = function(vehicle)
    if DoesEntityExist(vehicle) then
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

        vehicleProps["tyres"] = {}
        vehicleProps["windows"] = {}
        vehicleProps["doors"] = {}

        for id = 1, 7 do
            local tyreId = IsVehicleTyreBurst(vehicle, id, false)
        
            if tyreId then
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = tyreId
        
                if tyreId == false then
                    tyreId = IsVehicleTyreBurst(vehicle, id, true)
                    vehicleProps["tyres"][ #vehicleProps["tyres"]] = tyreId
                end
            else
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = false
            end
        end

        for id = 1, 13 do
            local windowId = IsVehicleWindowIntact(vehicle, id)

            if windowId ~= nil then
                vehicleProps["windows"][#vehicleProps["windows"] + 1] = windowId
            else
                vehicleProps["windows"][#vehicleProps["windows"] + 1] = true
            end
        end
        
        for id = 0, 5 do
            local doorId = IsVehicleDoorDamaged(vehicle, id)
        
            if doorId then
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = doorId
            else
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = false
            end
        end

        vehicleProps["engineHealth"] = GetVehicleEngineHealth(vehicle)
        vehicleProps["bodyHealth"] = GetVehicleBodyHealth(vehicle)
        vehicleProps["fuelLevel"] = GetVehicleFuelLevel(vehicle)

        return vehicleProps
    end
end

HandleAction = function(action)
    if action == "menu" then
        OpenGarageMenu()
    elseif action == "vehicle" then
        PutInVehicle()
    end
end

HandleCamera = function(garage, toggle)
    local Camerapos = Config.Garages[garage]["camera"]

    if not Camerapos then return end

	if not toggle then
		if cachedData["cam"] then
			DestroyCam(cachedData["cam"])
		end
		
		if DoesEntityExist(cachedData["vehicle"]) then
			DeleteEntity(cachedData["vehicle"])
		end

		RenderScriptCams(0, 1, 750, 1, 0)

		return
	end

	if cachedData["cam"] then
		DestroyCam(cachedData["cam"])
	end

	cachedData["cam"] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

	SetCamCoord(cachedData["cam"], Camerapos["x"], Camerapos["y"], Camerapos["z"])
	SetCamRot(cachedData["cam"], Camerapos["rotationX"], Camerapos["rotationY"], Camerapos["rotationZ"])
	SetCamActive(cachedData["cam"], true)

	RenderScriptCams(1, 1, 750, 1, 1)

	Citizen.Wait(500)
end

DrawScriptMarker = function(markerData)
    DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 25 ) or 0.0, 0.0, 0.0, markerData["sizeX"] or 0.25, markerData["sizeY"] or 0.25, markerData["sizeZ"] or 0.25, markerData["r"] or 0.25, markerData["g"] or 0.25, markerData["b"] or 0.25, 100, false, true, 2, false, false, false, false)
end

PlayAnimation = function(ped, dict, anim, settings)
	if dict then
        Citizen.CreateThread(function()
            RequestAnimDict(dict)

            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(100)
            end

            if settings == nil then
                TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
            else 
                local speed = 1.0
                local speedMultiplier = -1.0
                local duration = 1.0
                local flag = 0
                local playbackRate = 0

                if settings["speed"] then
                    speed = settings["speed"]
                end

                if settings["speedMultiplier"] then
                    speedMultiplier = settings["speedMultiplier"]
                end

                if settings["duration"] then
                    duration = settings["duration"]
                end

                if settings["flag"] then
                    flag = settings["flag"]
                end

                if settings["playbackRate"] then
                    playbackRate = settings["playbackRate"]
                end

                TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
            end
      
            RemoveAnimDict(dict)
		end)
	else
		TaskStartScenarioInPlace(ped, anim, 0, true)
	end
end

WaitForModel = function(model)
    local DrawScreenText = function(text, red, green, blue, alpha)
        SetTextFont(4)
        SetTextScale(0.0, 0.5)
        SetTextColour(red, green, blue, alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(true)
    
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(0.5, 0.5)
    end

    if not IsModelValid(model) then
        return ESX.ShowNotification("Este modelo ("..model..") no está en el servidor. Reporta el error ante el staff.")
    end

	if not HasModelLoaded(model) then
		RequestModel(model)
	end
	
	while not HasModelLoaded(model) do
		Citizen.Wait(0)

		DrawScreenText("Cargando...", 255, 255, 255, 150)
	end
end