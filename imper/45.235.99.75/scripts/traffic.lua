Citizen.CreateThread(function()
    while true 
        do
            
        SetVehicleDensityMultiplierThisFrame(0.0) -- NPCS em veículos
        SetPedDensityMultiplierThisFrame(0.0) -- Pedestres 
        SetRandomVehicleDensityMultiplierThisFrame(0.0) -- Veículos aleatórios 
        SetParkedVehicleDensityMultiplierThisFrame(0.0) -- Veículos estacionados 
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- Peds em cenários (sentados, etc)
        
        local playerPed = GetPlayerPed(-1)
        local pos = GetEntityCoords(playerPed) 
        RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
		
		for i = 1, 13 do
			EnableDispatchService(i, false)
		end
		
	-- These natives do not have to be called everyframe.
        SetGarbageTrucks(1)
        SetRandomBoats(0)
        
        Citizen.Wait(1)
    end

end)