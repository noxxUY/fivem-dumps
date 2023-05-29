Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 0, g = 250, b = 0 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 10

Config.Locale                     = 'en'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = false

Config.Zones = {

	ShopEntering = {
		Pos   = { x = -56.55, y = -1096.96, z = 26.42 }, 
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 36
	},

	ShopInside = {
		Pos     = { x = -45.75, y = -1095.88, z = 26.42 }, 
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 219.84,
		Type    = -1
	},

	ShopOutside = {
		Pos     = {x = -11.5628, y = -1085.25, z = 26.155}, 
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 126.09,
		Type    = -1
	},

	BossActions = {
		Pos   = { x = -1176.71, y = -1700.29, z = 4.78 }, 
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = { x = -198.11, y = -1297.54, z = 31.3}, 
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = { x = -198.11, y = -1297.54, z = 51.3}, 
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	}

}

