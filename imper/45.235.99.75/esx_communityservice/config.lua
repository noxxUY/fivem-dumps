Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 5

-- # Don't change this unless you know what you are doing. 3078.7, -4725.7, 15.2
Config.ServiceLocation 				= {x = 3078.7, y = -4725.7, z = 15.2}
-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 650.37, y = 10.76, z = 82.81}

Config.DiscordWebHook = "https://discord.com/api/webhooks/867492007252459545/Lgzwu0hYXeCm3ZYlSEBuGohsdXItFxKVTtCidm6Ur2CwGIfd7QUk2jydlkqKau6ZCRWC" -- Link al discord webhook matias#1111
Config.DiscordWebHookFooter = "Imperial RP" -- Footer del discord embed webhook matias#1111
Config.DiscordWebHookColor = '16440430' -- Color del embed matias#1111
-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = { 
	{ type = "cleaning", coords = vector3(3052.4, -4714.9, 15.2) },
    { type = "cleaning", coords = vector3(3046.6, -4723.6, 15.2) },
    { type = "cleaning", coords = vector3(3062.8, -4732.9, 15.2) },
    { type = "cleaning", coords = vector3(3074.5, -4728.7, 15.2) },
    { type = "cleaning", coords = vector3(3082.1, -4720.5, 15.2) },
    { type = "cleaning", coords = vector3(3088.7, -4717.9, 15.2) },
    { type = "cleaning", coords = vector3(3092.0, -4737.8, 15.2) },
    { type = "cleaning", coords = vector3(3082.4, -4761.0, 15.2) },
    { type = "gardening", coords = vector3(3059.7, -4750.9, 15.2) },
    { type = "gardening", coords = vector3(3062.1, -4737.3, 15.2) },
    { type = "gardening", coords = vector3(3051.9, -4727.0, 15.2) },
    { type = "gardening", coords = vector3(3057.2, -4704.4, 15.2) },
    { type = "gardening", coords = vector3(3068.9, -4707.6, 15.2) } 
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 7,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 36,
			['pants_2']  = 0,   ['shoes_1']  = 27,
			['shoes_2']  = 0,  ['chain_1']  = 0,
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
