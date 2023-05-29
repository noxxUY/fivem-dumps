fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name "kilombo_zonas"
description "Zonas seguras / rojas"
version "1.0"

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'@es_extended/imports.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js'
}

client_scripts {
	'client/*.lua',
	'config.lua',
}

server_scripts {
	'server/*.lua',
	'config.lua',
}






