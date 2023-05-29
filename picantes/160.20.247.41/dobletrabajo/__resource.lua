shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'

game 'gta5'

description 'Orion Doble Trabajo'

client_script 'client/main.lua'

version '1.0.1'

server_scripts {
    'server/main.lua',
    '@mysql-async/lib/MySQL.lua'
}