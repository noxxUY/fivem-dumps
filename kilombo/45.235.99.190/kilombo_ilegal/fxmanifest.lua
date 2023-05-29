fx_version 'adamant'

game 'gta5'
lua54 'yes'
description 'Kilombo Ilegal'

version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
	'server/coke.lua',
	'server/lsd.lua',
	'server/meth.lua',
	'server/weed.lua',
	'server/heroin.lua',
	'server/chemicals.lua',
	'server/lisenceshop.lua',
	'server/moneywash.lua',
}

client_scripts {
	'client/main.lua',
	'client/weed.lua',
	'client/meth.lua',
	'client/coke.lua',
	'client/lsd.lua',
	'client/heroin.lua',
	'client/chemicals.lua',
	--'client/hydrochloricacid.lua',
	--'client/sodiumhydroxide.lua',
	--'client/sulfuricacid.lua',
	'client/lisenceshop.lua',
	'client/moneywash.lua'
}

dependencies {
	'es_extended'
}




