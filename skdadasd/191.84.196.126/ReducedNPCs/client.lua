-- Density values from 0.0 to 1.0.
DensityMultiplier = 0.3
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(0.3)
	    SetPedDensityMultiplierThisFrame(1.0)
	    SetRandomVehicleDensityMultiplierThisFrame(0.3)
	    SetParkedVehicleDensityMultiplierThisFrame(0.0)
	    SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
	end
end)