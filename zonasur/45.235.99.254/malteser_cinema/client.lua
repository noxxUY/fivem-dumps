local cinematicbars = true


AddEventHandler("playerSpawned", function(spawn)
	SendNUIMessage({
		action = "close"
	})
end)


RegisterNetEvent('malte-cinema:activate')
AddEventHandler('malte-cinema:activate', function()
	if cinematicbars then
		SendNUIMessage({
			action = "open"
		})
		cinematicbars = false
	else
		SendNUIMessage({
			action = "close"
		})
		cinematicbars = true
	end
end)
