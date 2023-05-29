shared_script '@FiveEye/FiveEye.lua'

fx_version 'cerulean'

game 'gta5'

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
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