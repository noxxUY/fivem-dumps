function Alert(title, message, time, type)
	SendNUIMessage({
		action = 'open',
		title = title,
		type = type,
		message = message,
		time = time,
	})
end

RegisterNetEvent('okokNotify:Alert')
AddEventHandler('okokNotify:Alert', function(title, message, time, type)
	Alert(title, message, time, type)
end)

-- Example Commands - Delete them

RegisterCommand('success', function()
	exports['okokNotify']:Alert("SUCCESS", "You have sent <span style='color:#47cf73'>420€</span> to Tommy!", 5000, 'success')
end)

RegisterCommand('info', function()
	exports['okokNotify']:Alert("INFO", "The Casino has opened!", 5000, 'info')
end)

RegisterCommand('error', function()
	exports['okokNotify']:Alert("ERROR", "Please try again later!", 5000, 'error')
end)

RegisterCommand('warning', function()
	exports['okokNotify']:Alert("WARNING", "You are getting nervous!", 5000, 'warning')
end)

RegisterCommand('phone', function()
	exports['okokNotify']:Alert("SMS", "<span style='color:#f38847'>Tommy: </span> Where are you?", 5000, 'phonemessage')
end)

RegisterCommand('longtext', function()
	exports['okokNotify']:Alert("LONG MESSAGE", "Lorem ipsum dolor sit amet, consectetur adipiscing elit e pluribus unum.", 5000, 'neutral')
end)


RegisterCommand('police', function()
	exports['okokNotify']:Alert("RO-ALERT", "<span style='color:#f38847'>Tommy: </span> Where are you?", 5000, 'police')
end)


RegisterCommand('roalert', function()
	local msg = "<b style='color:#ba1313'>Alerte de Urgenta</b> <br /><br />Acesta este un mesaj pentru testarea sistemului RO-ALERT.<br />Nu se impune aplicarea masurilor de autoprotectie<br /><br />Inspectoratul de Situatii de Urgenta Los Santos "
	exports['okokNotify']:Alert("RO-ALERT", msg, 9300, 'roalert')
end)


RegisterCommand('cnn', function()
	local msg = "<b style='color:#ba1313'>Alerte de Urgenta</b> <br /><br />Acesta este un mesaj pentru testarea sistemului RO-ALERT.<br />Nu se impune aplicarea masurilor de autoprotectie<br /><br />Inspectoratul de Situatii de Urgenta Los Santos "
	exports['okokNotify']:Alert("RO-ALERT", msg, 9300, 'cnn')
end)