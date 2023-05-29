fx_version 'adamant'
games { 'gta5' }

shared_script '@es_extended/imports.lua'

client_scripts {
	'jaymenu.lua',
	'config.lua',
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

file 'AllTattoos.json'