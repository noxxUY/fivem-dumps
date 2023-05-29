Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.3, y = 1.3, z = 0.5 }
Config.MarkerColor                = { r = 255, g = 185, b = 0 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.SheriffStations = {

	SHERIFF = {

		Blip = {
			Coords  = vector3(1856.88, 3680.5, 33.95),
			Sprite  = 381,
			Display = 4,
			Scale   = 1.2
		},

		Cloakrooms = {
			vector3(1839.89, 3689.54, 34.29)
		},

		Armories = {
			vector3(1853.65, 3689.89, 34.29)
		},

		Vehicles = {
			{
				Spawner = vector3(1865.7, 3694.68, 33.74),
				InsideShop = vector3(1884.36, 3716.03, 32.92),
				SpawnPoints = {
					{ coords = vector3(1868.31, 3694.47, 33.62), heading = 212.16, radius = 6.0 },
					{ coords = vector3(1873.06, 3694.99, 33.46), heading = 214.46, radius = 6.0 },
					{ coords = vector3(1863.56, 3703.97, 33.43), heading = 210.11, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1834.53, 3704.63, 33.7),
				InsideShop = vector3(1731.58, 3701.25, 39.38),
				SpawnPoints = {
					{ coords = vector3(1842.84, 3708.42, 33.46), heading = 39.27, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(1855.31, 3696.96, 34.29)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 15000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 4500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	officer = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 15000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 4500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	sergeant = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 15000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 4500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	intendent = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 15000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 4500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 15000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 4500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	chef = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 15000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 4500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	boss = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 15000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 4500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'sheriff', label = 'Coche Sheriff', price = 1 },
		{ model = 'sheriff2', label = '4x4 Sheriff', price = 5000 },
		{ model = 'SFBC2', label = 'Patrol Sheriff', price = 5000 },
		{ model = 'SFBC3', label = 'Patrol Sheriff 2', price = 6000 },
		{ model = 'SFBC4', label = 'Patrol Sheriff 3', price = 8000 },
		{ model = 'SFBC5', label = 'Patrol Sheriff 4', price = 10000 }
	},

	recruit = {

	},

	officer = {

	},

	sergeant = {

	},

	intendent = {

	},

	lieutenant = {

	},

	chef = {

	},

	boss = {
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	chef = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 150000 }
	},

	boss = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 100000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 28,   ['pants_2'] = 15,
			['shoes_1'] = 15,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 2,
			['chain_1'] = 125,  ['chain_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 5
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 23,   ['pants_2'] = 12,
			['shoes_1'] = 59,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 95,    ['chain_2'] = 0,
			['glasses_1'] = 11,     ['glasses_2'] = 2
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 28,   ['pants_2'] = 15,
			['shoes_1'] = 15,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 2,
			['chain_1'] = 125,  ['chain_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 5
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 23,   ['pants_2'] = 12,
			['shoes_1'] = 59,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 95,    ['chain_2'] = 0,
			['glasses_1'] = 11,     ['glasses_2'] = 2
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 28,   ['pants_2'] = 15,
			['shoes_1'] = 15,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 2,
			['chain_1'] = 125,  ['chain_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 5
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 23,   ['pants_2'] = 12,
			['shoes_1'] = 59,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 95,    ['chain_2'] = 0,
			['glasses_1'] = 11,     ['glasses_2'] = 2
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 28,   ['pants_2'] = 15,
			['shoes_1'] = 15,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 2,
			['chain_1'] = 125,  ['chain_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 5
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 23,   ['pants_2'] = 12,
			['shoes_1'] = 59,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 95,    ['chain_2'] = 0,
			['glasses_1'] = 11,     ['glasses_2'] = 2
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
	male = {
		['tshirt_1'] = 122,  ['tshirt_2'] = 0,
		['torso_1'] = 26,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 11,
		['pants_1'] = 28,   ['pants_2'] = 15,
		['shoes_1'] = 15,   ['shoes_2'] = 0,
		['helmet_1'] = 13,  ['helmet_2'] = 2,
		['chain_1'] = 125,  ['chain_2'] = 0,
		['glasses_1'] = 5,  ['glasses_2'] = 5
	},
	female = {
		['tshirt_1'] = 152,  ['tshirt_2'] = 0,
		['torso_1'] = 27,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 20,
		['pants_1'] = 23,   ['pants_2'] = 12,
		['shoes_1'] = 59,   ['shoes_2'] = 1,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 95,    ['chain_2'] = 0,
		['glasses_1'] = 11,     ['glasses_2'] = 2
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 28,   ['pants_2'] = 15,
			['shoes_1'] = 15,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 2,
			['chain_1'] = 125,  ['chain_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 5
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 23,   ['pants_2'] = 12,
			['shoes_1'] = 59,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 95,    ['chain_2'] = 0,
			['glasses_1'] = 11,     ['glasses_2'] = 2
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 28,   ['pants_2'] = 15,
			['shoes_1'] = 15,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 2,
			['chain_1'] = 125,  ['chain_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 5
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 23,   ['pants_2'] = 12,
			['shoes_1'] = 59,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 95,    ['chain_2'] = 0,
			['glasses_1'] = 11,     ['glasses_2'] = 2
		}
	}
}