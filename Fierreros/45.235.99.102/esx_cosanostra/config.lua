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

Config.cosanostraStations = {

	LSPD = {

		Armories = {
			vector3(227.6239, 766.3579, 204.77)
		},

		Vehicles = {
			{
				Spawner = vector3(217.0974, 765.125, 204.67),
				InsideShop = vector3(219.0771, 778.1065, 204.67),
				SpawnPoints = {
					{coords = vector3(211.8427, 761.9303, 204.90), heading = 24.69, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(246.7667, 766.5834, 203.70)
		}

	}

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'dubsta3', price = 1}
		},

		officer = {
			{model = 'dubsta3', price = 1}
		},

		sergeant = {
			{model = 'dubsta3', price = 1}
		},

		lieutenant = {
			{model = 'dubsta3', price = 1}
		},

		boss = {
			{model = 'dubsta3', price = 1}
		}
	}
}
