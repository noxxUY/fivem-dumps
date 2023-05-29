

fx_version 'adamant'
games { 'gta5' }


server_script {
    '@mysql-async/lib/MySQL.lua',
    --'server.lua',
    'client/config.lua',
    '@es_extended/locale.lua',
    "config/*.lua",
}
	
client_script {
    'client/*.lua', 
    "config/*.lua",
    '@es_extended/locale.lua',
    "trabajos/*.lua",
}

ui_page "ui/index.html"

files {
    "ui/*.html",
    "ui/*.js",
    "ui/*.css"
}