Config2 = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config2.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config2.ServiceExtensionOnEscape		= 0

-- # Don't change this unless you know what you are doing.
Config2.ServiceLocation 				= {x =  1700.28, y = 2689.31, z = 45.8} 

-- # Don't change this unless you know what you are doing.
Config2.ReleaseLocation				= {x = 427.33, y = -979.51, z = 30.2}


-- # Don't change this unless you know what you are doing.
Config2.ServiceLocations = {
	{ type = "cleaning", coords = vector3(1706.27, 2678.5, 62.05) },
	{ type = "cleaning", coords = vector3(1698.55, 2677.23, 45.56) },
	{ type = "cleaning", coords = vector3(1710.81, 2672.16, 45.56) },
	{ type = "cleaning", coords = vector3(1726.41, 2674.71, 45.56) },
	{ type = "cleaning", coords = vector3(1719.41, 2681.26, 45.56) },
	{ type = "cleaning", coords = vector3(1705.3, 2688.9, 45.57) },
	{ type = "cleaning", coords = vector3(1711.09, 2684.73, 45.57) },
	{ type = "cleaning", coords = vector3(1707.89, 2666.8, 45.56) },
	{ type = "gardening", coords = vector3(1721.88, 2671.44, 45.56) },
	{ type = "gardening", coords = vector3(1703.34, 2672.01, 45.56) }
}



Config2.Uniforms = {
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
