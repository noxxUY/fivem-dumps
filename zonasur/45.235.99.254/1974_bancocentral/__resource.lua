fx_version 'adamant'

game 'gta5'

description 'Banco Central 1974'

server_scripts {
		'@mysql-async/lib/MySQL.lua',
        'server.lua',
		"config.lua"
}
client_script {
        'client.lua',
		"config.lua"
}