resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX REPAIR - By Nikuez'

version '1.0.0'

shared_script { '@es_extended/imports.lua' }

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

client_scripts {
	'client.lua'
}

dependency 'es_extended'
