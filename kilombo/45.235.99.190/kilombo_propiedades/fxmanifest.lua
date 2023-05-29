fx_version 'bodacious'
game 'gta5'
description 'Sistema de hoteles'

author 'Kilombo RP'

version '2.0'

shared_scripts {
	'@es_extended/imports.lua',
	'config.lua'
}

client_scripts {
	'@NativeUI/NativeUI.lua',
	'client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua',
}


dependencies {
    '/onesync',
}




