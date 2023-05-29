StartPostWork = function()
	if cachedPostJobData["isWorking"] then
		cachedPostJobData["isWorking"] = false

		for packageIndex = 1, #cachedPostJobData["packages"] do
			local package = cachedPostJobData["packages"][packageIndex]

			if DoesEntityExist(package) then
				while not NetworkHasControlOfEntity(package) do
					Citizen.Wait(0)
	
					NetworkRequestControlOfEntity(package)
				end
	
				DeleteEntity(package)
			end
		end

		if DoesEntityExist(cachedPostJobData["vehicle"]) then
			while not NetworkHasControlOfEntity(cachedPostJobData["vehicle"]) do
				Citizen.Wait(0)

				NetworkRequestControlOfEntity(cachedPostJobData["vehicle"])
			end

			DeleteEntity(cachedPostJobData["vehicle"])
		end

		return
	end

	cachedPostJobData["isWorking"] = true

	SpawnPostVehicle()
end

SpawnPostVehicle = function()
	if not ESX.Game.IsSpawnPointClear(Config.VehicleSpawn["coordinates"], 3.0) then
		ESX.ShowNotification("Mueva el vehículo que se encuentra en el punto de spawn.")

		return
	end

	ESX.Game.SpawnVehicle("boxville4", Config.VehicleSpawn["coordinates"], Config.VehicleSpawn["heading"], function(postVehicle)
		cachedPostJobData["vehicle"] = postVehicle

		SetEntityAsMissionEntity(postVehicle, true, true)

		SetVehicleNumberPlateText(postVehicle, Config.PlatePrefix)

		cachedPostJobData["vehicleBlip"] = AddBlipForEntity(postVehicle)

		SetBlipSprite(cachedPostJobData["vehicleBlip"], 85)
		SetBlipScale(cachedPostJobData["vehicleBlip"], 1.2)
		SetBlipColour(cachedPostJobData["vehicleBlip"], 66)
		BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Vehiculo de trabajo")
		EndTextCommandSetBlipName(cachedPostJobData["vehicleBlip"])

		SpawnPostPackages()
	end)
end

SpawnPostPackages = function()
	cachedPostJobData["packages"] = {}

	while not HasModelLoaded(Config.PackageModel) do
		Citizen.Wait(0)
		
		RequestModel(Config.PackageModel)
	end

	for packageIndex = 1, 5 do
		local packageEntity = CreateObject(Config.PackageModel, GetEntityCoords(cachedPostJobData["vehicle"]), true)

		SetEntityAsMissionEntity(packageEntity, true, true)

		table.insert(cachedPostJobData["packages"], packageEntity)

		AttachEntityToEntity(packageEntity, cachedPostJobData["vehicle"], 0, 0.0, -3.5 + (packageIndex / 2), -0.09, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, true)
	end

	RunJobThread()
end

RunJobThread = function()
	local GenerateNewLocation = function()
		if not cachedPostJobData["packages"][1] then
			ESX.ShowNotification("Regrese a la oficina y devuelva su camioneta, todos los paquetes entregados.")

			return
		end

		cachedPostJobData["deliverLocation"] = Config.PostDeliverySpots[math.random(#Config.PostDeliverySpots)]

		SetNewWaypoint(cachedPostJobData["deliverLocation"]["coordinates"]["x"], cachedPostJobData["deliverLocation"]["coordinates"]["y"])

		ESX.ShowNotification("Conduce hasta " .. cachedPostJobData["deliverLocation"]["location"] .. " y deje el paquete, su gps sabe el camino.")
	end

	GenerateNewLocation()

	local PickPackage = function(packageEntity)
		while not HasAnimDictLoaded("anim@heists@box_carry@") do
			Citizen.Wait(0)

			RequestAnimDict("anim@heists@box_carry@")
		end

		TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)

		Citizen.CreateThread(function()
			AttachEntityToEntity(packageEntity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		
			while IsEntityAttachedToEntity(packageEntity, PlayerPedId()) do
				if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
					TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
				end

				Citizen.Wait(0)
			end
		end)
	end

	local DropPackage = function(packageEntity)
		table.remove(cachedPostJobData["packages"], 1)

		DetachEntity(packageEntity, false, true)

		ClearPedTasks(PlayerPedId())

		Citizen.CreateThread(function()
			Citizen.Wait(math.random(1000, 2500))

			while not NetworkHasControlOfEntity(packageEntity) do
				Citizen.Wait(0)

				NetworkRequestControlOfEntity(packageEntity)
			end

			NetworkFadeOutEntity(packageEntity, true, true)

			Citizen.Wait(100)

			DeleteEntity(packageEntity)
		end)

		TriggerServerEvent("postman:receiveReward")

		GenerateNewLocation()
	end

	Citizen.CreateThread(function()
		while cachedPostJobData["isWorking"] and (DoesEntityExist(cachedPostJobData["vehicle"]) and DoesEntityExist(cachedPostJobData["packages"][1])) do
			local playerPed = PlayerPedId()
			local playerPedCoords = GetEntityCoords(playerPed)

			local currentPackage = cachedPostJobData["packages"][1]

			local distanceCheck = GetDistanceBetweenCoords(playerPedCoords, IsEntityAttachedToEntity(currentPackage, PlayerPedId()) and cachedPostJobData["deliverLocation"]["coordinates"] or GetEntityCoords(currentPackage), true)

			if distanceCheck <= 20.0 then
				local displayPos = IsEntityAttachedToEntity(currentPackage, PlayerPedId()) and cachedPostJobData["deliverLocation"]["coordinates"] or GetEntityCoords(currentPackage)
				local displayText = IsEntityAttachedToEntity(currentPackage, PlayerPedId()) and "Dejar ~y~paquete~s~ en ~g~" .. cachedPostJobData["deliverLocation"]["location"] or "Coger ~y~paquete"

				if distanceCheck <= 1.5 then
					displayText = "[~g~E~s~] " .. displayText

					if IsControlJustReleased(0, 38) then
						if string.match(displayText, "Coger") then
							if (GetVehicleDoorAngleRatio(cachedPostJobData["vehicle"], 2) and GetVehicleDoorAngleRatio(cachedPostJobData["vehicle"], 3)) ~= 0 then
								PickPackage(currentPackage)
							else
								ESX.ShowNotification("Abre las puertas.")
							end
						else
							DropPackage(currentPackage)
						end
					end
				end

				ESX.Game.Utils.DrawText3D(displayPos, displayText, 0.6)
			end

			Citizen.Wait(5)
		end
	end)
end