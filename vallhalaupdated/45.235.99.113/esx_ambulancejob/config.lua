Config                            = {}

Config.DrawDistance               = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 55000  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

Config.EarlyRespawnTimer          = 60000 * 3  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 6 -- time til the player bleeds out

Config.EnablePlayerManagement     = false -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 25000

Config.RespawnPoint = { coords = vector3(299.54, -616.92, 43.45), heading = 48.5 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(296.85, -584.12, 43.13),
			sprite = 61,
			scale  = 0.8,
			color  = 2
		},

		AmbulanceActions = {
			vector3(300.86, -597.08, 42.35),
			vector3(1834.95, 3693.05, 33.50)

		},

		Pharmacies = {
			vector3(304.59, -600.4, 42.35),
			vector3(1816.03, 3677.04, 33.5)
		},

		Vehicles = {
			{
				Spawner = vector3(295.64, -605.57, 90.32),
				InsideShop = vector3(276.5275, -603.9561, 42.97876),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 215, g = 24, b = 24, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(284.82, -613.04, 43.36), heading = 29.6, radius = 4.0 },
					{ coords = vector3(271.37, -596.24, 43.07), heading = 29.6, radius = 4.0 },
					{ coords = vector3(291.67, -607.41, 43.35), heading = 29.6, radius = 6.0 }
				}
			},
			{
				Spawner = vector3(1810.79, 3680.16, 34.28),
				InsideShop = vector3(1791.14, 3680.82, 34.24),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 215, g = 24, b = 24, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(1792.13, 3680.36, 34.22), heading = 30.84, radius = 5.0 }
				}
			},
			{
				Spawner = vector3(-256.64, 6351.68, 32.34),
				InsideShop = vector3(-270.39, 6333.67, 32.43),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 215, g = 24, b = 24, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-249.36, 6344.19, 32.38), heading = 222.8, radius = 5.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(343.01, -596.98, 74.17),
				InsideShop = vector3(362.89, -1598.44, 36.95),
				Marker = { type = 34, x = 1.0, y = 1.0, z = 1.0, r = 215, g = 24, b = 24, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(350.83, -587.63, 74.17), heading = 142.7, radius = 10.0 }
				}
			},
			{
				Spawner = vector3(1839.42, 3641.39, 34.06),
				InsideShop = vector3(1834.82, 3651.72, 34.31),
				Marker = { type = 34, x = 1.0, y = 1.0, z = 1.0, r = 215, g = 24, b = 24, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(1850.49, 3633.73, 36.2), heading = 30.54, radius = 10.0 }
				}
			},
			{
				Spawner = vector3(-258.89, 6309.46, 37.56),
				InsideShop = vector3(-252.36, 6319.18, 39.66),
				Marker = { type = 34, x = 1.0, y = 1.0, z = 1.0, r = 215, g = 24, b = 24, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-252.36, 6319.18, 39.66), heading = 136.54, radius = 10.0 }
				}
			}
		},


		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 0),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 0),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 0),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 0),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 0),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	estudiante = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000}
	},

	enfermero = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000}
	},

	interno = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500}
	},

	medico = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500},
		{ model = 'police', label = 'Smart', price = 15000}
					 
	},

	especialista = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500},
		{ model = 'police', label = 'Smart', price = 15000}
	},
	
	cirujano = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500},
		{ model = 'police', label = 'Smart', price = 15000}
	},
	
	subjefe = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500},
		{ model = 'police', label = 'Smart', price = 15000}
	},
	
	jefe = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500},
		{ model = 'police', label = 'Smart', price = 15000}
    },
	
	subdirector = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500},
		{ model = 'police', label = 'Smart', price = 15000}
    },

	boss = {
		{ model = 'ambulance', label = 'Ambulancia', price = 5000},
		{ model = 'dodgeEMS', label = 'dodge', price = 10000},
		{ model = 'motobm', label = 'Moto Vittal', price = 8500},
		{ model = 'police', label = 'Smart', price = 15000}
	}

}

Config.AuthorizedHelicopters = {

	estudiante = {},

    enfermero = {},

    interno = {},

    medico = {},

    especialista = {},

    cirujano = {
		
		{ model = 'as350', label = 'Heli Vittal', price = 20000}
    },

    subjefe = {
		
		{ model = 'as350', label = 'Heli Vittal', price = 20000}
    },

    jefe = {
		
		{ model = 'as350', label = 'Heli Vittal', price = 20000}
    },

    subdirector = {
		
		{ model = 'as350', label = 'Heli Vittal', price = 20000}
    },

    boss = {
 
        { model = 'as350', label = 'Heli Vittal', price = 20000}
    }

}
