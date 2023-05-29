Config                            = {}

Config.DrawDistance               = 5.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 0, g = 255, b = 0}

Config.EnablePlayerManagement     = false -- Enable if you want society managing.
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How much people can be in service at once?

Config.Locale                     = 'es'

Config.GnaStations = {

	Sandy = {

		Blip = {
			Coords  = vector3(1856.68, 3680.36, 33.92),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.9,
			Colour  = 0
		},

		Cloakrooms = {
			vector3(1850.0, 3696.2, 34.24)
		},

		Armories = {
			vector3(1451.7, -1380.1, 1110.6)
		},

		Vehicles = {
			{
				Spawner = vector3(1867.04, 3701.44, 1033.44),
				InsideShop = vector3(1867.04, 3701.44, 33.44),
				SpawnPoints = {
					{coords = vector3(1867.04, 3701.44, 33.44), heading = 207.26, radius = 6.0},
				}

			}
		},

		Helicopters = {
			{
				Spawner = vector3(1867.48, 3646.84, 1235.84),
				InsideShop = vector3(1867.48, 3646.84, 35.84),
				SpawnPoints = {
					{coords = vector3(1867.48, 3646.84, 35.84), heading = 92.6, radius = 10.0}
				}
			}
		},

		boats = {
			{
				Spawner = vector3(-847.64, -1368.12, 1.6),
				InsideShop = vector3(-857.56, -1369.04, -0.4),
				SpawnPoints = {
					{coords = vector3(-857.56, -1369.04, -0.4), heading = 194.0, radius = 10.0}
				}
			},
			{
				Spawner = vector3(1512.12, 3913.44, 31.0),
				InsideShop = vector3(1506.44, 3906.56, 29.56),
				SpawnPoints = {
					{coords = vector3(1506.44, 3906.56, 29.56), heading = 194.0, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_BZGAS', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0},
		{weapon = 'WEAPON_KNIFE', price = 0},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 1000, 4000, nil}, price = 0}
	},

	officer = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_BZGAS', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0},
		{weapon = 'WEAPON_KNIFE', price = 0},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 1000, 4000, nil}, price = 0}
	},

	sergeant = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_BZGAS', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0},
		{weapon = 'WEAPON_KNIFE', price = 0},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 1000, 4000, nil}, price = 0}
	},

	lieutenant = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_BZGAS', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0},
		{weapon = 'WEAPON_KNIFE', price = 0},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0, 1000, 4000, nil}, price = 0}
	},

	boss = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_BZGAS', price = 0},
		{weapon = 'GADGET_PARACHUTE', price = 0},
		{weapon = 'WEAPON_KNIFE', price = 0},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_HEAVYSNIPER', components = {0, 0, 1000, 4000, nil}, price = 0}
	}
}


Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'police3', price = 1},
			{model = 'police2', price = 1},
			{model = 'silv', price = 1},
			{model = 'polcaptivac140', price = 1},
			{model = 'polgs350', price = 1},
			{model = 'cuadp', price = 1},
			{model = 'poltaurus', price = 1},
			{model = 'geof1', price = 1},
			{model = 'code3ram', price = 1},
			{model = 'code318tahoe', price = 1},
			{model = 'pd_dirtbike', price = 1},
			{model = 'p5082', price = 1},
			{model = 'code3bmw', price = 1}
		},

		officer = {
			{model = 'police3', price = 1},
			{model = 'police2', price = 1},
			{model = 'silv', price = 1},
			{model = 'polcaptivac140', price = 1},
			{model = 'polgs350', price = 1},
			{model = 'cuadp', price = 1},
			{model = 'poltaurus', price = 1},
			{model = 'geof1', price = 1},
			{model = 'code3ram', price = 1},
			{model = 'code318tahoe', price = 1},
			{model = 'pd_dirtbike', price = 1},
			{model = 'p5082', price = 1},
			{model = 'code3bmw', price = 1}
		},

		sergeant = {
			{model = 'police3', price = 1},
			{model = 'police2', price = 1},
			{model = 'silv', price = 1},
			{model = 'polcaptivac140', price = 1},
			{model = 'polgs350', price = 1},
			{model = 'cuadp', price = 1},
			{model = 'poltaurus', price = 1},
			{model = 'geof1', price = 1},
			{model = 'code3ram', price = 1},
			{model = 'code318tahoe', price = 1},
			{model = 'pd_dirtbike', price = 1},
			{model = 'p5082', price = 1},
			{model = 'code3bmw', price = 1}
		},

		lieutenant = {
			{model = 'police3', price = 1},
			{model = 'police2', price = 1},
			{model = 'silv', price = 1},
			{model = 'polcaptivac140', price = 1},
			{model = 'polgs350', price = 1},
			{model = 'cuadp', price = 1},
			{model = 'poltaurus', price = 1},
			{model = 'geof1', price = 1},
			{model = 'code3ram', price = 1},
			{model = 'code318tahoe', price = 1},
			{model = 'pd_dirtbike', price = 1},
			{model = 'p5082', price = 1},
			{model = 'punisher', price = 1},
			{model = 'vetir', price = 1},
			{model = 'squaddie', price = 1},
			{model = 'code3bmw', price = 1},
			{model = 'gna3', price = 1}
		},

		boss = {
			{model = 'police3', price = 1},
			{model = 'police2', price = 1},
			{model = 'silv', price = 1},
			{model = 'polcaptivac140', price = 1},
			{model = 'polgs350', price = 1},
			{model = 'cuadp', price = 1},
			{model = 'poltaurus', price = 1},
			{model = 'geof1', price = 1},
			{model = 'code3ram', price = 1},
			{model = 'code318tahoe', price = 1},
			{model = 'pd_dirtbike', price = 1},
			{model = 'p5082', price = 1},
			{model = 'punisher', price = 1},
			{model = 'vetir', price = 1},
			{model = 'squaddie', price = 1},
			{model = 'code3bmw', price = 1},
			{model = 'gna3', price = 1}
		}
	},

	helicopter = {
		recruit = {},

		officer = {},

		sergeant = {},

		lieutenant = {
			{model = 'fibfrogger', props = {modLivery = 0}, price = 1}
		},

		boss = {
			{model = 'fibfrogger', props = {modLivery = 0}, price = 1}
		}
	},

	boats = {
		recruit = {},

		officer = {},

		sergeant = {},

		lieutenant = {
			{model = 'defender', props = {modLivery = 0}, price = 1}
		},

		boss = {
			{model = 'defender', props = {modLivery = 0}, price = 1}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 421,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 121,   pants_2 = 14,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 17,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 25,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 20,
			chain_1 = -1,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 421,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 121,   pants_2 = 14,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 17,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 25,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 20,
			chain_1 = -1,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 421,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 121,   pants_2 = 14,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 186,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 28,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 20,
			chain_1 = -1,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 422,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 121,   pants_2 = 14,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 238,  tshirt_2 = 0,
			torso_1 = 301,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 32,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 20,
			chain_1 = -1,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 36,  tshirt_2 = 0,
			torso_1 = 325,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 42,
			pants_1 = 121,   pants_2 = 14,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 1,
			torso_1 = 341,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 32,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 20,
			chain_1 = -1,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 33,  bproof_2 = 1
		},
		female = {
			bproof_1 = 32,  bproof_2 = 1
		}
	},

	gilet_wear = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1
		},
		female = {
			tshirt_1 = 32,  tshirt_2 = 1
		}
	}
}
