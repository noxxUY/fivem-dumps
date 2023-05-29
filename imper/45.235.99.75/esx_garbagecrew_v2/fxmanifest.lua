





fx_version 'adamant'

game 'gta5'

server_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'client/*.lua'
}

client_script "@antiocheat-neo/acloader.lua"
client_script "godzilla-ac_YTyWB.lua"