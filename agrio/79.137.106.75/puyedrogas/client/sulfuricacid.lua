local spawnedSulfuricAcidBarrels = 0
local SulfuricAcidBarrels = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())		

		if GetDistanceBetweenCoords(coords, Config.CircleZones.SulfuricAcidFarm.coords, true) < 50 then
			SpawnSulfuricAcidBarrels()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)
local checkLlega = false
RegisterNetEvent('snowiCheckPosSulfu', function()
TriggerServerEvent('snowiCallBSulfu', isPickingUp)
checkLlega = true end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPe3 = PlayerPedId()
		local coords = GetEntityCoords(playerPe3)
		local nearbyObject3, nearbyID3

		for i=1, #SulfuricAcidBarrels, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(SulfuricAcidBarrels[i]), false) < 1 then
				nearbyObject3, nearbyID3 = SulfuricAcidBarrels[i], i
			end
		end

		if nearbyObject3 and IsPedOnFoot(playerPe3) then

			if not isPickingUp then
				ESX.ShowFloatingHelpNotification(_U('SulfuricAcid_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

--				ESX.TriggerServerCallback('esx_illegal:canPickUp', function(canPickUp)

			--		if canPickUp then
						TaskStartScenarioInPlace(playerPe3, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPe3)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject3)
		
						table.remove(SulfuricAcidBarrels, nearbyID3)
						spawnedSulfuricAcidBarrels = spawnedSulfuricAcidBarrels - 1
		
						TriggerServerEvent('esx_illegal:pickedUpSulfuricAcid')
				--	else
				--		ESX.ShowNotification(_U('sodium_hydroxide_inventoryfull'))
				--	end

					while not checkLlega do
						Citizen.Wait(1000)
					end
										isPickingUp = false
										checkLlega = false

				--end, 'sodium_hydroxide')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(SulfuricAcidBarrels) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnSulfuricAcidBarrels()
	while spawnedSulfuricAcidBarrels < 10 do
		Citizen.Wait(0)
		local weedCoords2 = GenerateSulfuricAcidCoords()

		ESX.Game.SpawnLocalObject('prop_barrel_02a', weedCoords2, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(SulfuricAcidBarrels, obj)
			spawnedSulfuricAcidBarrels = spawnedSulfuricAcidBarrels + 1
		end)
	end
end

function ValidateSulfuricAcidCoord(plantCoord)
	if spawnedSulfuricAcidBarrels > 0 then
		local validate2 = true

		for k, v in pairs(SulfuricAcidBarrels) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate2 = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.SulfuricAcidFarm.coords, false) > 50 then
			validate2 = false
		end

		return validate2
	else
		return true
	end
end

function GenerateSulfuricAcidCoords()
	while true do
		Citizen.Wait(1)

		local weed3CoordX, weed3CoordY

		math.randomseed(GetGameTimer())
		local modX3 = math.random(-7, 7)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY3 = math.random(-7, 7)

		weed3CoordX = Config.CircleZones.SulfuricAcidFarm.coords.x + modX3
		weed3CoordY = Config.CircleZones.SulfuricAcidFarm.coords.y + modY3

		local coordZ3 = GetCoordZSulfuricAcid(weed3CoordX, weed3CoordY)
		local coord3 = vector3(weed3CoordX, weed3CoordY, coordZ3)

		if ValidateSulfuricAcidCoord(coord3) then
			return coord3
		end
	end
end

function GetCoordZSulfuricAcid(x, y)
	local groundCheckHeights = { 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0 }

	for i, height in ipairs(groundCheckHeights) do
		local found3Ground, z = GetGroundZFor_3dCoord(x, y, height)

		if found3Ground then
			return z
		end
	end

	return 18
end