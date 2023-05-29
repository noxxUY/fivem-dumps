
fx_version 'adamant'

game 'gta5'

description 'ESX License'

version '1.0.1'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@async/async.lua',
	'server/main.lua'
}
