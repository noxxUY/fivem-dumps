Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 255, g = 255, b = 0}

Config.EnablePlayerManagement     = false -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- Enable if you're using esx_identity.
Config.EnableLicenses             = false -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How much people can be in service at once?

Config.Locale                     = 'es'

Config.psgStations = {

	psg = {

		Blip = {
			Coords  = vector3(1847.2, 3669.3, 34.2),
			Sprite  = 67,
			Display = 4,
			Scale   = 0.8,
			Colour  = 5
		},

		Cloakrooms = {
			vector3(1851.4, 3685.4, 34.3)
		},

		Armories = {
			vector3(1857.2, 3687.6, 34.3)

		},

		Vehicles = {
			{
				Spawner = vector3(1863.5, 3703, 3300000000.5),
				InsideShop = vector3(-144.5639973596191, -593.89999984130859, 211.77509993967285),
				SpawnPoints = {
					{coords = vector3(1872.7, 3686.4, 33.7), heading = 185.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(1863.5, 3703, 3000000003.5),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1895.1, 3680.8, 33.2),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(1886.2, 3679, 33.4), heading = 92.6, radius = 10.0}
				}
			},
{
				Spawner = vector3(1863.27, 3648.27, 35.79),
				InsideShop = vector3(1872.14, 3645.82, 35.79),
				SpawnPoints = {
					{coords = vector3(1872.14, 3645.82, 35.79), heading = 26.19, radius = 10.0}
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
		{weapon = 'WEAPON_HEAVYPISTOL', components = {1000, 4000, nil}, price = 2500},
		                {weapon = 'WEAPON_STUNGUN', price = 500},
						{weapon = 'WEAPON_SMG', price = 6000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
	},

	officer = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW', price = 6000},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_CARBINERIFLE',  price = 7500},
                {weapon = 'WEAPON_SPECIALCARBINE',  price = 7500},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
                {weapon = 'WEAPON_KNIFE', price = 100},
                {weapon = 'WEAPON_BZGAS', price = 1000},
                {weapon = 'GADGET_PARACHUTE', price = 500},
	},

	sergeant = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW', price = 6000},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_CARBINERIFLE',  price = 7500},
                {weapon = 'WEAPON_SPECIALCARBINE',  price = 7500},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
                {weapon = 'WEAPON_KNIFE', price = 100},
                {weapon = 'WEAPON_BZGAS', price = 1000},
                {weapon = 'GADGET_PARACHUTE', price = 500},
	},

	lieutenant = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW', price = 6000},
		{weapon = 'WEAPON_SMG', price = 7500},
		{weapon = 'WEAPON_CARBINERIFLE', price = 7500},
                {weapon = 'WEAPON_SPECIALCARBINE', price = 7500},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
                {weapon = 'WEAPON_KNIFE', price = 100},
                {weapon = 'WEAPON_BZGAS', price = 1000},
                {weapon = 'GADGET_PARACHUTE', price = 500},
	},
	boss = {
		{weapon = 'WEAPON_HEAVYPISTOL', components = {1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW',  price = 6000},
		{weapon = 'WEAPON_SMG', price = 7500},
		{weapon = 'WEAPON_CARBINERIFLE',  price = 7500},
                {weapon = 'WEAPON_SPECIALCARBINE',price = 7500},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
                {weapon = 'WEAPON_KNIFE', price = 100},
                {weapon = 'WEAPON_BZGAS', price = 1000},
                {weapon = 'GADGET_PARACHUTE', price = 500},
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'prosegur1', label = 'BMW', price = 6000},
			{model = 'prosegur2', label = 'Maseratti', price = 10000},
			{model = 'prosegur3', label = 'Baller 4 puertas', price = 6000},
			{model = 'prosegur4', label = 'Dodge PFA', price = 6000},
			{model = 'prosegur5', label = 'Ford ranger halcon', price = 7000},
			{model = 'prosegur15', label = 'Moto', price = 7000},
			{model = 'prosegur6', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'prosegur7', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'prosegur8', label = 'Mustang', price = 10000},
			{model = 'riotpsg', label = 'Antidisturbios', price = 7000},
            {model = 'prosegur9', label = 'Ford 4x4 ', price = 10000}
		},

		officer = {
			{model = 'prosegur1', label = 'BMW', price = 6000},
			{model = 'prosegur2', label = 'Maseratti', price = 10000},
			{model = 'prosegur3', label = 'Baller 4 puertas', price = 6000},
			{model = 'prosegur4', label = 'Dodge PFA', price = 6000},
			{model = 'prosegur5', label = 'Ford ranger halcon', price = 7000},
			{model = 'prosegur15', label = 'Moto', price = 7000},
			{model = 'prosegur6', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'prosegur7', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'prosegur8', label = 'Mustang', price = 10000},
			{model = 'riotpsg', label = 'Antidisturbios', price = 7000},
            {model = 'prosegur9', label = 'Ford 4x4 ', price = 10000}
		},

		sergeant = {
			{model = 'prosegur1', label = 'BMW', price = 6000},
			{model = 'prosegur2', label = 'Maseratti', price = 10000},
			{model = 'prosegur3', label = 'Baller 4 puertas', price = 6000},
			{model = 'prosegur4', label = 'Dodge PFA', price = 6000},
			{model = 'prosegur5', label = 'Ford ranger halcon', price = 7000},
			{model = 'prosegur15', label = 'Moto', price = 7000},
			{model = 'prosegur6', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'prosegur7', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'prosegur8', label = 'Mustang', price = 10000},
			{model = 'riotpsg', label = 'Antidisturbios', price = 7000},
            {model = 'prosegur9', label = 'Ford 4x4 ', price = 10000}
		},


		lieutenant = {
			{model = 'prosegur1', label = 'BMW', price = 6000},
			{model = 'prosegur2', label = 'Maseratti', price = 10000},
			{model = 'prosegur3', label = 'Baller 4 puertas', price = 6000},
			{model = 'prosegur4', label = 'Dodge PFA', price = 6000},
			{model = 'prosegur5', label = 'Ford ranger halcon', price = 7000},
			{model = 'prosegur15', label = 'Moto', price = 7000},
			{model = 'prosegur6', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'prosegur7', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'prosegur8', label = 'Mustang', price = 10000},
			{model = 'riotpsg', label = 'Antidisturbios', price = 7000},
            {model = 'prosegur9', label = 'Ford 4x4 ', price = 10000}
		},

		boss = {
			{model = 'prosegur1', label = 'BMW', price = 6000},
			{model = 'prosegur2', label = 'Maseratti', price = 10000},
			{model = 'prosegur3', label = 'Baller 4 puertas', price = 6000},
			{model = 'prosegur4', label = 'Dodge PFA', price = 6000},
			{model = 'prosegur5', label = 'Ford ranger halcon', price = 7000},
			{model = 'prosegur15', label = 'Moto', price = 7000},
			{model = 'prosegur6', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'prosegur7', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'prosegur8', label = 'Mustang', price = 10000},
			{model = 'riotpsg', label = 'Antidisturbios', price = 7000},
            {model = 'prosegur9', label = 'Ford 4x4 ', price = 10000}
		},

		captain = {}
	},

	helicopter = {
		recruit = {},

		officer = {},

		lieutenant = {
			{model = 'helicopteropsg', props = {modLivery = 0}, price = 50000}
		},

		sergeant = {
			{model = 'helicopteropsg', props = {modLivery = 0}, price = 50000}
		},

		boss = {
			{model = 'helicopteropsg', props = {modLivery = 0}, price = 50000}
		}
	}
}

Config.CustomPeds = {
	shared = {},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 87,   pants_2 = 5,
			shoes_1 = 34,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 31,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 168,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 34,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},


	sergeant = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 2,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 34,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 34,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},


	boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 22,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 34,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 2,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
   bullet_wear1 = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 53,   torso_2 = 0,
			vest = 4,
			decals_1 = 8,   decals_2 = 2,
			arms = 28,
			pants_1 = 31,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 70,  helmet_2 = 0,
			chain_1 = 125,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
                        mask_1 = 53,
                        bproof_1 = 4,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 0,
			vest = 4,
			decals_1 = 8,   decals_2 = 2,
			arms = 31,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 50,  helmet_2 = 0,
			chain_1 = 83,    chain_2 = 2,
			ears_1 = 0,     ears_2 = 0,
                        mask_1 = 56,
                        bproof_1 = 4,  bproof_2 = 0
		}
	},
 bullet_wear2 = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 53,   torso_2 = 1,
			vest = 4,
			decals_1 = 8,   decals_2 = 2,
			arms = 20,
			pants_1 = 31,   pants_2 = 2,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 19,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
                        mask_1 = 0,
                        bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 152,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 0,
			vest = 4,
			decals_1 = 8,   decals_2 = 2,
			arms = 31,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 50,  helmet_2 = 0,
			chain_1 = 83,    chain_2 = 2,
			ears_1 = 0,     ears_2 = 0,
                        mask_1 = 56,
                        bproof_1 = 4,  bproof_2 = 0
		}
	},
	gilet_wear = {
		male = {
			bproof_1 = 2,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
		}
	}
}
