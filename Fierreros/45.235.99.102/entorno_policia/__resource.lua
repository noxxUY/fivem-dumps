resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Entorno_Policia'

ui_page 'html/main.html'

shared_script { '@es_extended/imports.lua' }

files {
	'html/main.html',
	"html/style.css",
	"html/app.js"
}

client_scripts{
	'@interact-sound-0.2.1',
    "client.lua",
}

server_scripts{
	'@interact-sound-0.2.1',
    "server.lua"
}