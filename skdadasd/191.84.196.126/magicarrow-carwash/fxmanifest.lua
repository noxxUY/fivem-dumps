fx_version "adamant"

game "gta5"
shared_script '@es_extended/imports.lua'
shared_scripts {
    'config.lua'
}

client_script { 
"client/client.lua"
}

server_script {
"server/server.lua"
} 



ui_page "html/index.html"
files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/fonts/pricedown.ttf',
    'html/fonts/modern_sans_serif_7.ttf',
    'html/sounds/*',
    'html/img/*',
    'html/reset.css'
}
