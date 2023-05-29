Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 3, Armories = 3, BossActions = 3, Vehicles = 3, Helicopters = 3}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds     = false -- Enable if you're using esx_optionalneeds
Config.EnableLicenses             = false -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = false -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale                     = 'es'

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(1866.6647, 3686.7344, 33.9483),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.7,
			Colour  = 46
		},

		Cloakrooms = {
			vector3(1856.8971, 3689.6201, 34.2670)
		},

		Armories = {
			vector3(1848.7866, 3689.9885, 34.2670)
		},

		Vehicles = {
			{
				Spawner = vector3(1857.3303, 3683.1641, 34.2675),
				InsideShop = vector3(1864.0369, 3679.8450, 33.6549),
				SpawnPoints = {
					{coords = vector3(1864.0369, 3679.8450, 33.6549), heading = 295.1168, radius = 6.0},
					{coords = vector3(1864.0369, 3679.8450, 33.6549), heading = 295.1168, radius = 6.0},
					{coords = vector3(1864.0369, 3679.8450, 33.6549), heading = 295.1168, radius = 6.0},
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1854.3949, 3681.2698, 34.2666),
				InsideShop = vector3(1854.9359, 3668.2268, 34.0294),
				SpawnPoints = {
					{coords = vector3(1854.9359, 3668.2268, 34.0294), heading = 198.7715, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(1851.7621, 3691.2480, 34.2670)
		}

	}

}

Config.AuthorizedWeapons = {
	-- Cadete
	recruit = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 5000}
	},
	-- SubOficial
	officer = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 5000}
	},
	-- Oficial I
	sergeant = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 25000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000}
	},
	-- Oficial II
	lieutenant = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 25000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000}
	},
	-- Sargento
	lieutenant2 = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 25000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 100000}
	},
	-- Sargento II
	lieutenant3 = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 25000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 100000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 100000}
	},
	-- Teniente 
	lieutenant4 = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 5000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 30000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 10000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 10000}
	},
	-- Capitan 
	lieutenant5 = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 5000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 30000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 10000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 10000}
	},
	-- Mayor
	lieutenant6 = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 25000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_MILITARYRIFLE', price = 75000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 100000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 100000}
	},
	-- Coronel
	lieutenant7 = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 25000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_MILITARYRIFLE', price = 75000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 100000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 100000}
	},
	-- General
	boss = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1000},
		{weapon = 'WEAPON_STUNGUN', price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 25000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_MILITARYRIFLE', price = 75000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', price = 200000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 100000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 100000},
		-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000}
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
             {model = 'psgauto', price = 100000},
             {model = 'motopsg', price = 50000}
		},

		officer = {
            {model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 50000}
		},

		sergeant = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000}
		},

		lieutenant = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000}
		},

		lieutenant2 = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000},
			{model = 'blindadopsg', price = 100000}
		},

		lieutenant3 = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000},
			{model = 'wmfenyrcop', price = 150000},
			{model = 'blindadopsg', price = 100000}
		},

		lieutenant4 = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000},
			{model = 'wmfenyrcop', price = 150000},
			{model = 'blindadopsg', price = 100000}
		},

		lieutenant5 = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000},
			{model = 'wmfenyrcop', price = 150000},
			{model = 'blindadopsg', price = 100000}
		},

		lieutenant6 = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000},
			{model = 'wmfenyrcop', price = 150000},
			{model = 'blindadopsg', price = 100000}
		},

		lieutenant7 = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000},
			{model = 'wmfenyrcop', price = 150000},
			{model = 'blindadopsg', price = 100000}
		},

		boss = {
			{model = 'psgauto', price = 100000},
            {model = 'motopsg', price = 25000},
            {model = 'psgraptor', price = 75000},
			{model = 'wmfenyrcop', price = 150000},
			{model = 'blindadopsg', price = 100000}
		}
	},

	helicopter = {
		recruit = {},

		officer = {},

		sergeant = {},
      
       lieutenant3 = {
            {model = 'helipfa', props = {modLivery = 0}, price = 200000}
        },

       lieutenant4 = {
            {model = 'helipfa', props = {modLivery = 0}, price = 200000},
            {model = 'buzzardpfa', props = {modLivery = 0}, price = 250000}
        },

        lieutenant5 = {
            {model = 'helipfa', props = {modLivery = 0}, price = 200000},
            {model = 'buzzardpfa', props = {modLivery = 0}, price = 250000}
        },
		
        lieutenant6 = {
			{model = 'helipfa', props = {modLivery = 0}, price = 200000},
            {model = 'buzzardpfa', props = {modLivery = 0}, price = 250000}
		},

		lieutenant7 = {
			{model = 'helipfa', props = {modLivery = 0}, price = 200000},
            {model = 'buzzardpfa', props = {modLivery = 0}, price = 250000}
		},

		boss = {
			{model = 'helipfa', props = {modLivery = 0}, price = 200000},
            {model = 'buzzardpfa', props = {modLivery = 0}, price = 250000}
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
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	officer = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant2 = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant3 = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant4 = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant5 = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant6 = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant7 = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	boss = {
		male = {
			tshirt_1 = 208,  tshirt_2 = 0,
			torso_1 = 351,    torso_2 = 0,
			decals_1 = 0,    decals_2 = 0,
			arms = 52,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 25,    shoes_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 73,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 31,
			pants_1 = 61,   pants_2 = 9,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 38,  bproof_2 = 0
		},
		female = {
			bproof_1 = 19,  bproof_2 = 9
		}
	},
	conjunto_nuevo = {
		male = {
			tshirt_1 = 70, tshirt_2 = 0,
			torso_1 = 220,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 42,
			pants_1 = 130,  pants_2 = 1,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
            mask_1 = 174,  mask_2 = 24
		},
		female = {
			tshirt_1 = 122, tshirt_2 = 0,
			torso_1 = 222,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 26,
			pants_1 = 136,  pants_2 = 1,
			shoes_1 = 25,   shoes_2 = 0,
            mask_1 = 178,  mask_2 = 24
		}
	},
	chaleco_geof = {
		male = {
			bproof_1 = 38,  bproof_2 = 0
		},
		female = {
			bproof_1 = 19,  bproof_2 = 9
		}
	}
}
