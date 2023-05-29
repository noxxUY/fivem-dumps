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

Config.mara18Stations = {

	LSPD = {

		Armories = {
			vector3(-1536.57, 107.7443, 56.779)
		},

		Vehicles = {
			{
				Spawner = vector3(-1534.80, 96.60437, 56.754),
				InsideShop = vector3(-1525.76, 92.26053, 56.549),
				SpawnPoints = {
					{coords = vector3(-1531.48, 83.43599, 56.729), heading = 319.96, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-1541.10, 92.08037, 57.951)
		}

	}

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'bati', price = 1},
			{model = 'flashgt', price = 1},
			{model = 'guardian', price = 1}
		},

		officer = {
			{model = 'bati', price = 1},
			{model = 'flashgt', price = 1},
			{model = 'guardian', price = 1}
		},

		sergeant = {
			{model = 'bati', price = 1},
			{model = 'flashgt', price = 1},
			{model = 'guardian', price = 1}
		},

		lieutenant = {
			{model = 'bati', price = 1},
			{model = 'flashgt', price = 1},
			{model = 'guardian', price = 1}
		},

		boss = {
			{model = 'bati', price = 1},
			{model = 'flashgt', price = 1},
			{model = 'guardian', price = 1}
		}
	}
}
