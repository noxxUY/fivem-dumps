fx_version 'adamant'

game 'gta5'

author 'Gacha#4596'

description 'A ped system by Gacha'

client_scripts {
	'Client/*.lua',
	'Client/Modules/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/Modules/*.lua',
	'server/*.lua',
	'server/Classes/*.lua'
}