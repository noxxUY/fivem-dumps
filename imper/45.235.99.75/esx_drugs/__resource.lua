





--##############################
--#                            #
--# CONFIG. BY -AGUS. AP LEAKS #
--#                            #
--##############################
--# Agacharse
--# Dudas al privado: -Agus#8423
--# Mi servidor de Discord -> https://discord.gg/JXCdVPcDG4

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Sistema de Drogas'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua',
	'server/coke.lua',
	'server/lsd.lua',
	'server/meth.lua',
	'server/weed.lua',
	'server/weed2.lua',
	'server/heroin.lua',
	'server/chemicals.lua',
	'server/lisenceshop.lua',
	'server/moneywash.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'client/pepe.lua',
	'client/weed.lua',
	'client/weed2.lua',
	'client/meth.lua',
	'client/coke.lua',
	'client/lsd.lua',
	'client/heroin.lua',
	'client/chemicals.lua',
	'client/hydrochloricacid.lua',
	'client/sodiumhydroxide.lua',
	'client/sulfuricacid.lua',
	'client/lisenceshop.lua',
	--'client/moneywash.lua',
}

dependencies {
	'es_extended'
}

client_script "godzilla-ac_eOStH.lua"