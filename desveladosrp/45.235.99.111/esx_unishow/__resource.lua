
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX STRIP'

version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
  'config.lua',
  'client.lua',
 }

server_scripts {
  'config.lua',
  'server.lua',
}
