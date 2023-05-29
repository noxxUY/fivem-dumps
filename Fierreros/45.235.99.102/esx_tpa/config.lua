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

Config.tpaStations = {

	LSPD = {

		Armories = {
			vector3(-1580.16, -34.2362, 57.565)
		},

		Vehicles = {
			{
				Spawner = vector3(-1590.40, -58.8479, 56.482),
				InsideShop = vector3(-1574.32, -60.3888, 56.491),
				SpawnPoints = {
					{coords = vector3(-1560.73, -48.7339, 56.508), heading = 344.91, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-1599.17, -34.0577, 58.192)
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
