Config                            = {}
Config.DrawDistance               = 50.0
Config.MarkerColor                = { r = 0, g = 191, b = 255 }
Config.EnableOwnedVehicles        = true
Config.ResellPercentage           = 50

Config.Locale                     = 'es'

Config.LicenseEnable = true -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {
	
	ShopEntering = {
		Pos   = vector3(-1259.08, -362.96, 36.92),
		Size  = vector3(1.5, 1.5, 1.0),
		Type  = 36
	},
	ShopOutside = {
		Pos   = vector3(-1234.8, -343.48, 36.72),
		Size  = vector3(1.5, 1.5, 1.0),
		Heading = 27.76,
		Type  = -1
	},

	Shop2 = {
		Pos   = vector3(-1266.76, -359.96, 36.92),
		Size  = vector3(1.5, 1.5, 1.0),
		Type  = 36
	},
	Shop3 = {
		Pos   = vector3(-1253.52, -350.88, 36.92),
		Size  = vector3(1.5, 1.5, 1.0),
		Type  = 36
	},

	ResellVehicle = {
		Pos   = vector3(-46.14, -1082.73, 625.74),
		Size  = vector3(0.0, 0.0, 0.0),
		Type  = 1
	}

}

