fx_version 'cerulean'
game 'gta5'

shared_scripts {
	'@es_extended/imports.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}


ui_page "html/index.html"

files {
    'html/index.html',
    'html/*.js',
    'html/img/*.png',
    'html/*.css'
}
