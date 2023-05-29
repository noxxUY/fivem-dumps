fx_version 'adamant'

game 'gta5'

name 'EUK-CarLock'
author 'Made by Millxr#0001 on Discord'

version '1.0.0'

server_script {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'esx_vehicleshop'
}

client_script "@Badger-Anticheat/acloader.lua"