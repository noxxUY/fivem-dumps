
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua',
	'config.lua',
	'locales/fr.lua',
	'locales/en.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua',
	'config.lua',
	'locales/en.lua'
}

dependency {
	'es_extended',
	'd3x_vehicleshop'
}