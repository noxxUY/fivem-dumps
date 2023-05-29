RegisterCommand('loadcars', function()
	print("Start loading vehicles...\n")
	for i, vehicle in ipairs(Vehicles) do
		if not IsModelInCdimage(vehicle) or not IsModelAVehicle(vehicle) then
				print(vehicle .. " hasn't been found")
		else
			RequestModel(vehicle)
			repeat
					print("Loading " .. vehicle.."...")
				Citizen.Wait(500)
			until HasModelLoaded(vehicle)

			if HasModelLoaded(vehicle) then
					print(vehicle .. " is loaded.\n")	
			end
			SetModelAsNoLongerNeeded(vehicle)
		end
	end
		print("All addon vehicles are loaded!")
end)