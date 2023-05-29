fx_version 'cerulean'
game 'gta5' 
description 'Presencia en discord'
version '1.0.5'

shared_scripts {
	'@es_extended/imports.lua',
	'config.lua'
}

client_script {
	'client/main.lua'
}

server_script{
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}




