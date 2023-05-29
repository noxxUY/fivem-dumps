Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 3000000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

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
Config.EarlyRespawnFineAmount     = 60000

Config.RespawnPoint = { coords = vector3(1168.0, -1522.6, 34.8), heading = 55.76 }
Config.RespawnPointSandy = { coords = vector3(1838.83, 3662.48, 33.97), heading = 48.5 }
Config.RespawnPaleto = { coords = vector3(-237.23, 6312.31, 31.5), heading = 48.5 }


Config.SpawnJobs = {
	['police'] = {coords = vector3(-274.79, 275.22, 89.88)},
	['prosegur'] = {coords = vector3(649.05, -8.59, 82.77)},
	['ambulance'] = {coords = vector3(1151.86, -1519.67, 34.84)},
	['gendarmerie'] = {coords = vector3(1858.19, 3676.04, 33.65)},

	
	
}

Config.Hospitals = { 

	CentralLosSantos = {

		Blip = {
			coords = vector3(1157.26, -1522.03, 34.84),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},
		AmbulanceActions = {
			vector3(1142.1, -1550.2, 34.3)
		}, 

		Pharmacies = { 
			vector3(1144.2, -1546.6, 34.3),
			vector3(1828.4, 3683.68, 33.27),
			vector3(-242.85, 6325.48, 31.43)
		},   

		Vehicles = {
			{  
				Spawner = vector3(1147.5, -1521.7, 34.8), 
				InsideShop = vector3(1147.5, -1521.7, 34.8), 
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(1161.8, -1506.7, 34.6), heading = 227.6, radius = 4.0 }

				}
			}
		}, 


		Helicopters = {
			{ 
				Spawner = vector3(1178.0, -1563.4, 39.3),
				InsideShop = vector3(1178.0, -1563.4, 39.3),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(1178.0, -1563.4, 39.3), heading = 300.65, radius = 4.0 }
				}
			}
		},

barco = {
			{   
				Spawner = vector3(-1759.44, -1048.97, 0.66),
				InsideShop = vector3(-1759.44, -1048.97, 0.66),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-1759.44, -1048.97, 0.66), heading = 300.65, radius = 4.0 }
				}
			}
		},

		FastTravels = {
			{  
				From = vector3(-2.96, 15.77, 0.96),
				To = { coords = vector3(914.07, -52.96, 78.94), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(-7.7, 4.17, 0.96),
				To = { coords = vector3(914.07, -52.96, 78.94), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}, 

			{ 
				From = vector3(-247.672, 6321.84, 28.7599),
				To = { coords = vector3(-244.22, 6327.87, 32.43), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}, 

			{
				From = vector3(-248.332, 6332.41, 31.4262),
				To = { coords = vector3(-251.14, 6319.78, 29.76), heading = 0.0 },
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
			},
            {			
			   From = vector3(136.11, -761.61, 44.75),
				To = { coords = vector3(133.69, -766.84, 242.15), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}, 
			---abogado
			 {			
			   From = vector3(-115.72, -605.76, 35.28),
				To = { coords = vector3(-139.22, -620.71, 167.82), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
             {			
			   From = vector3(-140.22, -617.37, 167.82),
				To = { coords = vector3(-114.53, -611.84, 35.28), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},			
			{
			 From = vector3(136.35, -761.43, 241.15),
				To = { coords = vector3(135.18, -767.12, 45.75), heading = 0.0 },
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
				From = vector3(-0.3, 7.0, -1.5),
				To = { coords = vector3(914.0, -52.9, 78.9), heading = 0.0 },
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

	
	ambulance = {
		--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
				{ model = 'mini', label = 'Vehiculo Mini', price = 1400},

					
	},

	doctor = {
		--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
	    { model = 'canina2', label = 'Vehiculo canina', price = 1400},
	---{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},

	chief_doctor = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
	--	{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
		{ model = 'samexz4', label = 'Vehiculo Clio', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	
	medicoclinico = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
	--	{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
		{ model = 'samexz4', label = 'Vehiculo same', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	
	medicoespecialista = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
		--{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
		{ model = 'samexz4', label = 'Vehiculo same', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	
	cirujano = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
		{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
	--	{ model = 'samexz3', label = 'Vehiculo same', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	
	
	cirujanoexperimentado = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
		{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
	--	{ model = 'samexz3', label = 'Vehiculo same', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	
	cirujanoinvestigador = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
		{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
	--	{ model = 'samexz3', label = 'Vehiculo same', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	
	instructor = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
	--	{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
		{ model = 'zendrack', label = 'Vehiculo same', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	
	director = {
--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
		--{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		---{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		--{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
		{ model = 'zendrack', label = 'Vehiculo same', price = 1400},
        --{ model = 'samexz4', label = 'Vehiculo same 2', price = 1400},
	},
	

	boss = {
	--{ model = 'sprintersame', label = 'Vehiculo Sprinter', price = 1200},
		{ model = 'sheriffx6', label = 'Vehiculo x6', price = 1400},
		{ model = 'mini', label = 'Vehiculo Mini', price = 1400},
		{ model = 'canina2', label = 'Vehiculo Todo terreno', price = 1400},
		{ model = 'zendrack', label = 'Vehiculo Jefe', price = 1400},
 		{ model = 'samexz3', label = 'Vehiculo same', price = 1400},
        { model = 'samexz4', label = 'Vehiculo same 2', price = 1400},

	}

}
Config.AuthorizedHelicopters = {

	ambulance = {},

doctor = {
		--{ model = 'samexzh', label = 'Sea Sparrow', price = 1000000 }
	},
	chief_doctor = {
	--	{ model = 'samexzh', label = 'Sea Sparrow', price = 600000 }
	},
	
	medicoclinico = {
  ---{ model = 'samexzh', label = 'Sea Sparrow', price = 600000 }
	},
	
	medicoespecialista = {
  -- { model = 'samexzh', label = 'Sea Sparrow', price = 600000 }
	},
	
	cirujano = {
--{ model = 'samexzh', label = 'Sea Sparrow', price = 600000 }
	},
	
	
	cirujanoexperimentado = {
--{ model = 'samexzh', label = 'Sea Sparrow', price = 600000 }
	},
	
	cirujanoinvestigador = {
--{ model = 'samexzh', label = 'Sea Sparrow', price = 600000 }
	},
	
	instructor = {
{ model = 'frogger', label = 'Sea Sparrow', price = 600000 }
	},
	
	director = {
{ model = 'frogger', label = 'Sea Sparrow', price = 600000 }
	},

	boss = {
		{ model = 'frogger', label = 'Nagasaki Buzzard', price = 6000000 }
	}

}

Config.Authorizedbarco = {

	ambulance = {},

doctor = {
		{ model = 'toro', label = 'Sea Sparrow', price = 1000000 }
	},
	chief_doctor = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
    medicoclinico = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
	
	medicoespecialista = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
	
	cirujano = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
	
	
	cirujanoexperimentado = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
	
	cirujanoinvestigador = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
	
	instructor = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
	
	director = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	},
	boss = {
		{ model = 'toro', label = 'Sea Sparrow', price = 600000 }
	}

}