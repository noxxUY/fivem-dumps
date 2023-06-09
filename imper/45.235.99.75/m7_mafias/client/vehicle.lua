function MathRound(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end
function GetVehicleProperties(vehicle)
	if DoesEntityExist(vehicle) then
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		local extras = {}

		for extraId=0, 12 do
			if DoesExtraExist(vehicle, extraId) then
				local state = IsVehicleExtraTurnedOn(vehicle, extraId) == 1
				extras[tostring(extraId)] = state
			end
		end
		local typeVehicle = 'car'
		if GetVehicleClass(vehicle) == 14 then
			typeVehicle = 'boat'
		elseif GetVehicleClass(vehicle) == 15 or GetVehicleClass(vehicle) == 16 then
			typeVehicle = 'helicopter'
		end
		
		return {
			model             = GetEntityModel(vehicle),
			typeVehicle       = typeVehicle,
			classVehicle      = GetVehicleClass(vehicle),

			plate             = string.gsub(GetVehicleNumberPlateText(vehicle), "^%s*(.-)%s*$", "%1"),
			plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

			bodyHealth        = MathRound(GetVehicleBodyHealth(vehicle), 1),
			engineHealth      = MathRound(GetVehicleEngineHealth(vehicle), 1),
			tankHealth        = MathRound(GetVehiclePetrolTankHealth(vehicle), 1),

			fuelLevel         = MathRound(GetVehicleFuelLevel(vehicle), 1),
			dirtLevel         = MathRound(GetVehicleDirtLevel(vehicle), 1),
			color1            = colorPrimary,
			color2            = colorSecondary,

			pearlescentColor  = pearlescentColor,
			wheelColor        = wheelColor,

			wheels            = GetVehicleWheelType(vehicle),
			windowTint        = GetVehicleWindowTint(vehicle),
			xenonColor        = GetVehicleXenonLightsColour(vehicle),

			neonEnabled       = {
				IsVehicleNeonLightEnabled(vehicle, 0),
				IsVehicleNeonLightEnabled(vehicle, 1),
				IsVehicleNeonLightEnabled(vehicle, 2),
				IsVehicleNeonLightEnabled(vehicle, 3)
			},

			neonColor         = table.pack(GetVehicleNeonLightsColour(vehicle)),
			extras            = extras,
			tyreSmokeColor    = table.pack(GetVehicleTyreSmokeColor(vehicle)),

			modSpoilers       = GetVehicleMod(vehicle, 0),
			modFrontBumper    = GetVehicleMod(vehicle, 1),
			modRearBumper     = GetVehicleMod(vehicle, 2),
			modSideSkirt      = GetVehicleMod(vehicle, 3),
			modExhaust        = GetVehicleMod(vehicle, 4),
			modFrame          = GetVehicleMod(vehicle, 5),
			modGrille         = GetVehicleMod(vehicle, 6),
			modHood           = GetVehicleMod(vehicle, 7),
			modFender         = GetVehicleMod(vehicle, 8),
			modRightFender    = GetVehicleMod(vehicle, 9),
			modRoof           = GetVehicleMod(vehicle, 10),

			modEngine         = GetVehicleMod(vehicle, 11),
			modBrakes         = GetVehicleMod(vehicle, 12),
			modTransmission   = GetVehicleMod(vehicle, 13),
			modHorns          = GetVehicleMod(vehicle, 14),
			modSuspension     = GetVehicleMod(vehicle, 15),
			modArmor          = GetVehicleMod(vehicle, 16),

			modTurbo          = IsToggleModOn(vehicle, 18),
			modSmokeEnabled   = IsToggleModOn(vehicle, 20),
			modXenon          = IsToggleModOn(vehicle, 22),

			modFrontWheels    = GetVehicleMod(vehicle, 23),
			modBackWheels     = GetVehicleMod(vehicle, 24),

			modPlateHolder    = GetVehicleMod(vehicle, 25),
			modVanityPlate    = GetVehicleMod(vehicle, 26),
			modTrimA          = GetVehicleMod(vehicle, 27),
			modOrnaments      = GetVehicleMod(vehicle, 28),
			modDashboard      = GetVehicleMod(vehicle, 29),
			modDial           = GetVehicleMod(vehicle, 30),
			modDoorSpeaker    = GetVehicleMod(vehicle, 31),
			modSeats          = GetVehicleMod(vehicle, 32),
			modSteeringWheel  = GetVehicleMod(vehicle, 33),
			modShifterLeavers = GetVehicleMod(vehicle, 34),
			modAPlate         = GetVehicleMod(vehicle, 35),
			modSpeakers       = GetVehicleMod(vehicle, 36),
			modTrunk          = GetVehicleMod(vehicle, 37),
			modHydrolic       = GetVehicleMod(vehicle, 38),
			modEngineBlock    = GetVehicleMod(vehicle, 39),
			modAirFilter      = GetVehicleMod(vehicle, 40),
			modStruts         = GetVehicleMod(vehicle, 41),
			modArchCover      = GetVehicleMod(vehicle, 42),
			modAerials        = GetVehicleMod(vehicle, 43),
			modTrimB          = GetVehicleMod(vehicle, 44),
			modTank           = GetVehicleMod(vehicle, 45),
			modWindows        = GetVehicleMod(vehicle, 46),
			modLivery         = GetVehicleLivery(vehicle)
		}
	else
		return
	end
end
function SetVehicleProperties(vehicle, props)
	if DoesEntityExist(vehicle) then
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleModKit(vehicle, 0)

		if props.plate then SetVehicleNumberPlateText(vehicle, props.plate) end
		if props.plateIndex then SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex) end
		if props.bodyHealth then SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0) end
		if props.engineHealth then SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0) end
		if props.tankHealth then SetVehiclePetrolTankHealth(vehicle, props.tankHealth + 0.0) end
		if props.fuelLevel then SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0) end
		if props.dirtLevel then SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0) end
		if props.color1 then SetVehicleColours(vehicle, props.color1, colorSecondary) end
		if props.color2 then SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2) end
		if props.pearlescentColor then SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor) end
		if props.wheelColor then SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor) end
		if props.wheels then SetVehicleWheelType(vehicle, props.wheels) end
		if props.windowTint then SetVehicleWindowTint(vehicle, props.windowTint) end

		if props.neonEnabled then
			SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
			SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
			SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
			SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
		end

		if props.extras then
			for extraId,enabled in pairs(props.extras) do
				if enabled then
					SetVehicleExtra(vehicle, tonumber(extraId), 0)
				else
					SetVehicleExtra(vehicle, tonumber(extraId), 1)
				end
			end
		end

		if props.neonColor then SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3]) end
		if props.xenonColor then SetVehicleXenonLightsColour(vehicle, props.xenonColor) end
		if props.modSmokeEnabled then ToggleVehicleMod(vehicle, 20, true) end
		if props.tyreSmokeColor then SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3]) end
		if props.modSpoilers then SetVehicleMod(vehicle, 0, props.modSpoilers, false) end
		if props.modFrontBumper then SetVehicleMod(vehicle, 1, props.modFrontBumper, false) end
		if props.modRearBumper then SetVehicleMod(vehicle, 2, props.modRearBumper, false) end
		if props.modSideSkirt then SetVehicleMod(vehicle, 3, props.modSideSkirt, false) end
		if props.modExhaust then SetVehicleMod(vehicle, 4, props.modExhaust, false) end
		if props.modFrame then SetVehicleMod(vehicle, 5, props.modFrame, false) end
		if props.modGrille then SetVehicleMod(vehicle, 6, props.modGrille, false) end
		if props.modHood then SetVehicleMod(vehicle, 7, props.modHood, false) end
		if props.modFender then SetVehicleMod(vehicle, 8, props.modFender, false) end
		if props.modRightFender then SetVehicleMod(vehicle, 9, props.modRightFender, false) end
		if props.modRoof then SetVehicleMod(vehicle, 10, props.modRoof, false) end
		if props.modEngine then SetVehicleMod(vehicle, 11, props.modEngine, false) end
		if props.modBrakes then SetVehicleMod(vehicle, 12, props.modBrakes, false) end
		if props.modTransmission then SetVehicleMod(vehicle, 13, props.modTransmission, false) end
		if props.modHorns then SetVehicleMod(vehicle, 14, props.modHorns, false) end
		if props.modSuspension then SetVehicleMod(vehicle, 15, props.modSuspension, false) end
		if props.modArmor then SetVehicleMod(vehicle, 16, props.modArmor, false) end
		if props.modTurbo then ToggleVehicleMod(vehicle,  18, props.modTurbo) end
		if props.modXenon then ToggleVehicleMod(vehicle,  22, props.modXenon) end
		if props.modFrontWheels then SetVehicleMod(vehicle, 23, props.modFrontWheels, false) end
		if props.modBackWheels then SetVehicleMod(vehicle, 24, props.modBackWheels, false) end
		if props.modPlateHolder then SetVehicleMod(vehicle, 25, props.modPlateHolder, false) end
		if props.modVanityPlate then SetVehicleMod(vehicle, 26, props.modVanityPlate, false) end
		if props.modTrimA then SetVehicleMod(vehicle, 27, props.modTrimA, false) end
		if props.modOrnaments then SetVehicleMod(vehicle, 28, props.modOrnaments, false) end
		if props.modDashboard then SetVehicleMod(vehicle, 29, props.modDashboard, false) end
		if props.modDial then SetVehicleMod(vehicle, 30, props.modDial, false) end
		if props.modDoorSpeaker then SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false) end
		if props.modSeats then SetVehicleMod(vehicle, 32, props.modSeats, false) end
		if props.modSteeringWheel then SetVehicleMod(vehicle, 33, props.modSteeringWheel, false) end
		if props.modShifterLeavers then SetVehicleMod(vehicle, 34, props.modShifterLeavers, false) end
		if props.modAPlate then SetVehicleMod(vehicle, 35, props.modAPlate, false) end
		if props.modSpeakers then SetVehicleMod(vehicle, 36, props.modSpeakers, false) end
		if props.modTrunk then SetVehicleMod(vehicle, 37, props.modTrunk, false) end
		if props.modHydrolic then SetVehicleMod(vehicle, 38, props.modHydrolic, false) end
		if props.modEngineBlock then SetVehicleMod(vehicle, 39, props.modEngineBlock, false) end
		if props.modAirFilter then SetVehicleMod(vehicle, 40, props.modAirFilter, false) end
		if props.modStruts then SetVehicleMod(vehicle, 41, props.modStruts, false) end
		if props.modArchCover then SetVehicleMod(vehicle, 42, props.modArchCover, false) end
		if props.modAerials then SetVehicleMod(vehicle, 43, props.modAerials, false) end
		if props.modTrimB then SetVehicleMod(vehicle, 44, props.modTrimB, false) end
		if props.modTank then SetVehicleMod(vehicle, 45, props.modTank, false) end
		if props.modWindows then SetVehicleMod(vehicle, 46, props.modWindows, false) end

		if props.modLivery then
			SetVehicleMod(vehicle, 48, props.modLivery, false)
			SetVehicleLivery(vehicle, props.modLivery)
		end
	end
end

RegisterNetEvent('m7_mafias:toggleMenu_impound')
AddEventHandler('m7_mafias:toggleMenu_impound', function(typeVehicle)
	local playerPed = PlayerPedId()
	local vehicleProperties = nil
	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		vehicleProperties = GetVehicleProperties(vehicle)
	end
	TriggerServerEvent("m7_mafias:openImpoundMenu" , typeVehicle , vehicleProperties )
end)

RegisterNetEvent('m7_mafias:openImpoundMenu')
AddEventHandler('m7_mafias:openImpoundMenu', function(Vehicles ,canInsertToGarage ,  vehicleProperties)
	local gangImpoundMenu = RageUI.CreateMenu(_U('impound'), _U('impound'))
	gangImpoundMenu:DisplayGlare(true)
	gangImpoundMenu:DisplayPageCounter(true)
	gangImpoundMenu.EnableMouse = false
	Citizen.CreateThread(function()
		local whileGoImpoundMenu = true 
		while whileGoImpoundMenu do
			Citizen.Wait(1.0)
			gangImpoundMenu.Closed = function()
				whileGoImpoundMenu = false
			end
			RageUI.IsVisible(gangImpoundMenu, function()
				local disabled = false
				if canInsertToGarage and vehicleProperties ~= nil then
					disabled = true
				end
				RageUI.Button( _U('insert_vehicle_to_gang'), _U('insert_vehicle_help') , {}, disabled, {
					onSelected = function()
						whileGoImpoundMenu = false
						TriggerServerEvent('m7_mafias:addVehicle',vehicleProperties)
						RageUI.Visible(gangImpoundMenu, false)
					end,
				});
				local typeVehicle = nil
				for _key, Vehicle in pairs(Vehicles) do
					if typeVehicle ~= Vehicle['type'] then
						RageUI.Separator(_U('impound_'..Vehicle['type'] ))
						typeVehicle = Vehicle['type']
					end
					local vehiclePropertiesOne = json.decode(Vehicle.vehicle)
					local vehicleLabel = GetDisplayNameFromVehicleModel(vehiclePropertiesOne.model)
					vehicleLabel = GetLabelText(vehicleLabel)
					RageUI.Button( vehicleLabel , _U('impound_price' , Config.impoundPrice )  , {}, true, {
						onSelected = function()
							local coords = GetEntityCoords(PlayerPedId())
							if IsAnyVehicleNearPoint(coords, 3) then
								TriggerEvent('m7_mafias:sendNotfication','[Mafia]', ''  , _U('not_empty_to_spawn') , 'CHAR_SOCIAL_CLUB' , 2 )
							else
								whileGoImpoundMenu = false
								TriggerServerEvent('m7_mafias:payImpound',vehiclePropertiesOne ,Vehicles ,canInsertToGarage ,  vehicleProperties)
								RageUI.Visible(gangImpoundMenu, false)
							end
						end,
					});
				end
			end, function() end)
		end
	end)
	RageUI.Visible(gangImpoundMenu, not RageUI.Visible(gangImpoundMenu))
end)




RegisterNetEvent('m7_mafias:spawnVehicle')
AddEventHandler('m7_mafias:spawnVehicle', function(vehicleProperties)
	local playerPed = PlayerPedId()
	local coords, head = GetEntityCoords(PlayerPedId()), GetEntityHeading(playerPed)
	if type(vehicleProperties) == 'string' then
		vehicleProperties = json.decode(vehicleProperties)
	end
	local model = (type(vehicleProperties.model) == 'number' and vehicleProperties.model or GetHashKey(vehicleProperties.model))

	Citizen.CreateThread(function()
		if not HasModelLoaded(model) and IsModelInCdimage(model) then
			RequestModel(model)

			while not HasModelLoaded(model) do
				Citizen.Wait(5)
			end
		end

		local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, head, true, false)
		
		local networkId = NetworkGetNetworkIdFromEntity(vehicle)
		local timeout = 0
		local gang = getGangID()

		SetNetworkIdCanMigrate(networkId, true)
		SetEntityAsMissionEntity(vehicle, true, false)
		SetVehicleMaxMods(vehicle)
		SetVehicleCustomPrimaryColour(vehicle, Config.Orgs[gang].Color.r, Config.Orgs[gang].Color.g, Config.Orgs[gang].Color.b)
		SetVehicleCustomSecondaryColour(vehicle, Config.Orgs[gang].Color.r, Config.Orgs[gang].Color.g, Config.Orgs[gang].Color.b)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetModelAsNoLongerNeeded(model)
		RequestCollisionAtCoord(coords.x, coords.y, coords.z)

		-- we can get stuck here if any of the axies are "invalid"
		while not HasCollisionLoadedAroundEntity(vehicle) and timeout < 2000 do
			Citizen.Wait(5)
			timeout = timeout + 1
		end

		SetVehicleProperties(vehicle,vehicleProperties)
		SetVehRadioStation(vehicle, 'OFF')
		if Config.fixSpawnVehicle then
			SetVehicleFixed(vehicle)
			SetVehicleDeformationFixed(vehicle)
		end
		SetVehicleUndriveable(vehicle, false)
		SetVehicleEngineOn(vehicle, true, true)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
		local carplate = GetVehicleNumberPlateText(vehicle)
	end)
end)

function SetVehicleMaxMods(vehicle)
	local props = {
	  modEngine       = 2,
	  modBrakes       = 2,
	  modTransmission = 2,
	  modSuspension   = 3,
	  modTurbo        = true,
	}
	ESX.Game.SetVehicleProperties(vehicle, props)
end

RegisterNetEvent('m7_mafias:toggleMenu_vehicle')
AddEventHandler('m7_mafias:toggleMenu_vehicle', function()
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local playerHead = GetEntityHeading(playerPed)
	if IsPedInAnyVehicle(playerPed,  false) then
		TriggerEvent('eden_garage:delete_vehicles_mafias')
	else
		OpenVehiclesMenu('car', playerCoords, playerHead)
	end
end)

RegisterNetEvent('m7_mafias:toggleMenu_boat')
AddEventHandler('m7_mafias:toggleMenu_boat', function()
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local playerHead = GetEntityHeading(playerPed)
	if IsPedInAnyVehicle(playerPed,  false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if DoesEntityExist(vehicle) then
			ESX.Game.DeleteVehicle(vehicle)
		end
	else
		OpenVehiclesMenu('boat', playerCoords, playerHead)
	end
end)

RegisterNetEvent('m7_mafias:toggleMenu_helicopter')
AddEventHandler('m7_mafias:toggleMenu_helicopter', function()
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local playerHead = GetEntityHeading(playerPed)
	if IsPedInAnyVehicle(playerPed,  false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if DoesEntityExist(vehicle) then
			ESX.Game.DeleteVehicle(vehicle)
		end
	else
		OpenVehiclesMenu('helicopter', playerCoords, playerHead)
	end
end)


function OpenVehiclesMenu(vehicle_type, coords, head)
	if vehicle_type == 'car' then
		TriggerEvent('eden_garage:spawn_vehicles_mafias', coords, head)
	else
		ESX.UI.Menu.CloseAll()
		local elements = {}
		local gang = getGangID()
		for i=1, #Config.Orgs[gang].AuthorizedVehicles[vehicle_type], 1 do
			local vehicle = Config.Orgs[gang].AuthorizedVehicles[vehicle_type][i]
			table.insert(elements, {label = vehicle.label, value = vehicle.name})
		end
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('vehicle_menu'),
				align    = 'bottom-right',
				elements = elements,
			},
			function(data2, menu2)

			menu2.close()

			local model = data2.current.value

			TriggerServerEvent('m7_mafias:spawnVehicle', {model=GetHashKey(model)})

			end,
			function(data2, menu2)

			menu2.close()

			end
		)
	end
end

function GetRandomNumber(length)
	Wait(5)
	math.randomseed(os.time())
	if length > 0 then
		local NumberCharset = {'0','1','2','3','4','5','6','7','8','9'}
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Wait(5)
	math.randomseed(os.time())
	if length > 0 then
		local Charset = {'a','b','c','d','e','f','g','h','j','k','l','m','n','o','p','q','r','s','t','v','w','x','y','z','i','u'}
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end


local waitForResponse = true
isOwned = false
RegisterNetEvent('m7_mafias:isOwnGangVehicle')
AddEventHandler('m7_mafias:isOwnGangVehicle', function(isOwn)
	isOwned = isOwn
	waitForResponse = false
end)
function isOwnGangVehicle(vehicle)
	local plate = string.gsub(GetVehicleNumberPlateText(vehicle), "^%s*(.-)%s*$", "%1")
	isOwned = false
	waitForResponse = true
	TriggerServerEvent('m7_mafias:isOwnVehicle', plate)
	local k = 0
	while waitForResponse and k < 1000 do
		k = k + 1 
		Citizen.Wait(10)
	end
	return isOwned 
end