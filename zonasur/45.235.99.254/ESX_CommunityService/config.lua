Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 8

Config.ServiceLocation                 = {x=782.5928, y=576.2944, z=125.92}

-- # No cambie esto a menos que sepa lo que está haciendo.
Config.ReleaseLocation                = vector4(237.6709,-406.411,47.924,338.69573974609)

-- # No cambie esto a menos que sepa lo que está haciendo.
--[[
Config.ServiceLocation 				= {x =  170.43, y = -990.7, z = 30.09}

-- # No cambie esto a menos que sepa lo que está haciendo.
Config.ReleaseLocation				= {x = 427.33, y = -979.51, z = 30.2}
]]--

-- # Don't change this unless you know what you are doing.

--[[
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(170.0, -1006.0, 29.34) },
	{ type = "cleaning", coords = vector3(177.0, -1007.94, 29.33) },
	{ type = "cleaning", coords = vector3(181.58, -1009.46, 29.34) },
	{ type = "cleaning", coords = vector3(189.33, -1009.48, 29.34) },
	{ type = "cleaning", coords = vector3(195.31, -1016.0, 29.34) },
	{ type = "cleaning", coords = vector3(169.97, -1001.29, 29.34) },
	{ type = "cleaning", coords = vector3(164.74, -1008.0, 29.43) },
	{ type = "cleaning", coords = vector3(163.28, -1000.55, 29.35) },
	{ type = "gardening", coords = vector3(181.38, -1000.05, 29.29) },
	{ type = "gardening", coords = vector3(188.43, -1000.38, 29.29) },
	{ type = "gardening", coords = vector3(194.81, -1002.0, 29.29) },
	{ type = "gardening", coords = vector3(198.97, -1006.85, 29.29) },
	{ type = "gardening", coords = vector3(201.47, -1004.37, 29.29) }
}
]]--

Config.ServiceLocations = {
    { type = "cleaning", coords = vector3(750.1550, 595.2567, 125.91) },
    { type = "cleaning", coords = vector3(757.2847, 594.7987, 125.91) },
    { type = "cleaning", coords = vector3(763.6402, 590.2408, 125.91) },
    { type = "cleaning", coords = vector3(770.0308, 593.0134, 125.91) },
    { type = "cleaning", coords = vector3(772.8830, 587.7922, 125.91) },
    { type = "cleaning", coords = vector3(778.4403, 586.1980, 125.91) },
    { type = "cleaning", coords = vector3(781.6088, 580.4876, 125.91) },
    { type = "cleaning", coords = vector3(789.7178, 576.9265, 125.91) },
    { type = "gardening", coords = vector3(772.2634, 582.1719, 126.01) },
    { type = "gardening", coords = vector3(765.3892, 585.8239, 126.01) },
    { type = "gardening", coords = vector3(756.3275, 589.5773, 126.01) },
    { type = "gardening", coords = vector3(759.2627, 598.8865, 125.99) },
    { type = "gardening", coords = vector3(784.4642, 586.9953, 126.02) }
}


Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 63, ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 118,  ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 118,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
