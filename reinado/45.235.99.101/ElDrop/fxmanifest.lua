fx_version 'adamant'
games { 'gta5' }

author 'Bigyzis'
description 'Air Drop v2'
version '0.2'

client_scripts {
    'config.lua',
    'client.lua',

}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'config.lua',
    'server.lua'
}