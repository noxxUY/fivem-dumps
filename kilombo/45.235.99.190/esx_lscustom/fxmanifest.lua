fx_version 'adamant'

game 'gta5'

description 'ESX LS Customs'
lua54 'yes'
version '1.0'
legacyversion '1.8.5'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}




