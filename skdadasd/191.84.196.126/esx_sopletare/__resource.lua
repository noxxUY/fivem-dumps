resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_script '@es_extended/imports.lua'

client_scripts {
    'client/functions.lua',
    'client/main.lua'
}

server_script 'server/main.lua'