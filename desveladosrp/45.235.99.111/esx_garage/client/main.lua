ESX = exports["es_extended"]:getSharedObject()

cachedData = {}

Citizen.CreateThread(function()
		Citizen.Wait(0)
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

Citizen.CreateThread(function()
	local CanDraw = function(action)
		if action == "vehicle" then
			if IsPedInAnyVehicle(PlayerPedId()) then
				local vehicle = GetVehiclePedIsIn(PlayerPedId())

				if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
					return true
				else
					return false
				end
			else
				return false
			end
		end

		return true
	end

	local GetDisplayText = function(action, garage)
		if not Config.Labels[action] then Config.Labels[action] = action end

		return string.format(Config.Labels[action], action == "vehicle" and GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())))) or garage)
	end

	while true do
		local sleepThread = 500

		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		for garage, garageData in pairs(Config.Garages) do
			for action, actionData in pairs(garageData["positions"]) do
				local dstCheck = #(pedCoords - actionData["position"])

				if dstCheck <= 10.0 then
					sleepThread = 5

					local draw = CanDraw(action)

					if draw then
						local markerSize = action == "vehicle" and 5.0 or 1.5

						if dstCheck <= markerSize - 0.1 then
							local usable, displayText = not DoesCamExist(cachedData["cam"]), GetDisplayText(action, garage)
							if usable then
								if IsControlJustPressed(0, 38) then
									cachedData["currentGarage"] = garage

									HandleAction(action)
								end
							end
						end

						DrawScriptMarker({
							["type"] = 1,
							["pos"] = actionData["position"] - vector3(0.0, 0.0, 0.985),
							["sizeX"] = markerSize,
							["sizeY"] = markerSize,
							["sizeZ"] = 1.0,
							["r"] = 0,
							["g"] = 191,
							["b"] = 255
						})
					end
				end
			end
		end

		Citizen.Wait(sleepThread)
	end
end)