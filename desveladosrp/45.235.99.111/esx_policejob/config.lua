Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

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

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 137,
			Display = 4,
			Scale   = 0.9,
			Colour  = 0
		},

		Cloakrooms = {
			vector3(462.0, -996.44, 30.68)
		},

		Armories = {
			vector3(451.7, -380.1, 0.6)
		},

		Vehicles = {
			{
				Spawner = vector3(431.16, -982.48, 25.68),
				InsideShop = vector3(431.16, -982.48, 25.68),
				SpawnPoints = {
					{coords = vector3(431.16, -982.48, 25.68), heading = 210.0, radius = 6.0},
				}
			},

			{
				Spawner = vector3(452.12, -980.92, 25.68),
				InsideShop = vector3(452.12, -980.92, 25.68),
				SpawnPoints = {
					{coords = vector3(452.12, -980.92, 25.68), heading = 210.1, radius = 6.0},
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(448.65, -981.25, 43.69),
				InsideShop = vector3(448.65, -981.25, 43.69),
				SpawnPoints = {
					{coords = vector3(448.65, -981.25, 43.69), heading = 92.6, radius = 10.0}
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
		{weapon = 'WEAPON_KNIFE', price = 0},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SNIPERRIFLE', components = {0, 0, 1000, 4000, nil}, price = 0}
	},

	boss = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_BZGAS', price = 0},
		{weapon = 'WEAPON_KNIFE', price = 0},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_SNIPERRIFLE', components = {0, 0, 1000, 4000, nil}, price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = '17fusionbb', price = 1},
			{model = 'p508', price = 1},
			{model = 'police4', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'fordpc', price = 1},
			{model = 'psp_bmwgs', price = 1},
			{model = 'sher', price = 1},
			{model = 'code3fpis', price = 1},
			{model = 'pmcbike', price = 1}
		},

		officer = {
			{model = '17fusionbb', price = 1},
			{model = 'p508', price = 1},
			{model = 'police4', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'fordpc', price = 1},
			{model = 'psp_bmwgs', price = 1},
			{model = 'sher', price = 1},
			{model = 'code3fpis', price = 1},
			{model = 'pmcbike', price = 1}
		},

		sergeant = {
			{model = '17fusionbb', price = 1},
			{model = 'p508', price = 1},
			{model = 'police4', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'fordpc', price = 1},
			{model = 'psp_bmwgs', price = 1},
			{model = 'sher', price = 1},
			{model = 'code3fpis', price = 1},
			{model = 'pmcbike', price = 1}
		},

		lieutenant = {
			{model = '17fusionbb', price = 1},
			{model = 'p508', price = 1},
			{model = 'police4', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'fordpc', price = 1},
			{model = 'psp_bmwgs', price = 1},
			{model = 'firetruk', price = 1},
			{model = 'code3fpis', price = 1},
			{model = 'sher', price = 1},
			{model = 'psp_mbsprinter', price = 1},
			{model = 'pmcbike', price = 1},
			{model = 'sspres', price = 1}
		},

		boss = {
			{model = '17fusionbb', price = 1},
			{model = 'p508', price = 1},
			{model = 'police4', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'fordpc', price = 1},
			{model = 'psp_bmwgs', price = 1},
			{model = 'firetruk', price = 1},
			{model = 'code3fpis', price = 1},
			{model = 'sher', price = 1},
			{model = 'psp_mbsprinter', price = 1},
			{model = 'pmcbike', price = 1},
			{model = 'sspres', price = 1}
		}
	},

	helicopter = {
		recruit = {},

		officer = {},

		sergeant = {},

		lieutenant = {
			{model = 'movilhp', props = {modLivery = 0}, price = 1}
		},

		boss = {
			{model = 'movilhp', props = {modLivery = 0}, price = 1}
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
			tshirt_1 = 173,  tshirt_2 = 0,
			torso_1 = 3,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 34,
			pants_1 = 157,   pants_2 = 0,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = 106,  helmet_2 = 20,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 50,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 36,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = 105,  helmet_2 = 20,
			chain_1 = 20,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 173,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 157,   pants_2 = 0,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = 106,  helmet_2 = 20,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 50,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 36,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = 105,  helmet_2 = 20,
			chain_1 = 20,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 173,  tshirt_2 = 0,
			torso_1 = 8,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 34,
			pants_1 = 157,   pants_2 = 0,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = 106,  helmet_2 = 20,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 9,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = 105,  helmet_2 = 20,
			chain_1 = 20,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 173,  tshirt_2 = 0,
			torso_1 = 17,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 157,   pants_2 = 0,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = 106,  helmet_2 = 20,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 455,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 38,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = 105,  helmet_2 = 20,
			chain_1 = 20,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 173,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 157,   pants_2 = 0,
			shoes_1 = 63,   shoes_2 = 0,
			helmet_1 = 106,  helmet_2 = 20,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 239,  tshirt_2 = 0,
			torso_1 = 463,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 38,
			pants_1 = 181,   pants_2 = 0,
			shoes_1 = 47,   shoes_2 = 0,
			helmet_1 = 105,  helmet_2 = 20,
			chain_1 = 20,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 33,  bproof_2 = 0
		},
		female = {
			bproof_1 = 3,  bproof_2 = 0
		}
	},

	gilet_wear = {
		male = {
			tshirt_1 = 33,  tshirt_2 = 1
		},
		female = {
			tshirt_1 = 3,  tshirt_2 = 1
		}
	}
}
