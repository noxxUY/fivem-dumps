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

Config.akogStations = {

	LSPD = {

		Armories = {
			vector3(-1134.87, 376.5599, 71.299)
		},

		Vehicles = {
			{
				Spawner = vector3(-1101.77, 355.5156, 68.487),
				InsideShop = vector3(-1096.47, 358.5884, 68.500),
				SpawnPoints = {
					{coords = vector3(-1096.47, 358.5884, 68.500), heading = 4.35, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-1142.80, 365.6440, 71.318)
		}

	}

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'hakuchou2', price = 1},
			{model = 'ztype', price = 1}
			
		},

		officer = {
			{model = 'hakuchou2', price = 1},
			{model = 'ztype', price = 1}
		},

		sergeant = {
			{model = 'hakuchou2', price = 1},
			{model = 'ztype', price = 1}
		},

		lieutenant = {
			{model = 'hakuchou2', price = 1},
			{model = 'ztype', price = 1}
		},

		boss = {
			{model = 'hakuchou2', price = 1},
			{model = 'ztype', price = 1}
		}
	}
}
