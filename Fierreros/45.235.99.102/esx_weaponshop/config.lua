Config               = {}

Config.DrawDistance  = 10.0
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1

Config.Locale        = GetConvar('esx:locale', 'en')
Config.MenuPosition  = "right"
Config.OxInventory   = ESX.GetConfig().OxInventory

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 5000

Config.Zones = {

	GunShop = {
		Legal = true,
		Blip = {
			Enabled = true,
			Sprite = 110,
			Color = 81,
			Display = 4,
			Scale = 0.7,
			ShortRange = true
		},
		Items = {
			{
				name = "WEAPON_PISTOL",
				price = 140000
			},
			{
				name = "WEAPON_FLASHLIGHT",
				price = 20000
			},
			{
				name = "WEAPON_MACHETE",
				price = 35000
			},
			{
				name = "WEAPON_VINTAGEPISTOL",
				price = 120000
			},
			{
				name = "WEAPON_BAT",
				price = 70000
			},
	},
		Locations = {
			vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1)
		}
	},

	BlackWeashop = {
		Legal = false,
		Blip = {
			Enabled = false,
			Sprite = 110,
			Color = 59,
			Display = 4,
			Scale = 0.7,
			ShortRange = true
		},
		Items = {
			{
				name = "WEAPON_PISTOL",
				price = 95000
			},
			{
				name = "WEAPON_COMBATPISTOL",
				price = 105000
			},
			{
				name = "WEAPON_APPISTOL",
				price = 295000
			},
			{
				name = "WEAPON_MICROSMG",
				price = 365000
			},
			{
				name = "WEAPON_MACHINEPISTOL",
				price = 345000
			},
			{
				name = "WEAPON_MINISMG",
				price = 335000
			},
			{
				name = "WEAPON_CARBINERIFLE",
				price = 950000
			},
			{
				name = "WEAPON_ASSAULTRIFLE",
				price = 965000
			},
			{
				name = "WEAPON_ADVANCEDRIFLE",
				price = 1125000
			},
			{
				name = "WEAPON_SPECIALCARBINE",
				price = 1150000
			},
		},
		Locations = {
			vector3(1637.807, 4879.458, 42.035)
		}
	}
}
