fx_version 'cerulean'
games { 'gta5' }
description 'GKSHOP - GKS EBAY'
version '1.1'


files {
    -- TEST
	'img/*.jpg',
	'img/*.png'
}

-- Client Scripts
client_scripts {
	'@es_extended/locale.lua',
	"locales/en.lua",
	'config.lua',
	'client/main.lua',
}

-- Server Scripts
server_scripts {
	--'@oxmysql/lib/MySQL.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	"locales/en.lua",
	'config.lua',
	'server/main.lua',
	'server/mainAPI.lua',
}

lua54 'yes'


escrow_ignore {
	'config.lua' ,
	"locales/en.lua",
	'server/*.lua',
	'client/*.lua'
}
dependency '/assetpacks'