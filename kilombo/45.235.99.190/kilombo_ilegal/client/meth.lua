local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local distancia = #(coords - Config.CircleZones.MethProcessing.coords)
		local sleep = 500

		if distancia < 5 then
			sleep = 1
			if not isProcessing then
				ESX.ShowHelpNotification(_U('meth_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessMeth()
						else
							OpenBuyLicenseMenu('meth_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'meth_processing')
				else
					ProcessMeth()
				end

			end
		end
		Citizen.Wait(sleep)
	end
end)

function ProcessMeth()
	isProcessing = true

	ESX.ShowNotification(_U('meth_processingstarted'))
	TriggerServerEvent('kilombo_ilegal:processMeth')
	local timeLeft = Config.Delays.MethProcessing / 1000
	local playerPed = PlayerPedId()
	local distancia = #(GetEntityCoords(playerPed) - Config.CircleZones.MethProcessing.coords)

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if distancia > 5 then
			ESX.ShowNotification(_U('meth_processingtoofar'))
			TriggerServerEvent('kilombo_ilegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end