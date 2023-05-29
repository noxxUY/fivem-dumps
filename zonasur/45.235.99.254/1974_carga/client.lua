local Vehicles = {}

Citizen.CreateThread(function()
	TriggerServerEvent('1974_carga:GetVehicles')
end)

RegisterNetEvent('1974_carga:VehicleIntoTable')
AddEventHandler('1974_carga:VehicleIntoTable', function(name)
	table.insert(Vehicles, name)
end)

RegisterNetEvent('1974_carga:LoadVehicles')
AddEventHandler('1974_carga:LoadVehicles', function()
    
    for i, v in pairs(Config.OtherVehicles) do
        TriggerEvent('1974_carga:VehicleIntoTable', v)
	end

	if Config.DebugPrint then
		print("Start loading vehicles...\n")
	end
	for i, vehicle in ipairs(Vehicles) do
		if not IsModelInCdimage(vehicle) or not IsModelAVehicle(vehicle) then
			if Config.DebugPrint then
				print(vehicle .. " no se ha encontrado (el nombre del modelo no es el mismo que el nombre de la carpeta o está mal escrito en \"Config.OtherVehicles\").")
			end
		else
			RequestModel(vehicle)
			
			repeat
				if Config.DebugPrint then
					print("Cargando " .. vehicle.."...")
				end
				Citizen.Wait(500)
			until HasModelLoaded(vehicle)

			if HasModelLoaded(vehicle) then
				if Config.DebugPrint then
					print(vehicle .. " cargo correctamente.\n")
				end
			end
			SetModelAsNoLongerNeeded(vehicle)
		end
	end
	if Config.DebugPrint then
		print("Todos los vehiculos fueron cargados correctamente!")
	end

end)
