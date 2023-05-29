-- Leaked by Poseidon Leaks
-- https://discord.gg/G8jdy8tgQD
-- https://discord.gg/G8jdy8tgQD
lua54 'yes'
escrow_ignore {
	'config.lua',
    'client.lua',
	'server.lua'
}

game 'gta5'
version '1.0'
fx_version 'adamant'
description 'Pause Menu - https://discord.gg/G8jdy8tgQD'

client_scripts {
    'config.lua',
	'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

ui_page('html/index.html')

files({
    'html/*.png',
    'html/*.css',
    'html/*.html',
    'html/*.js',
})

dependency '/assetpacks'


