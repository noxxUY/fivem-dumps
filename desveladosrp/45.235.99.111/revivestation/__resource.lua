resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

shared_script '@es_extended/imports.lua'

client_scripts {
	"config.lua",
	"client/*.lua"
}

server_script "server/*.lua"

ui_page "html/index.html"
files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}