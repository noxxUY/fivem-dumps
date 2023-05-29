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
			Coords  = vector3(829.2629, -1290.0602, 28.2487),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(852.8845, -1301.9177, 31.7433)
		},

		Armories = {
			vector3(847.1594, -1305.2096, 28.2332)
		},

		Vehicles = {
			{
				Spawner = vector3(843.0710, -1312.9135, 26.2584),
				InsideShop = vector3(849.9689, -1351.6375, 26.0888),
				SpawnPoints = {
					{coords = vector3(864.6528, -1377.0477, 26.1300), heading = 42.5230, radius = 6.0},
					{coords = vector3(859.1387, -1387.7561, 26.1548), heading = 34.7453, radius = 6.0},
					{coords = vector3(851.0008, -1403.5848, 26.1255), heading = 34.4249, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(838.1691, -1374.4100, 26.3062),
				InsideShop = vector3(830.5471, -1367.3728, 26.1346),
				SpawnPoints = {
					{coords = vector3(830.5471, -1367.3728, 26.1346), heading = 280.2224, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(829.9694, -1295.5970, 28.2332)
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
             {model = 'polgs350', price = 100000},
             {model = 'chevpol', price = 50000}
		},

		officer = {
            {model = 'polgs350', price = 100000},
            {model = 'chevpol', price = 50000}
		},

		sergeant = {
			{model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
            {model = 'chevpol', price = 50000},
			{model = 'blindado2', price = 200000}
		},

		lieutenant = {
            {model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
            {model = 'chevpol', price = 50000},
			{model = 'blindado2', price = 200000}
		},

		lieutenant2 = {
            {model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
            {model = 'autosecreto', price = 75000},
            {model = 'polgt17', price = 350000},
            {model = 'chevpol', price = 50000},
			{model = 'blindado2', price = 200000},
            {model = 'q7pfa', price = 120000},
            {model = 'geof', price = 300000},
            {model = 'cgeof', price = 120000}
		},

		lieutenant3 = {
            {model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 50000},
            {model = 'camionetapfa', price = 75000},
            {model = 'autosecreto', price = 75000},
            {model = 'polgt17', price = 350000},
            {model = 'chevpol', price = 50000},
			{model = 'blindado2', price = 200000},
            {model = 'geof', price = 300000},
            {model = 'q7pfa', price = 120000},
            {model = 'cgeof', price = 120000}
		},

		lieutenant4 = {
			{model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
            {model = 'autosecreto', price = 75000},
            {model = 'carpol', price = 50000},
            {model = 'polgt17', price = 350000},
            {model = 'chevpol', price = 50000},
            {model = 'polraptor', price = 150000},
			{model = 'blindado2', price = 200000},
            {model = 'geof', price = 300000},
            {model = 'cgeof', price = 120000},
            {model = 'q7pfa', price = 120000},
            {model = 'pol718', price = 400000}
		},

		lieutenant5 = {
			{model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
			{model = 'carpol', price = 250000},
            {model = 'polgt17', price = 350000},
            {model = 'autosecreto', price = 75000},
            {model = 'chevpol', price = 50000},
            {model = 'polraptor', price = 150000},
			{model = 'blindado2', price = 200000},
            {model = 'geof', price = 300000},
            {model = 'cgeof', price = 120000},
            {model = 'q7pfa', price = 120000},
            {model = 'pol718', price = 400000},
            {model = 'g63amg6x6cop', price = 400000},
			
			 
		},

		lieutenant6 = {
			{model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
			{model = 'carpol', price = 250000},
            {model = 'polgt17', price = 350000},
            {model = 'autosecreto', price = 75000},
            {model = 'chevpol', price = 50000},
            {model = 'polraptor', price = 150000},
            {model = 'geof', price = 300000},
			{model = 'blindado2', price = 200000},
            {model = 'cgeof', price = 120000},
            {model = 'q7pfa', price = 120000},
            {model = 'pol718', price = 400000},
            {model = 'g63amg6x6cop', price = 400000},
		},

		lieutenant7 = {
			{model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
			{model = 'carpol', price = 250000},
            {model = 'polgt17', price = 350000},
            {model = 'autosecreto', price = 75000},
            {model = 'chevpol', price = 50000},
            {model = 'polraptor', price = 150000},
			{model = 'blindado2', price = 200000},
            {model = 'geof', price = 300000},
            {model = 'cgeof', price = 120000},
            {model = 'q7pfa', price = 120000},
            {model = 'pol718', price = 400000},
            {model = 'g63amg6x6cop', price = 400000},
		},

		boss = {
			{model = 'polgs350', price = 100000},
            {model = 'motopfa', price = 25000},
            {model = 'camionetapfa', price = 75000},
			{model = 'carpol', price = 250000},
            {model = 'polgt17', price = 350000},
            {model = 'autosecreto', price = 75000},
            {model = 'chevpol', price = 50000},
            {model = 'polraptor', price = 150000},
			{model = 'blindado2', price = 200000},
            {model = 'geof', price = 300000},
            {model = 'cgeof', price = 120000},
            {model = 'q7pfa', price = 120000},
            {model = 'pol718', price = 400000},
            {model = 'g63amg6x6cop', price = 400000},
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
	recruit = { -- Cadete
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 63,   helmet_2 = 9,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	officer = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 106,   helmet_2 = 22,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 106,   helmet_2 = 21,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant = { -- Oficial 2
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 1,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant2 = { -- sargento 1
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 4,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant3 = { -- sargento 2
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 4,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant4 = { -- Teniente
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 0,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant5 = {
		male = { -- Capitan
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 3,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant6 = { -- mayor
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 5,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	lieutenant7 = { -- coronel
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 2,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 220,    torso_2 = 24,
			decals_1 = 0,    decals_2 = 0,
			arms = 18,
			pants_1 = 59,   pants_2 = 9,
			shoes_1 = 24,    shoes_2 = 0,
			helmet_1 = 28,   helmet_2 = 2,
			chain_1 = 0,     chain_2 = 0,
			ears_1 = 0,      ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 266,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 30,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 12,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	conjunto_nuevo = {
		male = {
			tshirt_1 = 15, tshirt_2 = 0,
			torso_1 = 111,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 172,
			pants_1 = 130,  pants_2 = 1,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = 105,  helmet_2 = 20,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
			glasses_1 = 45,  glasses_2 = 0,
            mask_1 = 194,  mask_2 = 7
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
			bproof_1 = 12,  bproof_2 = 1
		},
		female = {
			bproof_1 = 2,  bproof_2 = 0
		}
	}
}
