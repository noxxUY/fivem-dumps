
------------------------------------------

fx_version 'adamant'

game 'gta5'

description 'ESX RP Chat'

version '1.3.1'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'local/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'local/*.lua',
	'config.lua',
	'client/*.lua'
}

dependency 'es_extended'