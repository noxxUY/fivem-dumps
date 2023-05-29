fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Squizer'
description 'Extended drugs script by Squizer'
version '1.3.7'

shared_scripts {
	'@es_extended/locale.lua',
	'configs/locales.lua',
	'configs/config.lua'
}

client_scripts {
    'configs/client_edit.lua',
    'client/main.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'configs/config_s.lua',
    'configs/server_edit.lua',
    'server/main.lua',
}

ui_page 'nui/index.html'
files {
    'nui/app.js',
    'nui/index.html',
    'nui/style.css'
}

escrow_ignore {
	'configs/*.lua',
}

dependency '/server:4700' -- You must have server artifact at least 4700

dependency '/assetpacks'