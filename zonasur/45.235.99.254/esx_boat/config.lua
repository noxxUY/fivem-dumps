Config               = {}

Config.Locale        = 'en'

Config.LicenseEnable = true -- enable boat license? Requires esx_license
Config.LicensePrice  = 50000

Config.MarkerType    = 1
Config.DrawDistance  = 100.0

Config.Marker = {
	r = 100, g = 204, b = 100, -- blue-ish color
	x = 2.7, y = 2.7, z = 1.0  -- standard size circle
}

Config.StoreMarker = {
	r = 255, g = 0, b = 0,     -- red color
	x = 5.0, y = 5.0, z = 1.0  -- big circle for storing boat
}

Config.Zones = {

	Garages = {
	--[[
		{ -- Shank St, nearby campaign boat garage
			GaragePos  = vector3(-772.4, -1430.9, 0.5),
			SpawnPoint = vector4(-785.39, -1426.3, 0.0, 146.0),
			StorePos   = vector3(-798.4, -1456.0, 0.0),
			StoreTP    = vector4(-791.4, -1452.5, 1.5, 318.9)
		},

		{ -- Catfish View
			GaragePos  = vector3(3864.9, 4463.9, 1.6),
			SpawnPoint = vector4(3854.4, 4477.2, 0.0, 273.0),
			StorePos   = vector3(3857.0, 4446.9, 0.0),
			StoreTP    = vector4(3854.7, 4458.6, 1.8, 355.3)
		},

		{ -- Great Ocean Highway
			GaragePos  = vector3(-1614.0, 5260.1, 2.8),
			SpawnPoint = vector4(-1622.5, 5247.1, 0.0, 21.0),
			StorePos   = vector3(-1600.3, 5261.9, 0.0),
			StoreTP    = vector4(-1605.7, 5259.0, 2.0, 25.0)
		},

		{ -- North Calafia Way
			GaragePos  = vector3(712.6, 4093.3, 33.7),
			SpawnPoint = vector4(712.8, 4080.2, 29.3, 181.0),
			StorePos   = vector3(705.1, 4110.1, 30.2),
			StoreTP    = vector4(711.9, 4110.5, 31.3, 180.0)
		},

		{ -- Elysian Fields, nearby the airport
			GaragePos  = vector3(23.8, -2806.8, 4.8),
			SpawnPoint = vector4(23.3, -2828.6, 0.8, 181.0),
			StorePos   = vector3(-1.0, -2799.2, 0.5),
			StoreTP    = vector4(12.6, -2793.8, 2.5, 355.2)
		},

		{ -- Barbareno Rd
			GaragePos  = vector3(-3426.3, 976.0, 7.3),
			SpawnPoint = vector4(-3448.9, 995.0, 0.0, 75.0),
			StorePos   = vector3(-3436.5, 995.0, 0.3),
			StoreTP    = vector4(-3427.0, 952.6, 8.3, 0.0)
		}
		]]
	},

	BoatShops = {
		{ -- Shank St, nearby campaign boat garage
			Outside = vector3(-773.7, -1495.2, 1.6),
			Inside = vector4(-798.5, -1503.1, -0.4, 120.0)
		}
	}

}
--sr650fly dtd_jetskis
Config.Vehicles = {
	{model = 'seashark', category = "car", label = 'Seashark (Random Color)', price = 150000},
	{model = 'seashark3', category = "car", label = 'Seashark (Dark Blue)', price = 150000},
	{model = 'suntrap', category = "car", label = 'Suntrap', price = 200000},
	{model = 'jetmax', category = "car", label = 'Jetmax', price = 900000},
	{model = 'tropic2', category = "car", label = 'Tropic', price = 1300000},
	{model = 'dinghy2', category = "car", label = 'Dinghy 2 (Black)', price = 650000},
	{model = 'dinghy4', category = "car", label = 'Dinghy 4 (Random Color)', price = 800000},
	{model = 'speeder', category = "car", label = 'Speeder', price = 1700000},
	{model = 'squalo', category = "car", label = 'Squalo (Random Color)', price = 1220000},
	{model = 'toro', category = "donadores", label = 'Toro', price = 30000000},
	{model = 'submersible', category = "donadores", label = 'Sumerjible', price = 30000000},
	--{model = 'sr650fly', label = 'Sea Ray 650 fly', price = 30000000},
	{model = 'marquis', category = "donadores", label = 'Velero', price = 30000000},
	{model = 'avisa', category = "donadores", label = 'Kraken Avisa', price = 30000000},
	{model = 'longfin', category = "donadores", label = 'Shitzu Longfin', price = 30000000},
	--{model = 'sr650fly', category = "exclusivos", label = 'Yate SR650', price = 60000000},
}