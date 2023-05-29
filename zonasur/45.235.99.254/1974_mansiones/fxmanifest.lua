fx_version 'adamant'
games { 'gta5' }

description 'Mansiones by 1974'

client_scripts {
	"config.lua",
	"client/main.lua"
}

server_scripts {
	"@async/async.lua",
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/main.lua",
}