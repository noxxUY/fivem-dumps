shared_script '@FiveEye/FiveEye.lua'

fx_version 'cerulean'
game 'gta5'

client_scripts {
    'client/cl_main.lua',
    'client/cl_main_ping.lua',
    'client/cl_main_deathloot.lua',
    'client/noclip.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/commands.lua',
    'server/sv_main_ping.lua',
    'server/sv_main_deathloot.lua',
    'server/sv_main.lua'
}