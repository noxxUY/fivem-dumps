shared_script '@FiveEye/FiveEye.lua'

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Holdup'

version '1.1.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'client/motiontext.lua',
	'client/main.lua',
	'client/cliente.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}

exports {"Draw3DTextPermanent", "Draw3DText", "Draw3DTextTimeout"}