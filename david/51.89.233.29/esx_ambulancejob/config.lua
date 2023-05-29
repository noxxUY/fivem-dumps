Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 500  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders
Config.NPCJobEarnings             = {min = 200, max = 400}
Config.MinimumDistance            = 100 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destionations.

Config.Locale                     = 'fr'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 4 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 10 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 500

Config.RespawnPoint = { coords = vector3(358.79, -589.58, 28.8), heading = 247.16 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(383.04, -588.78, 28.57),
			sprite = 61,
			scale  = 1.2
		},

		AmbulanceActions = {
			vector3(338.57, -585.32, 27.79)
		},

		Pharmacies = {
			vector3(339.51, -582.32, 27.79)
		},

		Vehicles = {
			{
				Spawner = vector3(354.35, -602.75, 28.78),
				InsideShop = vector3(362.49, -590.6, 28.67),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(362.49, -590.6, 28.67), heading = 164.73, radius = 4.0 },
					{ coords = vector3(368.57, -582.13, 28.71), heading = 125.37, radius = 4.0 },
					{ coords = vector3(366.66, -592.84, 28.7), heading = 338.51, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(354.83, -579.84, 74.17),
				InsideShop = vector3(351.88, -588.02, 74.17),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.88, -588.02, 74.17), heading = 250.03, radius = 10.0 }
				}
			}
		}
	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'fa_ambulance', label = 'Ambulancia', price = 1},
		{ model = 'dodgeems', label = 'Dodge EMS/Bomberos', price = 5000},
		{ model = 'ambulance', label = 'Ambulancia bomberos', price = 1}
	},

	doctor = {
		{ model = 'fa_ambulance', label = 'Ambulancia', price = 1},
		{ model = 'dodgeems', label = 'Dodge EMS/Bomberos', price = 5000},
		{ model = 'ambulance', label = 'Ambulancia bomberos', price = 1}
	},

	chief_doctor = {
		{ model = 'fa_ambulance', label = 'Ambulancia', price = 1},
		{ model = 'dodgeems', label = 'Dodge EMS/Bomberos', price = 5000},
		{ model = 'ambulance', label = 'Ambulancia bomberos', price = 1}
	},

	boss = {
		{ model = 'fa_ambulance', label = 'Ambulancia', price = 1},
		{ model = 'dodgeems', label = 'Dodge EMS/Bomberos', price = 5000},
		{ model = 'ambulance', label = 'Ambulancia bomberos', price = 1}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'uh1calfire', label = 'Helicoptero Rescate', price = 100000 }
	},

	chief_doctor = {
		{ model = 'uh1calfire', label = 'Helicoptero Rescate', price = 100000 }
	},

	boss = {
		{ model = 'uh1calfire', label = 'Helicoptero Rescate', price = 100000 }
	}

}

Config.Uniforms = {
	[1] = { -- EMS
	  male = {
		['tshirt_1'] = 129, ['tshirt_2'] = 0,
		['torso_1'] = 250,  ['torso_2'] = 0,
		['decals_1'] = 58,  ['decals_2'] = 1,
		['arms'] = 85,
		['pants_1'] = 20,   ['pants_2'] = 0,
		['shoes_1'] = 54,   ['shoes_2'] = 0,
		['helmet_1'] = 122, ['helmet_2'] = 0,
		['chain_1'] = 126,  ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,   ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 159, ['tshirt_2'] = 0,
		['torso_1'] = 258,  ['torso_2'] = 0,
		['decals_1'] = 66,  ['decals_2'] = 1,
		['arms'] = 98,
		['pants_1'] = 23,   ['pants_2'] = 0,
		['shoes_1'] = 52,   ['shoes_2'] = 0,
		['helmet_1'] = 121, ['helmet_2'] = 0,
		['chain_1'] = 96,   ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,   ['bproof_2'] = 0
	  }
	},
	[2] = { -- BOMBEROS
	  male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 2,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 11,
		['pants_1'] = 1,   ['pants_2'] = 0,
		['shoes_1'] = 24,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 5,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 11,
		['pants_1'] = 3,   ['pants_2'] = 0,
		['shoes_1'] = 24,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  }
	}
}

Config.JobLocations = {
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67),
	vector3(362.3, -590.5, 28.67)
}
