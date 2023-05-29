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

Config.xiterStations = {

	MAFIA = {

		Blip = {
		},

		Cloakrooms = {
			vector3(0, 0, 0)
		},

		Armories = {
			vector3(1979.6749, 5172.1875, 47.6391)  
		},

		Vehicles = {
			{
				Spawner = vector3(0, 0, 0), 
				InsideShop = vector3(-2591.1978, 1930.4978, 167.3004),
				SpawnPoints = {
					{coords = vector3(-2591.1978, 1930.4978, 167.3004), heading = 90.0, radius = 6.0},
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
			vector3(0, 0, 0),
		}

	},
}


Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_COMBATPDW', price = 77000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 110000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 190000 },
		{ weapon = 'WEAPON_PISTOL',  price = 58000 },
		{ weapon = 'WEAPON_COMPACTRIFLE',  price = 65000 },
		{ weapon = 'WEAPON_ASSAULTSMG',  price = 123000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',  price = 55000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 70000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 118000 },
		{ weapon = 'WEAPON_APPISTOL', price = 100000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE',  price = 97000 },
		{ weapon = 'WEAPON_PISTOL50',  price = 60000 },
		{ weapon = 'WEAPON_MICROSMG',  price = 102000 },
		{ weapon = 'WEAPON_GUSENBERG',  price = 87000 },
		{ weapon = 'WEAPON_SMG', price = 170000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE_MK2',  price = 90000 },
		{ weapon = 'WEAPON_SPECIALCARBINE',  price = 130000 },
		{ weapon = 'WEAPON_SMG_MK2',  price = 84000 },

	},

	officer = {
		{ weapon = 'WEAPON_COMBATPDW', price = 77000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 110000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 190000 },
		{ weapon = 'WEAPON_PISTOL',  price = 58000 },
		{ weapon = 'WEAPON_COMPACTRIFLE',  price = 65000 },
		{ weapon = 'WEAPON_ASSAULTSMG',  price = 123000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',  price = 55000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 70000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 118000 },
		{ weapon = 'WEAPON_APPISTOL', price = 100000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE',  price = 97000 },
		{ weapon = 'WEAPON_PISTOL50',  price = 60000 },
		{ weapon = 'WEAPON_MICROSMG',  price = 102000 },
		{ weapon = 'WEAPON_GUSENBERG',  price = 87000 },
		{ weapon = 'WEAPON_SMG', price = 170000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE_MK2',  price = 90000 },
		{ weapon = 'WEAPON_SPECIALCARBINE',  price = 130000 },
		{ weapon = 'WEAPON_SMG_MK2',  price = 84000 },
	},

	sergeant = {
		{ weapon = 'WEAPON_COMBATPDW', price = 77000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 110000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 190000 },
		{ weapon = 'WEAPON_PISTOL',  price = 58000 },
		{ weapon = 'WEAPON_COMPACTRIFLE',  price = 65000 },
		{ weapon = 'WEAPON_ASSAULTSMG',  price = 123000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',  price = 55000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 70000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 118000 },
		{ weapon = 'WEAPON_APPISTOL', price = 100000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE',  price = 97000 },
		{ weapon = 'WEAPON_PISTOL50',  price = 60000 },
		{ weapon = 'WEAPON_MICROSMG',  price = 102000 },
		{ weapon = 'WEAPON_GUSENBERG',  price = 87000 },
		{ weapon = 'WEAPON_SMG', price = 170000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE_MK2',  price = 90000 },
		{ weapon = 'WEAPON_SPECIALCARBINE',  price = 130000 },
		{ weapon = 'WEAPON_SMG_MK2',  price = 84000 },
	},

	lieutenant = {
		{ weapon = 'WEAPON_COMBATPDW', price = 77000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 110000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 190000 },
		{ weapon = 'WEAPON_PISTOL',  price = 58000 },
		{ weapon = 'WEAPON_COMPACTRIFLE',  price = 65000 },
		{ weapon = 'WEAPON_ASSAULTSMG',  price = 123000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',  price = 55000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 70000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 118000 },
		{ weapon = 'WEAPON_APPISTOL', price = 100000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE',  price = 97000 },
		{ weapon = 'WEAPON_PISTOL50',  price = 60000 },
		{ weapon = 'WEAPON_MICROSMG',  price = 102000 },
		{ weapon = 'WEAPON_GUSENBERG',  price = 87000 },
		{ weapon = 'WEAPON_SMG', price = 170000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE_MK2',  price = 90000 },
		{ weapon = 'WEAPON_SPECIALCARBINE',  price = 130000 },
		{ weapon = 'WEAPON_SMG_MK2',  price = 84000 },
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPDW', price = 77000 },
		{ weapon = 'WEAPON_BULLPUPRIFLE', price = 110000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 190000 },
		{ weapon = 'WEAPON_PISTOL',  price = 58000 },
		{ weapon = 'WEAPON_COMPACTRIFLE',  price = 65000 },
		{ weapon = 'WEAPON_ASSAULTSMG',  price = 123000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',  price = 55000 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 70000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE', price = 118000 },
		{ weapon = 'WEAPON_APPISTOL', price = 100000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE',  price = 97000 },
		{ weapon = 'WEAPON_PISTOL50',  price = 60000 },
		{ weapon = 'WEAPON_MICROSMG',  price = 102000 },
		{ weapon = 'WEAPON_GUSENBERG',  price = 87000 },
		{ weapon = 'WEAPON_SMG', price = 170000 },
		{ weapon = 'WEAPON_ASSAULTRIFLE_MK2',  price = 90000 },
		{ weapon = 'WEAPON_SPECIALCARBINE',  price = 130000 },
		{ weapon = 'WEAPON_SMG_MK2',  price = 84000 },
	}
}


Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'kuruma', price = 1}
		},

		officer = {
			{model = 'kuruma', price = 1}
		},

		sergeant = {
			{model = 'kuruma', price = 1}
		},

		lieutenant = {
			{model = 'kuruma', price = 1}
		},
		
		boss = {
			{model = 'kuruma', price = 1}
		}
	},

	helicopter = {
		recruit = {},

		officer = {},
	
		officer2 = {},
	
		officer3 = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 1 },
		},
	
		sargeant = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 1 },
		},
	
		sargeant2 = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 1 },
		},
	
		teniente = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 1 },
		},
	
		teniente2 = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 0 },
		},
	
		capitan = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 0 },
		},
	
		capitan2 = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 0 },
		},
	
		boss = {
			{ model = 'polmav', label = 'Helicoptero MAFIA', livery = 0, price = 0 },
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
			pants_1 = 25,   pants_2 = 1,
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
			pants_1 = 25,   pants_2 = 1,
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
			bproof_1 = 2,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 13,  tshirt_2 = 1
		}
	},


	xiter_wear2 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 25,   pants_2 = 4,
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
			pants_1 = 25,   pants_2 = 4,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
        }
	},

	xiter_wear5 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 25,   pants_2 = 5,
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
			pants_1 = 25,   pants_2 = 5,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0
        }
	},
    
	xiter_wear = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 22,   pants_2 = 7,
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
			pants_1 = 22,   pants_2 = 7,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0	
        }
	},

	xiter_wear3 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 13,   pants_2 = 2,
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
			pants_1 = 13,   pants_2 = 2,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0	
		}
	},

	xiter_wear4 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 30,
			pants_1 = 8,   pants_2 = 0,
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
			pants_1 = 8,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			mask_1 = 0,   mask_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			glasses_1 = 0,    glasses_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 =2,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0	
		
		}
	}
	
}