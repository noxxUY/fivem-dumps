
fx_version 'adamant'

game 'gta5'

shared_script '@es_extended/imports.lua'

client_scripts {
	"config.lua",
	"client/functions.lua",
	"client/main.lua"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/main.lua",
	"server/functions.lua",
	"server/database.lua"
	
}