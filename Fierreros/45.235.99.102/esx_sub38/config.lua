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

Config.sub38Stations = {

	LSPD = {

		Armories = {
			vector3(-1797.58, 408.1203, 113.45)
		},

		Vehicles = {
			{
				Spawner = vector3(-1790.67, 395.7196, 112.79),
				InsideShop = vector3(-1799.01, 396.6352, 112.78),
				SpawnPoints = {
					{coords = vector3(-1807.74, 397.4490, 112.50), heading = 107.5, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-1821.32, 422.4085, 127.90)
		}

	}

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'zentorno', price = 1}
		},

		officer = {
			{model = 'zentorno', price = 1}
		},

		sergeant = {
			{model = 'zentorno', price = 1}
		},

		lieutenant = {
			{model = 'zentorno', price = 1}
		},

		boss = {
			{model = 'zentorno', price = 1}
		}
	}
}
