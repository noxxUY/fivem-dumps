Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.CircleZones = {
	DrugDealer = {coords = vector3(696.47, -305.0, 59.16), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 25.0},
}
Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 2400 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(50000, 100000),
		nameOfStore = "24/7. (Paleto Bay)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='sheriff',
		necesita=3,
		distMAX = 20
	},
	["sandy_twentyfourseven"] = {
		position = { x = 2674.08, y = 3287.39, z = 55.24 },
		reward = math.random(50000, 100000),
		nameOfStore = "24/7. (Sandy)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police', 'sheriff',
		necesita=3,
		distMAX = 20
	},
	["grapeseed_twentyfourseven"] = {
		position = { x = 1706.61, y = 4919.94, z = 42.06 },
		reward = math.random(50000, 100000),
		nameOfStore = "24/7. (GrapeSeed)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police', 'sheriff',
		necesita=3,
		distMAX = 20
	},
	["casino"] = {
		position = { x = 1000.42, y = 33.76, z = 59.83 },
		reward = math.random(1500000, 2700000),
		nameOfStore = "Casino [CAJA FUERTE]",
		secondsRemaining = 1800, -- seconds
		lastRobbed = 0,
		para='police',
		blip=642,
		color = 27,
		necesita=12,
		distMAX = 100
	},---BANCOS
	["joyeria"] = {
		position =  {x=-619.67474365234, y=-229.26593017578, z=38.041748046875, h=19.842519760132},
		reward = math.random(300000, 470000),
		nameOfStore = "Joyeria",
		secondsRemaining = 1800, -- seconds
		lastRobbed = 0,
		para='police',
		blip=486,
		color = 27,
		necesita=6,
		distMAX = 25
	},
	["roboOro"] = {
		position =   {x=1087.912109375, y=-2007.1120605469, z=31.352416992188, h=297.63778686523},
		reward = math.random(100000, 270000),
		nameOfStore = "Joyeria",
		secondsRemaining = 1800, -- seconds
		lastRobbed = 0,
		para='police',
		blip=527,
		color = 5,
		necesita=5,
		distMAX = 45
	},---BANCOS
	["bancoCentral"] = {
		position =   {x=264.8835144043, y=219.78462219238, z=101.66662597656, h=99.212593078613},
		reward = math.random(550000, 800000),
		nameOfStore = "Banco Central [CONCENTRACION DE DINERO]",
		secondsRemaining = 1800, -- seconds
		lastRobbed = 0,
		para='police',
		blip=150,
		color = 27,
		necesita=8,
		distMAX = 70
	},---BANCOS
	["fleekaCentral"] = {
		position = { x = 146.79, y = -1044.7, z = 29.38},
		reward = math.random(150000, 320000),
		nameOfStore = "Fleeka Central",
		secondsRemaining = 720, -- seconds
		lastRobbed = 0,
		para='police',
		blip=763,
		color = 1,
		necesita=8,
		distMAX = 40,
nameBlip = 'Robo a fleeka'
	},
	["fleekaLifeInvader"] = {
		position = { x = -1211.62, y = -335.64, z = 37.78},
		reward = math.random(120000, 280000),
		nameOfStore = "Fleeka LifeInvader",
		secondsRemaining = 720, -- seconds
		lastRobbed = 0,
		para='police',
		blip=763,
		color = 1,
		necesita=8,
		distMAX = 40,
nameBlip = 'Robo a fleeka'
	},
	["fleekaVlone"] = {
		position = { x = -2957.77, y = 481.29, z = 15.71},
		reward = math.random(150000, 320000),
		nameOfStore = "Fleeka Pacific",
		secondsRemaining = 720, -- seconds
		lastRobbed = 0,
		para='police',
		blip=763,
		color = 1,
		necesita=8,
		distMAX = 40,
nameBlip = 'Robo a fleeka'
	},
	["fleekaPaleto"] = {
		position = { x = -104.01, y = 6477.61, z = 31.63},
		reward = math.random(150000, 320000),
		nameOfStore = "Fleeka Paleto",
		secondsRemaining = 720, -- seconds
		lastRobbed = 0,
		para='sheriff',
		blip=763,
		color = 1,
		necesita=8,
		distMAX = 40,
nameBlip = 'Robo a fleeka'
	},
	--[["fleekaSandy"] = {
		position = { x = 1176.35, y = 2711.62, z = 38.09},
		reward = math.random(150000, 320000),
		nameOfStore = "Fleeka Sandy",
		secondsRemaining = 720, -- seconds
		lastRobbed = 0,
		para='sheriff',
		blip=763,
		color = 1,
		necesita=8,
		distMAX = 40,
nameBlip = 'Robo a fleeka'
	},--]]
	["fleekaBope"] = {
		position = { x = 311.42, y = -283.21, z = 54.49},
		reward = math.random(150000, 320000),
		nameOfStore = "Fleeka Motel",
		secondsRemaining = 720, -- seconds
		lastRobbed = 0,
		para='police',
		blip=763,
		color = 1,
		necesita=8,
		distMAX = 40,
nameBlip = 'Robo a fleeka'
	},
	["fleekaMedio"] = {
		position = { x = -353.98, y = -54.08, z = 49.05}, 
		reward = math.random(150000, 350000),
		nameOfStore = "Fleeka LS Customs",
		secondsRemaining = 720, -- seconds
		lastRobbed = 0,
		para='police',
		blip=763,
		color = 1,
		necesita=8,
		distMAX = 40,
nameBlip = 'Robo a fleeka'
	},
	--BANCOS
	["casas1"] = {
		position = { x = 90.32, y = 3745.71, z = 41.13 },
		reward = math.random(3500, 5000),
		nameOfStore = "Caravana Antigua",
		secondsRemaining =460 , -- seconds
		lastRobbed = 0,
		para='sheriff',
		blip =467,
		color =26,
		scale=1.52,
		necesita=1,
		distMAX = 20
	},
	["casas2"] = {
		position = { x = 2329.42, y = 2570.01, z = 46.73 },
		reward = math.random(3500, 9000),
		nameOfStore = "Caravana Laboratorio",
		secondsRemaining =460 , -- seconds
		lastRobbed = 0,
		para='police',
		blip =467,
		color =26,
		scale=1.52,
		necesita=1,
		distMAX = 20
	},
	["casas3"] = {
		position = { x = 1539.32, y = 1702.21, z = 109.63 },
		reward = math.random(3500, 3800),
		nameOfStore = "Caravana Pastos",
		secondsRemaining =460 , -- seconds
		lastRobbed = 0,
		para='police',
		blip =467,
		color =26,
		scale=1.52,
		necesita=1,
		distMAX = 20
	},
	["casas4"] = {
		position = { x = 2444.47, y = 4976.631, z =  51.56 },
		reward = math.random(3500, 3800),
		nameOfStore = "Caravana Pastos",
		secondsRemaining =460 , -- seconds
		lastRobbed = 0,
		para='sheriff',
		blip =467,
		color =26,
		scale=1.52,
		necesita=1,
		distMAX = 20
	},
	["LaboratoriosHumane"] = {
		position = { x = 3537.72, y = 3667.57, z = 28.13 },
		reward = math.random(370000, 462890),
		nameOfStore = "Laboratorios Humane",
		secondsRemaining = 2400, -- seconds
		lastRobbed = 0,
		para='police',
		necesita=14,
		distMAX = 100
	},
	["sandyshores_twentyfourseven"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(50000, 100000),
		nameOfStore = "24/7. (Sandy Shores)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='sheriff',
		necesita=3,
		distMAX = 20
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(50000, 100000),
		nameOfStore = "24/7. (Little Seoul)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police',
		necesita=3,
		distMAX = 20
	},
	--[[["bar_one"] = {
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(50000, 100000),
		nameOfStore = "Yellow Jack. (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},--]]
	["ocean_liquor"] = {
		position = { x = -2957.33, y = 481.21, z = 15.71 },
		reward = math.random(50000, 100000),
		nameOfStore = "Licorería. (Great Ocean Highway)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police',
		necesita=3,
		distMAX = 20
	},["badulake_sandy"] = {
		position = { x = 1395.03, y = 3613.01, z = 34.71 },
		reward = math.random(50000, 100000),
		nameOfStore = "Badulake. (Sandy)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='sheriff',
		necesita=3,
		distMAX = 20
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(50000, 100000),
		nameOfStore = "Licorería. (El Rancho Blvd)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police',
		necesita=3,
		distMAX = 20
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(50000, 100000),
		nameOfStore = "Licorería. (San Andreas Avenue)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police',
		necesita=3,
		distMAX = 20
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(50000, 100000),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police',
		necesita=3,
		distMAX = 20
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(50000, 100000),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		para='police',
		necesita=3,
		distMAX = 20
	}
}
