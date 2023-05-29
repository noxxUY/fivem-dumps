fx_version 'adamant'

game 'gta5'

description 'HR Scoreboard'

version '1.1.0'

shared_scripts {
    '@es_extended/imports.lua'
}

server_script 'server/main.lua'

client_script 'client/main.lua'

ui_page 'html/scoreboard.html'

files {
	'html/scoreboard.html',
	'html/script.js',
	'html/style.css'
}





