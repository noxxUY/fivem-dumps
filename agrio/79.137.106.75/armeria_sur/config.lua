Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 1.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 32

Config.Locale        = 'es'

--Config.LicenseEnable = true -- only turn this on if you are using esx_license
--Config.LicensePrice  = 30000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(810.22, -2159.19, 29.65),
			--vector3(810.2, -2157.3, 28.6),
			--vector3(1693.4, 3759.5, 33.7),
			--vector3(-330.2, 6083.8, 30.4),
			--vector3(252.3, -50.0, 68.9),
			--vector3(22.0, -1107.2, 28.8),
			--vector3(2567.6, 294.3, 107.7),
			--vector3(-1117.5, 2698.6, 17.5),
			--vector3(842.4, -1033.4, 27.1)
		}
	},

	

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			--vector3(-1306.2, -394.0, 35.6)
		}
	}

}

Config.Garage = {
	Vehicles = {
        Pos          = { x = 822.33, y = -2146.18, z = 28.71 },
        SpawnPoint   = { x = 830.30, y = -2125.91, z = 29.16 },
        Size         = { x = 1.8, y = 1.8, z = 2.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 36,
        Heading      = 81.43,
    },

    VehicleDeleters = {
        Pos   = { x = 819.59, y = -2117.43, z = 29.39 },
        Size  = { x = 3.0, y = 3.0, z = 1.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 36,
    },
}

Config.AuthorizedVehicles = {
    { name = '15tahoe',  label = 'Vehiculo Armeria Sur' },
}