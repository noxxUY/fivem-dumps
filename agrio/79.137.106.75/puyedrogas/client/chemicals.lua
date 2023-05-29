local menuOpen = false
local wasOpen = false
local SpawnedChemicals = 0
local Chemicals = {}
local snowiCoordChemic = vector3(490.1802, -3326.044, 6.060791)
local checkLlega = false
RegisterNetEvent('snowiCheckPosChe', function()
TriggerServerEvent('snowiCallBChe', isPickingUp)
checkLlega = true end)
local kkkdsh= 2500

local afk = false
AddEventHandler('estoyAfk', function(a) 
if a == true then
	afk = true
else
	afk = false
end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(kkkdsh)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, snowiCoordChemic, true) < 30 then
			SpawnChemicals()
			print('Spawneo')
			kkkdsh=1
			Citizen.Wait(500)
		else
			kkkdsh = 2500
		end
	end
end)
local jusdg= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(jusdg)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.ChemicalsConvertionMenu.coords, true) < 5 then
			jusdg=1
			if not menuOpen then
				ESX.ShowFloatingHelpNotification(_U('chemicals_prompt'))

				if IsControlJustReleased(0, Keys['E']) then
					if Config.ChemicalsLicenseEnabled then
						chemicalsmenucheck()
					else
						wasOpen = true
						OpenChemicalsMenu()
					end
				end
			else
				jusdg=2500
			end
		--[[else
			if wasOpen then
				wasOpen = false
				ESX.UI.Menu.CloseAll()
			end

			Citizen.Wait(500)--]]
		end
	end
end)

function chemicalsmenucheck()

	ESX.TriggerServerCallback('esx_illegal:CheckLisense', function(cb)
		if cb then
			wasOpen = true
			OpenChemicalsMenu()
		else
			ESX.ShowNotification(_U('need_license'))
		end
	end)
end

function OpenChemicalsMenu()
	if afk == true then
		TriggerEvent('esx:showNotification', 'No puedes interactuar si estas AFK!')
		return
	end
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.ChemicalsConvertionItems[v.name]

		if price and v.count >= 0 then
			table.insert(elements, {
				label = ('%s  <span style="color:green;">%s</span>'):format("Make " .. v.label , ""),
				name = v.name,
			})
		end
	end


	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ChemicalsConvertionMenu', {
		title    = _U('ChemicalsConvertion_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		menu.close()
		menuOpen = false
		TriggerServerEvent('esx_illegal:ChemicalsConvertionMenu', data.current.name, 1)
	end, function(data, menu)
	end)
end
local kekekek = 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(kekekek)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID
		local nocheck = false
			if GetDistanceBetweenCoords(coords, GetEntityCoords(Chemicals[1]), false) < 20.0 then
				kekekek = 1
				for i=1, #Chemicals, 1 do
				--print('Drawmarker in '..GetEntityCoords(Chemicals[i]))
				nocheck = true
				DrawMarker(22, GetEntityCoords(Chemicals[i]).x,GetEntityCoords(Chemicals[i]).y,73.64, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5,0.5, 0.2, 0, 150, 250, 100, true, true, 2, false, false, false, false)
				end
			else
				kekekek = 1500
			
			end
			if nocheck == true then
		for i=1, #Chemicals, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(Chemicals[i]), false) < 1 then
				--print('Drawmarker in '..GetEntityCoords(Chemicals[i]))
				--DrawMarker(22, GetEntityCoords(Chemicals[i]).x,GetEntityCoords(Chemicals[i]).y,73.64, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5,0.5, 0.2, 0, 150, 250, 100, true, true, 2, false, false, false, false)
				
				nearbyObject, nearbyID = Chemicals[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			kekekek = 1

			if not isPickingUp then
				ESX.ShowFloatingHelpNotification(_U('chemicals_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

--				ESX.TriggerServerCallback('esx_illegal:canPickUp', function(canPickUp)

			--		if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(Chemicals, nearbyID)
						SpawnedChemicals = SpawnedChemicals - 1
		
						TriggerServerEvent('esx_illegal:pickedUpChemicals')
				--	else
			--			ESX.ShowNotification(_U('chemicals_inventoryfull'))
		--			end

					while not checkLlega do
						Citizen.Wait(1000)
					end
										isPickingUp = false
										checkLlega = false

			--	end, 'chemicals')
			end

	
		end
	end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Chemicals) do
			ESX.Game.DeleteObject(v)
		end
	end
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

function SpawnChemicals()
	while SpawnedChemicals < 10 do
		Citizen.Wait(0)
		local chemicalsCoords = GeneratechemicalsCoords()

		ESX.Game.SpawnLocalObject('prop_barrel_01a', chemicalsCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(Chemicals, obj)
			SpawnedChemicals = SpawnedChemicals + 1
		end)
	end
end

function ValidatechemicalsCoord(plantCoord)
	if SpawnedChemicals > 0 then
		local validate = true

		for k, v in pairs(Chemicals) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, snowiCoordChemic, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratechemicalsCoords()
	while true do
		Citizen.Wait(1)

		local chemicalsCoordX, chemicalsCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-7, 7)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-7, 7)

		chemicalsCoordX = snowiCoordChemic.x + modX
		chemicalsCoordY = snowiCoordChemic.y + modY

		local coordZ = GetCoordZChemicals(chemicalsCoordX, chemicalsCoordY)
		local coord = vector3(chemicalsCoordX, chemicalsCoordY, coordZ)

		if ValidatechemicalsCoord(coord) then
			return coord
		end
	end
end

function GetCoordZChemicals(x, y)
	local groundCheckHeights = { 03.0, 4.0, 5.0, 6.0, 7.0, 8.0,366.0, 365.0, 364.0, 367.0, 368.0, 363.0, 362.0, 369.0, 361.0, 370.0, 359.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 366.0
end