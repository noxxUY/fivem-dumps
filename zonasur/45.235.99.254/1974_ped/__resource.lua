resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description '1974 PED'

client_scripts {
	'config.lua',
	'client.lua'
}

server_scripts {
	'config.lua',
	'server.lua',
	'@mysql-async/lib/MySQL.lua',
}