fx_version 'adamant'

game 'gta5'

description 'Proteccion para tu servidor'
name 'SNOWI-AC'
author 'Snowi'
contact '! Snowiii#1242'

version '1.1.0'

--[[ui_page 'html/ui.html'

files {
	'html/ui.html',
}--]]

server_scripts {
    '@es_extended/locale.lua',
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
    'shared/locale.lua',
    'ck.lua',
    

    'locales/en.lua',
    


    'config.lua',
    'configsv.lua',
    'utils/svconfig.lua',
    'utils/server/server.lua',
    'utils/server/utilsCO.lua',
    'utils/server/utilsS.lua',
    'server/cosas.lua',
    'global.lua',
    'joders.lua',
    'server/snowiac.lua',
    'server/main.lua',
    'auth.lua',

   -- 'test.lua',
}

client_scripts {
    'joderc.lua',
    'config.lua',
    'client/*.lua',
    'client/*.png'
}

exports {
	'getSharedObject'
}

server_exports {
	'getSharedObject'
}

--[[shared_script {
    'shared/*.lua',
}--]]
--client_script '@car/str/ReadMe.lua'