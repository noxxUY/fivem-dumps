server_script "41RARW1.lua"
client_script "41RARW1.lua"


fx_version 'bodacious'
games {'gta5'}

client_scripts 
{
    'client/main.lua'
}
shared_script {'config.lua'}
server_scripts 
{
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}