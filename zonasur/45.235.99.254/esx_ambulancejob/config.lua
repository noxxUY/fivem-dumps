Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 27, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 1000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

Config.EarlyRespawnTimer          = 50000 * 5 -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 10000

Config.RespawnPoint1 = {coords = vector3(341.0465,-1395.09,32.509), heading=49.003974914551} --ciudad
Config.RespawnPoint2 = {coords = vector3(1831.73, 3681.78, 34.27), heading = 202.62} --sandy
Config.RespawnPoint3 = {coords = vector3(-242.59, 6326.01, 32.43), heading = 222.09} --paleto
Config.RespawnPointPolice = {coords = vector3(452.1424,-992.114,30.689), heading = 352.44412231445} --spawn solo para PDLC

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-826.689,-1219.54,6.9341),
			sprite = 61,
			scale  = 0.9,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-822.568,-1235.45,7.3374 - 0.95)
		},

		Pharmacies = {
			vector3(-819.823,-1243.13,7.3374 - 0.95)
		},
		
		BossActions = {
			vector3(-790.757,-1245.22,7.3374 - 0.95)
		},

		Vehicles = {
			{
				Spawner = vector3(-837.279,-1240.18,6.9341),
				Marker = {type = 36, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(-840.487,-1230.81,6.6623), heading = 318.39678955078, radius = 4.0}
				}
			}
		},
		
		VehiclesDelete = {
			{
				Spawner = vector3(-840.487,-1230.81,6.6623 - 0.95),
				Marker = {type = 27, x = 3.5, y = 3.5, z = 1.5, r = 255, g = 0, b = 0, a = 100, rotate = false},
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-778.506,-1203.57,51.147),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(-791.361,-1191.23,53.027), heading = 234.40985107422, radius = 10.0}
				}
			}
		},
		
		HelicoptersDelete = {
			{
				Name = 'Santos',
				Spawner = vector3(-791.361,-1191.23,53.027 - 0.95),
				Marker = {type = 27, x = 10.0, y = 10.0, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = false},
			}
		},

		FastTravels = {

		},

		FastTravelsPrompt = {		
			{
				From = vector3(-773.885,-1207.17,51.147 - 0.95),
				To = {coords = vector3(-793.764,-1245.89,7.3374), heading = 229.71594238281},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_top')
			},
			
			{
				From = vector3(-793.764,-1245.89,7.3374 - 0.95),
				To = {coords = vector3(-773.885,-1207.17,51.147), heading = 344.19525146484},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_bottom')
			},
			--Subir Banco Central
			{
				From = vector3(260.5,203.59,109.34),
				To = {coords = vector3(249.78,223.4,151.63), heading = 298.23},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_top')
			},
			
			{
				From = vector3(249.78,223.4,150.72),
				To = {coords = vector3(260.5,203.59,110.29), heading = 329.87},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_bottom')
			},
			--Maze Bank
			{
				From = vector3(-79.4051, -795.918, 44.227 - 0.95),
				To = {coords = vector3(-77.8976, -830.128, 243.38), heading = 112.99},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_enter')
			},
			
			{
				From = vector3(-77.8976, -830.128, 243.38 - 0.95),
				To = {coords = vector3(-79.4051, -795.918, 44.227), heading = 115.54},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_exit')
			},
			--Maze Bank Terraza
			{
				From = vector3(-62.9640, -814.296, 243.38 - 0.95),
				To = {coords = vector3(-66.9605, -821.890, 321.28), heading = 112.99},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_enter')
			},
			
			{
				From = vector3(-66.9605, -821.890, 321.28 - 0.95),
				To = {coords = vector3(-62.9640, -814.296, 243.38), heading = 115.54},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_exit')
			},
			--Yate
			{
				From = vector3(-2071.04, -1028.87, 4.89),
				To = {coords = vector3(-2071.31,-1018.61,3.05), heading = 247.51},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_enter')
			},
			
			{
				From = vector3(-2071.31,-1018.61,3.05 - 0.95),
				To = {coords = vector3(-2071.04, -1028.87, 4.89), heading = 160.48},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_exit')
			},
			--Casino PFA
			{
				From = vector3(978.2333, 18.91857, 80.990 - 0.95),
				To = {coords = vector3(1139.424, 234.6194, -50.44), heading = 41.1},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_enter')
			},
			
			{
				From = vector3(1139.424, 234.6194, -50.44 - 0.95),
				To = {coords = vector3(978.2333, 18.91857, 80.990), heading = 239.98},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_exit')
			},
			{
				From = vector3(959.6386, 32.31185, 120.22 - 0.95),
				To = {coords = vector3(1107.146, 243.1130, -45.84), heading = 263.24},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_enter')
			},			
			{
				From = vector3(1107.146, 243.1130, -45.84 - 0.95),
				To = {coords = vector3(959.6386, 32.31185, 120.22), heading = 147.39},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_exit')
			},
			--MATI PENTHOUSE -305.041,-720.974,28.028,160.10729980469
			{
				From = vector3(-305.041,-720.974,28.028 - 0.95),
				To = {coords = vector3(-288.243,-722.663,125.47), heading = 251.42900085449},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_enter')
			},			
			{
				From = vector3(-288.243,-722.663,125.47 - 0.95),
				To = {coords = vector3(-305.041,-720.974,28.028), heading = 160.10729980469},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel_exit')
			},
		}

	},
	
	Sandy = {

		Blip = {
			coords = vector3(1826.6, 3686.62, 34.27),
			sprite = 61,
			scale  = 0.9,
			color  = 2
		},

		AmbulanceActions = {
			vector3(1834.73, 3690.26, 33.27)
		},

		Pharmacies = {
			vector3(1836.05, 3691.46, 33.27)
		},
		
		BossActions = {
			vector3(0, 0, 0)
		},

		Vehicles = {
			{
				Spawner = vector3(1830.97, 3693.3, 34.22),
				Marker = {type = 36, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(1839.35, 3700.79, 33.7), heading = 301.05, radius = 4.0}
				}
			}
		},
		
		VehiclesDelete = {
			{
				Spawner = vector3(1826.09, 3692.85, 33.23),
				Marker = {type = 27, x = 3.5, y = 3.5, z = 1.5, r = 255, g = 0, b = 0, a = 100, rotate = false},
			}
		},
		
		Helicopters = {
			{
				Spawner = vector3(1841.64, 3649.54, 34.25),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(1847.08, 3638.11, 36.22), heading = 30.19, radius = 10.0}
				}
			}
		},
		
		HelicoptersDelete = {
			{
				Name = 'Sandy',
				Spawner = vector3(1846.34, 3639.26, 34.89),
				Marker = {type = 27, x = 10.0, y = 10.0, z = 1.5, r = 255, g = 0, b = 0, a = 100, rotate = false},
			}
		},

		FastTravels = {

		},

		FastTravelsPrompt = {		
			
		}

	},
	
	Paleto = {

		Blip = {
			coords = vector3(-242.85, 6325.67, 32.43),
			sprite = 61,
			scale  = 0.9,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-260.33, 6317.89, 31.43)
		},

		Pharmacies = {
			vector3(-251.7, 6312.85, 31.43)
		},
		
		BossActions = {
			vector3(0, 0, 0)
		},

		Vehicles = {
			{
				Spawner = vector3(-262.41, 6309.34, 32.42),
				Marker = {type = 36, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(-265.71, 6307.5, 32.15), heading = 223.85, radius = 4.0}
				}
			}
		},
		
		VehiclesDelete = {
			{
				Spawner = vector3(-239.8, 6334.52, 31.5),
				Marker = {type = 27, x = 3.5, y = 3.5, z = 1.5, r = 255, g = 0, b = 0, a = 100, rotate = false},
				SpawnPoints = {
					{coords = vector3(328.71, -556.5, 27.72), heading = 340.6, radius = 4.0}
				}
			}
		},

		Helicopters = {
			{		
				Spawner = vector3(-260.32, 6311.13, 37.55),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(-251.17,6320.67,40.05), heading = 135.83, radius = 10.0}
				}	
			}
		},
		
		HelicoptersDelete = {
			{
				Name = 'Paleto',
				Spawner = vector3(-252.41,6319.0,38.67),
				Marker = {type = 27, x = 10.0, y = 10.0, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = false},
			}	
		},

		FastTravels = {

		},

		FastTravelsPrompt = {		
			
		}

	}
}


Config.AuthorizedVehicles = {

	{
		model = 'ambulance',
		label = 'Ambulancia'
	},
	{
		model = 'ghispo2',
		label = 'Auto'
	},
	{
		model = 'rangerems',
		label = 'Ranger'
	},
}

Config.AuthorizedHelicopters = {

	{
		model = 'polmav',
		label = 'HELICOPTERO'
	}
}


Config.Uniforms = {
	ambulance = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 23,
			['arms'] = 85,
			['bags_1'] = 21,    ['bags_2'] = 10,
			['pants_1'] = 86,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 6,
			['helmet_1'] = 122,  ['helmet_2'] = 1,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 126,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 212,   ['torso_2'] = 23,
			['arms'] = 109,
			['bags_1'] = 21,    ['bags_2'] = 10,
			['pants_1'] = 89,   ['pants_2'] = 0,
			['shoes_1'] = 81,   ['shoes_2'] = 6,
			['helmet_1'] = 121,  ['helmet_2'] = 1,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		}
	},
	doctor = {
		male = {
            ['tshirt_1'] =  31,  ['tshirt_2'] = 0,
            ['torso_1'] =  9,    ['torso_2'] = 0,
            ['decals_1'] = 0,    ['decals_2'] = 0,
            ['arms'] = 88,
            ['pants_1'] = 28,    ['pants_2'] = 0,
            ['shoes_1'] = 8,     ['shoes_2'] = 0,
            ['helmet_1'] = -1,    ['helmet_2'] = 0, 
            ['chain_1'] = 126,   ['chain_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0, 
			['bag_1'] = 21,    ['bag_2'] = 10, 
		},
		female = {
            ['tshirt_1'] = 38,   ['tshirt_2'] = 0, 
            ['torso_1'] = 9,     ['torso_2'] = 0,
            ['decals_1'] = 0,    ['decals_0'] = 0,
            ['arms'] = 101,
            ['pants_1'] = 6,     ['pants_2'] = 0,
            ['shoes_1'] = 50,    ['shoes_2'] = 1,
            ['helmet_1'] = -1,    ['helmet_2'] = 0,
            ['chain_1'] = 96,    ['chain_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
            ['bag_1'] = 21,    ['bag_2'] = 10, 
		}
	},
	psiquiatra = {
		male = {
            ['tshirt_1'] =  15,  ['tshirt_2'] = 0,
            ['torso_1'] =  349,  ['torso_2'] = 9, 
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 88,
            ['pants_1'] = 28,   ['pants_2'] = 0,
            ['shoes_1'] = 10,    ['shoes_2'] = 0,
            ['helmet_1'] = -1,   ['helmet_2'] = 0, 
            ['chain_1'] = 126,   ['chain_2'] = 0,
            ['ears_1'] = -1,    ['ears_2'] = 0,
            ['mask_1'] = -1,    ['mask_2'] = 0, 
            ['bag_1'] = 21,    ['bag_2'] = 10, 
		},
		female = {
            ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 367,    ['torso_2'] = 9,
            ['decals_1'] = 0,   ['decals_0'] = 0,
            ['arms'] = 101,
            ['pants_1'] = 6,    ['pants_2'] = 0,
            ['shoes_1'] = 27,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,   ['helmet_2'] = 0,
            ['chain_1'] = 96,   ['chain_2'] = 0, 
            ['ears_1'] = -1,    ['ears_2'] = 0,
            ['mask_1'] = -1,    ['mask_2'] = 0,
            ['bag_1'] = 21,    ['bag_2'] = 10, 
		}
	},
	chief_doctor = {
		male = {
            ['tshirt_1'] =  15,  ['tshirt_2'] = 0,
            ['torso_1'] =  349,  ['torso_2'] = 7, 
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 88,
            ['pants_1'] = 28,   ['pants_2'] = 0,
            ['shoes_1'] = 10,    ['shoes_2'] = 0,
            ['helmet_1'] = -1,   ['helmet_2'] = 0, 
            ['chain_1'] = 126,   ['chain_2'] = 0,
            ['ears_1'] = -1,    ['ears_2'] = 0,
            ['mask_1'] = -1,    ['mask_2'] = 0, 
            ['bag_1'] = 21,    ['bag_2'] = 10,
		},
		female = {
            ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 367,    ['torso_2'] = 7,
            ['decals_1'] = 0,   ['decals_0'] = 0,
            ['arms'] = 101, 
            ['pants_1'] = 6,    ['pants_2'] = 0,
            ['shoes_1'] = 27,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,   ['helmet_2'] = 0,
            ['chain_1'] = 96,   ['chain_2'] = 0, 
            ['ears_1'] = -1,    ['ears_2'] = 0,
            ['mask_1'] = -1,    ['mask_2'] = 0,
            ['bag_1'] = 21,    ['bag_2'] = 10, 
		}
	},
	instructor = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 5,
			['torso_1'] = 9,   ['torso_2'] = 0,
			['arms'] = 1,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 8,   ['shoes_2'] = 0,
			--['helmet_1'] = 122,  ['helmet_2'] = 1,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 126,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		},
		female = {
			['tshirt_1'] = 0,  ['tshirt_2'] = 3,
			['torso_1'] = 9,   ['torso_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 6,   ['pants_2'] = 0,
			['shoes_1'] = 13,   ['shoes_2'] = 0,
			--['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		}
	},
	subboss = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 6,
			['torso_1'] = 9,   ['torso_2'] = 0,
			['arms'] = 1,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 8,   ['shoes_2'] = 0,
			--['helmet_1'] = 122,  ['helmet_2'] = 1,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 126,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		},
		female = {
			['tshirt_1'] = 0,  ['tshirt_2'] = 4,
			['torso_1'] = 9,   ['torso_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 6,   ['pants_2'] = 0,
			['shoes_1'] = 13,   ['shoes_2'] = 0,
			--['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		}
	},
	boss = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 13,
			['torso_1'] = 9,   ['torso_2'] = 0,
			['arms'] = 1,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 8,   ['shoes_2'] = 0,
			--['helmet_1'] = 122,  ['helmet_2'] = 1,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 126,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		},
		female = {
			['tshirt_1'] = 0,  ['tshirt_2'] = 5,
			['torso_1'] = 9,   ['torso_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 6,   ['pants_2'] = 0,
			['shoes_1'] = 13,   ['shoes_2'] = 0,
			--['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
		}
	}
}