ESX = nil

cachedPostJobData = {}

isWorking = false

Citizen.CreateThread(function()
	while not ESX do
		--Fetching esx library, due to new to esx using this.

		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end

	if ESX.IsPlayerLoaded() then
		-- print("Player loaded.")
	end
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
	Citizen.Wait(100)

	local postOfficeBlip = AddBlipForCoord(Config.StartJobSpot["coordinates"])

	SetBlipSprite(postOfficeBlip, 85)
	SetBlipScale(postOfficeBlip, 1.4)
	SetBlipColour(postOfficeBlip, 69)
	SetBlipAsShortRange(postOfficeBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Oficina postal")
	EndTextCommandSetBlipName(postOfficeBlip)

	while true do
		local sleepThread = 500

		if not Config.JobNeeded or Config.JobNeeded and (ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == "postman") then
			local playerPed = PlayerPedId()
			local playerPedCoords = GetEntityCoords(playerPed)

			local dstCheck = GetDistanceBetweenCoords(playerPedCoords, Config.StartJobSpot["coordinates"], true)

			if dstCheck <= 5.0 then 
				sleepThread = 5

				if dstCheck <= 1.0 then
					local displayText = cachedPostJobData["isWorking"] and "Estas trabajando, ~INPUT_CONTEXT~ para cancelar el trabajo actual..." or "~INPUT_CONTEXT~ Comenzar reparto"

					ESX.ShowHelpNotification(displayText)

					if IsControlJustReleased(0, 38) then
						StartPostWork()
					end
				end

				DrawMarker(6, Config.StartJobSpot["coordinates"] - vector3(0.0, 0.0, 0.985), 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 1.2, 1.2, 1.2, 0, 150, 150, 100, false, true, 2, false, false, false, false)
			end
		end

	  	Citizen.Wait(sleepThread)
	end
end)

