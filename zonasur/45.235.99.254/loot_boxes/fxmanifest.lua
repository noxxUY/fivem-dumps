--[[
    ODISEA SHOP FIVEM:
    https://discord.gg/r63Y26ZDce
    https://discord.gg/r63Y26ZDce
    https://discord.gg/r63Y26ZDce
]]--

version '1.0.0'

fx_version 'adamant'
game 'gta5'

ui_page "html/ui.html"

client_scripts {
	'client.lua',
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
	"html/img/*.png",
}