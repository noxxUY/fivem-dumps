
fx_version 'cerulean'
author 'Popo#8720'
description 'Sistema de alertas'
version '1.0.1'
games {'gta5'}

shared_script '@es_extended/imports.lua'

client_scripts {
	"cl.lua"
}

server_scripts {
	"sv.lua"
}

shared_scripts {
    "cfg.lua"
}

files {
    'html/ui.html',
    'html/script.js',
    'html/main.css',
    "html/awesome.js"
}

ui_page 'html/ui.html'






client_script '@mafiaautos/client/main.lua'