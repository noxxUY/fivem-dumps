fx_version 'adamant'

game 'gta5'

description 'ESX Holdup'

version '1.1.0'

shared_scripts{
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'configbank.lua'
}

client_scripts {
	'client/banks.lua',
	'client/main.lua'
}

server_scripts {
	'server/bank.lua',
	'server/main.lua'
}



