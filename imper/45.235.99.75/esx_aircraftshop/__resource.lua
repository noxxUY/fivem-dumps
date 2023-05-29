





resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Aircraft Shop'

version '1.2.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/br.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'config.lua',
	'client/utils.lua',
	'client/main.lua'
}


client_script "@antiocheat-neo/acloader.lua"
client_script "godzilla-ac_eOStH.lua"