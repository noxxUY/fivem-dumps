shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'
game 'gta5'
name 'Mythic Framework Notification System'
version 'v1.1.0'

ui_page {
    'html/ui.html',
}

files {
	'html/*.html',
	'html/js/*.js', 
	'html/css/*.css',
}

client_scripts {
	'client/main.lu*',
}

exports {
	'SendAlert',
	'SendUniqueAlert',
	'PersistentAlert',
	'DoCustomHudText'
}
client_script '@Interpol/Shareds/ToLoad.lua'