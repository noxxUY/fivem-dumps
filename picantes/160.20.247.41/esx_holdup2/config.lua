Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 126, g = 26, b = 26, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 23    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 5
Config.TimerBeforeNewRob    = 300 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["humane"] = {
		position = { x = 3567.969, y = 3700.589, z = 28.11719 },
		reward = math.random(2000000 , 2500000),
		nameOfStore = "(PFA) Laboratorio Humane",
		secondsRemaining = 700, -- seconds
		lastRobbed = 0
	},
	["banco_central"] = {
		position = { x = 3567.969, y = 3700.589, z = 28.11719 },
		reward = math.random(2000000 , 2500000),
		nameOfStore = "(PFA) Laboratorio Humane",
		secondsRemaining = 700, -- seconds
		lastRobbed = 0
	},
}
