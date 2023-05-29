RegisterNetEvent("esx_givecarkeys:keys")
AddEventHandler("esx_givecarkeys:keys", function()

giveCarKeys()

end)

function giveCarKeys()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsPedInAnyVehicle(playerPed,  false) then
        vehicle = GetVehiclePedIsIn(playerPed, false)			
    else
        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
    end

	local plate = GetVehicleNumberPlateText(vehicle)
	local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

	ESX.TriggerServerCallback('esx_givecarkeys:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestPlayer == -1 or closestDistance > 3.0 then
					exports['okokNotify']:Alert("SERVIDOR", 'No hay nadie cerca para darle las llaves', 3500, 'info')	
				else
						ESX.UI.Menu.CloseAll()
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'confirmar_llaves',
						{
							title = ('Escribí "Si" o "Yes" para confirmar dar llaves. (Sin comillas)')
						},
						function(data, menu)
							if data.value == nil then
							exports['okokNotify']:Alert("SERVIDOR", 'Tenés que escribir "Si" o "Yes" para confirmar la entrega de llaves.', 5500, 'info')
							else
							
								if data.value == "si" or data.value == "Si" or data.value == "SI" or data.value == "sI" or data.value == "yes" or data.value == "yES" or data.value == "YEs" or data.value == "YES" then
									local retval = GetDisplayNameFromVehicleModel(vehicleProps.model)
									exports['okokNotify']:Alert("SERVIDOR", 'Entregaste las llaves de tu '..retval..', con patente '..vehicleProps.plate..'', 4500, 'info')	
									TriggerServerEvent('esx_givecarkeys:setVehicleOwnedPlayerId', GetPlayerServerId(closestPlayer), vehicleProps)
								end
							
							menu.close()
							end
						end,
						function(data, menu)
							menu.close()
						end)
				end

		else
			exports['okokNotify']:Alert("SERVIDOR", 'No podes entregar las llaves de un vehículo que no es tuyo.', 3500, 'info')	
		end
	end, GetVehicleNumberPlateText(vehicle))
end
