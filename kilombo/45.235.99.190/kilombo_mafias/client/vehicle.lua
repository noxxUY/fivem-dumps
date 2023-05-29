function SpawnVehicle(props)
    local coords = GetEntityCoords(PlayerPedId())

    ESX.Game.SpawnVehicle(props.model, coords, 90, function(vehicle)
        if DoesEntityExist(vehicle) then
            ESX.Game.SetVehicleProperties(vehicle, props)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            TriggerServerEvent('lunar_garage:vehicleTakenOut', props.plate)
        end
    end)
end

RegisterNetEvent('Erfan:gang:toggleMenu_vehicle')
AddEventHandler('Erfan:gang:toggleMenu_vehicle', function()
	local playerPed  = PlayerPedId()
    Citizen.Wait(100)
	if IsPedInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local props = ESX.Game.GetVehicleProperties(vehicle)
		ESX.TriggerServerCallback('lunar_garage:saveVehicle', function(success) 
			if success then
				ESX.Game.DeleteVehicle(vehicle)
			else
                ESX.ShowNotification(_U('not_yours'), "error")
			end
		end, props)
	else
		OpenGarage({shared="mafia"})
	end
end)

function OpenGarage(args)
    ESX.TriggerServerCallback('lunar_garage:getVehicles', function(vehicles) 
        if #vehicles > 0 then
            local elements = {}
            for k,v in ipairs(vehicles) do
                local props = json.decode(v.vehicle)
                if IsModelInCdimage(props.model) then
                    local label = GetLabelText(GetDisplayNameFromVehicleModel(props.model))
                    if label == 'NULL' then 
                        label = GetDisplayNameFromVehicleModel(props.model)
                    end
                    if v.type == "car" then
                        icono = "car"
                    elseif v.type == "air" then
                        icono = "helicopter"
                    elseif v.type == "boat" then
                        icono = "boat"
                    end
                    if v.stored == true or v.stored == 1 then
                        table.insert(elements, {
                            title = _U('vehicle', label),
                            icon = icono,
                            description = _U('license_plate', props.plate),
                            metadata = { { label = 'Estado', value = _U('in_garage') } },
                            onSelect = SpawnVehicle,
                            args = props,
                        })
                    elseif v.stored == false or v.stored == 0 and v.storedhouse <= 0 then
                        table.insert(elements, {
                            title = _U('vehicle', label),
                            icon = 'car',
                            description = _U('license_plate', props.plate),
                            metadata = { { label = 'Estado', value = _U('out_garage') } },
                            onSelect = function(args)
                                ESX.ShowNotification(_U('impounded'), "warning")
                            end,
                        })
                    elseif v.storedhouse > 0 then
                        table.insert(elements, {
                            title = _U('vehicle', label),
                            icon = 'car',
                            description = _U('license_plate', props.plate),
                            metadata = { { label = 'Estado', value = _U('en_casa', v.storedhouse) } },
                            onSelect = function(args)
                                ESX.ShowNotification(_U('guardado_casa', v.storedhouse), "info")
                            end,
                        })
                    end
                end
            end
            lib.registerContext({
                id = 'garage_mafia',
                title = "Garage",
                options = elements,
            })
            lib.showContext('garage_mafia')
        else
            ESX.ShowNotification(_U('no_vehicles'), "error")
        end
    end, currentData, args.shared)
end