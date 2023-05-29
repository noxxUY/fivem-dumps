Config                            = {}

Config.DrawDistance               = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 10000  -- Revive reward, set to 0 if you don't want it enabled
Config.SaveDeathStatus              = true -- Save Death Status?
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

 -- DEFAULT

Config.EarlyRespawnTimer          = 60000 * 5  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 90 -- time til the player bleeds out


Config.RemoveWeaponsAfterRPDeath  = true  -- Activar despues de purga
Config.RemoveCashAfterRPDeath     = true  -- Activar despues de purga
Config.RemoveItemsAfterRPDeath    = true  -- Activar despues de purga

--[[ 
Config.EarlyRespawnTimer          = 600 * 1  -- time til respawn is available
Config.BleedoutTimer              = 600 * 1 -- time til the player bleeds out

Config.RemoveWeaponsAfterRPDeath  = false  -- Activar despues de purga
Config.RemoveCashAfterRPDeath     = false  -- Activar despues de purga
Config.RemoveItemsAfterRPDeath    = false  -- Activar despues de purga ]]

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 15000

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.RespawnPoint = {coords = vector3(-665.9634, 307.6587, 83.0841), heading = 22.5750}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-665.9634, 307.6587, 83.0841),
			sprite = 61,
			scale  = 0.8,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-678.0615, 336.8581, 82.1832)
		},

		Pharmacies = {
			vector3(-664.5638, 320.9663, 82.1832)
		},

		Vehicles = {
			{
				Spawner = vector3(-684.1529, 339.5890, 78.2183),
				InsideShop = vector3(-678.1589, 345.7968, 78.1183),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(-676.5887, 362.3658, 78.1184), heading = 79.7116, radius = 4.0},
					{coords = vector3(-687.3902, 364.2172, 78.1176), heading = 96.9328, radius = 4.0},
					{coords = vector3(-656.3958, 360.9595, 78.1184), heading = 96.9328, radius = 4.0},
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-851.5433, -1234.2762, 14.8338),
				InsideShop = vector3(-842.7963, -1245.0681, 14.8338),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(-842.7963, -1245.0681, 14.8338), heading = 223.06, radius = 10.0}
				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, -29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, -26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		} 

	}
}

Config.Jobs = {
	{job = 'police', coords = vec3(342.32, 323.34, 23.44), img = 'url.com'},
	{job = 'militar', coords = vec3(342.32, 323.34, 23.44), img = 'url.com'},
	{job = 'fbi', coords = vec3(342.32, 323.34, 23.44), img = 'url.com'},
	
}


Config.AuthorizedVehicles = {
    car = {
		ambulance = {
			{model = 'ambulance2', price = 10000}
			-- {model = 'motobm', price = 5000}
		},

		doctor = {
			{model = 'ambulance2', price = 10000},
			-- {model = 'motobm', price = 5000}
		},

		chief_doctor = {
			{model = 'bmwcruzroja', price = 10000},
			{model = 'ambulance2', price = 10000},
			{model = 'rangerems', price = 10000}
		--	{model = 'motobm', price = 5000}
		},

		chief_doctor2 = {
			{model = 'bmwcruzroja', price = 10000},
			{model = 'ambulance2', price = 10000},
			{model = 'rangerems', price = 10000}
		--	{model = 'motobm', price = 5000}
		},

		chief_doctor3 = {
			{model = 'bmwcruzroja', price = 10000},
			{model = 'ghispo2', price = 10000},
			{model = 'rangerems', price = 10000}
		--	{model = 'motobm', price = 5000}
		},

		chief_doctor4 = {
			{model = 'bmwcruzroja', price = 10000},
			{model = 'ghispo2', price = 10000},
			{model = 'rangerems', price = 10000}
		--	{model = 'motobm', price = 5000}
		},

		boss = {
			{model = 'bmwcruzroja', price = 10000},
			{model = 'ghispo2', price = 10000},
			{model = 'rangerems', price = 10000},
			{model = 'rmodpolice', price = 5000}
		}
	},

    helicopter = {
     ambulance = {
       --     {model = 'helisame', price = 100000}
        },
		
        doctor = {
	---		{model = 'helisame', price = 100000}
		},

		chief_doctor = {
	--		{model = 'helisame', price = 100000}
		},

		chief_doctor2 = {
		--	{model = 'helisame', price = 100000}
		},

		chief_doctor3 = {
			{model = 'helisame', price = 100000}
		},

		chief_doctor4 = {
			{model = 'helisame', price = 100000}
		},

		boss = {
			{model = 'helisame', price = 100000}
		}
    }
}
