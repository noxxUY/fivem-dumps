fx_version 'adamant'

game 'gta5'

description 'ESX Clothes Shop'

version '1.8.5'
lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

dependencies {
	'es_extended',
	'esx_skin'
}




