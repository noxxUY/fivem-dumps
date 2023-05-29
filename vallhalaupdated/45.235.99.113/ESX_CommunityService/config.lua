Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 0

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x =  1646.37, y = 2515.94, z = 45.56}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 1848.14, y = 2585.88, z = 45.67}


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(1642.94, 2511.38, 45.56) },--
	{ type = "cleaning", coords = vector3(1639.47, 2507.58, 45.56) },--
	{ type = "cleaning", coords = vector3(1635.77, 2503.25, 45.56) },--
	{ type = "cleaning", coords = vector3(1631.77, 2498.34, 45.56) },--
	{ type = "cleaning", coords = vector3(1627.77, 2493.51, 45.56) },--
	{ type = "cleaning", coords = vector3(1629.53, 2503.46, 45.56) },--
	{ type = "cleaning", coords = vector3(1625.39, 2503.09, 45.56) },--
	{ type = "cleaning", coords = vector3(1637.31, 2497.88, 45.56) },--
	{ type = "cleaning", coords = vector3(1637.62, 2493.0, 45.56) },
	{ type = "gardening", coords = vector3(1642.27, 2492.71, 45.56) },
	{ type = "gardening", coords = vector3(1641.28, 2498.86, 45.56) },
	{ type = "gardening", coords = vector3(1633.35, 2491.78, 45.56) },
	{ type = "gardening", coords = vector3(1625.81, 2507.81, 45.56) },--
	{ type = "gardening", coords = vector3(1625.28, 2499.3, 45.56) },
	{ type = "gardening", coords = vector3(1632.63, 2510.28, 45.56) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 120,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
