fx_version 'adamant'

game 'gta5'

description 'rewards'

version '1.2.0'

files {
	'html/index.html',

	'html/jquery.countdown.min.js',
	'html/config.js',
	'html/script.js',
	'html/style.css',
	'html/img/cars/*.png',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/sonido-ruleta.mp3',
    'html/fonts/Growland_Bold.otf',
}

ui_page {
	'html/index.html'
}

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua'
}

server_scripts {
	'server/server.lua',
	'@oxmysql/lib/MySQL.lua'
}

client_scripts {
	'client/client.lua'
}




