shared_script '@FiveEye/FiveEye.lua'



fx_version 'adamant'
game 'gta5'

author 'Nicks'
description 'FiveM'
version '2.0.0'


client_scripts {
	'client/antisound.lua',
	'client/clientnonpc.lua',
	'client/saltos.lua',
	'client/delpuertos.lua',
	'client/chaleco_cl.lua',
	'client/pause.lua',
	'client/detonado.lua',
	'client/dmgweapon.lua',
	'client/autos.lua',
	'client/antipared.lua',
	'client/handsup.lua',
	'client/stamina.lua',
	'config.lua',
	'client/mvcam.lua',
	'client/discordprecense.lua'
}

server_scripts {
	'server/chaleco_sv.lua',
	'server/server_kill.lua',
	'server/server.lua'
}
