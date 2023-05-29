Config                            = {}

Config.DrawDistance               = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 2500  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'


Config.EarlyRespawnTimer          = 60000 * 4  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 6 -- time til the player bleeds out

Config.EnablePlayerManagement     = false -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = true

Config.RemoveItems = {
	'suppressor',
	'clip',
	'bandage',
	'cannabis',
	'poppyresin',
	'moneywash',
	'coca_leaf',
	'sube',
	'id_card_f',
	'cigarett',
	'lighter',
	'raspberry',
	'jewels',
	'lsa',
	'lsd',
	'marijuana',
	'marijuanaEat',
	'meth',
	'methEat',
	'sulfuric_acid',
}

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoints = {
	{coords = vector3(-825.5387, -1227.5464, 6.9341), heading = 45.6742}, -- Central Los Santos  -825.5387, -1227.5464, 6.9341, 45.6742
	{coords = vector3(1836.03, 3670.99, 34.28), heading = 296.06}, -- Sandy Shores
	{coords = vector3(-247.18,6330.7,32.43), heading = 220.0} -- Paleto
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-825.5387, -1227.5464, 6.9341),
			sprite = 61,
			scale  = 0.8,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-815.0063, -1236.5564, 7.3374)   --815.0063, -1236.5564, 7.3374, 8.2822
		},

		Pharmacies = {
			vector3(-820.3915, -1242.6735, 7.3374) --820.3915, -1242.6735, 7.3374, 137.4872
		},

		Vehicles = {
			{
				Spawner = vector3(286.52, -611.76, 5.37),
				InsideShop = vector3(291.07,-608.43,43.35),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 0, g = 147, b = 255, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(291.07,-608.43,43.35), heading = 74.19, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(362.28, -592.11, 74.17),
				InsideShop = vector3(351.54, -588.0, 74.17),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 200, g = 0, b = 255, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.54, -588.0, 74.17), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = { coords = vector3(272.8, -1358.8, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
	
			{
				From = vector3(275.3, -1361, 23.5),
				To = { coords = vector3(295.8, -1446.5, 28.9), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
	
			{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
	
			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
	
			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
	
			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}
		},
	
		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
	
			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	estudiante = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100}
	},

	enfermero = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100}
	},

	interno = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100}
	},

	medico = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100},
		{ model = 'police', label = 'Smart', price = 100}
					 
	},

	especialista = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100},
		{ model = 'police', label = 'Smart', price = 100}
	},
	
	cirujano = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100},
		{ model = 'police', label = 'Smart', price = 100}
	},
	
	subjefe = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100},
		{ model = 'police', label = 'Smart', price = 100}
	},
	
	jefe = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100},
		{ model = 'police', label = 'Smart', price = 100}
    },
	
	subdirector = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100},
		{ model = 'police', label = 'Smart', price = 100}
    },

	boss = {
		{ model = 'ambulance', label = 'Ambulancia', price = 100},
		{ model = 'dodgeEMS', label = 'dodge', price = 100},
		{ model = 'motobm', label = 'Moto Vittal', price = 100},
		{ model = 'police', label = 'Smart', price = 100}
	}

}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulancia', price = 750},
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulancia', price = 750},
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulancia', price = 750},
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulancia', price = 750},
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'as350', label = 'Escuadron aereo', price = 10000 },
		{ model = 'seasparrow', label = 'Escuadron acuatico', price = 2500 }
	},

	chief_doctor = {
		{ model = 'as350', label = 'Escuadron aereo', price = 1500 },
		{ model = 'seasparrow', label = 'Escuadron acuatico', price = 30000 }
	},

	boss = {
		{ model = 'as350', label = 'Escuadron aereo', price = 10000 },
		{ model = 'seasparrow', label = 'Escuadron acuatico', price = 2500 }
	}

}
