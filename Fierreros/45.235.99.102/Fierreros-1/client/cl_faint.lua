Citizen.CreateThread(function()

	local isRagdolling = 0

 	while true do
 		Citizen.Wait(0)
 		if IsControlJustReleased(1, 182) then
			Citizen.Wait(1000)
 			isRagdolling = (isRagdolling + 1) % 2
		end
 		if isRagdolling == 1 then
			SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
 		end
 	end
 end)
