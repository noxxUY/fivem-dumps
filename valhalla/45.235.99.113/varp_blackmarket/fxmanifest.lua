shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'

game 'gta5'

author 'Dev x BTNGaming'
description 'ESX Weapon Black Market'
version '1.0'

client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'locales/es.lua',
    'config.lua',
    'client/peds.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/en.lua',
    'locales/es.lua',
    'config.lua',
    'server/main.lua'
}
