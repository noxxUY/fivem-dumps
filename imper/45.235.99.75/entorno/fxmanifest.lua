





fx_version 'adamant'

game 'gta5'

description 'ESX Emergency System'

version '1.0.0'

files {
}

server_script "server.lua"
client_script "client.lua"

server_scripts {

    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
  
  }
client_script "@antiocheat-neo/acloader.lua"
client_script "godzilla-ac_YTyWB.lua"