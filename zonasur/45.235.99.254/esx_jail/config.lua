Config = {}
Config.Locale = 'en'

Config.JailBlip = vector3(1854.0, 2622.0, 45.0) --Federal
Config.JailBlip2 = vector3(478.03, -976.47, 28.25) --Comisaria

Config.JailLocation = vector3(1641.6, 2571.0, 45.5) --Ubicacion de la celda federal

-- Ubicaciones de las celdas de comisaria
Config.Jail_Celda = {	
	[1] = vector3(487.1450,-1005.41,30.462),
	[2] = vector3(486.4110,-1009.67,30.462),
	[3] = vector3(486.1547,-1013.97,30.462),
	--[4] = vector3(487.0401,-1013.93,26.273),
	--[5] = vector3(84.7602,-1005.85,26.273),
}



Config.JailTimeSyncInterval = 60000 * 5


Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 0,   ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 2,   ['pants_1']  = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}