shared_script '@FiveEye/FiveEye.lua'

games {'common'}

fx_version('adamant')
description('Sistema de anuncios | JSX-Framework')
author('<@Jaareet#0097/>')
version('1.0.0')

ui_page('nui/index.html')

files({'**/**/**/**/**/**/**/**/*.*'})

shared_scripts { 'shared/*.l**' }

server_scripts {
    'server/*.l*a'
}

client_scripts {
    'client/*.l*a'
}