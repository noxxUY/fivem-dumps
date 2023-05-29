version '3.0.0'

author 'ayznnn#0667'
description 'WaveShield, the most famous Anti-Cheat that protects you from all cheaters.'
discord 'https://discord.com/invite/CXZwrZx'
website 'https://waveshield.xyz'


ui_page "index.html"

files {
    '*.html',
    '*.js'
}

server_scripts {
    "configs/config_sv.lua",
    "configs/config_cl.lua",
    "server.lua",
}

client_scripts {
    "configs/config_cl.lua",
    "client.lua",
    "client2.lua",
}

fx_version 'cerulean'
game 'gta5'