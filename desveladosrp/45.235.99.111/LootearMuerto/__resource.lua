
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_script '@es_extended/imports.lua'

client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
	'locales/sv.lua',
    'config.lua',
    'client/main.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
	'locales/sv.lua',
    'config.lua',
	'server/main.lua'
}