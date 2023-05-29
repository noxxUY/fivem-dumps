fx_version 'adamant'

game 'gta5'

description 'Forzar vehiculos'

version '2.0.0'
ui_page 'html/index.html'

shared_scripts { 
	'@es_extended/imports.lua'
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/reset.css',
    'html/break.mp3',
    'html/abierto.mp3'
}

client_scripts {
    'cl.lua',
    'frontend.lua',
}

server_scripts {
    'sv.lua',
}





