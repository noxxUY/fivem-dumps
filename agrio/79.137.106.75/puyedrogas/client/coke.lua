local spawnedCocaLeaf = 0
local CocaPlants = {}
local isPickingUp, isProcessing = false, false
--local coordSnowi = vector3(2007.74, 503.43, 164.65)
local coordSnowi = vector3(3495.692, 2578.312, 12.51428)
local coordsProces =  vector3(1015.952, 2387.802, 51.15088) 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
local duerme = true
		if GetDistanceBetweenCoords(coords, coordSnowi, true) < 50 then
			duerme = false
			SpawnCocaPlants()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
		if duerme == true then
			Citizen.Wait(3000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
local d1 = true
		if GetDistanceBetweenCoords(coords, coordsProces, true) < 5 then
			d1 = false
			if not isProcessing then
				ESX.ShowFloatingHelpNotification(_U('coke_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessWeed()
						else
							OpenBuyLicenseMenu('coke_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'coke_processing')
				else
					ProcessCoke()
				end

			end
		else
			Citizen.Wait(500)
		end
		if d1 == true then
			Citizen.Wait(2500)
		end
	end
end)
local checkLlega = false
RegisterNetEvent('snowiCheckPos', function()
TriggerServerEvent('snowiCallB', isPickingUp)
checkLlega = true end)

local afk = false
AddEventHandler('estoyAfk', function(a) 
if a == true then
	afk = true
else
	afk = false
end
end)

function ProcessCoke()
	if afk == true then
		TriggerEvent('esx:showNotification', 'No puedes interactuar si estas AFK!')
		return
	end
	isProcessing = true

	ESX.ShowNotification(_U('coke_processingstarted'))
	TriggerServerEvent('esx_illegal:processCocaLeaf')
	local timeLeft = Config.Delays.CokeProcessing / 1000
	local playerPed = PlayerPedId()
	while not HasAnimDictLoaded('dam_rec_civi') do
		RequestAnimDict('dam_rec_civi') Wait(100)
	end
	ESX.ShowNotification('Sientes la coca en tus manos y poco a poco te estas volviendo TRAMBÓLICO')
    TaskPlayAnim(GetPlayerPed(-1), 'dam_rec_civi', 'floor_back', 8.0, -8, -1, 49, 0, 0, 0, 0)

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), coordsProces, false) > 5 then
			ESX.ShowNotification(_U('coke_processingtoofar'))

			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID
		local d2 = true

		for i=1, #CocaPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(CocaPlants[i]), false) < 1 then
				d2 = false
				nearbyObject, nearbyID = CocaPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowFloatingHelpNotification(_U('coke_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

--				ESX.TriggerServerCallback('esx_illegal:canPickUp', function(canPickUp)

				--	if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(CocaPlants, nearbyID)
						spawnedCocaLeaf = spawnedCocaLeaf - 1
		
						TriggerServerEvent('esx_illegal:pickedUpCocaLeaf')
				--	else
				--		ESX.ShowNotification(_U('coke_inventoryfull'))
				--	end
while not checkLlega do
	Citizen.Wait(1000)
end
					isPickingUp = false
					checkLlega = false

				--end, 'coca_leaf')
			end

		else
			Citizen.Wait(500)
		end
		if d2 == true then
			Citizen.Wait(2500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(CocaPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnCocaPlants()
	while spawnedCocaLeaf < 35 do
		
		Citizen.Wait(5)
		local weedCoords = GenerateCocaLeafCoords()
		print('Spawned '..weedCoords.x..'//'..weedCoords.y..'//'..weedCoords.z)
		ESX.Game.SpawnLocalObject('prop_plant_01a', weedCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			--PlaceObjectOnGroundProperly_2(obj)
			FreezeEntityPosition(obj, true)

			table.insert(CocaPlants, obj)
			spawnedCocaLeaf = spawnedCocaLeaf + 1
		end)
	end
end

function ValidateCocaLeafCoord(plantCoord)

	if spawnedCocaLeaf > 0 then
		local validate = true

		for k, v in pairs(CocaPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, coordSnowi, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateCocaLeafCoords()
	while true do
		Citizen.Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		weedCoordX = coordSnowi.x + modX
		weedCoordY = coordSnowi.y + modY

		local coordZ = GetCoordZCoke(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateCocaLeafCoord(coord) then
			return coord
		end
	end
end

function GetCoordZCoke(x, y)
	local groundCheckHeights = { 13.0, 12.0, 11.0, 10.0, 14.0, 15.0, 18.0, 17.0, 16.0, 15.0, 19.0, 20.0, 21.0, 22.0, 70.0, 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0, 163.0, 164.0, 165.0, 115.0, 114.0, 116.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 77
end