fx_version 'cerulean'

game 'gta5'

author 'Roderic#0614'
description 'Example'

--Client Scripts-- 
client_scripts {
 'Client/*.lua'
}

shared_scripts {
 'Config.lua'
}

--Server Scripts-- 
server_scripts {
 '@oxmysql/lib/MySQL.lua',
 'Server/*.lua',
 'ServerDiscord/*.js'
}

server_exports {
 'UpdateRole'
}