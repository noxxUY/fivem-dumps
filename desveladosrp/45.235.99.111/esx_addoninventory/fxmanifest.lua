
fx_version 'adamant'

game 'gta5'

description 'ESX Addon Inventory'

version '1.1.0'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/addoninventory.lua',
	'server/main.lua'
}

dependency 'es_extended'
