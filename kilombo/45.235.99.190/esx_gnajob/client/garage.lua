-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

local insideMarker = false

local inRange = false
local inRangeBorrar = false

local shown = false
local shown2 = false

-- Core Thread Function:
Citizen.CreateThread(function()
	while true do

		sleep = 500
		local coords = GetEntityCoords(PlayerPedId())
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		local pedInVeh = IsPedInAnyVehicle(PlayerPedId(), true)
		local jugador = PlayerPedId()
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.gnaDatabaseName) then
			for k,v in pairs(Config.CarZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						sleep = 1
						DrawMarker(Config.gnaCarMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.gnaCarMarkerScale.x, Config.gnaCarMarkerScale.y, Config.gnaCarMarkerScale.y, Config.gnaCarMarkerColor.r,Config.gnaCarMarkerColor.g,Config.gnaCarMarkerColor.b,Config.gnaCarMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 2.5 ) and insideMarker == false then
						if IsPedOnFoot(jugador) then
								inRange = true
								if IsControlJustPressed(0, Config.KeyToOpenCarGarage) then
									--gnaGarage('car')
									VehicleMenu('car')
									insideMarker = true
									Citizen.Wait(500)
								end
						else
							inRangeBorrar = true
							if IsControlJustPressed(0, Config.KeyToOpenCarGarage) then
								insideMarker = false
								local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
								if dist < 3 then
									DeleteEntity(veh)
									exports['okokNotify']:Alert("SERVIDOR", Config.VehicleParked, 3500, 'success')
								else
									exports['okokNotify']:Alert("SERVIDOR", Config.NoVehicleNearby, 3500, 'error')
								end
								Citizen.Wait(500)
							end
						end
					else
						inRange = false
						inRangeBorrar = false
					end
				end
			end

			for k,v in pairs(Config.HeliZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						sleep = 1
						DrawMarker(Config.gnaHeliMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.95, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.gnaHeliMarkerScale.x, Config.gnaHeliMarkerScale.y, Config.gnaHeliMarkerScale.z, Config.gnaHeliMarkerColor.r,Config.gnaHeliMarkerColor.g,Config.gnaHeliMarkerColor.b,Config.gnaHeliMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then


							if IsPedOnFoot(jugador) then
									inRange = true
									if IsControlJustPressed(0, Config.KeyToOpenCarGarage) then
										gnaGarage('helicopter')
										insideMarker = true
										Citizen.Wait(500)
									end
							else
								inRangeBorrar = true
								if IsControlJustPressed(0, Config.KeyToOpenCarGarage) then
									insideMarker = false
									local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
									if dist < 3 then
										DeleteEntity(veh)
										exports['okokNotify']:Alert("SERVIDOR", Config.VehicleParked, 3500, 'success')
									else
										exports['okokNotify']:Alert("SERVIDOR", Config.NoVehicleNearby, 3500, 'error')
									end
									Citizen.Wait(500)
								end
							end

					end
				end
			end


			if inRangeBorrar and not shown2 then
				shown2 = true
				ESX.TextUI(Config.BorrarCoche, "info")
			elseif not inRangeBorrar and shown2 then
				shown2 = false
				ESX.HideUI()
			end


			if inRange and not shown and IsPedOnFoot(jugador) then
				shown = true
				ESX.TextUI(Config.CarDraw3DText, "info")
			elseif not inRange and shown then
				shown = false
				ESX.HideUI()
			end

		end
		Citizen.Wait(sleep)
	end
end)

-- gna Garage Menu:
gnaGarage = function(type)
	local elements = {
		{ label = Config.LabelGetVeh, action = "get_vehicle" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_gnaGarage_menu",
		{
			title    = Config.TitlegnaGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		local action = data.current.action
		if action == "get_vehicle" then
			if type == 'car' then
				VehicleMenu('car')
			elseif type == 'helicopter' then
				VehicleMenu('helicopter')
            end
		end
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Vehicle Spawn Menu:
VehicleMenu = function(type)
	local storage = nil
	local elements = {}
	local ped = PlayerPedId()
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(ped)
	
	if type == 'car' then
		for k,v in pairs(Config.gnaVehicles) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'car'})
		end
	elseif type == 'helicopter' then
		for k,v in pairs(Config.gnaHelicopters) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'helicopter'})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_gnaGarage_vehicle_garage",
		{
			title    = Config.TitlegnaGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		inRange = false
		insideMarker = false
		local plate = exports['esx_vehicleshop']:GeneratePlate()
		VehicleLoadTimer(data.current.model)
		local veh = CreateVehicle(data.current.model,pos.x,pos.y,pos.z,GetEntityHeading(playerPed),true,false)
		SetPedIntoVehicle(PlayerPedId(),veh,-1)
		SetVehicleNumberPlateText(veh,plate)
		
		if type == 'car' then
			exports['okokNotify']:Alert("SERVIDOR", 'Sacaste el vehículo: <span style="color: green;"><b><strong>'..data.current.label..'</b></strong></span>', 3500, 'info')
		elseif type == 'helicopter' then
			exports['okokNotify']:Alert("SERVIDOR", 'Sacaste el helicóptero: <span style="color: green;">'..data.current.label..'</span>', 3500, 'info')
		end
		
		TriggerEvent("fuel:setFuel",veh,100.0)
		SetVehicleDirtLevel(veh, 0.1)		
	end, function(data, menu)
		menu.close()
		insideMarker = false
		inRange = false
	end, function(data, menu)
	end)
end

-- Load Timer Function for Vehicle Spawn:
function VehicleLoadTimer(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)

			drawLoadingText(Config.VehicleLoadText, 255, 255, 255, 255)
		end
	end
end

-- Loading Text for Vehicles Function:
function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end