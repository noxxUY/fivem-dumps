fx_version 'bodacious'

game 'gta5'

description 'ESX Mechanic JOB'

version '1.0.0'

shared_scripts {
	'@es_extended/locale.lua',
	'config/*.lua',
	'locales/*.lua',
}

server_scripts {
	'server/class/*.lua',
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}