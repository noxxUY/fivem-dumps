fx_version 'adamant'
game 'gta5'
description 'ESX Barber Shop'

version '1.1.0'
lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua'
}

server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

dependencies {
	'es_extended',
	'esx_skin'
}





