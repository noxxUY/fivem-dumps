Config               = {}

Config.DrawDistance  = 2
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 155, b = 253 }
Config.Type          = 27

Config.Locale        = 'es'
Config.Blur			 = true

Config.LicenseEnable = true
Config.LicensePrice  = 600000000000

Config.Zones = {
	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(253.88, -47.42, 41.24),
			vector3(814.6, -2157.9, 3.0),  
			vector3(-1303.7, -393.8, 7.6), 

		}
	},

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			--vector3(728.92, 4188.70, 39.75)
		}
	}
}
