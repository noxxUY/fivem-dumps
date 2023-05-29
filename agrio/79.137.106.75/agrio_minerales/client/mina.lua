
local spawnedPiedras = 0
local Piedras = {}
local isPickingUp = false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.Piedras.coords, true) < 50 then
			SpawnPiedras()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID
		local playerPed = PlayerPedId()
        local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))


		for i=1, #Piedras, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(Piedras[i]), false) < 1 then
				nearbyObject, nearbyID = Piedras[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then 
				ESX.ShowFloatingHelpNotification("~y~[E]~w~ para obtener minerales", vector3(playerX, playerY, playerZ))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('minero:cosechar', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_GARDENER_PLANT', 0, false)
						exports['progressBars2']:startUI(10000, "Obteniendo minerales")
						Citizen.Wait(9000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
						
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(Piedras, nearbyID)
						spawnedPiedras = spawnedPiedras - 1
		
						TriggerServerEvent('minero:delux')
					else
						ESX.ShowNotification("No puedes cargar más")
					end

					isPickingUp = false

				end)
			
				
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Piedras) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnPiedras()
	while spawnedPiedras < 5 do
		Citizen.Wait(0)
		local weedCoords = GeneratePiedrasCoords()

		ESX.Game.SpawnLocalObject('prop_rock_1_i', weedCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(Piedras, obj)
			spawnedPiedras = spawnedPiedras + 1
		end)
	end
end

function ValidatePiedrasCoord(plantCoord)
	if spawnedPiedras > 0 then
		local validate = true

		for k, v in pairs(Piedras) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 1 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.Piedras.coords, false) > 35 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratePiedrasCoords()
	while true do
		Citizen.Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		weedCoordX = Config.CircleZones.Piedras.coords.x + modX
		weedCoordY = Config.CircleZones.Piedras.coords.y + modY

		local coordZ = GetCoordZtrigos(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidatePiedrasCoord(coord) then
			return coord
		end
	end
end

function GetCoordZtrigos(x, y)
	local groundCheckHeights = { 70.0, 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 77
end


