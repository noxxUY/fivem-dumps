shared_script '@WaveShield/resource/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'bodacious'
game 'gta5'
lua54 'yes'

description 'Nabla Corporation - Vehicle Signal Script'
author 'Nabla Corporation'
version '1.0.1'

client_script 'Client/*.lua'
server_script 'Server/*.lua'
shared_script 'Shared/*.lua'

escrow_ignore {
  'Shared/*.lua',
  'Client/block.lua'
}

dependencies {
  '/server:4752',
  '/onesync',
}

dependency '/assetpacks'