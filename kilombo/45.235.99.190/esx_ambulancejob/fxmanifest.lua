fx_version 'adamant'

game 'gta5'

description 'ESX Ambulance Job'

lua54 'yes'
version '1.8.5'

shared_scripts { 
	'@ox_lib/init.lua',
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}


server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/main.lua',
	'client/job.lua',
	'client/garage.lua'
}

dependencies {
	'es_extended',
	'esx_skin',
	'esx_vehicleshop'
}




