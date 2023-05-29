
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description 'dream_guide'
version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
	'client/main.lua',
	'config.lua',
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/app.css',
	'html/app.js',
}