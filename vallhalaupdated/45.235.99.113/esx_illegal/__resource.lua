shared_script '@FiveEye/FiveEye.lua'

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Illegal'

version '2.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua',
	'server/coke.lua',
	'server/lsd.lua',
	'server/meth.lua',
	'server/weed.lua',
	'server/heroin.lua',
	'server/chemicals.lua',
	'server/licenseshop.lua',
	'server/moneywash.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua',
	'client/weed.lua',
	'client/meth.lua',
	'client/coke.lua',
	'client/lsd.lua',
	'client/heroin.lua',
	'client/chemicals.lua',
	'client/hydrochloricacid.lua',
	'client/sodiumhydroxide.lua',
	'client/sulfuricacid.lua',
	'client/licenseshop.lua',
	'client/moneywash.lua',
	'client/teleport.lua',
}

dependencies {
	'es_extended'
}
