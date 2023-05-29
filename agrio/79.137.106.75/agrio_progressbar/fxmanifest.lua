

fx_version 'cerulean'
games { 'gta5' }


ui_page 'html/ui.html'

files {
    'html/*.html',
    'html/js/*.js',
    'html/css/*.css'
}

client_scripts {
    'client/main.lua'
}

server_scripts {

}

exports {
	'Progress',
    'Stop'
}