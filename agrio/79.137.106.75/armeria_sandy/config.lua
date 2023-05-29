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
			vector3(1692.62, 3761.49, 34.65),
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
        Pos          = { x = 1704.63, y = 3765.18, z = 34.71 },
        SpawnPoint   = { x = 1718.60, y = 3757.83, z = 34.06 },
        Size         = { x = 1.8, y = 1.8, z = 2.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 36,
        Heading      = 211.43,
    },

    VehicleDeleters = {
        Pos   = { x = 1711.99, y = 3776.83, z = 34.39 },
        Size  = { x = 3.0, y = 3.0, z = 1.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 36,
    },
}

Config.AuthorizedVehicles = {
    { name = '15tahoe',  label = 'Vehiculo Armeria Sandy' },
}