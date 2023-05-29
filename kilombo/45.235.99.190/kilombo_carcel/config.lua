Config = {}

Config.Locale       				= 'es'

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 5

-- # TIEMPO DE CADA BARRIDA 
Config.ActionTime = 8000

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x = 1753.69, y = 2502.24, z = 45.6}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 334.41, y = -1599.49, z = 32.53}

-- # Configuración para remover armas al ser enviadas las acciones
Config.RemoverArmas 				= true


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector4(1747.7060546875, 2505.1118164063, 44.565013885498, 37.37579) },
	{ type = "cleaning", coords = vector4(1744.4278564453, 2513.3269042969, 44.565013885498, 37.37579) },
	{ type = "cleaning", coords = vector4(1747.3433837891, 2520.5422363281, 44.565013885498, 37.37579) },
	{ type = "cleaning", coords = vector4(1754.4577636719, 2515.5922851563, 44.565013885498, 37.37579) },
	{ type = "cleaning", coords = vector4(1736.7592773438, 2515.4445800781, 44.565013885498, 37.37579) },
	{ type = "cleaning", coords = vector4(1742.5203857422, 2523.619140625, 44.564979553223, 37.37579) },
	{ type = "cleaning", coords = vector4(1750.2283935547, 2531.2275390625, 44.564987182617, 37.37579) },
	{ type = "cleaning", coords = vector4(1747.2020263672, 2512.4084472656, 44.565017700195, 37.37579) },
	{ type = "cleaning", coords = vector4(1741.55078125, 2511.53125, 44.565017700195, 37.37579) },
	{ type = "cleaning", coords = vector4(1756.2816162109, 2526.0622558594, 44.565013885498, 37.37579) }
	--{ type = "gardening", coords = vector3(201.47, -1004.37, 29.29) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 26, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 67, ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0, ['helmet_1']  = 1
		},
		female = {
			['tshirt_1'] = 15,   ['tshirt_2'] = 0,
			['torso_1']  = 14,  ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 81,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 0,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
