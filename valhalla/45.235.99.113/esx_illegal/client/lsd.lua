local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.lsdProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('lsd_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				if not IsPedInAnyVehicle(playerPed, true) then
					if Config.RequireCopsOnline then
						ESX.TriggerServerCallback('esx_illegal:EnoughCops', function(cb)
							if cb then
								Processlsd()
							else
								ESX.ShowNotification(_U('cops_notenough'))
							end
						end, Config.Cops.LSD)
					else
						Processlsd()
					end
				else
					ESX.ShowNotification(_U('need_on_foot'))
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Processlsd()
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

		if GetDistanceBetweenCoords(coords, Config.CircleZones.thionylchlorideProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('thionylchloride_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				if not IsPedInAnyVehicle(playerPed, true) then
					if Config.RequireCopsOnline then
						ESX.TriggerServerCallback('esx_illegal:EnoughCops', function(cb)
							if cb then
								Processthionylchloride()
							else
								ESX.ShowNotification(_U('cops_notenough'))
							end
						end, Config.Cops.LSD)
					else
						Processthionylchloride()
					end
				else
					ESX.ShowNotification(_U('need_on_foot'))
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

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.thionylchlorideProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('thionylchloride_processingtoofar'))
			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end