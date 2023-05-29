fx_version 'adamant'

game 'gta5'
lua54 'yes'
description 'Servicios Comunitarios | Kilombo RP'

version '1.1.1'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'@ox_lib/init.lua',
	'locales/es.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

dependency 'es_extended'





