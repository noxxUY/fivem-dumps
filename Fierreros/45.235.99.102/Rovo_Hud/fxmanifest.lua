fx_version 'cerulean'

game 'gta5'
lua54 'yes'
author 'Roderic#0001 and tavO#5849'
description 'Rovo Hud!'

--Client Scripts-- 
client_scripts {
    'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
    'Server/*.lua'
}


shared_scripts {
    'Shared.lua'
}

--UI Part-- 
ui_page {
    'html/index.html', 
}

--File Part-- 
files {
    'html/index.html',
    'html/app.js', 
    'html/style.css',
    'html/img/*.png',
    'html/dist/*.js',
    'html/dist/*.css',
} 

escrow_ignore {
    'Shared.lua',
    'Client/Map.lua',
    'Client/Vehicle.lua',
    'Client/EsxDeclaration.lua',
    'Server/EsxDeclaration.lua'
}

dependency '/assetpacks'