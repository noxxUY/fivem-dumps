ESX = nil

Citizen.CreateThread(function() 
	while ESX == nil do 
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
		Citizen.Wait(50) 
		
	end 
end)

RegisterNetEvent('esx_anuncios:sendAnuncio')
AddEventHandler('esx_anuncios:sendAnuncio', function(job, theme, msg)
	SendNUIMessage({
		AnuncioShowing = true,
		job = job,
		msg = msg,
		letter = theme
	})
end)