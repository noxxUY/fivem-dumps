Config = {}

Config.Cmd = "deletevehicles" -- Chat command to delete vehicles

Config.Framework = "esx" -- Options: "esx", "qbcore", "other"

Config.QBUsePermissionsUpdate = false

Config.AdminGroups = { -- Admin groups that can access the admin menu
	"superadmin",
	"god",
	"admin",
	"mod"
}

Config.AdminList = { -- IF YOU USE ESX OR QBCORE IGNORE THIS
	'license:2ash123ad1337a15029a21a6s4e3622f91cde1d0', -- Example, change this
	'discord:370910283901283929' -- Example, change this
}

Config.DeleteVehicleTimer = 10 -- Time (in minutes) that it will take to delete vehicles since you execute the command

Config.DeleteVehiclesIfInSafeZone = true -- If true it'll delete vehicles inside safezones

Config.DeleteVehiclesAt = { -- Delete vehicles automatically at this time every day (h = hour m = minutes)
	{['h'] = 19, ['m'] = 10},
	{['h'] = 19, ['m'] = 20},
	{['h'] = 19, ['m'] = 30},
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