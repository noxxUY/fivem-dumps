Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.OnlyFirstname = true
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license
Config.EnableMoneyWash = true
Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2
		},

		Cloakrooms = {
			--vector3(452.6, -992.8, 30.6),
			vector3(463.02, -999.14, 30.6),
			vector3(129.5868, -756.989, 242.1436), --CNi
			vector3(610.8, -2.71, 90.6),
			vector3(-1309.32, -1518.31, 4.46),
		},

		Armories = {
		--	vector3(451.7, -980.1, 30.6),
		vector3(482.61, -995.46, 30.60),
			vector3(603.3, 20.6, 90.6),
			vector3(118.6286, -728.5187, 242.1436), --Cni
			vector3(-1315.83, -1512.86, 4.46),
			
		},

		Vehicles = {
			{
				--Spawner = vector3(454.6, -1017.4, 28.4),
				Spawner = vector3(457.56, -974.74, 25.7),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					{ coords = vector3(449.3539, -1024.8, 28.57214), heading = 178.0, radius = 6.0 },
					{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(550.3, -57.28, 71.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(566.9, -60.6, 71.70), heading = 244.1, radius = 6.0 },
					{ coords = vector3(557.81, -62.61, 70.95), heading = 237.5, radius = 6.0 }
				}
			},
			{
				Spawner = vector3(-1308.53, -1521.08, 4.40),
				InsideShop = vector3(-1332.76, -1508.85, 4.30),
				SpawnPoints = {
					{ coords = vector3(-1324.69, -1500.16, 4.30), heading = 297.1, radius = 6.0 },
					{ coords = vector3(-1309.21, -1502.41, 4.35), heading = 229.5, radius = 6.0 }
				}
			},
			{
				Spawner = vector3(136.4967, -722.0176, 42.01831),
				InsideShop = vector3(-1332.76, -1508.85, 4.30),
				SpawnPoints = {
					{ coords = vector3(149.7758, -710.7165, 42.01831), heading = 297.1, radius = 6.0 },
					--{ coords = vector3(-1309.21, -1502.41, 4.35), heading = 229.5, radius = 6.0 }
				}
			},
			--de barcos
			{
				Spawner = vector3(-878.6506, -1462.536, 1.578735),
				InsideShop = vector3(-1332.76, -1508.85, 4.30),
				SpawnPoints = {
					{ coords = vector3(-874.2462, -1458.818, 0.3487549), heading = 204.0941, radius = 6.0 },
					--{ coords = vector3(-1309.21, -1502.41, 4.35), heading = 229.5, radius = 6.0 }
				}
			},{
				Spawner = vector3(-742.8659, 6071.815, 1.224854),
				InsideShop = vector3(-1332.76, -1508.85, 4.30),
				SpawnPoints = {
					{ coords = vector3(-773.4594, 6100.352, 0.7363281), heading = 204.0941, radius = 6.0 },
					--{ coords = vector3(-1309.21, -1502.41, 4.35), heading = 229.5, radius = 6.0 }
				}
			},
			
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			},
			{
				Spawner = vector3(569.71, 10.35, 103.2),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				
				SpawnPoints = { { coords = vector3(580.5, 12.2, 103.3), heading = 92.6, radius = 10.0 } }
				
					
			},
			{
				Spawner = vector3(134.7692, -734.0176, 262.8352),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				
				SpawnPoints = { { coords =  vector3(122.2681, -743.5912, 262.8352) , heading = 92.6, radius = 10.0 } }
				
					
			},
			{
				Spawner = vector3(-1327.094, -1523.328, 8.723022),
				InsideShop =vector3(-1296.884, -1371.64, 12.68274),
				
				SpawnPoints = { { coords =   vector3(-1319.604, -1521.31, 11.63806) , heading = 277.796, radius = 10.0 } }
				
					
			}
		},

		Helicopters1 = {
			--{
				--Spawner = vector3(569.71, 10.35, 103.2),
				--InsideShop = vector3(477.0, -1106.4, 43.0),
				
				--SpawnPoints = { x = 580.50, y = 12.26, z = 103.3 },
				--Heading    = 92.0,
					--{ coords = vector3(580.5, 12.2, 103.3), heading = 92.6, radius = 10.0 }
			--}
		},

		BossActions = {
			--vector3(448.4, -973.2, 30.6),
			vector3(462.84, -985.02, 30.6),
			vector3(549.4, -18.2, 87.6),
			vector3(149.3143, -759.4681, 242.1436) --Cni
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }--]]
	},

	officer = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 }--]]
	},

	sergeant = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1},
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 }--]]
	},

	intendent = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 }--]]
	},

	lieutenant = {
	--[[	{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 1 }--]]
	},

	chef = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1000 },
        { weapon = 'WEAPON_NIGHTSTICK', price = 200 },
        { weapon = 'WEAPON_MACHINEPISTOL', price = 1100 },
        { weapon = 'WEAPON_STUNGUN', price = 250 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 25 },
        { weapon = 'WEAPON_SMG', price = 5000 },
        { weapon = 'WEAPON_CARBINERIFLE', price = 9000 },
        { weapon = 'WEAPON_SPECIALCARBINE', price = 9000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_SNIPERRIFLE', price = 10000 },
        { weapon = 'WEAPON_HEAVYPISTOL', price = 1 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1000 },
        { weapon = 'WEAPON_NIGHTSTICK', price = 200 },
        { weapon = 'WEAPON_MACHINEPISTOL', price = 1100 },
        { weapon = 'WEAPON_STUNGUN', price = 250 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 25 },
        { weapon = 'WEAPON_SMG', price = 5000 },
        { weapon = 'WEAPON_CARBINERIFLE', price = 9000 },
        { weapon = 'WEAPON_SPECIALCARBINE', price = 9000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_SNIPERRIFLE', price = 10000 },
        { weapon = 'WEAPON_HEAVYPISTOL', price = 1 }
	},

	bope = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1000 },
        { weapon = 'WEAPON_NIGHTSTICK', price = 200 },
        { weapon = 'WEAPON_MACHINEPISTOL', price = 1100 },
        { weapon = 'WEAPON_STUNGUN', price = 250 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 25 },
        { weapon = 'WEAPON_SMG', price = 5000 },
        { weapon = 'WEAPON_CARBINERIFLE', price = 9000 },
        { weapon = 'WEAPON_SPECIALCARBINE', price = 9000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_SNIPERRIFLE', price = 10000 },
        { weapon = 'WEAPON_HEAVYPISTOL', price = 1 }
	},

	cni = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1000 },
        { weapon = 'WEAPON_NIGHTSTICK', price = 200 },
        { weapon = 'WEAPON_MACHINEPISTOL', price = 1100 },
        { weapon = 'WEAPON_STUNGUN', price = 250 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 25 },
        { weapon = 'WEAPON_SMG', price = 5000 },
        { weapon = 'WEAPON_CARBINERIFLE', price = 9000 },
        { weapon = 'WEAPON_SPECIALCARBINE', price = 9000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_SNIPERRIFLE', price = 10000 },
        { weapon = 'WEAPON_HEAVYPISTOL', price = 1 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
		--[[{ model = 'riot', label = 'Ford CNP', price = 1 },
		{ model = 'police3', label = 'Ford 4x4 CNP', price = 1 },
		{ model = 'police2', label = 'Lexus CNP', price = 1 },
		{ model = 'policeb', label = 'MOTO ', price = 1 },
		{ model = 'psp_bmwgs', label = 'MOTO CNP ', price = 1 },
		{ model = 'chgr', label = 'CHGR CNP ', price = 1 },
		{ model = 'dodgecnp', label = 'DODGE CNP ', price = 1 },
		{ model = 'hkona', label = 'KONA CNP', price = 1 },
		{ model = 'x6cnp', label = 'BMW X6 CNP', price = 1 },
		{ model = 'predator', label = 'Barco CNP ( Solo usar con permiso de altos cargos ) ', price = 1 },]]--
		
		--{ model = 'policeold2', label = 'TEST 4 ', price = 1 },
		--{ model = 'police4', label = 'TEST 5 ', price = 1 },
	},
	
	recruit = {
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	
	officer = {
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	
	sergeant = {
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	
	intendent = {
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	
	lieutenant = {
		--{ model = 'polsecreta', label = 'X5 Secreta Negro ', price = 1 },    
		--{ model = 'wmfenyrcop', label = 'Lambo', price = 1 },
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	
	chef = {
	--	{ model = '15charger', label = 'Secreta', price = 1 },    
		--{ model = 'wmfenyrcop', label = 'Lambo', price = 1 },
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	
	boss = {
		--{ model = '15charger', label = 'Secreta', price = 1 },    
		--{ model = 'polsecreta', label = 'X5 Secreta Negro ', price = 1 },    
		--{ model = 'wmfenyrcop', label = 'Lambo', price = 1 },
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
		{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	cni = {
	--{ model = '09tahoe', label = 'Tahoe', price = 1 },    
	--{ model = '15charger', label = 'Charger', price = 1 },    
	--{ model = 'police4', label = 'Police 4', price = 1 },    
	--{ model = 'camarobb', label = 'Camaro', price = 1 },    
	{ model = 'riot', label = 'Blindado LSPD', price = 1 },
		{ model = 'valor18charg', label = 'Charger LSPD', price = 1 },
		{ model = 'valorbmw', label = 'Mery BMW LSPD', price = 1 },
		{ model = 'valor18tahoe', label = 'Tahoe LSPD ', price = 1 },
		{ model = 'valor20ram', label = 'RAM LSPD ', price = 1 },
		{ model = 'valorfpis', label = 'Ford Taurus LSPD ', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Interceptor LSPD ', price = 1 },
		{ model = 'valorf250', label = 'FORD 250 LSPD', price = 1 },
		{ model = 'valorporsche', label = 'PORSCHE LSPD', price = 1 },
		{ model = 'valorcvpi', label = 'FORD CVPI', price = 1 },
		{ model = 'valorkawa', label = 'Moto Montaña LSPD', price = 1 },
		{ model = 'valorharley', label = 'Moto Harley LSPD', price = 1 },
	},
	bope = {
		{ model = 'fbi2', label = 'Patrulla BEPO', price = 1},
		{ model = '15charger', label = 'Secreta', price = 1 },    
	},
	sgc={
		{ model = 'valorgator', label = 'Mini Coche Seguridad Civil', price = 1},
		{ model = 'valorquad', label = 'Quad Seguridad Civil', price = 1},
		{ model = '15charger', label = 'Secreta', price = 1 },    
		{ model = 'pbike', label = 'Patrulla Seguridad Civil', price = 1},
		{ model = 'psp_rtwizy', label = 'Huevo Kinder Seguridad Civil', price = 1},
		{ model = 'psp_bmwgs', label = 'New Seguridad Civil', price = 1},
		{ model = 'fbi4', label = 'Opel Kinder Seguridad Civil', price = 1},
		{ model = 'tchcop', label = 'Secreta Seguridad Civil', price = 1},
		{ model = 'focus20', label = 'Focus Seguridad Civil', price = 1},
		{ model = 'ateca20cnp', label = 'Ateca Seguridad Civil', price = 1},
	
	},
	

}


Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Helicoptero LSPD', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero VOLITO', livery = 0, price = 1 },
		{ model = 'swathel', label = 'Helicoptero LSPD 2', livery = 0, price = 1 }	
	},

	chef = {
		{ model = 'polmav', label = 'Helicoptero LSPD', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero VOLITO', livery = 0, price = 1 },
		{ model = 'swathel', label = 'Helicoptero LSPD 2', livery = 0, price = 1 }	
	},

	boss = {
		{ model = 'polmav', label = 'Helicoptero LSPD', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero VOLITO', livery = 0, price = 1 },
		{ model = 'swathel', label = 'Helicoptero LSPD 2', livery = 0, price = 1 }	
	},

	cni = {
		{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero LSPD', livery = 0, price = 1 }	
	},

	bope = {
		{ model = 'as350', label = 'Helicoptero B.O.P.E.', price = 1},
	},
	sgc = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
	}

}

Config.AuthorizedHelicopters1 = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }		
	},

	chef = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }	
	},

	boss = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }	
	},

	bope = {
		{ model = 'as350', label = 'Helicoptero B.O.P.E.', price = 1},
	}
}
-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	bope_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 33,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	bullet_wear = {
		male = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		}
	}

}