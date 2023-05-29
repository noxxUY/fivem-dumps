shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'

game 'gta5'

version '1.1'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'config_sv.lua',
	'server/main.lua'
}

client_scripts {
	'config_cl.lua',
	'client/main.lua'
}

shared_script '@es_extended/imports.lua'
