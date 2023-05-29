Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 3
Config.GnaNumberRequired = 1
Config.TimerBeforeNewRob    = 900 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 50  -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(300000, 500000),
		nameOfStore = "24/7. (Little Seoul)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["ocean_liquor"] = {
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(400000, 600000),
		nameOfStore = "Robs Liquor. (Great Ocean Highway)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(400000, 600000),
		nameOfStore = "Robs Liquor. (El Rancho Blvd)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(400000, 700000),
		nameOfStore = "Robs Liquor. (San Andreas Avenue)",
		secondsRemaining = 120, -- seconds
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(400000, 700000),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(400000, 700000),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["facebook"] = {
		position = { x = -1052.36,  y = -232.4,  z = 44.04 },
		reward = math.random(900000, 1200000),
		nameOfStore = "Facebook",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["fabrica"] = {
		position = {x = -613.1, y = -1623.98, z = 33.01},
		nameOfStore = "Fabrica",
		reward = math.random(600000, 800000),
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["carniceria"] = {
		position = { x = 990.88,  y = -2136.13,  z = 30.22 },
		reward = math.random(600000, 800000),
		nameOfStore = "Carniceria",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["banco_lanacion"] = {
		position = { x = 230.0, y = 234.34, z = 97.12 },
		reward = math.random(1500000, 2200000),
		nameOfStore = "Banco Santander", 
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["banco_Maze"] = {
		position = { x = -1292.08,  y = -838.8,  z = 17.16 },
		reward = math.random(1500000, 2200000),
		nameOfStore = "Banco Santander", 
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["banco_ICBC"] = {
		position = { x = 1176.72, y = 2711.83, z = 38.1 },
		reward = math.random(3500000, 7200000),
		nameOfStore = "Banco Santander", 
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["banco_Patagonia"] = {
		position = { x = 255.72,  y = 225.48,  z = 101.88 },
		reward = math.random(5050000, 9000000),
		nameOfStore = "Banco Santander", 
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["banco_BBVA"] = {
		position = { x = 311.06, y = -283.19, z = 54.17 },
		reward = math.random(1500000, 2200000),
		nameOfStore = "Banco Santander",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["dior"] = {
		position = { x = -170.2,  y = -296.64,  z = 39.72 },
		reward = math.random(350000, 520000),
		nameOfStore = "Dior",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["Michael"] = {
		position = { x = -808.88,  y = 172.48,  z = 76.76 },
		reward = math.random(600000, 1000000),
		nameOfStore = "Casa Michael",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["ammu"] = {
		position = { x = -665.28,  y = -933.36,  z = 21.84 },
		reward = math.random(400000, 650000),
		nameOfStore = "Ammu Nation",
		secondsRemaining = 120, -- seconds
		lastRobbed = 0
	},
	["ammu1"] = {
		position = { x = 817.18,  y = -2162.28,  z = 29.6 },
		reward = math.random(400000, 650000),
		nameOfStore = "Ammu Nation",
		secondsRemaining = 120, -- seconds
		lastRobbed = 0
	},
	["ammu2"] = {
		position = { x = 2571.05,  y = 294.58,  z = 108.72 },
		reward = math.random(400000, 650000),
		nameOfStore = "Ammu Nation",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["ammu3"] = {
		position = { x = -3174.88,  y = 1085.0,  z = 20.84 },
		reward = math.random(400000, 650000),
		nameOfStore = "Ammu Nation",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["pampero"] = {
		position = { x = -1446.4,  y = -246.24,  z = 49.84 },
		reward = math.random(350000, 520000),
		nameOfStore = "Pampero",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["Franklin"] = {
		position = { x = -2.32,  y = 528.56,  z = 175.0 },
		reward = math.random(700000, 900000),
		nameOfStore = "Casa Franklin",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["Lester"] = {
		position = { x = 1273.4,  y = -1708.28,  z = 54.76 },
		reward = math.random(600000, 700000),
		nameOfStore = "Casa Lester",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["Mike"] = {
		position = { x = -15.92,  y = -1430.2,  z = 31.12 },
		reward = math.random(700000, 900000),
		nameOfStore = "Casa Mike",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["Floyd"] = {
		position = { x = -1153.24,  y = -1517.56,  z = 10.64 },
		reward = math.random(700000, 900000),
		nameOfStore = "Casa Floyd",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["Yate"] = {
		position = {x = -2084.52,  y = -1018.28,  z = 12.8},
		reward = math.random(1500000, 2000000),
		nameOfStore = "Yate",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0
	},
	["Casino"] = {
		position = { x = 1111.03,  y = 245.33,  z = -45.83 },
		reward = math.random(4000000, 7500000),
		nameOfStore = "Casino",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0
	},
	["Leiva_Joyas"] = {
		position = { x = -630.96,  y = -228.76,  z = 38.04 },
		reward = math.random(2000000, 3000000),
		nameOfStore = "Leiva Joyas",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	}
}

	
