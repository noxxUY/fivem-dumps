fx_version 'adamant'
game 'gta5'
description 'ESX Housing'
version '1.1.1'

-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

server_script '@mysql-async/lib/MySQL.lua'
shared_script 'configuration/*.lua'
server_script 'server/*.lua'
client_script 'client/*.lua'

dependency 'es_extended'
dependency 'loaf_keysystem'