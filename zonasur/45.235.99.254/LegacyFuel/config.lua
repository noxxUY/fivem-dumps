Config = {}

-- Are you using ESX? Turn this to true if you would like fuel & jerry cans to cost something.
Config.UseESX = true

-- What should the price of jerry cans be?
Config.JerryCanCost = 2000
Config.RefillCost = 1000 -- If it is missing half of it capacity, this amount will be divided in half, and so on.

-- Fuel decor - No need to change this, just leave it.
Config.FuelDecor = "_FUEL_LEVEL"

-- What keys are disabled while you're fueling.
Config.DisableKeys = {0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323}

-- Want to use the HUD? Turn this to true.
Config.EnableHUD = false

-- Configure blips here. Turn both to false to disable blips all together.
Config.ShowNearestGasStationOnly = false
Config.ShowAllGasStations = true

-- Modify the fuel-cost here, using a multiplier value. Setting the value to 2.0 would cause a doubled increase.
Config.CostMultiplier = 30.0

-- Configure the strings as you wish here.
Config.Strings = {
	ExitVehicle = "Salga del vehículo para cargar nafta",
	EToRefuel = "Presiona ~g~E ~w~para cargar nafta.",
	JerryCanEmpty = "Bidon vacio",
	FullTank = "Tanque Lleno",
	PurchaseJerryCan = "Presiona ~g~E ~w~para comprar bidon. ~g~$" .. Config.JerryCanCost,
	CancelFuelingPump = "Presiona ~g~E ~w~para cancelar la carga.",
	CancelFuelingJerryCan = "Presiona ~g~E ~w~para cancelar la carga.",
	NotEnoughCash = "No tienes suficiente efectivo",
	RefillJerryCan = "Presiona ~g~E ~w~ para rellenar el bidón.",
	NotEnoughCashJerryCan = "No hay suficiente efectivo para rellenar el bidon",
	JerryCanFull = "Bidon lleno",
	TotalCost = "Costo Total",
}

if not Config.UseESX then
	Config.Strings.PurchaseJerryCan = "Presiona ~g~E ~w~ para comprar un bidón"
	Config.Strings.RefillJerryCan = "Presiona ~g~E ~w~ para recargar el bidón"
end

Config.PumpModels = {
	[-2007231801] = true,
	[1339433404] = true,
	[1694452750] = true,
	[1933174915] = true,
	[-462817101] = true,
	[-469694731] = true,
	[-164877493] = true
}

-- Blacklist certain vehicles. Use names or hashes. https://wiki.gtanet.work/index.php?title=Vehicle_Models
Config.Blacklist = {
	--"Adder",
	--276773164
}

-- Do you want the HUD removed from showing in blacklisted vehicles?
Config.RemoveHUDForBlacklistedVehicle = true

-- Class multipliers. If you want SUVs to use less fuel, you can change it to anything under 1.0, and vise versa.
Config.Classes = {
	[0] = 0.5, -- Compacts
	[1] = 0.5, -- Sedans
	[2] = 0.5, -- SUVs
	[3] = 0.5, -- Coupes
	[4] = 0.5, -- Muscle
	[5] = 0.5, -- Sports Classics
	[6] = 0.5, -- Sports
	[7] = 0.5, -- Super
	[8] = 0.5, -- Motorcycles
	[9] = 0.5, -- Off-road
	[10] = 0.5, -- Industrial
	[11] = 0.5, -- Utility
	[12] = 0.5, -- Vans
	[13] = 0.0, -- Cycles
	[14] = 0.1, -- Boats
	[15] = 0.5, -- Helicopters
	[16] = 0.5, -- Planes
	[17] = 0.2, -- Service
	[18] = 0.5, -- Emergency
	[19] = 0.5, -- Military
	[20] = 0.5, -- Commercial
	[21] = 0.5, -- Trains
}

-- The left part is at percentage RPM, and the right is how much fuel (divided by 10) you want to remove from the tank every second
Config.FuelUsage = {
	[1.0] = 1.4,
	[0.9] = 1.2,
	[0.8] = 1.0,
	[0.7] = 0.9,
	[0.6] = 0.8,
	[0.5] = 0.7,
	[0.4] = 0.5,
	[0.3] = 0.4,
	[0.2] = 0.2,
	[0.1] = 0.1,
	[0.0] = 0.0,
}

Config.GasStations = {
	--1
	{
		blip = vector3(49.4187, 2778.793, 58.043),
		owner = 'steam:1100001442a3859',
		menu = vector3(46.62829,2789.559,57.885)
	},
	--2
	{
		blip = vector3(263.894, 2606.463, 44.983),
		owner = 'steam:110000143b9d045',
		menu = vector3(265.6319,2598.274,44.844)
	},
	--3
	{
		blip = vector3(1039.958, 2671.134, 39.550),
		owner = 'steam:110000154aa7530',
		menu = vector3(1039.363,2664.216,39.551)
	},
	--4
	{
		blip = vector3(1207.260, 2660.175, 37.899),
		owner = 'steam:11000013fccafdc',
		menu = vector3(1202.196,2654.235,37.851)
	},
	--5
	{
		blip = vector3(2539.685, 2594.192, 37.944),
		owner = 'steam:110000142da9b51',
		menu = vector3(2545.162,2592.137,37.957)
	},
	--6
	{
		blip = vector3(2679.858, 3263.946, 55.240),
		owner = 'steam:11000011c7c43c7',
		menu = vector3(2673.768,3267.082,55.240)
	},
	--7
	{
		blip = vector3(2005.055, 3773.887, 32.403),
		owner = nil,
		menu = vector3(2001.519,3779.884,32.180)
	},
	--8
	{
		blip = vector3(1687.156, 4929.392, 42.078),
		owner = 'steam:11000013eddecb0',
		menu = vector3(1694.880,4924.179,42.229)
	},
	--9
	{
		blip = vector3(1701.314, 6416.028, 32.763),
		owner = 'steam:110000145cd4c3f',
		menu = vector3(1706.283,6425.901,32.774)
	},
	--10
	{
		blip = vector3(179.857, 6602.839, 31.868),
		owner = 'steam:110000155dd4497',
		menu = vector3(171.5316,6634.327,31.620)
	},
	--11
	{
		blip = vector3(-94.4619, 6419.594, 31.489),
		owner = 'steam:11000014d7dd483',
		menu = vector3(-92.7192,6409.825,31.640)
	},
	--12
	{
		blip = vector3(-2554.996, 2334.40, 33.078),
		owner = 'steam:110000142a9e3ac',
		menu = vector3(-2543.99,2315.988,33.216)
	},
	--13
	{
		blip = vector3(-1800.375, 803.661, 138.651),
		owner = 'steam:11000014e866f7f',
		menu = vector3(-1819.51,797.3222,138.14)
	},
	--14
	{
		blip = vector3(-1437.622, -276.747, 46.207),
		owner = 'steam:11000014809f8b2',
		menu = vector3(-1427.83,-268.370,46.226)
	},
	--15
	{
		blip = vector3(-2096.243, -320.286, 13.168),
		owner = 'steam:11000014361a573',
		menu = vector3(-2066.35,-312.809,13.289)
	},
	--16
	{
		blip = vector3(-724.619, -935.1631, 19.213),
		owner = 'steam:11000013e458c16',
		menu = vector3(-702.780,-916.784,19.214)
	},
	--17
	{
		blip = vector3(-526.019, -1211.003, 18.184),
		owner = 'steam:110000118a5eea9',
		menu = vector3(-531.463,-1221.13,18.455)
	},
	--18
	{
		blip = vector3(-70.2148, -1761.792, 29.534),
		owner = 'steam:11000015a202c48',
		menu = vector3(-57.8951,-1747.09,29.316)
	},
	--19
	{
		blip = vector3(265.648, -1261.309, 29.292),
		owner = 'steam:110000145fd9930',
		menu = vector3(289.4807,-1266.91,29.440)
	},
	--20
	{
		blip = vector3(819.653, -1028.846, 26.403),
		owner = 'steam:11000014a36e17b',
		menu = vector3(835.2508,-1036.81,27.645)
	},
	--21
	{
		blip = vector3(1208.951, -1402.567,35.224),
		owner = 'steam:11000014acee872',
		menu = vector3(1211.217,-1389.02,35.376)
	},
	--22
	{
		blip = vector3(1181.381, -330.847, 69.316),
		owner = 'steam:11000013f7c756c',
		menu = vector3(1167.814,-323.419,69.281)
	},
	--23
	{
		blip = vector3(620.843, 269.100, 103.089),
		owner = 'steam:11000014892dc83',
		menu = vector3(642.3338,260.2406,103.29)
	},
	--24
	{	
		blip = vector3(2581.321, 362.039, 108.468),
		owner = 'steam:110000147ea8d6a',
		menu = vector3(2559.143,373.4540,108.62)
	},
	--25
	{
		blip = vector3(176.631, -1562.025, 29.263),
		owner = 'steam:110000112da688e',
		menu = vector3(166.8164,-1553.31,29.261)
	},
	--26
	{
		blip = vector3(-319.292, -1471.715, 30.549),
		owner = 'steam:11000014efbf746',
		menu = vector3(-342.512,-1474.94,30.748)
	},
	--27
	{
		blip = vector3(1784.324, 3330.55, 41.253),
		owner = 'steam:11000015b969fc9',
		menu = vector3(1776.246,3327.411,41.433)
	}
}
