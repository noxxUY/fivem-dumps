fx_version 'cerulean'
game 'gta5'

description 'Armour-AntiRPF | Anti RPF, silent aim, hitbox stretch and more.'
version '1.0.4'
author 'Armour Anti-Cheat | https://discord.gg/ArmourAC'
lua54 'yes'

client_script 'client/main.lua'

server_scripts {
    'config/config.lua',
    'server/main.lua'
}

escrow_ignore {
    'config/config.lua'
}
dependency '/assetpacks'
dependency '/assetpacks'