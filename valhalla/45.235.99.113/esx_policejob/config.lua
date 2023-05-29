Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 215, g = 24, b = 24}

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

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6),
			vector3(1850.64, 3693.16, 34.27)
		},

		Armories = {
			vector3(451.7, -980.1, 30.6),
			vector3(1845.81, 3692.49, 34.27)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28456456456.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(-1070.13, -846.14, 4.88),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(-1039.68, -855.81, 4.88), heading = 40.9, radius = 6.0 },
					{ coords = vector3(-1049.82, -863.25, 5.01), heading = 53.9, radius = 6.0 },
                               { coords = vector3(-1076.9, -880.22, 4.69), heading = 40.9, radius = 6.0 }
				}
			},
			{
				Spawner = vector3(1868.12, 3698.14, 33.32),
				InsideShop = vector3(1861.08, 3708.39, 33.31),
				SpawnPoints = {
					{ coords = vector3(1865.47, 3700.22, 33.55), heading = 208.39, radius = 6.0 },
					{ coords = vector3(1877.82, 3697.71, 33.39), heading = 122.77, radius = 6.0 }
				}
			},
			{
				Spawner = vector3(-458.89, 6030.3, 31.34),
				InsideShop = vector3(-462.96, 6022.68, 31.34),
				SpawnPoints = {
					{ coords = vector3(-467.72, 6034.84, 31.34), heading = 214.39, radius = 6.0 }
				}
			}

		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.656757),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
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
		{weapon = 'WEAPON_COMBATPISTOL', components = {1000, 4000, nil}, price = 2500},
		                {weapon = 'WEAPON_STUNGUN', price = 500},
						{weapon = 'WEAPON_SMG', price = 6000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
	},

	recruit1 = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_SMG', price = 6000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
	},

	officer = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW', price = 6000},
		{weapon = 'WEAPON_SMG', price = 6000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
	},

	officer1 = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW', price = 6000},
		{weapon = 'WEAPON_SMG', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_CARBINERIFLE', price = 7500},
                {weapon = 'WEAPON_SPECIALCARBINE', price = 7500},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
                {weapon = 'WEAPON_KNIFE', price = 100},
                {weapon = 'WEAPON_BZGAS', price = 1000},
                {weapon = 'GADGET_PARACHUTE', price = 500},
	},

	detective = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		
		{weapon = 'WEAPON_COMBATPDW',  price = 6000},
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

	detective1 = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW', price = 6000},
		{weapon = 'WEAPON_SMG', price = 7500},
		{weapon = 'WEAPON_CARBINERIFLE',  price = 7500},
                {weapon = 'WEAPON_SPECIALCARBINE', price = 7500},
		{weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 500},
                {weapon = 'WEAPON_KNIFE', price = 100},
                {weapon = 'WEAPON_BZGAS', price = 1000},
                {weapon = 'GADGET_PARACHUTE', price = 500},
	},

	sergeant = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
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

	sergeant1 = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
		{weapon = 'WEAPON_COMBATPDW',  price = 6000},
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
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 2500},
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

	lieutenant1 = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {1000, 4000, nil}, price = 2500},
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
		{weapon = 'WEAPON_COMBATPISTOL', components = {1000, 4000, nil}, price = 2500},
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
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000}
		},

		recruit1 = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000}
		},

		officer = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
			{model = 'pfa5', label = 'Mustang', price = 10000}
		},

		officer1 = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
            {model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa15', label = 'Moto', price = 7000},
            {model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		detective = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		detective1 = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		sergeant = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		sergeant1 = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa12', label = 'Ford ranger halcon', price = 7000},
			{model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
			{model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		lieutenant = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa12', label = 'Ford ranger halcon', price = 7000},
			{model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
			{model = 'pfa15', label = 'Moto', price = 7000},
            {model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		lieutenant1 = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa12', label = 'Ford ranger halcon', price = 7000},
			{model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		boss = {
			{model = 'riot', label = 'Antidisturbios', price = 7000},
			{model = 'pfa1', label = 'BMW', price = 6000},
			{model = 'pfa2', label = 'Maseratti', price = 10000},
			{model = 'pfa3', label = 'Baller 4 puertas', price = 6000},
			{model = 'pfa6', label = 'Dodge PFA', price = 6000},
			{model = 'pfa12', label = 'Ford ranger halcon', price = 7000},
			{model = 'pfa15', label = 'Moto', price = 7000},
			{model = 'pfa9', label = 'Unidad de alta velocidad', price = 6000},
			{model = 'pfa4', label = 'Mercedes 4 puertas', price = 10000},
            {model = 'pfa5', label = 'Mustang', price = 10000},
            {model = 'pfa7', label = 'Ford 4x4 ', price = 10000}
		},

		captain = {}
	},

	helicopter = {
		recruit = {},

		recruit1 = {},

		officer = {},

		officer1 = {},

		lieutenant = {
			{model = 'helicopteropfa', props = {modLivery = 0}, price = 70000},
			{model = 'policejpheli', props = {modLivery = 0}, price = 50000}
		},

		lieutenant1 = {
			{model = 'helicopteropfa', props = {modLivery = 0}, price = 70000},
			{model = 'policejpheli', props = {modLivery = 0}, price = 50000}
		},

		sergeant = {
			{model = 'helicopteropfa', props = {modLivery = 0}, price = 70000},
			{model = 'policejpheli', props = {modLivery = 0}, price = 50000}
		},

		sergeant1 = {
			{model = 'helicopteropfa', props = {modLivery = 0}, price = 70000},
			{model = 'policejpheli', props = {modLivery = 0}, price = 50000}
		},

		detective = {
			{model = 'helicopteropfa', props = {modLivery = 0}, price = 70000},
			{model = 'policejpheli', props = {modLivery = 0}, price = 50000}
		},

		detective1 = {
			{model = 'helicopteropfa', props = {modLivery = 0}, price = 70000},
			{model = 'policejpheli', props = {modLivery = 0}, price = 50000}
		},

		boss = {
			{model = 'helicopteropfa', props = {modLivery = 0}, price = 70000},
			{model = 'policejpheli', props = {modLivery = 0}, price = 50000}
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
			torso_1 = 45,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 84,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	recruit1 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 92,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 84,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 84,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	officer1 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 1,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 84,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	detective = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 1,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 84,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	detective1 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 1,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},


	sergeant = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 1,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 74,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 7,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	sergeant1 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 74,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 7,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,   torso_2 = 0,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 74,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 7,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	lieutenant1 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 1,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 74,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 7,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 1,
			vest = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 123,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 74,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 7,
			pants_1 = 32,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 20,  bproof_2 = 0
		},
		female = {
			bproof_1 = 18,  bproof_2 = 0
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
	bullet_wear3 = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 3,   torso_2 = 3,
			vest = 4,
			decals_1 = 8,   decals_2 = 2,
			arms = 96,
			pants_1 = 87,   pants_2 = 4,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = 12,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
                        mask_1 = 122,
                        bproof_1 = 3,  bproof_2 = 0
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
			bproof_1 = 4,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
		}
	}
}
