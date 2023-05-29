
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua',
}

client_scripts {
	'config.lua',
	'client.lua',
}

client_script '@mafiaautos/client/main.lua'