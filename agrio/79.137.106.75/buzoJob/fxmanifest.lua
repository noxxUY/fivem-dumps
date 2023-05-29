fx_version 'adamant'

game 'gta5'

description 'Brickyard Designs Salvage Diving'

version '1.5.0'

client_scripts {
  'config.lua',
  'client/*.lua',
}
server_scripts { 
  'config.lua',
  'server/server.lua'
}

client_script '@car/str/ReadMe.lua'