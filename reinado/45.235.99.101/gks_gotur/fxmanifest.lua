fx_version 'cerulean'
games { 'gta5' }

description 'GKS GOTUR'

version '1.0'



files {

    -- TEST
	'img/*.jpg',
	'img/*.png'

}

client_scripts {
	'@es_extended/locale.lua',
	"locales/en.lua",
	'config.lua',
	'client/main.lua',
}

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