fx_version "cerulean"
game "gta5"

author "Squizer#3020"
description "Simple script for healing players."

shared_script '@es_extended/imports.lua'

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'locales.lua',
    'client.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'server.lua',
    'locales.lua',
    'config.lua'
}
