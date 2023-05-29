Config                      = {}
Config.Locale               = 'en'

Config.Marker               = {
	r            = 126, g = 26, b = 26, a = 100, -- red color
	x            = 1.0, y = 1.0, z = 1.5, -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 23    -- default circle type, low draw distance due to indoors area
}

Config.psgNumberRequired = 2
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance          = 50   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney       = true -- give black money? If disabled it will give cash instead

Stores                      = {
	["blaine_country"]        = {
		position         = { x = -106.24, y = 6474.21, z = 31.65 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Mini Banco Paleto",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["chicken"]        = {
		position         = { x = -65.6, y = 6240.4, z = 31.1 },
		reward           = math.random(12500000 , 30000000),
		nameOfStore      = "Chicken",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["blaine_country2"]   = {
		position         = { x = -2957.6674804688, y = 481.45776367188, z = 15.697026252747 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Flecca Costa",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["rancho"]   = {
		position         = { x = 2452.7, y = 4972.9, z = 46.9 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Rancho",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["cerve"]   = {
		position         = { x = 2673.9, y = 3286.2, z = 55.3 },
		reward           = math.random(225000 , 400000),
		nameOfStore      = "Cerveceria PSG",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
	["banco_sandy"]   = {
		position         = { x = 1177.213, y = 2711.868, z = 38.09229 },
		reward           = math.random(2250000 , 4000000),
		nameOfStore      = "Fleeca Sandy",
		secondsRemaining = 300, -- seconds
		lastRobbed       = 0
	},
}
