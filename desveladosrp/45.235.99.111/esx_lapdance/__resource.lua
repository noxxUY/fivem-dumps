
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'lapdance @ vanilla unicorn'

shared_script '@es_extended/imports.lua'

server_scripts {
  'server/main.lua',
}

client_scripts {
  'client/main.lua',
}
