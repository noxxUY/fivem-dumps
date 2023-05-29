Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.VagosStations = {

	LSPD = {

--		Blip = {
--			Coords  = vector3(425.1, -979.5, 30.7),
--			Sprite  = 60,
--			Display = 4,
--			Scale   = 1.2,
--			Colour  = 29
--		},

		Cloakrooms = {
			vector3(8.93, 528.41, 170.64)
		},

		Armories = {
			vector3(2.14, 527.58, 170.62)
		},

		Vehicles = {
			{
				Spawner = vector3(14.19, 549.51, 176.28),
				InsideShop = vector3(5.01, 550.82, 175.39),
				SpawnPoints = {
					{ coords = vector3(-1.03, 545.86, 174.07), heading = 304.81, radius = 6.0 },
					{ coords = vector3(5.34, 550.2, 175.35), heading = 304.23, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(8.37, 506.47, 170.48),
				InsideShop = vector3(13.62, 505.84, 170.44),
				SpawnPoints = {
					{ coords = vector3(13.82, 505.84, 170.44), heading = 298.31, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(4.58, 526.69, 174.63)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_GUSENBERG', price = 20000 },
		{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 18000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 27000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 8000 },
		{ weapon = 'WEAPON_REVOLVER', price = 12000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 40000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 55000 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		{ weapon = 'WEAPON_MINISMG', price = 15000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
		{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		{ weapon = 'WEAPON_MOLOTOV', price = 500 }
	},

	officer = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_GUSENBERG', price = 20000 },
		{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 18000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 27000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 8000 },
		{ weapon = 'WEAPON_REVOLVER', price = 12000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 40000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 55000 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		{ weapon = 'WEAPON_MINISMG', price = 15000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
		{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		{ weapon = 'WEAPON_MOLOTOV', price = 500 }
	},

	sergeant = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_GUSENBERG', price = 20000 },
		{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 18000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 27000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 8000 },
		{ weapon = 'WEAPON_REVOLVER', price = 12000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 40000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 55000 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		{ weapon = 'WEAPON_MINISMG', price = 15000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
		{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		{ weapon = 'WEAPON_MOLOTOV', price = 500 }
	},

	intendent = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_GUSENBERG', price = 20000 },
		{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 18000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 27000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 8000 },
		{ weapon = 'WEAPON_REVOLVER', price = 12000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 40000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 55000 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		{ weapon = 'WEAPON_MINISMG', price = 15000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
		{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		{ weapon = 'WEAPON_MOLOTOV', price = 500 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_GUSENBERG', price = 20000 },
		{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 18000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 27000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 8000 },
		{ weapon = 'WEAPON_REVOLVER', price = 12000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 40000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 55000 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		{ weapon = 'WEAPON_MINISMG', price = 15000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
		{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		{ weapon = 'WEAPON_MOLOTOV', price = 500 }
	},

	chef = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_GUSENBERG', price = 20000 },
		{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 18000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 27000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 8000 },
		{ weapon = 'WEAPON_REVOLVER', price = 12000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 40000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 55000 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		{ weapon = 'WEAPON_MINISMG', price = 15000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
		{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		{ weapon = 'WEAPON_MOLOTOV', price = 500 }
	},

	boss = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_GUSENBERG', price = 20000 },
		{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 18000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 35000 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 27000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 8000 },
		{ weapon = 'WEAPON_REVOLVER', price = 12000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 40000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 55000 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_APPISTOL', price = 25000 },
		{ weapon = 'WEAPON_DOUBLEACTION', price = 10000 },
		{ weapon = 'WEAPON_MINISMG', price = 15000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 40000 },
		{ weapon = 'WEAPON_COMPACTRIFLE', price = 45000 },
		{ weapon = 'WEAPON_MOLOTOV', price = 500 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
    { model = 'daemon', label = 'Moto 1', price = 2000 },
	{ model = 'slamvan2', label = 'Coche moteros', price = 5000 },
    { model = 'sanctus', label = 'Moto 3 - Calavera', price = 20000 },
    { model = 'gburrito', label = 'Furgoneta', price = 1000 }
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
	recruit = {
		{ model = 'supervolito', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	officer = {
		{ model = 'supervolito', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	sergeant = {
		{ model = 'supervolito', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	intendent = {
		{ model = 'supervolito', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	lieutenant = {
		{ model = 'supervolito', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	chef = {
		{ model = 'supervolito', label = 'Helicoptero', livery = 0, price = 200000 }
	},

	boss = {
		{ model = 'supervolito', label = 'Helicoptero', livery = 0, price = 200000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 23,  ['tshirt_2'] = 0,
			['torso_1'] = 157,   ['torso_2'] = 0,
			['decals_1'] = 14,   ['decals_2'] = 0,
			['arms'] = 115,
			['pants_1'] = 4,   ['pants_2'] = 0,
			['shoes_1'] = 81,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 50,    ['chain_2'] = 1,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 60,  ['tshirt_2'] = 0,
			['torso_1'] = 181,   ['torso_2'] = 0,
			['decals_1'] = 13,   ['decals_2'] = 0,
			['arms'] = 24,
			['pants_1'] = 4,   ['pants_2'] = 9,
			['shoes_1'] = 85,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 37,    ['chain_2'] = 1,
			['ears_1'] = 11,     ['ears_2'] = 7
		}
	},
	officer_wear = {
		male = {
	  ['tshirt_1'] = 23,  ['tshirt_2'] = 0,
	  ['torso_1'] = 157,   ['torso_2'] = 0,
	  ['decals_1'] = 14,   ['decals_2'] = 0,
	  ['arms'] = 115,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 81,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 50,    ['chain_2'] = 1,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 60,  ['tshirt_2'] = 0,
	  ['torso_1'] = 181,   ['torso_2'] = 0,
	  ['decals_1'] = 13,   ['decals_2'] = 0,
	  ['arms'] = 24,
	  ['pants_1'] = 4,   ['pants_2'] = 9,
	  ['shoes_1'] = 85,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 37,    ['chain_2'] = 1,
	  ['ears_1'] = 11,     ['ears_2'] = 7
		}
	},
	sergeant_wear = {
		male = {
	  ['tshirt_1'] = 23,  ['tshirt_2'] = 0,
	  ['torso_1'] = 157,   ['torso_2'] = 0,
	  ['decals_1'] = 14,   ['decals_2'] = 0,
	  ['arms'] = 115,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 81,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 50,    ['chain_2'] = 1,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 60,  ['tshirt_2'] = 0,
	  ['torso_1'] = 181,   ['torso_2'] = 0,
	  ['decals_1'] = 13,   ['decals_2'] = 0,
	  ['arms'] = 24,
	  ['pants_1'] = 4,   ['pants_2'] = 9,
	  ['shoes_1'] = 85,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 37,    ['chain_2'] = 1,
	  ['ears_1'] = 11,     ['ears_2'] = 7
		}
	},
	intendent_wear = {
		male = {
	  ['tshirt_1'] = 23,  ['tshirt_2'] = 0,
	  ['torso_1'] = 157,   ['torso_2'] = 0,
	  ['decals_1'] = 14,   ['decals_2'] = 0,
	  ['arms'] = 115,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 81,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 50,    ['chain_2'] = 1,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 60,  ['tshirt_2'] = 0,
	  ['torso_1'] = 181,   ['torso_2'] = 0,
	  ['decals_1'] = 13,   ['decals_2'] = 0,
	  ['arms'] = 24,
	  ['pants_1'] = 4,   ['pants_2'] = 9,
	  ['shoes_1'] = 85,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 37,    ['chain_2'] = 1,
	  ['ears_1'] = 11,     ['ears_2'] = 7
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
	  ['tshirt_1'] = 23,  ['tshirt_2'] = 0,
	  ['torso_1'] = 157,   ['torso_2'] = 0,
	  ['decals_1'] = 14,   ['decals_2'] = 0,
	  ['arms'] = 115,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 81,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 50,    ['chain_2'] = 1,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 60,  ['tshirt_2'] = 0,
	  ['torso_1'] = 181,   ['torso_2'] = 0,
	  ['decals_1'] = 13,   ['decals_2'] = 0,
	  ['arms'] = 24,
	  ['pants_1'] = 4,   ['pants_2'] = 9,
	  ['shoes_1'] = 85,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 37,    ['chain_2'] = 1,
	  ['ears_1'] = 11,     ['ears_2'] = 7
		}
	},
	chef_wear = {
		male = {
	  ['tshirt_1'] = 23,  ['tshirt_2'] = 0,
	  ['torso_1'] = 157,   ['torso_2'] = 0,
	  ['decals_1'] = 14,   ['decals_2'] = 0,
	  ['arms'] = 115,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 81,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 50,    ['chain_2'] = 1,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 60,  ['tshirt_2'] = 0,
	  ['torso_1'] = 181,   ['torso_2'] = 0,
	  ['decals_1'] = 13,   ['decals_2'] = 0,
	  ['arms'] = 24,
	  ['pants_1'] = 4,   ['pants_2'] = 9,
	  ['shoes_1'] = 85,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 37,    ['chain_2'] = 1,
	  ['ears_1'] = 11,     ['ears_2'] = 7
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
	  ['tshirt_1'] = 23,  ['tshirt_2'] = 0,
	  ['torso_1'] = 157,   ['torso_2'] = 0,
	  ['decals_1'] = 14,   ['decals_2'] = 0,
	  ['arms'] = 115,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 81,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 50,    ['chain_2'] = 1,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 60,  ['tshirt_2'] = 0,
	  ['torso_1'] = 181,   ['torso_2'] = 0,
	  ['decals_1'] = 13,   ['decals_2'] = 0,
	  ['arms'] = 24,
	  ['pants_1'] = 4,   ['pants_2'] = 9,
	  ['shoes_1'] = 85,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 37,    ['chain_2'] = 1,
	  ['ears_1'] = 11,     ['ears_2'] = 7
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
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