

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'ESX Mecano Job'

version '1.0.0'

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'config.lua',
  'client/pepe.lua',
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'config.lua',
  'server/main.lua'
}

exports {
  'openMechanic'
}
 
 files {
    "interiorproxies.meta"
}


data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'
