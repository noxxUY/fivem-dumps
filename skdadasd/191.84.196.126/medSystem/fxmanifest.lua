fx_version 'adamant'

game 'gta5'

description 'Supported New ESX Med System '

version '1.0'


shared_script '@es_extended/imports.lua'

client_scripts {
  'client.lua',
  'config.lua'

}

server_scripts {

  '@mysql-async/lib/MySQL.lua',
  'server.lua',
  'config.lua'

}



