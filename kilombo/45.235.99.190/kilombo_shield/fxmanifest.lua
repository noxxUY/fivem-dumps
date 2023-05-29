fx_version 'cerulean'
game 'gta5' 

author 'HömeR#0666'
version '2.6.0'

shared_scripts {
    '@es_extended/imports.lua'
}

client_scripts {
    'client/main.lua',
}

server_scripts { 
    '@oxmysql/lib/MySQL.lua',
    'server/comandos.lua',
    'server/main.lua'
}

server_exports {
	'BanThis'
}
