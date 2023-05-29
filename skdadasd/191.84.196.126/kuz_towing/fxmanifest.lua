fx_version 'cerulean'
games      { 'gta5' }

author 'KuzQuality | Kuzkay'
description 'Towing script made by KuzQuality'
version '1.0.4'


ui_page 'html/index.html'

--
-- Files
--
shared_script '@es_extended/imports.lua'
files {
    'html/js/jquery.js',
    'html/fonts/quicksand.ttf',
    'html/img/*.png',
    'html/index.html',
}


--
-- Server
--

server_scripts {
    'shared/config.lua',
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'shared/config.lua',
    'client/client.lua',
}
