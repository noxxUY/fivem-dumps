Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.TimerBeforeNewRob    = 600 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["lifeinvader"] = {
		position = vector3(-1052.1, -232.35, 44.02),
		reward = 3825150,
		nameOfStore = "Lifeinvader",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 2,
		paramafias = false,
		job = "police",
		required = 6,
		lastRobbed = 0
	},
	["bancocentral"] = {
		position = vector3(265.4218, 213.5918, 100.5835),
		reward = 10350120,
		nameOfStore = "Banco Central",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 2,
		paramafias = true,
		job = "police",
		required = 10,
		lastRobbed = 0
	},
	["Casa Michael"] = {
		position = vector3(-810.7726, 179.7631, 72.1531),
		reward = 3345621,
		nameOfStore = "Casa Michael",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 2,
		paramafias = false,
		job = "police",
		required = 6,
		lastRobbed = 0
	},
	["Joyeria"] = {
		position = vector3(-631.3013, -230.0546, 37.1603),
		reward = 3252878,
		nameOfStore = "Joyeria",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 2,
		paramafias = false,
		job = "police",
		required = 4,
		lastRobbed = 0
	},
	["Humane"] = {
		position = vector3(3589.3337, 3686.7637, 26.6215),
		reward = 8456741,
		nameOfStore = "Humane",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 4,
		paramafias = true,
		job = "prosegur",
		required = 6,
		lastRobbed = 0
	},
	["Estadio Maze Bank"] = {
		position = vector3(-235.5120, -2003.1099, 23.7854),
		reward = math.random(6000000, 10000000),
		nameOfStore = "Estadio Maze Bank",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 3,
		paramafias = false,
		job = "police",
		required = 6,
		lastRobbed = 0
	},
	--[[
	["Polleria"] = {
		position = vector3(-68.1653, 6253.7715, 30.2902),
		reward = math.random(1500000, 2000000),
		nameOfStore = "Polleria",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 1200, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 4,
		paramafias = false,
		job = "fbi",
		required = 6,
		lastRobbed = 0
	}, ]]
	["Rancho"] = {
		position = vector3(2455.2603, 4979.9775, 45.8224),
		reward = 4125852,
		nameOfStore = "Rancho",
		CatRobo = "Robo Grado 1",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 1,
		paramafias = false,
		job = "prosegur",
		required = 5,
		lastRobbed = 0
	},
	["Fleeca 584"] = {
		position = vector3(310.5022, -282.9229, 52.3745),
		reward = 6215168,
		nameOfStore = "Fleeca 584",
		CatRobo = "Robo Grado 1",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 1,
		paramafias = false,
		job = "police",
		required = 6,
		lastRobbed = 0
	},
	["Fleeca 3019"] = {
		position = vector3(-103.4326, 6477.7236, 30.6212),
		reward = 6215168,
		nameOfStore = "Fleeca 584",
		CatRobo = "Robo Grado 1",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 1,
		paramafias = false,
		job = "prosegur",
		required = 6,
		lastRobbed = 0
	},
	["Fleeca 529"] = {
		position = vector3(-355.4503, -53.5577, 48.0444),
		reward = 6215168,
		nameOfStore = "Fleeca 529",
		CatRobo = "Robo Grado 1",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 1,
		paramafias = false,
		job = "police",
		required = 6,
		lastRobbed = 0
	},
	["Fleeca 814"] = {
		position = vector3(-2957.3779, 480.3854, 14.7068),
		reward = 6215168,
		nameOfStore = "Fleeca 814",
		CatRobo = "Robo Grado 1",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 1,
		paramafias = false,
		job = "militar",
		required = 1,
		lastRobbed = 0
	},
	["Fleeca 656"] = {
		position = vector3(-1207.4967, -336.6429, 36.7593),
		reward = 6215168,
		nameOfStore = "Fleeca 656",
		CatRobo = "Robo Grado 1",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 1,
		paramafias = false,
		job = "police",
		required = 6,
		lastRobbed = 0
	},
	["Fleeca 940"] = {
		position = vector3(1172.9893, 2714.5193, 36.3663),
		reward = 6215168,
		nameOfStore = "Fleeca 940",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 1,
		paramafias = false,
		job = "prosegur",
		required = 4,
		lastRobbed = 0
	},
	["MazeBank 323"] = {
		position = vector3(-1312.2954, -821.6025, 16.1483),
		reward = 5415168,
		nameOfStore = "MazeBank 323",
		CatRobo = "Robo Grado 2",
		secondsRemaining = 300, -- seconds
		blip = 567, 
		bcolor = 5,
		chalecosRobo = 2,
		paramafias = false,
		job = "militar",
		required = 6,
		lastRobbed = 0
	},
	
------
-- Robos Normales
------

	
	["paleto_twentyfourseven"] = {
		position = vector3(1736.32, 6419.47, 34.13),
		reward = 256987,
		nameOfStore = "24/7. (3030) ",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "prosegur",
		required = 2,
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = vector3(1961.24, 3749.46, 32.34),
		reward = 256987,
		nameOfStore = "24/7. (Sandy Shores)",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "prosegur",
		required = 2,
		lastRobbed = 0
	},
	--[[
	["littleseoul_twentyfourseven"] = {
		position = vector3(-709.17, -904.21, 18.31),
		reward = math.random(15000, 35000),
		nameOfStore = "24/7. (Little Seoul)",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		job = "police",
		required = 2,
		lastRobbed = 0
	}, ]]
	["bar_one"] = {
		position = vector3(1990.57, 3044.95, 47.21),
		reward = 256987,
		nameOfStore = "Yellow Jack. (Sandy Shores)",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "prosegur",
		required = 2,
		lastRobbed = 0
	},
	["ocean_liquor"] = {
		position = vector3(-2959.33, 388.21, 14.00),
		reward = 256987,
		nameOfStore = "Robs Liquor. (Great Ocean Highway)",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["rancho_liquor"] = {
		position = vector3(1126.80, -980.40, 45.41),
		reward = 256987,
		nameOfStore = "Robs Liquor. (El Rancho Blvd)",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = vector3(-1219.85, -916.27, 11.32),
		reward = 256987,
		nameOfStore = "Robs Liquor. (San Andreas Avenue)",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	--[[
	["grove_ltd"] = {
		position = vector3(-43.40, -1749.20, 29.42),
		reward = math.random(15000, 35000),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	}, ]]
	["mirror_ltd"] = {
		position = vector3(1160.67, -314.40, 68.30),
		reward = 256987,
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["calle_817"] = {
		position = vector3(-1828.07, 799.76, 137.26),
		reward = 256987,
		nameOfStore = "Tienda 24/7 CALLE 817",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["calle_574"] = {
		position = vector3(380.36, 331.55, 102.67),
		reward = 256987,
		nameOfStore = "Tienda 24/7 CALLE 574",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	
	
	
	["ammu_gc"] = {
		position = vector3(19.8055, -1104.0396, 27.8971),
		reward = 382063,
		nameOfStore = "Ammu GC",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 2,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	
	["ammu_60"] = {
		position = vector3(819.49, -2155.92, 28.62),
		reward = 382063,
		nameOfStore = "Ammunation calle 9275",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["Tienda 9066"] = {
		position = vector3(28.37, -1340.01, 28.6),
		reward = 256987,
		nameOfStore = "Tienda 9066",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["Tienda 635"] = {
		position = vector3(-1483.1212, -376.1176, 39.1634),
		reward = 256987,
		nameOfStore = "Tienda 635",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["Tienda 803"] = {
		position = vector3(-3046.7529, 583.4916, 6.9089),
		reward = 256987,
		nameOfStore = "Tienda 803",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 0,
		paramafias = false,
		job = "police",
		required = 2,
		lastRobbed = 0
	},
	["Tienda 402"] = {
		position = vector3(2549.921, 386.611, 108.6088),
		reward = 256987,
		nameOfStore = "Tienda 402",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 2,
		paramafias = false,
		job = "prosegur",
		required = 2,
		lastRobbed = 0
	},
	["Tienda 2013"] = {
		position = vector3(1703.703, 4919.525, 42.052),
		reward = 256987,
		nameOfStore = "Tienda 2013",
		CatRobo = "Robos Normales",
		secondsRemaining = 300, -- seconds
		blip = 110, 
		bcolor = 2,
		chalecosRobo = 2,
		paramafias = false,
		job = "prosegur",
		required = 2,
		lastRobbed = 0
	}
	

}

exports('GetStores',function() -- these exports don't need to be refered in __resource.lua (defined in the global scope)
    return Stores
end)