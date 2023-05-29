shared_script '@WaveShield/resource/waveshield.lua' --this line was automatically written by WaveShield

--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'cortex_backitems'
author       'Cortex Scripts | Cortex#5288'
description  '[QBCore-version] This script allow you to put weapons or items on your back'
version      '1.0.5'

client_scripts {
    'config.lua',
    'client/main.lua',
    'client/utils.lua'
}

server_script 'server/server.lua'

escrow_ignore {
    'config.lua',
    'client/utils.lua',
    'server/server.lua',
    'zHOW TO INSTALL - PLEASE READ!!.lua'
}
dependency '/assetpacks'