Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 30

Config.DiscordWebHook = "https://discord.com/api/webhooks/868764739386351626/c4QLOm1_b_BvgmyaxBPggtFBeQpIvqrb-Cg2DFEao0YNB4HqUsB0g5n9GsBiyF2CYXeS" -- Link al discord webhook matias#1111
Config.DiscordWebHookFooter = "Imperial RP" -- Footer del discord embed webhook matias#1111
Config.DiscordWebHookColor = '16440430' -- Color del embed matias#1111

Config.Locale                     = 'es'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 4
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = { x = 205.43, y = -178.21, z = 53.61 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 1
	},

	ShopInside = {
		Pos     = { x = 218.84, y = -190.12, z = 54.61 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = -20.0,
		Type    = -1
	},

	ShopOutside = {
		Pos     = { x = 216.54, y = -201.68, z = 53.9 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 330.0,
		Type    = -1
	},

	BossActions = {
		Pos   = { x = 225.51, y = -180.3, z = 53.61 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1 
	},

	GiveBackVehicle = {
		Pos   = { x = -18.227, y = -1078.558, z = 25.675 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = { x = 0.0, y = 0.0, z = 0.0 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1 
	} 

}
