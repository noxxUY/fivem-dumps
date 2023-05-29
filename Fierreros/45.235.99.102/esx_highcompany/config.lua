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

Config.highcompanyStations = {

	LSPD = {

		Armories = {
			vector3(-1516.50, 852.1159, 181.59)
		},

		Vehicles = {
			{
				Spawner = vector3(-1524.66, 888.0490, 181.79),
				InsideShop = vector3(-1531.20, 890.9317, 181.89),
				SpawnPoints = {
					{coords = vector3(-1538.85, 889.9533, 181.69), heading = 204.59, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-1585.08, 776.2077, 189.19)
		}

	}

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'superd', price = 1},
			{model = 'dubsta3', price = 1}
		},

		officer = {
			{model = 'superd', price = 1},
			{model = 'dubsta3', price = 1}
		},

		sergeant = {
			{model = 'superd', price = 1},
			{model = 'dubsta3', price = 1}
		},

		lieutenant = {
			{model = 'superd', price = 1},
			{model = 'dubsta3', price = 1}
		},

		boss = {
			{model = 'superd', price = 1},
			{model = 'dubsta3', price = 1}
		}
	}
}
