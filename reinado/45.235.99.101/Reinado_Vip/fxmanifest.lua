fx_version 'cerulean'

game 'gta5'

author 'Roderic#0614'
description 'Example'

--Client Scripts-- 
client_scripts {
 'Client/*.lua'
}

server_exports {
	'CheckBattle'
}

--Server Scripts-- 
server_scripts {
 'Server/*.lua'
}

shared_scripts {
    'Config.lua'
}


ui_page 'html/index.html'


files {
	'html/index.html',
	'html/jquery.js',
	'html/init.js',
}

