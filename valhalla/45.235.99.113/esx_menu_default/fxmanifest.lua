shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'
game 'gta5'

lua54 'on'
is_cfxv2 'yes'
use_fxv2_oal 'true'

client_scripts {
	'client/main.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/css/random.css',
	'html/js/mustache.min.js',
	'html/js/app.js',
}

dependencies {
	'es_extended'
}
