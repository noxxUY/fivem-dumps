
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'littlebot'

shared_script '@es_extended/imports.lua'

-- Server
server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

-- Client
client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'client/main.lua'
}
