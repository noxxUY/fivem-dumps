shared_script '@FiveEye/FiveEye.lua'


------
-- InteractSound by Scott
-- Verstion: v0.0.1
------

fx_version 'cerulean'
games { 'gta5' }


-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files({
    'client/html/index.html',
    -- Begin Sound Files Here...
    -- client/html/sounds/ ... .ogg
	'client/html/sounds/beber.ogg',
	'client/html/sounds/comer.ogg',
	'client/html/sounds/esposas.ogg', 
    'client/html/sounds/llavespuerta.ogg',
	'client/html/sounds/entradatienda.ogg',
	'client/html/sounds/recargar.ogg',	
	'client/html/sounds/demo.ogg',
	'client/html/sounds/aviso1.ogg',
	'client/html/sounds/cintoalarma.ogg',
	'client/html/sounds/ayuntamiento.ogg', 
    'client/html/sounds/oficina.ogg',
	'client/html/sounds/sodamachine.ogg',
	'client/html/sounds/vozped.ogg',
	'client/html/sounds/vozped1.ogg',
	'client/html/sounds/aviso2.ogg',
	'client/html/sounds/aviso3.ogg',
	'client/html/sounds/taxi.ogg',
	'client/html/sounds/taxi2.ogg',
	'client/html/sounds/llegada.ogg',
	'client/html/sounds/venta.ogg',
	'client/html/sounds/venta2.ogg',
	'client/html/sounds/ventamadera.ogg',
	'client/html/sounds/ventamadera2.ogg',
	'client/html/sounds/alarm.ogg',
	'client/html/sounds/speedcamera.ogg',
	'client/html/sounds/cerrar.ogg',
	'client/html/sounds/Phone_Call_Sound_Effect.ogg',
	'client/html/sounds/ring.ogg',
	'client/html/sounds/tchatNotification.ogg',
	'client/html/sounds/buckle.ogg',
	'client/html/sounds/crash01.ogg',
	'client/html/sounds/unbuckle.ogg'
})
