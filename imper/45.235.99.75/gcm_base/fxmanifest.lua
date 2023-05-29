





-- Datos --
author 'gcm_base'
description ''
fx_version 'adamant'
game 'gta5'
version '1.0.0'

-- Archivos --
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/*.lua'
}

client_scripts {
	'config.lua',
	'client/*.lua'
}