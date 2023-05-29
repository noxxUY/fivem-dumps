fx_version 'adamant'

game 'gta5'

name 'LERP-CarLock'
author 'Made by Millxr#0001 on Discord'

lua54 'yes'

shared_script {
	'@ox_lib/init.lua',
	'config.lua',
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/en.lua'
}

version '1.0.0'

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

dependencies {
	'es_extended'
}




