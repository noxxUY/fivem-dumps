Config                        	= {}
Config.CopsScaleReward			= true

--Hash of the npc ped. Change only if you know what you are doing.
Config.NPCHash					= 349680864 			

--Random time societies will get alerted. This is a range in seconds.
Config.AlertCopsDelayRangeStart	= 1
Config.AlertCopsDelayRangeEnd	= 10

--If you want to notify more societies add them here. example { "mafia", "bikers" }
Config.AlertExtraSocieties 		= { }

--Self Explained
Config.CargoProviderLocation	= { 
	Sandy = {
		Npc = {x=1308.874, y=4362.171, z=40.546, h = 255.39 },
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 }, 
		CargoDeliveryLocations = { 
			{x=268.1253,y=273.2079,z=104.51,name="Banco Central"},
			{x=1175.386,y=2695.182,z=36.934,name="Banco Sandy"},
			{x=-2945.65,y=478.01,z= 14.26,name="Banco Galicia"},
			{x=-113.29,y=6482.36,z=30.47,name="Banco Paleto"},
			{x=-1212.95,y=-352.679,z=36.289,name="Banco Santander"},
			{x=-360.1,y=-75.88,z=44.66,name="Banco Provincia"},
			{x=135.4777,y=-1050.39,z=28.151,name="Banco Macro"},
			{x=-1398.20,y=-462.003,z=34.479,name="Banco Mazebank"},
			{x=1204.320,y=-3116.18,z=5.5403,name="Puerto"},
		},
	},
	--[[
	Paleto = {
		Npc = {x=44.41331,y=6303.689,z=30.219,h=206.47961425781 },
		SpawnPoint = { x=48.22002,y=6297.381,z=30.852,h=210.12777709961 }, 
		CargoDeliveryLocations = { x=135.4777,y=-1050.39,z=28.151, name = "Banco Macro"},
	},
	Ciudad = {
		Npc = {x=485.3761,y=-3383.65,z=5.0699,h=1.9430981874466 },
		SpawnPoint = { x=491.8819,y=-3373.70,z=5.6760,h=358.4670715332 }, 
		CargoDeliveryLocations = { x = -113.29, y = 6482.36, z = 30.47, name = "Banco Paleto"},
	},
	]]--
}


Config.CargoDeliveryLocations 	= {
	{ x=268.1253, y=273.2079, z=104.51, name = "Banco Central"},
	{ x=1175.386, y=2695.182, z=36.934, name = "Banco Sandy"},
	{ x = -2945.65, y = 478.01, z = 14.26, name = "Banco Galicia"},
	{ x = -113.29, y = 6482.36, z = 30.47, name = "Banco Paleto"},
	{ x=-1212.95, y=-352.679, z=36.289, name = "Banco Santander"},
	{ x = -360.1, y = -75.88, z = 44.66, name = "Banco Provincia"},
	{ x=135.4777,y=-1050.39,z=28.151, name = "Banco Macro"},
	{ x=-1398.20,y=-462.003,z=34.479, name = "Banco Mazebank"},
}


Config.Scenarios = {
	
	{ 
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 }, 
		DeliveryPoint = 6.0,
		VehicleName = "Stockade",
		MinCopsOnline = 1,
		CargoCost = 100000,
		CargoReward = 100000
	
	},

	{ 
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 }, 
		DeliveryPoint = 6.0,
		VehicleName = "Stockade",
		MinCopsOnline = 2,
		CargoCost = 250000,
		CargoReward = 250000
	
	},
	{ 
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 },  
		DeliveryPoint = 6.0,
		VehicleName = "Stockade",
		MinCopsOnline = 3,
		CargoCost = 350000,
		CargoReward = 350000
	
	},
	{ 
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 },  
		DeliveryPoint = 6.0,
		VehicleName = "Stockade",
		MinCopsOnline = 4,
		CargoCost = 500000,
		CargoReward = 500000
	
	},
	{ 
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 },  
		DeliveryPoint = 6.0,
		VehicleName = "Stockade",
		MinCopsOnline = 6,
		CargoCost = 750000,
		CargoReward = 750000
	
	},
	{ 
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 },  
		DeliveryPoint = 6.0,
		VehicleName = "Stockade",
		MinCopsOnline = 8,
		CargoCost = 1000000,
		CargoReward = 1000000
	
	},
	{ 
		SpawnPoint = { x=1316.449, y=4357.913, z=40.530, h=340.67 },  
		DeliveryPoint = 6.0,
		VehicleName = "Stockade",
		MinCopsOnline = 10,
		CargoCost = 2000000,
		CargoReward = 2000000
	
	}
}