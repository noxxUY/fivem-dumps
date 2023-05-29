fx_version 'adamant'

games { 'gta5' }

description 'Vehicle hunt by Slerbamonsteri'

version '6.9.0'

client_scripts {
	'client.lua',
	'config.lua',
}

server_script {
	'server.lua',
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
}
