Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local opa = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 47) then
            if not opa then
                TaskPlayAnim(PlayerPedId(), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                opa = true
            else
                opa = false
                ClearPedTasks(PlayerPedId())
            end
        end
    end
end)