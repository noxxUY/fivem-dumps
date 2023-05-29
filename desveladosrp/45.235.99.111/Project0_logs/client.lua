--[[ ===================================================== ]]--
--[[                     Project Zer0                      ]]--
--[[ ===================================================== ]]--

          --[Discord](https://discord.gg/xgfHnxXssE)
--[[local spawned = false
AddEventHandler("playerSpawned",function()
	if spawned == false then
		TriggerServerEvent("raiderlog:giris")
		spawned = true
	end
end)]]--