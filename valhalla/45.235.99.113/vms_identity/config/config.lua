Config                  = {}

Config.MaxNameLength = 20 -- Max Name Length.
Config.LimitHeight = {120, 220} -- minimum and maximum
Config.LimitYear = {1800, 2023} -- minimum and maximum

Config.EnableBlur = true

Config.Multichars = false
Config.UseCustomSkinCreator = false -- If you want this you must set Config.Multichars = false 

Config.Notification = function(title, message, type)
	if type == "success" then
		ESX.ShowNotification(message)
		-- TriggerEvent('esx:showNotification', message)
		
	elseif type == "error" then
		ESX.ShowNotification(message)
		-- TriggerEvent('esx:showNotification', message)
		
	elseif type == "info" then
		ESX.ShowNotification(message)
		-- TriggerEvent('esx:showNotification', message)
		
	end
end

Config.Translate = {
	['cmd.opened_register'] = 'Successfully opened register menu for player %s',
	['cmd.help_id'] = 'id',
	['cmd.help_register'] = 'Open a register menu for a player',

	['register_notify'] = 'Registro',
  	['register_success'] = 'Registración completada!',
  	['already_registered'] = 'Ya registraste este usuario.',
  	['invalid_firstname'] = 'Revisa <b>Nombre</b>.',
  	['invalid_lastname'] = 'Revisa <b>Apellido</b>.',
  	['invalid_sex'] = 'Revisa <b>Genero</b>.',
  	['invalid_dob'] = 'Revisa <b>Fecha de nacimiento</b>.',
  	['invalid_height'] = 'Revisa <b>Altura</b>.',
}