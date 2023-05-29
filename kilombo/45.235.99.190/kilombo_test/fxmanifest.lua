fx_version 'bodacious'
game 'gta5'
author 'Kilombo'

description 'Kilombo Test'

version '1.2.0'

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/logo.png',
	'html/cursor.png',
	'html/styles.css',
	'html/questions.js',
	'html/scripts.js',
	'html/debounce.min.js'
}

shared_scripts {
	'@es_extended/imports.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server.lua'
}
client_script {
    'client.lua'
}




