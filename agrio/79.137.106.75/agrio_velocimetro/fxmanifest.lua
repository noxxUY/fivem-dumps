-- THIS MUST BE ABOVE ALL OTHER SCRIPTS



version '1.0.0'

fx_version 'bodacious'
games { 'gta5' }

server_scripts { 
    '@mysql-async/lib/MySQL.lua',
    "config.lua",
    "server/server.lua",
}

ui_page 'hud/ui.html'

client_scripts {
    "client/*.lua",
}

files {
    "hud/*.html",
    "hud/*.css",
    "hud/*.js",
    'hud/fonts/*.TTF',
	'hud/fonts/*.ttf',
	'hud/fonts/*.otf',
    'hud/img/largas.png',
    'hud/img/cortas.png',
    'hud/img/gear.png',
    'hud/img/cruiser.png'
    
}