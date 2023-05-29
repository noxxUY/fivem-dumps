shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'
game 'gta5'

client_scripts {
	'@es_extended/client/wrapper.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/*.html',
	'html/css/*.css',
	'html/js/mustache.min.js',
	'html/js/*.js',
}
