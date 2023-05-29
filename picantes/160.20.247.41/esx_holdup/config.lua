Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 126, g = 26, b = 26, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 23    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 300 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 30.72, y = -1339.98, z = 29.5 },
		reward = math.random(70000 , 800000),
		nameOfStore = "(PFA) Supermercado Carwash",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = -1219.741, y = -916.2857, z = 11.5 },
		reward = math.random(70000 , 800000),
		nameOfStore = "(PFA) Cerveceria - Vespucci",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["tienda3x1"] = {
		position =  { x = 1126.114, y = -981.4022, z = 45.5 },
		reward = math.random(70000 , 800000),
		nameOfStore = "(PFA) Cerveceria - Mission Row",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["bar_one"] = {
		position = { x = 380.19, y = 332.14, z = 103.57 },
		reward = math.random(70000 , 800000),
		nameOfStore = "(PFA) Supermercado Banco Central",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.23 },
		reward = math.random(70000 , 800000),
		nameOfStore = "(PFA) Supermercado Grove Street",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["tiendaruta"] = {
		position =  { x = -1099.12, y = -2587.21, z = 13.93 },
		reward = math.random(70000 , 800000),
		nameOfStore = "(PFA) Supermercado Aeropuerto",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["tiendaruta2"] = {
		position = { x = -106.24, y = 6474.21, z = 31.65 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA) Mini Banco Paleto",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["tiendacampo1"] = {
		position = { x = -355.1077, y = -53.84176, z = 49.09468 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA) Fleeca A.C.A",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["tiendacampo2"] = {
		position = { x = -2957.6674804688, y = 481.45776367188, z = 15.697026252747 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA) Flecca Costa",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["tiendaruta3"] = {
		position = { x = 311.18, y = -283.22, z = 54.17 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA) Flecca Ayuntamiento",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1173.27, y = 2716.417, z = 38.05859 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA) Fleeca Sandy",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["tiendachina"] = {
		position = { x = -1220.17, y = -915.97, z = 11.33 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA)Tienda China",
		secondsRemaining = 120, -- seconds
		lastRobbed = 0
	},
	["tiendamon"] = {
		position = { x = -1211.54, y = -335.66, z = 37.78 },
		reward = math.random(300000 , 350000),
		nameOfStore = "(PFA) Facebook",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["tiendaropa1"] = {
		position = { x = -170.67, y = -296.57, z = 39.73 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA)Tienda Ropa Gucci",
		secondsRemaining = 120, -- seconds
		lastRobbed = 0
	},
	["tiendaropa2"] = {
		position = { x = -822.86, y = -1069.67, z = 11.33 },
		reward = math.random(200000 , 250000),
		nameOfStore = "(PFA)Tienda Ropa Gucci",
		secondsRemaining = 120, -- seconds
		lastRobbed = 0
	},
}
