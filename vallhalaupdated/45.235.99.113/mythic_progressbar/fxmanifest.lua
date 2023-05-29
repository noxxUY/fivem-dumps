shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'
game 'gta5'

ui_page('html/index.html') 

client_scripts {
    'client/main.lu*'
}

files {
    'html/*.html',
    'html/css/*.css',
    'html/js/*.js'
}