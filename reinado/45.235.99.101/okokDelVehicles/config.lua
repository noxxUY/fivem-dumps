-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
Config, Locale = {}, {}

Config.locale = "en"

-- Chat command to delete vehicles
Config.Cmd = "deletevehicles"

Config.ESX = true -- Set this to true if you use ESX 

-- If you use ESX you don't need to add any identifier to Config.AdminList because it checks if you have permission by your player group (superadmin, admin, mod)

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.AdminList = {
	'license:482377161c0c391c6d82c394dd9ee53ebeeea745', -- Example, change this
	'discord:357315802367787038' -- Example, change this
}

-- Time (in minutes) that it will take to delete vehicles since you execute the command
Config.DeleteVehicleTimer = 30

-- If true it'll delete vehicles inside safezones
Config.DeleteVehiclesIfInSafeZone = false

-- Delete vehicles automatically at this time every day (h = hour m = minutes)
Config.DeleteVehiclesAt = {
	{['h'] = 00, ['m'] = 20},
	{['h'] = 00, ['m'] = 40},
	{['h'] = 01, ['m'] = 00},
	{['h'] = 01, ['m'] = 20},
	{['h'] = 01, ['m'] = 40},
	{['h'] = 02, ['m'] = 00},
	{['h'] = 02, ['m'] = 20},
	{['h'] = 02, ['m'] = 40},
	{['h'] = 03, ['m'] = 00},
	{['h'] = 03, ['m'] = 20},
	{['h'] = 03, ['m'] = 40},
	{['h'] = 04, ['m'] = 00},
	{['h'] = 04, ['m'] = 20},
	{['h'] = 04, ['m'] = 40},
	{['h'] = 05, ['m'] = 00},
	{['h'] = 05, ['m'] = 20},
	{['h'] = 05, ['m'] = 40},
	{['h'] = 06, ['m'] = 00},
	{['h'] = 06, ['m'] = 20},
	{['h'] = 06, ['m'] = 40},
	{['h'] = 07, ['m'] = 00},
	{['h'] = 07, ['m'] = 20},
	{['h'] = 07, ['m'] = 40},
	{['h'] = 08, ['m'] = 00},
	{['h'] = 08, ['m'] = 20},
	{['h'] = 08, ['m'] = 40},
	{['h'] = 09, ['m'] = 00},
	{['h'] = 09, ['m'] = 20},
	{['h'] = 09, ['m'] = 40},
	{['h'] = 10, ['m'] = 00},
	{['h'] = 10, ['m'] = 20},
	{['h'] = 10, ['m'] = 40},
	{['h'] = 11, ['m'] = 00},
	{['h'] = 11, ['m'] = 20},
	{['h'] = 11, ['m'] = 40},
	{['h'] = 12, ['m'] = 00},
	{['h'] = 12, ['m'] = 20},
	{['h'] = 12, ['m'] = 40},
	{['h'] = 13, ['m'] = 00},
	{['h'] = 13, ['m'] = 20},
	{['h'] = 13, ['m'] = 40},
	{['h'] = 14, ['m'] = 00},
	{['h'] = 14, ['m'] = 20},
	{['h'] = 14, ['m'] = 40},
	{['h'] = 15, ['m'] = 00},
	{['h'] = 15, ['m'] = 20},
	{['h'] = 15, ['m'] = 40},
	{['h'] = 16, ['m'] = 00},
	{['h'] = 16, ['m'] = 20},
	{['h'] = 16, ['m'] = 40},
	{['h'] = 17, ['m'] = 00},
	{['h'] = 17, ['m'] = 20},
	{['h'] = 17, ['m'] = 40},
	{['h'] = 18, ['m'] = 00},
	{['h'] = 18, ['m'] = 20},
	{['h'] = 18, ['m'] = 40},
	{['h'] = 19, ['m'] = 00},
	{['h'] = 19, ['m'] = 20},
	{['h'] = 19, ['m'] = 40},
	{['h'] = 20, ['m'] = 00},
	{['h'] = 20, ['m'] = 20},
	{['h'] = 20, ['m'] = 40},
	{['h'] = 21, ['m'] = 30},
	{['h'] = 21, ['m'] = 00},
	{['h'] = 21, ['m'] = 20},
	{['h'] = 22, ['m'] = 40},
	{['h'] = 23, ['m'] = 00},
	{['h'] = 23, ['m'] = 20},
	{['h'] = 23, ['m'] = 40},
}

-- Set safezones
-- For the blip color check: https://docs.fivem.net/docs/game-references/blips/#blip-colors
-- If you want to remove the blip simply set 'alpha' to 0
Config.SafeZones = {
	 { ['x'] = 425.1079, ['y'] = -979.4921, ['z'] = 25.7000, ['radius'] = 50.0, ['color'] = 2, ['alpha'] = 10},
	{ ['x'] = -821.3746, ['y'] = -1221.9932, ['z'] = 7.1951, ['radius'] = 50.0, ['color'] = 2, ['alpha'] = 10},
	{ ['x'] = 229.2847, ['y'] = 214.3526, ['z'] = 106.4742, ['radius'] = 50.0, ['color'] = 2, ['alpha'] = 10}, 
	{ ['x'] = -1084.1034, ['y'] = -266.1701, ['z'] = 39.1411, ['radius'] = 50.0, ['color'] = 2, ['alpha'] = 10}, 
	{ ['x'] = -670.8486, ['y'] = -228.3097, ['z'] = 37.9157, ['radius'] = 50.0, ['color'] = 2, ['alpha'] = 10},
	{ ['x'] = 2961.4429, ['y'] = 2744.0667, ['z'] = 43.4748, ['radius'] = 150.0, ['color'] = 2, ['alpha'] = 10}, 
	{ ['x'] = -213.3132, ['y'] = -1326.3225, ['z'] = 30.8904, ['radius'] = 150.0, ['color'] = 2, ['alpha'] = 10}, 
	{ ['x'] = 828.8583, ['y'] = -960.5201, ['z'] = 26.4989, ['radius'] = 130.0, ['color'] = 2, ['alpha'] = 0},  -- LS CUSTOM MONKEYS
	{ ['x'] = 1083.7520, ['y'] = -1968.0529, ['z'] = 34.9608, ['radius'] = 130.0, ['color'] = 2, ['alpha'] = 0},  -- Fundicion
	{ ['x'] = 1875.9070, ['y'] = 299.4349, ['z'] = 164.2742, ['radius'] = 130.0, ['color'] = 2, ['alpha'] = 0},  -- Lavado
	{ ['x'] = 1312.642, ['y'] = 603.5736, ['z'] = 80.0988, ['radius'] = 130.0, ['color'] = 2, ['alpha'] = 0},  -- frontera
	{ ['x'] = -674.0726, ['y'] = 318.8609, ['z'] = 83.0831, ['radius'] = 130.0, ['color'] = 2, ['alpha'] = 0},  -- Hospital
	{ ['x'] = -529.7816, ['y'] = 5318.8555, ['z'] = 74.8527, ['radius'] = 150.0, ['color'] = 2, ['alpha'] = 0},  -- aserradero
	
}