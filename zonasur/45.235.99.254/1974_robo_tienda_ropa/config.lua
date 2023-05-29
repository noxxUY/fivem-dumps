Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 3600 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary

Stores = {
	["Tienda1"] = {
		position = { x=71.66945, y=-1391.29, z=29.376 },
		nameOfStore = "Tienda Strawberry",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police'
	},
	["Tienda2"] = {
		position = { x=-709.211, y=-151.321, z=37.415 },
		nameOfStore = "Rocksford Hills",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police'
	},
	["Tienda3"] = {
		position = { x=-165.285, y=-303.453, z=39.733 },
		nameOfStore = "Burton",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police'
	},
	["Tienda4"] = {
		position = { x=429.0895, y=-807.562, z=29.491 },
		nameOfStore = "Textile City",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["Tienda5"] = {
		position = { x=-823.034, y=-1069.89, z=11.328 },
		nameOfStore = "Vespucci Canals",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police'
	},
	["Tienda6"] = {
		position = { x=-1448.58, y=-237.733, z=49.813 },
		nameOfStore = "Morningwood",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["Tienda7"] = {
		position = { x=6.243885, y=6508.749, z=31.877 },
		nameOfStore = "Paleto Bay",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police2'
	},
	["Tienda8"] = {
		position = { x=127.0344, y=-224.184, z=54.557 },
		nameOfStore = "Alta",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["Tienda9"] = {
		position = { x=1697.697, y=4821.866, z=42.063 },
		nameOfStore = "Grapeseed",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'gendarme'
	},
	["Tienda10"] = {
		position = { x=613.0227, y=2762.683, z=42.088 },
		nameOfStore = "Harmony",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'gendarme'
	},
	["Tienda11"] = {
		position = { x=1198.006, y=2713.812, z=38.222 },
		nameOfStore = "Grand Senora Desert",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'gendarme'
	},
	["Tienda12"] = {
		position = { x=-1193.94, y=-766.946, z=17.316 },
		nameOfStore = "Del Perro",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police'
	},
	["Tienda13"] = {
		position = { x=-3169.41, y=1043.220, z=20.863 },
		nameOfStore = "Chumash",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police2'
	},
	["Tienda14"] = {
		position = { x=-1102.99, y=2714.026, z=19.107 },
		nameOfStore = "Zancudo River",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0,
		para = 'police2'
	},
}
