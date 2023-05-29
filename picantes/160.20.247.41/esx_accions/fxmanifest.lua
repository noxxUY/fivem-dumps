shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'

game 'gta5'

version '1.8.5'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',	
	'locales/*.lua',
	'config/config_cm.lua',
	'config/config_ja.lua',
	'config/BL4CK-webhook.lua',
	'server/*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config/config_cm.lua',
	'config/config_ja.lua',
	'client/*.lua'
}

dependencies {
	'es_extended',
	'async'
}
--==========================================
--Servidor "Yordi's Base"- CREADOR : ¡ Yordi zzz !#0347
--==========================================