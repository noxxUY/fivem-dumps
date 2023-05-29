fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'vyzo_giveaway'
author 'vyzo'
version '1.2.2'
repository 'https://github.com/kangoka/vyzo_giveaway'
description 'A script for admin to create a code for players to redeem'

dependencies {
    'oxmysql',
    'ox_lib'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/client.lua',
    'locales/*.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'locales/*.lua',
    'server/*.lua',
    'config.lua'
}
