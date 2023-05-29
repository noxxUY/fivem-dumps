Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1
Config.Locale        = 'fr'

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 15000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {
			{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 2000, 8000, nil }, price = 6000 },
			{ weapon = 'WEAPON_BAT', price = 1000},
			{ weapon = 'WEAPON_MACHETE', price = 2000},
			{ weapon = 'WEAPON_FLASHLIGHT', price = 200},
			{ weapon = 'WEAPON_SWITCHBLADE', price = 2500},
			{ weapon = 'GADGET_PARACHUTE', price = 500}
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
	}
}