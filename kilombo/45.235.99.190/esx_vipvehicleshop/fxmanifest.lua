fx_version 'adamant'

game 'gta5'

lua54 'yes'

description 'Tienda de vehículos'

version '1.8.5'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/*.lua'
}

dependency 'es_extended'

export 'GeneratePlate'




