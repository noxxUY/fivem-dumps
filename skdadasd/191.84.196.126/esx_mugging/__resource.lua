resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Muggin'

version '1.0.3'

shared_script '@es_extended/imports.lua'

client_script {
    "client/main.lua",
    "config.lua"
}

server_script {
    "server/main.lua",
    "config.lua"
}
