
fx_version 'adamant'

game 'gta5'

description 'ESX Data Store'

version '1.0.2'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/classes/datastore.lua',
	'server/main.lua'
}
