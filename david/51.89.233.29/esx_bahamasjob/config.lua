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

Config.BahamasStations = {

	BAHAMAS = {

--		Blip = {
--			Coords  = vector3(425.1, -979.5, 30.7),
--			Sprite  = 60,
--			Display = 4,
--			Scale   = 1.2,
--			Colour  = 29
--		},

		Cloakrooms = {
			vector3(-1152.94, -1516.75, 10.63)
		},

		Armories = {
			vector3(-1150.71, -1513.41, 10.63)
		},

		Vehicles = {
			{
				Spawner = vector3(-1152.96, -1529.94, 4.25),
				InsideShop = vector3(-1174.94, -1488.2, 4.38),
				SpawnPoints = {
					{ coords = vector3(-1193.53, -1497.6, 4.38), heading = 214.42, radius = 6.0 },
					{ coords = vector3(-1187.36, -1493.15, 4.38), heading = 214.42, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1156.87, -1524.09, 4.28),
				InsideShop = vector3(-1195.18, -1487.26, 4.38),
				SpawnPoints = {
					{ coords = vector3(-1195.18, -1487.26, 4.38), heading = 214.97, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-1144.38, -1515.7, 10.63)
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
        { model = 's63w222', label = 'Mercedes AMG S63', price = 163000 },
		{ model = 'FX4', label = 'LandRover Discovery 4', price = 53016 },
		{ model = 'e34', label = 'BMW M5 E34', price = 35000 },
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
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 111,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 22,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 51,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 41,  ['tshirt_2'] = 2,
			['torso_1'] = 58,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 36,
			['pants_1'] = 23,   ['pants_2'] = 10,
			['shoes_1'] = 29,   ['shoes_2'] = 0,
			['helmet_1'] = 61,  ['helmet_2'] = 9,
			['chain_1'] = 27,    ['chain_2'] = 2,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
	  ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 22,
	  ['pants_1'] = 87,   ['pants_2'] = 14,
	  ['shoes_1'] = 24,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 51,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
      ['tshirt_1'] = 41,  ['tshirt_2'] = 2,
      ['torso_1'] = 58,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 36,
      ['pants_1'] = 23,   ['pants_2'] = 10,
      ['shoes_1'] = 29,   ['shoes_2'] = 0,
      ['helmet_1'] = 61,  ['helmet_2'] = 9,
      ['chain_1'] = 27,    ['chain_2'] = 2,
      ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
	  ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 22,
	  ['pants_1'] = 87,   ['pants_2'] = 14,
	  ['shoes_1'] = 24,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 51,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
      ['tshirt_1'] = 41,  ['tshirt_2'] = 2,
      ['torso_1'] = 58,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 36,
      ['pants_1'] = 23,   ['pants_2'] = 10,
      ['shoes_1'] = 29,   ['shoes_2'] = 0,
      ['helmet_1'] = 61,  ['helmet_2'] = 9,
      ['chain_1'] = 27,    ['chain_2'] = 2,
      ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
	  ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 22,
	  ['pants_1'] = 87,   ['pants_2'] = 14,
	  ['shoes_1'] = 24,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 51,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
      ['tshirt_1'] = 41,  ['tshirt_2'] = 2,
      ['torso_1'] = 58,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 36,
      ['pants_1'] = 23,   ['pants_2'] = 10,
      ['shoes_1'] = 29,   ['shoes_2'] = 0,
      ['helmet_1'] = 61,  ['helmet_2'] = 9,
      ['chain_1'] = 27,    ['chain_2'] = 2,
      ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
	  ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 22,
	  ['pants_1'] = 87,   ['pants_2'] = 14,
	  ['shoes_1'] = 24,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 51,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
      ['tshirt_1'] = 41,  ['tshirt_2'] = 2,
      ['torso_1'] = 58,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 36,
      ['pants_1'] = 23,   ['pants_2'] = 10,
      ['shoes_1'] = 29,   ['shoes_2'] = 0,
      ['helmet_1'] = 61,  ['helmet_2'] = 9,
      ['chain_1'] = 27,    ['chain_2'] = 2,
      ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
	  ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 22,
	  ['pants_1'] = 87,   ['pants_2'] = 14,
	  ['shoes_1'] = 24,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 51,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
      ['tshirt_1'] = 41,  ['tshirt_2'] = 2,
      ['torso_1'] = 58,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 36,
      ['pants_1'] = 23,   ['pants_2'] = 10,
      ['shoes_1'] = 29,   ['shoes_2'] = 0,
      ['helmet_1'] = 61,  ['helmet_2'] = 9,
      ['chain_1'] = 27,    ['chain_2'] = 2,
      ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
	  ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
	  ['torso_1'] = 111,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 22,
	  ['pants_1'] = 87,   ['pants_2'] = 14,
	  ['shoes_1'] = 24,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 51,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
      ['tshirt_1'] = 41,  ['tshirt_2'] = 2,
      ['torso_1'] = 58,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 36,
      ['pants_1'] = 23,   ['pants_2'] = 10,
      ['shoes_1'] = 29,   ['shoes_2'] = 0,
      ['helmet_1'] = 61,  ['helmet_2'] = 9,
      ['chain_1'] = 27,    ['chain_2'] = 2,
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