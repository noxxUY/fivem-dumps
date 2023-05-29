Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'es' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 10

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x =  1713.08, y = 2509.68, z = 45.56}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 427.33, y = -979.51, z = 30.2}


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(1704.36, 2499.8, 45.56) },
	{ type = "cleaning", coords = vector3(1704.56, 2492.16, 45.56) },
	{ type = "cleaning", coords = vector3(1700.44, 2486.2, 45.56) },
	{ type = "cleaning", coords = vector3(1693.36, 2488.84, 45.56) },
	{ type = "cleaning", coords = vector3(1680.32, 2493.08, 45.56) },
	{ type = "cleaning", coords = vector3(11679.2, 2487.84, 45.56) },
	{ type = "cleaning", coords = vector3(1761.36, 2474.71, 45.56) },
	{ type = "cleaning", coords = vector3(1685.88, 2477.6, 45.56) },
	{ type = "gardening", coords = vector3(1694.48, 2477.12, 45.56) },
	{ type = "gardening", coords = vector3(1701.24, 2481.32, 45.56) },
	{ type = "gardening", coords = vector3(1697.52, 2502.8, 45.56) },
	{ type = "gardening", coords = vector3(1704.0, 2509.96, 45.56) },
	{ type = "gardening", coords = vector3(1713.08, 2509.68, 45.56) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 191, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 56, ['pants_1']  = 42,
			['pants_2']  = 1,   ['shoes_1']  = 66,
			['shoes_2']  = 0,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1']  = 64,  ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 75,  ['pants_1'] = 40,
			['pants_2']  = 0,  ['shoes_1']  = 49,
			['shoes_2']  = 0,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
