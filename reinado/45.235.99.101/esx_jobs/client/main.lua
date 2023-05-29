local Blips = {}
local JobBlips = {}
local isInMarker = false
local hintToDisplay = "no hint to display"
local onDuty = true
local spawner = 0
local myPlate = {}

local vehicleObjInCaseofDrop = nil
local vehicleInCaseofDrop = nil

local vehicleMaxHealth = nil

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
	refreshBlips()
end)

RegisterNetEvent('esx:onPlayerLogout',function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob',function(job)
	ESX.PlayerData.job = job
end)

function OpenMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = _U('cloakroom'),
		align = 'right',
		elements = {
			{label = _U('job_wear'),     value = 'job_wear'},
			{label = _U('citizen_wear'), value = 'citizen_wear'}
		}
	}, function(data, menu)
		if data.current.value == 'citizen_wear' then
			onDuty = true
			ESX.ShowNotification(_U('offduty'),"success")
		
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				local Male = skin.sex == 0
				TriggerEvent('skinchanger:loadDefaultModel', Male, function()
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx:restoreLoadout')
					end)
				end)
			end)
								
								
		elseif data.current.value == 'job_wear' then
			onDuty = true
			local playerPed = PlayerPedId()
			
			local hash = GetEntityModel(PlayerPedId())
			
			if hash == `mp_m_freemode_01` then
                    print('[DEBUG] Opcion 2.')
			ESX.ShowNotification(_U('onduty'), "success")
			
                       SetPedComponentVariation(PlayerPedId(), 11, 238, 0, 2) -- TORSO
                       SetPedComponentVariation(PlayerPedId(), 4, 129, 1, 2) -- Pantalon
                       SetPedComponentVariation(PlayerPedId(), 6, 54, 5, 2)   -- Zapatos
                       SetPedComponentVariation(PlayerPedId(), 8, 59, 1, 2)  
						SetPedComponentVariation(PlayerPedId(), 3, 175, 2, 2)   -- Manos
						SetPedPropIndex(PlayerPedId(), 0, 145, 1, 2)  -- Sombrero
					   
			elseif hash ==  `mp_f_freemode_01` then
                    print('[DEBUG] Opcion 1.')
			ESX.ShowNotification(_U('onduty'),"success")
						SetPedComponentVariation(PlayerPedId(), 11, 117, 0, 2)  -- TORSO
						SetPedComponentVariation(PlayerPedId(), 8, 36, 1, 2)   -- Remera
						SetPedComponentVariation(PlayerPedId(), 7, 144, 1, 2)  -- Sombrero
						SetPedComponentVariation(PlayerPedId(), 6, 25, 0, 2) -- Zapatos
						SetPedComponentVariation(PlayerPedId(), 4, 30, 0, 2)   -- Pantalon
						SetPedComponentVariation(PlayerPedId(), 3, 180, 4, 2)   -- Manos
						SetPedPropIndex(PlayerPedId(), 0, 144, 1, 2) 
			
			end
			
				
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

AddEventHandler('esx_jobs:action', function(job, zone, zoneKey)
	menuIsShowed = true
	if zone.Type == "cloakroom" then
		OpenMenu()
	elseif zone.Type == "work" then
		local playerPed = PlayerPedId()

		if IsPedInAnyVehicle(playerPed, false) then
			ESX.ShowNotification(_U('foot_work'))
		else
			TriggerServerEvent('esx_jobs:startWork', zone.Item, zoneKey)
		end
	elseif zone.Type == "vehspawner" then
		local spawnPoint = nil
		local vehicle = nil

		for k,v in pairs(Config.Jobs) do
			if ESX.PlayerData.job.name == k then
				for l,w in pairs(v.Zones) do
					if w.Type == "vehspawnpt" and w.Spawner == zone.Spawner then
						spawnPoint = w
						spawner = w.Spawner
					end
				end

				for m,x in pairs(v.Vehicles) do
					if x.Spawner == zone.Spawner then
						vehicle = x
					end
				end
			end
		end

		if ESX.Game.IsSpawnPointClear(spawnPoint.Pos, 5.0) then
			spawnVehicle(spawnPoint, vehicle, zone.Caution)
		else
			ESX.ShowNotification(_U('spawn_blocked'))
		end

	elseif zone.Type == "vehdelete" then
		local looping = true

		for k,v in pairs(Config.Jobs) do
			if ESX.PlayerData.job.name == k then
				for l,w in pairs(v.Zones) do
					if w.Type == "vehdelete" and w.Spawner == zone.Spawner then
						local playerPed = PlayerPedId()

						if IsPedInAnyVehicle(playerPed, false) then

							local vehicle = GetVehiclePedIsIn(playerPed, false)
							local plate = GetVehicleNumberPlateText(vehicle)
							plate = string.gsub(plate, " ", "")
							local driverPed = GetPedInVehicleSeat(vehicle, -1)
							local vehicleMaxHealth = GetVehicleEngineHealth(vehicle)

							if playerPed == driverPed then

								for i=1, #myPlate, 1 do
									if myPlate[i] == plate then

										local vehicleHealth = GetVehicleEngineHealth(vehicleInCaseofDrop)
										local giveBack = ESX.Math.Round(vehicleHealth / vehicleMaxHealth, 2)

										TriggerServerEvent('esx_jobs:caution', "give_back", giveBack, 0, 0)
										DeleteVehicle(GetVehiclePedIsIn(playerPed, false))

										if w.Teleport ~= 0 then
											ESX.Game.Teleport(playerPed, w.Teleport)
										end

										table.remove(myPlate, i)

										if vehicleObjInCaseofDrop.HasCaution then
											vehicleInCaseofDrop = nil
											vehicleObjInCaseofDrop = nil
											vehicleMaxHealth = nil
										end

										break
									end
								end

							else
								ESX.ShowNotification(_U('not_your_vehicle'))
							end

						end

						looping = false
						break
					end

					if looping == false then
						break
					end
				end
			end
			if looping == false then
				break
			end
		end
	elseif zone.Type == "delivery" then
		if Blips['delivery'] ~= nil then
			RemoveBlip(Blips['delivery'])
			Blips['delivery'] = nil
		end
		TriggerServerEvent('esx_jobs:startWork', zone.Item, zoneKey)
	end
	--nextStep(zone.GPS)
end)

function nextStep(gps)
	if gps ~= 0 then
		if Blips['delivery'] ~= nil then
			RemoveBlip(Blips['delivery'])
			Blips['delivery'] = nil
		end

		Blips['delivery'] = AddBlipForCoord(gps.x, gps.y, gps.z)
		SetBlipRoute(Blips['delivery'], true)
		ESX.ShowNotification(_U('next_point'))
	end
end

AddEventHandler('esx_jobs:hasExitedMarker', function(zone)
	TriggerServerEvent('esx_jobs:stopWork')
	menuIsShowed = false
	isInMarker = false
end)

RegisterNetEvent('esx:setJob', function(job)
	onDuty = true
	myPlate = {} -- loosing vehicle caution in case player changes job.
	spawner = 0
	deleteBlips()
	refreshBlips()
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function refreshBlips()
	local zones = {}
	local blipInfo = {}

	--if ESX.PlayeData.job ~= nil then
		for jobKey,jobValues in pairs(Config.Jobs) do
			if jobKey == ESX.PlayerData.job.name then
				for zoneKey,zoneValues in pairs(jobValues.Zones) do

					if zoneValues.Blip then
						local _Pos = {}
						if (zoneValues.Zone) then
							TriggerEvent("izone:getZoneCenter", zoneValues.Zone, function(_center)
								if (_center) then
									_Pos = _center
								end
							end)
						else
							_Pos = zoneValues.Pos
						end
						local blip = AddBlipForCoord(_Pos.x, _Pos.y, _Pos.z)
						SetBlipSprite  (blip, jobValues.BlipInfos.Sprite)
						SetBlipDisplay (blip, 4)
						SetBlipScale   (blip, 0.6)
						SetBlipCategory(blip, 3)
						SetBlipColour  (blip, jobValues.BlipInfos.Color)
						SetBlipAsShortRange(blip, true)

						BeginTextCommandSetBlipName("STRING")
						AddTextComponentSubstringPlayerName(zoneValues.Name)
						EndTextCommandSetBlipName(blip)
						table.insert(JobBlips, blip)
					end
				end
			end
		end
	--end
end



function spawnVehicle(spawnPoint, vehicle, vehicleCaution)
	hintIsShowed = false
	TriggerServerEvent('esx_jobs:caution', 'take', vehicleCaution, spawnPoint, vehicle)
end

RegisterNetEvent('esx_jobs:spawnJobVehicle',function(spawnPoint, vehicle)
	local playerPed = PlayerPedId()

	ESX.Game.SpawnVehicle(vehicle.Hash, spawnPoint.Pos, spawnPoint.Heading, function(spawnedVehicle)

		if vehicle.Trailer ~= "none" then
			ESX.Game.SpawnVehicle(vehicle.Trailer, spawnPoint.Pos, spawnPoint.Heading, function(trailer)
				AttachVehicleToTrailer(spawnedVehicle, trailer, 1.1)
			end)
		end

		-- save & set plate
		local plate = 'WORK' .. math.random(100, 900)
		SetVehicleNumberPlateText(spawnedVehicle, plate)
		table.insert(myPlate, plate)
		plate = string.gsub(plate, " ", "")

		TaskWarpPedIntoVehicle(playerPed, spawnedVehicle, -1)

		if vehicle.HasCaution then
			vehicleInCaseofDrop = spawnedVehicle
			vehicleObjInCaseofDrop = vehicle
			vehicleMaxHealth = GetVehicleEngineHealth(spawnedVehicle)
		end
	end)
end)

-- Display markers (only if on duty and the player's job ones)
CreateThread(function()
	while true do
		local Sleep = 1500
		local zones = {}
		
		if ESX.PlayerData.job then
			for k,v in pairs(Config.Jobs) do
				if ESX.PlayerData.job.name == k then
					Sleep = 0
					zones = v.Zones
				end
			 end

			local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(zones) do
				if onDuty or v.Type == "cloakroom" then
						if (v.Zone) then
							TriggerEvent("izone:getZoneCenter", v.Zone, function(center)
								if (not(center == nil)) then
									if(v.Marker ~= -1 and #(coords - center) < Config.DrawDistance) then
										Sleep = 0
										DrawMarker(v.Marker, center.x, center.y, center.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
									end
								end
							end)
						else
							local Pos = vector3(v.Pos.x, v.Pos.y, v.Pos.z)
							if(v.Marker ~= -1 and #(coords - Pos) < Config.DrawDistance) then
								Sleep = 0
								DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
							end
						end
				end
			end
		end
	Wait(Sleep)
	end
end)

-- Display public markers
CreateThread(function()
	while true do
		local Sleep = 1500
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.PublicZones) do
			if(v.Marker ~= -1 and #(coords - v.Pos) < Config.DrawDistance) then
				Sleep = 0
				DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	Wait(Sleep)
	end
end)

-- Activate public marker
CreateThread(function()
	while true do
		local Sleep = 1500
		local coords   = GetEntityCoords(PlayerPedId())

		for k,v in pairs(Config.PublicZones) do
			if #(coords - v.Pos) < v.Size.x/2 then
				Sleep = 0
				ESX.ShowHelpNotification(v.Hint)
				hintIsShowed = true
				if IsControlJustReleased(0, 38) then
					ESX.Game.Teleport(PlayerPedId(), position)
				end
			end
		end

	Wait(Sleep)
	end
end)

-- Activate menu when player is inside marker
CreateThread(function()
	while true do

		local Sleep = 500

		-- if ESX.PlayerData.job and ESX.PlayerData.job.name ~= 'unemployed' then
			local zones = nil
			local job = nil

			for k,v in pairs(Config.Jobs) do
				if ESX.PlayerData.job.name == k then
					Sleep = 0
					job = v
					zones = v.Zones
				end
			end

			if zones then
				local coords      = GetEntityCoords(PlayerPedId())
				local currentZone = nil
				local zone        = nil
				local lastZone    = nil

				for k,v in pairs(zones) do
					-- If we defined a zone from iZone
					if v.Zone then
						TriggerEvent("izone:isPlayerInZone", v.Zone, function(isIn)
							if isIn then
								Sleep = 0
								isInMarker  = true
								currentZone = k
								zone        = v
								return
							else
								isInMarker  = false
							end
						end)
						-- Because we were in a routine
						if isInMarker then
							break
						end
					-- Else use radius defined from center
					else
						local Pos = vector3(v.Pos.x, v.Pos.y, v.Pos.z)
						if #(coords - Pos) < v.Size.x then
							Sleep = 0
							isInMarker  = true
							currentZone = k
							zone        = v
							break
						else
							isInMarker  = false
						end
					end
					
				end

				if IsControlJustReleased(0, 38) and not menuIsShowed and isInMarker then
					-- if onDuty or zone.Type == "cloakroom" then
						TriggerEvent('esx_jobs:action', job, zone, currentZone)
					-- end
				end

				-- hide or show top left zone hints
				if isInMarker and not menuIsShowed then
					hintIsShowed = true
					if (onDuty or zone.Type == "cloakroom") and zone.Type ~= "vehdelete" then
						hintToDisplay = zone.Hint
						 ESX.ShowHelpNotification(hintToDisplay)
					elseif zone.Type == "vehdelete" and (onDuty) then
						local playerPed = PlayerPedId()

						if IsPedInAnyVehicle(playerPed, false) then
							local vehicle = GetVehiclePedIsIn(playerPed, false)
							local driverPed = GetPedInVehicleSeat(vehicle, -1)
							local plate = GetVehicleNumberPlateText(vehicle)
							plate = string.gsub(plate, " ", "")

							if playerPed == driverPed then

								for i=1, #myPlate, 1 do
									if myPlate[i] == plate then
										hintToDisplay = zone.Hint
										break
									end
								end

							else
								hintToDisplay = _U('not_your_vehicle')
								ESX.ShowHelpNotification(hintToDisplay)
							end
						else
							hintToDisplay = _U('in_vehicle')
							ESX.ShowHelpNotification(hintToDisplay)
						end
						hintIsShowed = true
					elseif onDuty and zone.Spawner ~= spawner then
						hintToDisplay = _U('wrong_point')
						ESX.ShowHelpNotification(hintToDisplay)
					end
				end

				if isInMarker and not hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = true
				end

				if not isInMarker and hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = false
					TriggerEvent('esx_jobs:hasExitedMarker', zone)
				end
			end
		-- end
	Wait(Sleep)
	end
end)

if Config.RequestIPL then
	CreateThread(function()
		-- Slaughterer
		RemoveIpl("CS1_02_cf_offmission")
		RequestIpl("CS1_02_cf_onmission1")
		RequestIpl("CS1_02_cf_onmission2")
		RequestIpl("CS1_02_cf_onmission3")
		RequestIpl("CS1_02_cf_onmission4")
		-- Tailor
		RequestIpl("id2_14_during_door")
		RequestIpl("id2_14_during1")
	end)
end
if ESX.PlayerLoaded then refreshBlips() end



exports('OpenMenu', function()
    OpenMenu()
end)

