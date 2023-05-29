server_script "SHOQ0LQ9ETT.lua"
client_script "SHOQ0LQ9ETT.lua"


fx_version 'adamant'

game 'gta5'

description 'ESX Advanced Vehicle Shop'

Author 'Human Tree92 | Velociti Entertainment'

version '1.0.0'

server_scripts {
	'@async/async.lua',
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
	'client/utils.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'esx_dmvschool',
	'esx_licenseshop'
}

export 'GeneratePlate'
