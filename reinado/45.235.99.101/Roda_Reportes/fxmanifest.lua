fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'Roderic#0614'
description 'Example'

--Client Scripts-- 
client_scripts {
 'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
 'Server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'Config.lua'
}
