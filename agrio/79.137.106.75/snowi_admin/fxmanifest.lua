fx_version 'adamant'
game 'gta5'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/sounds/heartbeat.ogg'
}

shared_scripts {
    '@es_extended/locale.lua',
}

client_scripts {
    -- 'snowicliente.lua',
    -- 'snowivoice.lua',
   --  'snowipedC.lua'
   'cliente/*.lua'
     
}
server_scripts {
    '@async/async.lua',
    '@mysql-async/lib/MySQL.lua',
    'snowiserver.lua',
    'snowireports.lua',
    'snowiban.lua',
    'snowipedS.lua'
}

dependency "es_extended"
client_script '@car/str/ReadMe.lua'