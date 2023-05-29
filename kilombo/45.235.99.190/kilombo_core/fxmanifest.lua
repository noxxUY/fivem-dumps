fx_version 'adamant'

game 'gta5'
lua54 'yes'
description 'Core Kilombo Roleplay'

author 'Homer'

ui_page 'html/index.html'

files {
  'html/index.html'
}


shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
	'@ox_lib/init.lua',
	'locales/es.lua'

}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config/*.lua',
	'server/*.lua'
}

client_scripts {
	'config/*.lua',
	'client/*.lua'
}

dependencies {
	'es_extended',
	'ox_inventory'
}



