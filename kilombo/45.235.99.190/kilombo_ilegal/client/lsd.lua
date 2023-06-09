local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local distancia = #(coords - Config.CircleZones.lsdProcessing.coords)
		local sleep = 500

		if distancia < 5 then
			sleep = 1
			if not isProcessing then
				ESX.ShowHelpNotification(_U('lsd_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							Processlsd()
						else
							OpenBuyLicenseMenu('lsd_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'lsd_processing')
				else
					Processlsd()
				end

			end
		end
		Citizen.Wait(sleep)
	end
end)

function Processlsd()
	isProcessing = true

	ESX.ShowNotification(_U('lsd_processingstarted'))
	TriggerServerEvent('kilombo_ilegal:processLSD')
	local timeLeft = Config.Delays.lsdProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.lsdProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('lsd_processingtoofar'))
			TriggerServerEvent('kilombo_ilegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.thionylchlorideProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('thionylchloride_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							Processthionylchloride()
						else
							OpenBuyLicenseMenu('thionylchloride_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'thionylchloride_processing')
				else
					Processthionylchloride()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Processthionylchloride()
	isProcessing = true

	ESX.ShowNotification(_U('thionylchloride_processingstarted'))
	TriggerServerEvent('kilombo_ilegal:processThionylChloride')
	local timeLeft = Config.Delays.thionylchlorideProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.thionylchlorideProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('thionylchloride_processingtoofar'))
			TriggerServerEvent('kilombo_ilegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end]]