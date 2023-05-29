Config                      = {}
Config.Locale               = 'en'

Config.Marker               = {
	r            = 126, g = 26, b = 26, a = 100, -- red color
	x            = 1.0, y = 1.0, z = 1.5, -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 23    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance          = 23   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney       = true -- give black money? If disabled it will give cash instead

Stores                      = {
	["tienda_los_santos_1"]   = {
		position         = { x = 30.72, y = -1339.98, z = 29.5 },
		reward           = math.random(110000 , 135000),
		nameOfStore      = "Tienda Carwash",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["maze_bank"]   = {
		position         = { x = -1301.1, y = -823.1, z = 17.2 },
		reward           = math.random(1100000 , 1350000),
		nameOfStore      = "Maze Bank",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["tienda_vespucci"]   = {
		position         = { x = -1219.741, y = -916.2857, z = 11.5 },
		reward           = math.random(110000 , 135000),
		nameOfStore      = "Cerveceria Vespucci",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["tienda_comi"]   = {
		position         = { x = 1126.114, y = -981.4022, z = 45.5 },
		reward           = math.random(110000 , 135000),
		nameOfStore      = "Cerveceria Comi",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["tienda_los_santos_2"]   = {
		position         = { x = 380.19, y = 332.14, z = 103.57 },
		reward           = math.random(110000 , 135000),
		nameOfStore      = "Supermercado 24/7",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["estacion_los_santos_1"] = {
		position         = { x = 1160.67, y = -314.40, z = 69.23 },
		reward           = math.random(110000 , 135000),
		nameOfStore      = "Estacion de servicio",
		secondsRemaining = 200, -- seconds
		lastRobbed       = 0
	},
	["estacion_los_santos_2"] = {
		position         = { x = -43.40, y = -1749.20, z = 29.43 },
		reward           = math.random(110000 , 135000),
		nameOfStore      = "Estacion de servicio",
		secondsRemaining = 5, -- seconds
		lastRobbed       = 0
	},
	["aeropuerto"]            = {
		position         = { x = -1099.12, y = -2587.21, z = 13.93 },
		reward           = math.random(110000 , 135000),
		nameOfStore      = "Aeropuerto",
		secondsRemaining = 200, -- seconds
		lastRobbed       = 0
	},
	["banco_ls"]        = {
		position         = { x = -355.1077, y = -53.84176, z = 49.09468 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Fleeca A.C.A",
		secondsRemaining = 380, -- seconds
		lastRobbed       = 0
	},
	["blaine_country3"]   = {
		position         = { x = 311.18, y = -283.22, z = 54.17 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Flecca Ayuntamiento",
		secondsRemaining = 380, -- seconds
		lastRobbed       = 0
	},
	["humane"]   = {
		position         = { x = 3602.7, y = 3723.4, z = 29.7 },
		reward           = math.random(5250000 , 7000000),
		nameOfStore      = "Laboratorio Humane",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["invader"]   = {
		position         = { x = -1082.1, y = -249.7, z = 37.8 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Life Invader",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["casa_michael"]   = {
		position         = { x = -812.7956, y = 180.0264, z = 72.14575 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Casa Michael",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["banco_central"]   = {
		position         = { x = 265.2659, y = 213.5736, z = 101.6666 },
		reward           = math.random(12500000 , 15000000),
		nameOfStore      = "Banco Central",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["blaine_country4"]   = {
		position         = { x = -1211.54, y = -335.66, z = 37.78 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Fleeca-Chico de Life Invader",
		secondsRemaining = 380, -- seconds
		lastRobbed       = 0
	},
}
