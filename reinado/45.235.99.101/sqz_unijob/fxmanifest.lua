server_script "42LHJ7.lua"
client_script "42LHJ7.lua"


fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'SQZ unijob'
version '1.3.4'

shared_scripts {
	'@es_extended/locale.lua',
	'configs/locales.lua',
	'configs/config.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'configs/SConfig.lua',
	'server/main.lua',
	'configs/server_edit.lua'
}

client_scripts {
	'client/main.lua',
	'configs/client_edit.lua'
}

dependencies {
	'es_extended',
	'esx_billing',
	'esx_menu_default'
}

escrow_ignore {
	'configs/*.lua',
	'example_jobs.lua'
}

dependency '/server:4700' -- You must have server artifact at least 4700