resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'Mafia´s System'

version 'a0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/administrator.lua',
	'client/register.lua',
	'client/enclosures.lua',
	'config.lua'
}

ui_page('html/index.html')

files({
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/cursor.png',
})

server_exports {
	'getPlayerFromId',
}

exports {
	'HUD_',
	'GetGroup',
	'Esposado',
}