fx_version 'adamant'

game 'gta5'

description 'Kilombo mecánicos'
lua54 'yes'
version '1.0'
legacyversion '1.8.5'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'@ox_lib/init.lua',
	'config.lua',
	'locales/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

dependencies {
	'es_extended',
	'esx_society',
	'esx_billing'
}




