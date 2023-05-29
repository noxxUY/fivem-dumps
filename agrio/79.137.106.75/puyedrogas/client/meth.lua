local isPickingUp, isProcessing = false, false
local methaPro = vector3(-1416.14, 6752.2, 3.06)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, methaPro, true) < 5 then
			DrawMarker(22, methaPro, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5,0.5, 0.2, 250, 250, 250, 250, true, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, methaPro, true) < 1 then
			if not isProcessing then
				ESX.ShowFloatingHelpNotification(_U('meth_processprompt'))
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
		else
			Citizen.Wait(500)
		end
	end
end)
local afk = false
AddEventHandler('estoyAfk', function(a) 
if a == true then
	afk = true
else
	afk = false
end
end)
function ProcessMeth()
	if afk == true then
		TriggerEvent('esx:showNotification', 'No puedes interactuar si estas AFK!')
		return
	end
	isProcessing = true

	ESX.ShowNotification(_U('meth_processingstarted'))
	TriggerServerEvent('esx_illegal:processMeth')
	local timeLeft = Config.Delays.MethProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), methaPro, false) > 5 then
			ESX.ShowNotification(_U('meth_processingtoofar'))
			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end