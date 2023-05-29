Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.GnaNumberRequired = 3
Config.GnaNumberRequired = 1
Config.TimerBeforeNewRob    = 900 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 50  -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(300000, 500000),
		nameOfStore = "24/7. (Paleto Bay)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(300000, 500000),
		nameOfStore = "24/7. (Sandy Shores)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["bar_one"] = {
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(400000, 700000),
		nameOfStore = "Yellow Jack. (Sandy Shores)",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["polleria"] = {
		position = { x = -86.28,  y = 6236.88,  z = 31.09 },
		reward = math.random(800000, 1000000),
		nameOfStore = "Polleria",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["humane"] = {
		position = { x = 3534.87,  y = 3660.68,  z = 28.12 },
		nameOfStore = "Laboratorio Humane",
		reward = math.random(1700000, 2000000),
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["banco_Galicia"] = {
		position = { x = -2958.36,  y = 387.92,  z = 14.04 },
		reward = math.random(1500000, 2200000),
		nameOfStore = "Banco Santander", 
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["banco_pcia"] = {
		position = { x = -105.12,  y = 6476.48,  z = 31.64 },
		reward = math.random(1500000, 2200000),
		nameOfStore = "Banco Santander", 
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["ammu4"] = {
		position = {x = -1118.68,  y = 2696.68,  z = 18.56 },
		reward = math.random(900000, 1000000),
		nameOfStore = "Ammu Nation",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["ammu3"] = {
		position = {x = -3172.24,  y = 1085.04,  z = 20.84 },
		reward = math.random(900000, 1000000),
		nameOfStore = "Ammu Nation",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["casa_abandonada"] = {
		position = { x = 2447.68,  y = 4981.92,  z = 46.84 },
		reward = math.random(1500000, 2000000),
		nameOfStore = "Casa abandonada",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	},
	["Trevor"] = {
		position = { x = 1973.12,  y = 3817.84,  z = 33.44 },
		reward = math.random(500000, 700000),
		nameOfStore = "Casa Trevor",
		secondsRemaining = 320, -- seconds
		lastRobbed = 0
	}
}

	
