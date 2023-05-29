shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'
game 'gta5'

author 'RTDTonino#2060'
description 'Medico Ilegal'

shared_script {
  '@es_extended/imports.lua',
  'shared/shared.lua',
  'shared/config.lua',
}

server_scripts {
  'server/main.lua',
}

client_scripts {
  'client//main.lua',
}

dependencies {
  'es_extended',
  'esx_ambulancejob',
  'mythic_progbar'
}