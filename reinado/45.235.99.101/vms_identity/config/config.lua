Config                  = {}

Config.MaxNameLength = 20 -- Max Name Length.
Config.LimitHeight = {120, 220} -- minimum and maximum
Config.LimitYear = {1900, 2010} -- minimum and maximum

Config.EnableBlur = true

Config.Multichars = false
Config.UseCustomSkinCreator = false -- If you want this you must set Config.Multichars = false 

Config.Notification = function(title, message, type)
	if type == "success" then
	ESX.ShowNotification(message)
	--	exports["vms_notify"]:Notification(title, message, 4000, "#58c431", "fa-solid fa-fingerprint")
	elseif type == "error" then
--		exports["vms_notify"]:Notification(title, message, 4000, "#c43131", "fa-solid fa-fingerprint")
	ESX.ShowNotification(message)
	elseif type == "info" then
	--	exports["vms_notify"]:Notification(title, message, 4000, "#4287f5", "fa-solid fa-fingerprint")
	ESX.ShowNotification(message)
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