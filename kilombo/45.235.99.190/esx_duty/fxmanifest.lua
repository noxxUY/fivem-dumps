fx_version 'bodacious'
game 'gta5'
author 'The Owls - Nosmakos'
description 'ESX Advanced Duty System'
version '1.0.0'

shared_script {'@es_extended/imports.lua'}

client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
    'client/main.lua',
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
    'server/main.lua',
}

dependency 'es_extended'




