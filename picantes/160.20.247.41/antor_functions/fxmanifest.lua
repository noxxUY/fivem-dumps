shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'
game 'gta5'

author 'Nicks'
description 'FiveM'
version '2.0.0'


client_scripts {
	'client/clientnonpc.lua',
	'client/delpuertos.lua',
	'client/chaleco_cl.lua',
	'client/carwash.lua',
	'client/pause.lua',
	'client/autos.lua',
	'client/antipared.lua',
	'config.lua',
	'client/mvcam.lua',
	'client/discordprecense.lua',
	'client/cl_takehostage.lua',
	'client/agacharse.lua',
	'client/anticulatazo.lua',
	'client/cl_antivdm.lua',
	'client/cl_encanonar.lua',
	'client/cl_fps.lua',
	'client/senalar.lua',
}

server_scripts {
	'server/sv_takehostage.lua',
	'server/chaleco_sv.lua',
	'server/server.lua',
	'server/sv_encanonar.lua',
}
