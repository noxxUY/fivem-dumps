local spawnedPoppys = 0
local PoppyPlants = {}
local isPickingUp, isProcessing = false, false

local snowicoordsHeroinFarm =vector3(-2167.424, 1499.275, 299.9385) 
local snowicoordsHeroinProcess =  vector3(-2079.903, 2609.815, 3.078369)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, snowicoordsHeroinFarm, true) < 50 then
			SpawnPoppyPlants()
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

		if GetDistanceBetweenCoords(coords, snowicoordsHeroinProcess, true) < 5 then
			if not isProcessing then
				ESX.ShowFloatingHelpNotification(_U('heroin_processprompt'))
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
		else
			Citizen.Wait(500)
		end
	end
end)
local afk = false
AddEventHandler('estoyAfk', function(a) 
if a == true then
	afk = true
else
	afk = false
end
end)
function ProcessHeroin()
	if afk == true then
		TriggerEvent('esx:showNotification', 'No puedes interactuar si estas AFK!')
		return
	end
	isProcessing = true

	ESX.ShowNotification(_U('heroin_processingstarted'))
	TriggerServerEvent('esx_illegal:processPoppyResin')
	local timeLeft = Config.Delays.HeroinProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), snowicoordsHeroinProcess, false) > 5 then
			ESX.ShowNotification(_U('heroin_processingtoofar'))
			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end
local checkLlega = false
RegisterNetEvent('snowiCheckPosPopy', function()
TriggerServerEvent('snowiCallBPopy', isPickingUp)
checkLlega = true end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #PoppyPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(PoppyPlants[i]), false) < 1 then
				nearbyObject, nearbyID = PoppyPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowFloatingHelpNotification(_U('heroin_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				--ESX.TriggerServerCallback('esx_illegal:canPickUp', function(canPickUp)

					--if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(PoppyPlants, nearbyID)
						spawnedPoppys = spawnedPoppys - 1
		
						TriggerServerEvent('esx_illegal:pickedUpPoppy')
				--	else
				--		ESX.ShowNotification(_U('poppy_inventoryfull'))
				--	end

					while not checkLlega do
						Citizen.Wait(1000)
					end
										isPickingUp = false
										checkLlega = false

			--	end, 'poppyresin')
			end

		else
			Citizen.Wait(500)
		end

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

		ESX.Game.SpawnLocalObject('prop_cs_plant_01', heroinCoords, function(obj)
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

		if GetDistanceBetweenCoords(plantCoord, snowicoordsHeroinFarm, false) > 50 then
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

		heroinCoordX = snowicoordsHeroinFarm.x + modX
		heroinCoordY = snowicoordsHeroinFarm.y + modY

		local coordZ = GetCoordZHeroin(heroinCoordX, heroinCoordY)
		local coord = vector3(heroinCoordX, heroinCoordY, coordZ)

		if ValidateHeroinCoord(coord) then
			return coord
		end
	end
end

function GetCoordZHeroin(x, y)
	local groundCheckHeights = { 70.0, 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 9.0, 8.0, 7.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 114.0, 115.0, 116.0, 117.0, 118.0, 52.0, 51.0, 53.0, 54.0, 55.0, 299.0, 298.0, 297.0, 296.0, 295.0, 300.0, 301.0, 302.0, 303.0, 304.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 12.64
end