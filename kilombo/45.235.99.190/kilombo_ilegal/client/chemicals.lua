local menuOpen = false
local wasOpen = false
local SpawnedChemicals = 0
local Chemicals = {}

local HasAlreadyEnteredMarker, IsInShopMenu = false, false
local CurrentAction, CurrentActionMsg, LastZone, currentDisplayVehicle, CurrentVehicleData
local CurrentActionData, Vehicles, Categories = {}, {}, {}
local procesando = false

Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(PlayerPedId())
		local distancia = #(coords - Config.CircleZones.ChemicalsField.coords)
		local sleep = 500

		if distancia < 50 then
			sleep = 1
			SpawnChemicals()
			Citizen.Wait(500)
		end
		Citizen.Wait(sleep)
	end
end)

-- Enter / Exit marker events & Draw Markers
Citizen.CreateThread(function()
	while true do
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true
		local sleep = 500

		for k,v in pairs(Config.Zones) do
			local distance = #(playerCoords - Config.Zones.ChemicalsConvertionMenu.Pos)
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			local distancia = #(coords - Config.CircleZones.ChemicalsConvertionMenu.coords)

			--if distance < Config.DrawDistance then
			if distancia < Config.DrawDistance then
				sleep = 1

				if Config.Zones.ChemicalsConvertionMenu.Type ~= -1 then
					DrawMarker(Config.Zones.ChemicalsConvertionMenu.Type, Config.Zones.ChemicalsConvertionMenu.Pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.ChemicalsConvertionMenu.Size.x, Config.Zones.ChemicalsConvertionMenu.Size.y, Config.Zones.ChemicalsConvertionMenu.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, nil, nil, false)
				end

				--if distance < Config.Zones.ChemicalsConvertionMenu.Size.x then
				if distancia < 2 then
					isInMarker, currentZone = true, k
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			LastZone = currentZone
			TriggerEvent('kilombo_ilegal:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('kilombo_ilegal:hasExitedMarker', LastZone)
		end
		Citizen.Wait(sleep)
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'petroleo_menu' then
					OpenChemicalsMenu()
				end
				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('kilombo_ilegal:AnimacionPetroleo')
AddEventHandler('kilombo_ilegal:AnimacionPetroleo', function()

	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)

end)

RegisterNetEvent('kilombo_ilegal:AnimacionPetroleoSTOP')
AddEventHandler('kilombo_ilegal:AnimacionPetroleoSTOP', function()

	ClearPedTasksImmediately(PlayerPedId())

end)


RegisterNetEvent('kilombo_ilegal:hasEnteredMarker')
AddEventHandler('kilombo_ilegal:hasEnteredMarker', function(zone)
	if zone == 'ChemicalsConvertionMenu' then

		CurrentAction     = 'petroleo_menu'
		CurrentActionMsg  = _U('chemicals_prompt')
		CurrentActionData = {}
	end
end)

RegisterNetEvent('kilombo_ilegal:hasExitedMarker')
AddEventHandler('kilombo_ilegal:hasExitedMarker', function(zone)
	if not IsInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

function chemicalsmenucheck()

	OpenChemicalsMenu()

end

function OpenChemicalsMenu()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true
	IsInShopMenu = true
	local playerPed = PlayerPedId()

	FreezeEntityPosition(playerPed, true)

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.ChemicalsConvertionItems[v.name]

		if price and v.count >= 0 then
			table.insert(elements, {
				--label = ('%s  <span style="color:green;">%s</span>'):format("Fabricar: " .. v.label , ""),
				label = ('<span style="color:green;">Procesar petróleo</span>'),
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
		TriggerServerEvent('kilombo_ilegal:ChemicalsConvertionMenu', data.current.name, 1)
		local playerPed = PlayerPedId()

		FreezeEntityPosition(playerPed, false)
		Procesando = true

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'petroleo_menu'
		CurrentActionMsg  = _U('chemicals_prompt')
		CurrentActionData = {}

		local playerPed = PlayerPedId()

		FreezeEntityPosition(playerPed, false)
	end)
end

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID
		local sleep = 500

		for i=1, #Chemicals, 1 do
			local distancia = #(coords - GetEntityCoords(Chemicals[i]))
			if distancia < 1 then
				nearbyObject, nearbyID = Chemicals[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			sleep = 1
			if not isPickingUp then
				ESX.ShowHelpNotification(_U('chemicals_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('kilombo_ilegal:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(6000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(Chemicals, nearbyID)
						SpawnedChemicals = SpawnedChemicals - 1
		
						ESX.TriggerServerCallback("kilombo_ilegal:pickedUpChemicals", function(picked) 
							if not picked then return ESX.ShowNotification(_U('chemicals_inventoryfull'), "error") end
						end)
						-- TriggerServerEvent('kilombo_ilegal:pickedUpChemicals')
					else
						exports['okokNotify']:Alert("SERVIDOR", _U('chemicals_inventoryfull'), 3500, 'error')
					end

					isPickingUp = false

				end, 'petroleum')
			end
		end
		Citizen.Wait(sleep)
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

		ESX.Game.SpawnLocalObject('prop_rad_waste_barrel_01', chemicalsCoords, function(obj)
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

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.ChemicalsField.coords, false) > 50 then
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

		chemicalsCoordX = Config.CircleZones.ChemicalsField.coords.x + modX
		chemicalsCoordY = Config.CircleZones.ChemicalsField.coords.y + modY
		chemicalsCoordZ = Config.CircleZones.ChemicalsField.coords.z

		local coordZ = chemicalsCoordZ
		local coord = vector3(chemicalsCoordX, chemicalsCoordY, coordZ)

		if ValidatechemicalsCoord(coord) then
			return coord
		end
	end
end

function GetCoordZChemicals(x, y)
	local groundCheckHeights = { 1, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 5.9
end