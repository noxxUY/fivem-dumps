fx_version 'cerulean'
game 'gta5'

shared_scripts {
	'@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'locales/es.lua',
    'ConfigGrups.lua',
    'Client/Config.lua'
}

client_script {
    'Client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'Server/*.lua',
}


ui_page 'html/index.html'


files {
	'html/index.html',
	'html/jquery.js',
	'html/init.js',
}





