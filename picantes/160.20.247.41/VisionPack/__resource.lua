shared_script '@FiveEye/FiveEye.lua'

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'JArita'

version '2.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',

	'server/*.lua',

}

client_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config/*.lua',
	'client/*.lua',

}

dependencies {
	'es_extended'
}