fx_version 'cerulean'

game 'gta5'

shared_scripts {
	'@es_extended/imports.lua',
	'config.lua'
}

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}

client_scripts {
	'client/client.lua'
}

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/sounds/pickaxe.ogg',
	'client/html/sounds/breakrock.ogg'
})

dependencies {
	'oxmysql',
}



