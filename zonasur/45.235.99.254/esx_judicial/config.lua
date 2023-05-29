Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 20 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.AuthorizedWeapons = {
	abogado = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{weapon = 'WEAPON_STUNGUN', price = 1000 }
	},
	
	fiscal = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{weapon = 'WEAPON_STUNGUN', price = 1000 }
	},

	juez = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{weapon = 'WEAPON_STUNGUN', price = 1000 }
	}
}

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Pos     = { x=237.8345, y=-415.559, z=47.948 },
			Sprite  = 351,
			Display = 4,
			Scale   = 1.1,
			Colour  = 62,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			
		},

		Cloakrooms = {
			{ x = 228.6001, y = -437.777, z = 47.955 - 0.95 },
		},

		Armories = {
			{ x = 230.6788, y = -442.374, z = 47.955 - 0.95 },
		},

		Vehicles = {
			--[[
			{
				Spawner    = { x = -151.0, y = -580.07, z = 31.43 },
				SpawnPoints = {
					{ x = -152.49, y = -585.6, z = 32.15, heading = 70.34, radius = 6.0 }
				}
			}
			]]
		},

		Helicopters = {
			--[[
			{
				Spawner    = { x = 463.33, y = -982.44, z = 42.70 },
				SpawnPoint = { x = 450.04, y = -981.14, z = 44.08, heading = 0, radius = 10.0 },
			}
			]]
		},
		
		HelicoptersDeleters = {
			
		},

		VehicleDeleters = {
			--{ x = -137.74, y = -587.07, z = 31.43 }
		},

		BossActions = {
			{ x = 224.2390, y = -437.341, z = 47.955 -0.95 }
		},

	},
}

-- https://wiki.rage.mp/index.php?title=Vehicles

Config.AuthorizedHelicoptero = {

	{
		model = 'polmav',
		label = 'POLICIA'
	},

}

Config.AuthorizedVehicles = {
	Shared = {
		--[[
		{
			model = 'shield',
			label = 'Raptor'
		}
		]]
	},

	abogado = {

	},

	fiscal = {

	},

	boss = {

	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	abogado = {
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 59,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 20,   ['pants_2'] = 0,
			['shoes_1'] = 20,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 38,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = -1,     ['bags_2'] = 0, 
			['watches_1'] = -1,     ['watches_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	fiscal = {
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 59,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 20,   ['pants_2'] = 0,
			['shoes_1'] = 20,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 38,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = -1,     ['bags_2'] = 0, 
			['watches_1'] = -1,     ['watches_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 22,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 58,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	
	bullet_wear = {
		male = {
			['bproof_1'] = 1,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 1,  ['bproof_2'] = 0
		}
	},
	police_casco = {
		male = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
		},
		female = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}