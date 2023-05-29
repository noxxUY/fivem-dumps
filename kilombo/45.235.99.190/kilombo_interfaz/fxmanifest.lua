fx_version 'cerulean'
game 'gta5'

shared_scripts {
    '@es_extended/imports.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/**.**'
}



