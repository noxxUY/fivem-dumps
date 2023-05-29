local isPickingUp, isProcessing = false, false
local coordsHydroc = vector3(1542.171, 6334.075, 24.07324)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.lsdProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowFloatingHelpNotification(_U('lsd_processprompt'))
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
function Processlsd()
	if afk == true then
		TriggerEvent('esx:showNotification', 'No puedes interactuar si estas AFK!')
		return
	end
	isProcessing = true

	ESX.ShowNotification(_U('lsd_processingstarted'))
	TriggerServerEvent('esx_illegal:processLSD')
	local timeLeft = Config.Delays.lsdProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.lsdProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('lsd_processingtoofar'))
			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, coordsHydroc, true) < 5 then
			if not isProcessing then
				ESX.ShowFloatingHelpNotification(_U('thionylchloride_processprompt'))
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
	TriggerServerEvent('esx_illegal:processThionylChloride')
	local timeLeft = Config.Delays.thionylchlorideProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), coordsHydroc, false) > 5 then
			ESX.ShowNotification(_U('thionylchloride_processingtoofar'))
			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end