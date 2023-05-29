
fx_version 'adamant'

game 'gta5'

description 'ESX Addon Account'

version '1.0.1'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/addonaccount.lua',
	'server/main.lua'
}

dependency 'es_extended'
