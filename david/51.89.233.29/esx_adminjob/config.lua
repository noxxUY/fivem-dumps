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

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.AdminStations = {

	LSPD = {

--		Blip = {
--			Coords  = vector3(425.1, -979.5, 30.7),
--			Sprite  = 60,
--			Display = 4,
--			Scale   = 1.2,
--			Colour  = 29
--		},

		Cloakrooms = {
			vector3(1400.54, 1159.58, 114.33)
		},

		Armories = {
			vector3(1401.74, 1134.33, 114.33)
		},

		Vehicles = {
			{
				Spawner = vector3(1407.44, 1114.62, 114.84),
				InsideShop = vector3(1415.21, 1050.62, 114.33),
				SpawnPoints = {
					{ coords = vector3(1403.15, 1118.75, 114.84), heading = 90.33, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1443.76, 1106.47, 116.17),
				InsideShop = vector3(1469.71, 1111.55, 116.17),
				SpawnPoints = {
					{ coords = vector3(1449.65, 1111.75, 116.17), heading = 184.7, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(1395.67, 1147.96, 114.33)
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
        { model = 'schafter4', label = 'Audi RS7', price = 152000 },
	    { model = 'tailgater', label = 'Mercedes AMG CLS53', price = 127000 },
        { model = 'toros', label = 'Lexus KX570', price = 52000 },
        { model = 'speedo4', label = 'Furgoneta', price = 20000 }
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
			['tshirt_1'] = 131,  ['tshirt_2'] = 0,
			['torso_1'] = 111,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 38,
			['pants_1'] = 4,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 161,  ['tshirt_2'] = 0,
			['torso_1'] = 103,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 27,
			['pants_1'] = 102,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
	  ['tshirt_1'] = 131,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 38,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
	  ['tshirt_1'] = 131,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 38,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
	  ['tshirt_1'] = 131,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 38,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
	  ['tshirt_1'] = 131,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 38,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
	  ['tshirt_1'] = 131,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 38,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
	  ['tshirt_1'] = 131,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 38,
	  ['pants_1'] = 4,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
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