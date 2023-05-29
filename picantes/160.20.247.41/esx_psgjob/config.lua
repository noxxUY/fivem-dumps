Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = false -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How much people can be in service at once?

Config.Locale                     = 'es'

Config.psgStations = {

	Prosegur = {

		Blip = {
			Coords  = vector3(1856.3761, 3681.7805, 34.2683), 
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 60
		},

		Cloakrooms = {
			vector3(1848.8079, 3695.7600, 34.2701)   
		},

		Armories = {
			vector3(1860.9172, 3688.9058, 34.2701)   
		},

		Vehicles = {
			{
				Spawner = vector3(0, 0, 0),
				InsideShop = vector3(0, 0, 0),
				SpawnPoints = {
					{coords = vector3(0, 0, 0), heading = 90.0, radius = 6.0},
					{coords = vector3(0, 0, 0), heading = 90.0, radius = 6.0},
					{coords = vector3(0, 0, 0), heading = 90.0, radius = 6.0},
					{coords = vector3(0, 0, 0), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(0, 0, 0),
				InsideShop = vector3(0, 0, 0),
				SpawnPoints = {
					{coords = vector3(0, 0, 0), heading = 276.1, radius = 6.0},
					{coords = vector3(0, 0, 0), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1079.9, -864.89, 5.04), 
				InsideShop = vector3(-1050.8, -864.84, 4.87),
				SpawnPoints = {
					{coords = vector3(-1066.8, -864.84, 4.87), heading = 213.72, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(1855.5774, 3689.3413, 38.0713),  
		}

	},

	BCSD = {

		Blip = {
			Coords  = vector3(0, 0, 0),
			Sprite  = 0,
			Display = 0,
			Scale   = 0,
			Colour  = 0
		},

		Cloakrooms = {
			vector3(0, 0, 0)
		},

		Armories = {
			vector3(0, 0, 0)
		},

		Vehicles = {
			{
				Spawner = vector3(0, 0, 0),
				InsideShop = vector3(40054.6, -1017.4, -22228.4),
				SpawnPoints = {
					{coords = vector3(40054.6, -1017.4, -22228.4), heading = 90.0, radius = 6.0},
				}
			},

			{
				Spawner = vector3(454.6, -1017.4, -22228.4),
				InsideShop = vector3(454.6, -1017.4, -22228.4),
				SpawnPoints = {
					{coords = vector3(40054.6, -1017.4, -22228.4), heading = 276.1, radius = 6.0},
					{coords = vector3(40054.6, -1017.4, -22228.4), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(0, 0, 0), 
				InsideShop = vector3(0, 0, 0),
				SpawnPoints = {
					{coords = vector3(0, 0, 0), heading = 293.72, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(0, 0, 0),
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	officer = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	sergeant = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	lieutenant = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	cabo = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	cabo1 = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	cabomayor = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	sargento = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	sargento1 = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	subteniente = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	teniente = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	subins = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	inspector = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	},

	boss = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
	}
}

Config.AuthorizedVehicles = {
	car = {},

	helicopter = {
		recruit = {},

		officer = {},
	
		officer2 = {},
	
		officer3 = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 1 },
		},
	
		sargeant = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 1 },
		},
	
		sargeant2 = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 1 },
		},
	
		teniente = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 1 },
		},
	
		teniente2 = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 0 },
		},
	
		capitan = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 0 },
		},
	
		capitan2 = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 0 },
		},
	
		boss = {
			{ model = 'polmav', label = 'Helicoptero Prosegur', livery = 0, price = 0 },
		},
	
		cabo = {
			{ model = 'as332', label = 'Helicoptero Sheriff', livery = 0, price = 0 },
		},
	
		sheriff = {
			{ model = 'as332', label = 'Helicoptero Sheriff', livery = 0, price = 1 },
		}
	}
}

Config.Uniforms = {
    recruit = {
		male = {
			tshirt_1 = 38,  tshirt_2 = 0,
			torso_1 = 241,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 45,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 4,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},


	boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			ppants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	gilet_wear = {
		male = {
			bproof_1 = 27,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 13,  tshirt_2 = 1
		}
	},


	psg_wear2 = { ---Uniforme Sargemto/1ro
		male = {
			tshirt_1 = 38,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 7,    chain_2 = 0,
			bproof_1 =38,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 38,  tshirt_2 = 0,
			torso_1 = 74,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 7,    chain_2 = 0,
			bproof_1 =38,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
        }
	},

	psg_wear5 = { --- Cabo 1 
		male = {
			tshirt_1 = 44,  tshirt_2 = 0,
			torso_1 = 94,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 241,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
        }
	},
    
	psg_wear = {
		male = {
			tshirts_1 = 15,  tshirt_2 = 0,
			torso_1 = 102,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 102,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
        }
	},

	psg_wear3 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	psg_wear4 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 24,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0	
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =27,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0	
		
		}
	}
	
}