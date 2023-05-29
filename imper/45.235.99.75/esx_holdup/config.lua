Config = {}

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,
	x = 1.0, y = 1.0, z = 1.5,
	DrawDistance = 15.0, Type = 1
}

Config.TimerBeforeNewRob = 1800
Config.MaxDistance = 20
Config.GiveBlackMoney = true


Stores = {
	["paleto_twentyfourseven"] = {
		type = 'normal',
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Tiendita. (Paleto Bay)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["sandyshores_twentyfoursever"] = {
		type = 'normal',
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Tiendita. (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["littleseoul_twentyfourseven"] = {
		type = 'normal',
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Tiendita. (Little Seoul)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["bar_one"] = {
		type = 'normal',
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Tiendita. (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["ocean_liquor"] = {
		type = 'normal',
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Licoreria. (Great Ocean Highway)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["rancho_liquor"] = {
		type = 'normal',
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Licoreria. (El Rancho Blvd)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["sanandreas_liquor"] = {
		type = 'normal',
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Licoreria. (San Andreas Avenue)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["grove_ltd"] = {
		type = 'normal',
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Tiendita. (Grove Street)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["mirror_ltd"] = {
		type = 'normal',
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Tiendita. (Mirror Park Boulevard)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	
	["tiendita1"] = {
		type = 'normal',
		position = { x = 30.43, y = -1339.7, z = 29.5 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Robo a tienda (Puti)",
		secondsRemaining = 200, -- seconds
		-- secondsRemaining = 15, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	
	["tiendita2"] = { 
		type = 'normal',
		position = { x = 380.94, y = 332.3, z = 103.57 },
		reward = math.random(10000000, 15000000),
		nameOfStore = "Robo a tienda (Barrio Alto)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	["flecca2"] = {
		type = 'normal',
		position = { x = -2957.9, y = 481.98, z = 15.7 },
		reward = math.random(20000000, 30000000),
		nameOfStore = "Robo a flecca ",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	}, 
	["flecca3"] = {
		type = 'normal',
		position = { x = -1211.18, y = -335.65, z = 37.78 },
		reward = math.random(20000000, 30000000),
		nameOfStore = "Robo a flecca ",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	}, 
    ["flecca4"] = {
		type = 'normal',
		position = { x = 1176.1, y = 2711.72, z = 38.09 },
		reward = math.random(20000000, 30000000),
		nameOfStore = "Robo a flecca ",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 2,
	},
	-- banque central
	["Banco_Central"] = {
		type = 'special',
		position = { x = 242.073, y = 211.268, z = 110.283 },
		reward = math.random(130000000, 220000000),
		nameOfStore = "Robo banco central",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 8,
	},
	-- lifeinvader
	["Banco_Paleto"] = {
		type = 'special',
		position = { x = -103.2, y = 6477.67, z = 31.63 },
		reward = math.random(100000000, 120000000),
		nameOfStore = "Robo banco central de  Paleto",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 6,
	},
	
	["Yate"] = {
		type = 'special',
		position = { x = -2085.74, y = -1018.01, z = 12.78 },
		reward = math.random(100000000, 120000000),
		nameOfStore = "Robo a yate",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 6,
	},
	["LifeInvades"] = {
		type = 'special',
		position = { x = -1050.54, y = -242.2, z = 44.02},
		reward = math.random(100000000, 120000000),
		nameOfStore = "Robo a invader",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 6,
	},
	-- hospital
	["Humane"] = {
		type = 'special',
		position = { x = 3537.31, y = 3660.19, z = 28.12 },
		reward = math.random(100000000, 100000000),
		nameOfStore = "Robo a Humane",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 6,
	},
	["Joyeria"] = {
		type = 'special',
		position = { x = -623.5, y = -234.49, z = 38.06 },
		reward = math.random(100000000, 150000000),
		nameOfStore = "Robo a Joyeria",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 6,
	}, 
	["Mansion MICHAEL"] = {
		type = 'special',
		position = { x = -809.3, y = 170.99, z = 76.74 },
		reward = math.random(130000000, 150000000),
		nameOfStore = "Robo a Mansion MICHAEL",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 6,
	}, 
	["Afip"] = {
		type = 'special', 
		position = { x = 124.32, y = -732.75, z = 242.15 },
		reward = math.random(150000000, 180000000),
		nameOfStore = "Robo a la AFIP",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 12,
	},
	["Almacen (Sandy)"] = {
		type = 'special', 
		position = { x = 1396.43, y = 3607.06, z = 38.94 },
		reward = math.random(30000000, 80000000),
		nameOfStore = "Robo al Almacen de sandy",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0,
		requiredCops = 6,
	}, 

	["Carniceria"] = {
		type = 'special',
		position = { x = 976.9, y = -2123.7, z = 30.4 },
		reward = math.random(150000000, 180000000),
		nameOfStore = "Robo a la Carniceria",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 12,
	},
	
	["Estacionamiento"] = {
		type = 'special', 
		position = { x = 386.4, y = -1681.3, z = 48.3},
		reward = math.random(150000000, 180000000),
		nameOfStore = "Robo al Estacionamiento",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 12,
	},
	["Fundidora"] = {
		type = 'special', 
		position = { x = 1081.0, y = -2008.5, z = 43.8},
		reward = math.random(150000000, 180000000),
		nameOfStore = "Robo a la Fundidora",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 12,
	},
	
	["Subte"] = {
		type = 'special', 
		position = { x = -1366.1, y = -481.0, z = 23.2},
		reward = math.random(150000000, 180000000),
		nameOfStore = "Robo al Subte",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0,
		requiredCops = 12,
	},

	
}
