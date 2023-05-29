Config                            = {}

Config.DrawDistance               = 8.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Armories = 21, BossActions = 22, Vehicles = 36}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds     = false -- Enable if you're using esx_optionalneeds
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = false -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale = GetConvar('esx:locale', 'es')

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.tropadokiStations = {

	LSPD = {

		Armories = {
			vector3(-1464.74, -33.9670, 55.050)
		},

		Vehicles = {
			{
				Spawner = vector3(-1467.85, -29.9332, 54.680),
				InsideShop = vector3(-1452.78, -14.8913, 54.652),
				SpawnPoints = {
					{coords = vector3(-1463.68, -25.8549, 54.646), heading = 50.97, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-1481.36, -41.5122, 56.844)
		}

	}

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'xls', price = 1},
			{model = 'zentorno', price = 1},
			{model = 'bf400', price = 1}
		},

		officer = {
			{model = 'xls', price = 1},
			{model = 'zentorno', price = 1},
			{model = 'bf400', price = 1}
		},

		sergeant = {
			{model = 'xls', price = 1},
			{model = 'zentorno', price = 1},
			{model = 'bf400', price = 1}
		},

		lieutenant = {
			{model = 'xls', price = 1},
			{model = 'zentorno', price = 1},
			{model = 'bf400', price = 1}
		},

		boss = {
			{model = 'xls', price = 1},
			{model = 'zentorno', price = 1},
			{model = 'bf400', price = 1}
		}
	}
}
