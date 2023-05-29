fx_version 'cerulean'

game 'gta5'

author 'Roderic#0614'
description 'Example'

--Client Scripts-- 
client_scripts {
  'Vehiculos.lua',
  'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'Server/*.lua'
}

shared_scripts {
    'Config.lua'
}

--UI Part-- 
ui_page {
 'html/index.html', 
}

--File Part-- 
files {
 'html/index.html',
 'html/app.js', 
 'html/style.css'
} 