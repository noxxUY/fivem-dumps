Config                            = {}
Config.DrawDistance               = 20
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 50

Config.Locale                     = 'es'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.OxInventory = ESX.GetConfig().OxInventory

Config.Blip = {
	show = true,
	Sprite = 326,
	Display = 4,
	Color = 81,
	Scale = 0.6
}

Config.Zones = {

	ShopEntering = {
		Pos   = vector3(-1995.4937744141, -330.45867919922, 48.106304168701),
		Size  = {x = 0.7, y = 0.7, z = 0.7},
		Type  = 36
	},

	ShopEnteringMarker = {
		Pos   = vector3(-1995.4937744141, -330.45867919922, 48.106304168701 - 1),
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Type  = 27
	},

	ShopInside = {
		Pos     = vector3(-1989.2056884766, -322.41619873047, 48.106342315674),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 231.48818969727,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(-1962.0042724609, -339.55307006836, 45.536109924316), 
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 261.84042358398,
		Type    = -1
	},

}
