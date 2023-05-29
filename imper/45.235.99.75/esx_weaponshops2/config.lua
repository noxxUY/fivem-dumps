Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 255, g = 35, b = 35 }
Config.Type          = 2

Config.Locale        = 'en'

Config.LicenseEnable = false -- only turn this on if you are using esx_license
Config.LicensePrice  = 10000

Config.Zones = {

	GunShop = {
		Legal = false,
		Items = {},
		Locations = { 
			vector3(-3171.45, 1087.32, 19.84),
		}   
	},
	

	BlackWeashop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(2197.2, 5608.9, 53.5)
		} 
	}

}
