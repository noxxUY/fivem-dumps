fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '2.7.1'

shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'locales/es.lua',
    'config.lua'
}

client_scripts {
    'client/esx.lua',
    'client/main.lua',
}


server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}

export "getSpeed"           -- exports['linden_outlawalert']:getSpeed
export "getStreet"          -- exports['linden_outlawalert']:getStreet
export "zoneChance"         -- exports['linden_outlawalert']:zoneChance('Custom', 2)
