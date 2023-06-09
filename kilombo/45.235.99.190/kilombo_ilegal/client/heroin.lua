local spawnedPoppys = 0
local PoppyPlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(PlayerPedId())
		local distancia = #(coords - Config.CircleZones.HeroinField.coords)
		local sleep = 500
		
		if distancia < 50 then
			sleep = 1
			SpawnPoppyPlants()
			Citizen.Wait(500)
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local distancia = #(coords - Config.CircleZones.HeroinProcessing.coords)
		local sleep = 500

		if distancia < 5 then
			sleep = 1
			if not isProcessing then
				ESX.ShowHelpNotification(_U('heroin_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessHeroin()
						else
							OpenBuyLicenseMenu('heroin_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'heroin_processing')
				else
					ProcessHeroin()
				end

			end
		end
		Citizen.Wait(sleep)
	end
end)

function ProcessHeroin()
	isProcessing = true

	ESX.ShowNotification(_U('heroin_processingstarted'))
	TriggerServerEvent('kilombo_ilegal:processPoppyResin')
	local timeLeft = Config.Delays.HeroinProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.HeroinProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('heroin_processingtoofar'))
			TriggerServerEvent('kilombo_ilegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID
		local sleep = 500
		
		for i=1, #PoppyPlants, 1 do
			local distancia = #(coords - GetEntityCoords(PoppyPlants[i]))
			if distancia < 2 then
				nearbyObject, nearbyID = PoppyPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			sleep = 1
			if not isPickingUp then
				ESX.ShowHelpNotification(_U('heroin_pickupprompt'))
			else
				ESX.HideUI()
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('kilombo_ilegal:canPickUp', function(canPickUp)

					if canPickUp then
						-- TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
						if lib.progressCircle({
							duration = 6000,
							label = "Cosechando Opio",
							position = 'middle',
							useWhileDead = false,
							canCancel = true,
							allowCuffed = false,
							disable = {
								car = true,
								move = true
							},
							anim = {
								scenario = 'world_human_gardener_plant'
							}
						}) then
							ClearPedTasks(playerPed)
							Citizen.Wait(1500)
			
							ESX.Game.DeleteObject(nearbyObject)
			
							table.remove(PoppyPlants, nearbyID)
							spawnedPoppys = spawnedPoppys - 1
			
							TriggerServerEvent('kilombo_ilegal:pickedUpPoppy')
							ClearPedTasksImmediately(playerPed)
						end

					else
						ESX.ShowNotification(_U('poppy_inventoryfull'))
					end

					isPickingUp = false

				end, 'poppyresin')
			end
		end
		Citizen.Wait(sleep)
	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(PoppyPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnPoppyPlants()
	while spawnedPoppys < 15 do
		Citizen.Wait(0)
		local heroinCoords = GenerateHeroinCoords()

		ESX.Game.SpawnLocalObject('prop_fib_plant_02', heroinCoords, function(obj)
		--ESX.Game.SpawnLocalObject('prop_plant_cane_01a', heroinCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(PoppyPlants, obj)
			spawnedPoppys = spawnedPoppys + 1
		end)
	end
end

function ValidateHeroinCoord(plantCoord)
	if spawnedPoppys > 0 then
		local validate = true

		for k, v in pairs(PoppyPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.HeroinField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateHeroinCoords()
	while true do
		Citizen.Wait(1)

		local heroinCoordX, heroinCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		heroinCoordX = Config.CircleZones.HeroinField.coords.x + modX
		heroinCoordY = Config.CircleZones.HeroinField.coords.y + modY
		heroinCoordZ = Config.CircleZones.HeroinField.coords.z

		--local coordZ = GetCoordZHeroin(heroinCoordX, heroinCoordY)
		local coordZ = heroinCoordZ
		local coord = vector3(heroinCoordX, heroinCoordY, coordZ)

		if ValidateHeroinCoord(coord) then
			return coord
		end
	end
end

function GetCoordZHeroin(x, y)
	local groundCheckHeights = { 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 12.64
end