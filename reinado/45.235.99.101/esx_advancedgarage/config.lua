Config = {}
Config.Locale  = 'en'

Config.MenuAlign = 'right'
Config.DrawDistance = 20

Config.UseCommand = false -- Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
Config.ParkVehicles = true -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
Config.KickPossibleCheaters = true -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
Config.UseCustomKickMessage = true -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.

Config.GiveSocietyMoney = true -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
Config.ShowVehicleLocation = true -- true = Will show Location of Vehicles in the Garage Menus.
Config.ShowSpacers = true -- true = Shows Spacers in Menus.

Config.PointMarker = {Type = 1, r = 255, g = 255, b = 255, x = 1.5, y = 1.5, z = 1.5} -- Green Color / Standard Size Circle.
Config.DeleteMarker = {Type = 1, r = 255, g = 0, b = 0, x = 2.5, y = 2.5, z = 2.5} -- Red Color / Big Size Circle.
Config.PoundMarker = {Type = 1, r = 0, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.5} -- Blue Color / Standard Size Circle.
Config.JPoundMarker = {Type = 20, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.5} -- Red Color / Standard Size Circle.

Config.GarageBlip = {Sprite = 290, Color = 38, Display = 2, Scale = 0.1} -- Public Garage Blip.
Config.PGarageBlip = {Sprite = 290, Color = 53, Display = 2, Scale = 0.1} -- Private Garage Blip.
Config.PoundBlip = {Sprite = 67, Color = 64, Display = 2, Scale = 0.1} -- Pound Blip.
Config.JGarageBlip = {Sprite = 290, Color = 49, Display = 2, Scale = 0.1} -- Job Garage Blip.
Config.JPoundBlip = {Sprite = 67, Color = 49, Display = 2, Scale = 0.1} -- Job Pound Blip.

Config.PoundWait = 2 -- How many Minutes someone must wait before Opening Pound Menu Again.
Config.JPoundWait = 10 -- How many Minutes someone must wait before Opening Job Pound Menu Again.

Config.UseDamageMult = true -- true = Costs more to Store a Broken/Damaged Vehicle.
Config.DamageMult = 1 -- Higher Number = Higher Repair Price.

Config.UsingAdvancedVehicleShop = true -- Set to true if using esx_advancedvehicleshop

Config.UseAmbulanceGarages = true -- true = Allows use of Ambulance Garages.
Config.UseAmbulancePounds = true -- true = Allows use of Ambulance Pounds.
Config.UseAmbulanceBlips = true -- true = Use Ambulance Blips.
Config.AmbulancePoundPrice = 80 -- How much it Costs to get Vehicle from Ambulance Pound.

Config.UsePoliceGarages = true -- true = Allows use of Police Garages.
Config.UsePolicePounds = true -- true = Allows use of Police Pounds.
Config.UsePoliceBlips = true -- true = Use Police Blips.
Config.PolicePoundPrice = 10000 -- How much it Costs to get Vehicle from Police Pound.

Config.UseProsegurPounds = true -- true = Allows use of Police Pounds.

Config.UseAircraftGarages = false -- true = Allows use of Aircraft Garages.
Config.UseAircraftBlips = false -- true = Use Aircraft Blips.
Config.AircraftPoundPrice = 2500 -- How much it Costs to get Vehicle from Aircraft Pound.

Config.UseBoatGarages = true -- true = Allows use of Boat Garages.
Config.UseBoatBlips = true -- true = Use Boat Blips.
Config.BoatPoundPrice = 25000 -- How much it Costs to get Vehicle from Boat Pound.

Config.UseCarGarages = true -- true = Allows use of Car Garages.
Config.UseCarBlips = true -- true = Use Car Blips.
Config.CarPoundPrice = 8000 -- How much it Costs to get Vehicle from Car Pound.

Config.UsePrivateCarGarages = true -- true = Allows use of Private Car Garages.

-- Marker = Enter Location | Spawner = Spawn Location | Spawner2 = Job Aircraft Spawn Location | Deleter = Delete Location
-- Deleter2 = Job Aircraft Delete Location | Heading = Spawn Heading | Heading2 = Job Aircraft Spawn Heading

-- Start of Ambulance
Config.AmbulanceGarages = {
	Los_Santos = {
		Marker = vector3(-826.2756, -1227.5306, 5.9341),
		Spawner = vector3(-839.4732, -1224.7234, 5.9341),
		Deleter = vector3(-848.3698, -1226.7776, 5.7469),
		Heading = 51.8655
	},
	SandyHospi = {
		Marker = vector3(1837.4280, 3695.6179, 33.2690),
		Spawner = vector3(1843.3695, 3705.3010, 33.6680),
		Deleter = vector3(1843.3695, 3705.3010, 32.6680),
		Heading = 4.3786
	},
	PaletoHospi = {
		Marker = vector3(-245.5370, 6332.8262, 31.4894),
		Spawner = vector3(-239.5975, 6334.4634, 32.3783),
		Deleter = vector3(-239.5975, 6334.4634, 31.3783),
		Heading = 221.2277
	}
}



Config.AmbulancePounds = {
	Los_Santos = {
		Marker = vector3(-678.0778, 339.8575, 77.2183),
		Spawner = vector3(-669.6655, 344.5546, 78.1184),
		Deleter = vector3(-669.6655, 344.5546, 77.2184),
		Heading = 82.6357
	}
}
-- End of Ambulance

-- Start of Police
Config.PoliceGarages = {
	Los_Santos = {
		Marker = vector3(425.41, -1003.43, 29.71),
		Spawner = vector3(434.28, -1015.8, 28.83),
		Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(462.95, -1014.56, 27.07),
		Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 90.46,
		Heading2 = 184.53
	}
}

Config.PolicePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}

Config.ProsegurPounds = {
	Los_Santo = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Police

-- Start of Aircrafts
Config.AircraftGarages = {
	Los_Santos_Airport = {
		Marker = vector3(-1617.14, -3145.52, 12.99),
		Spawner = vector3(-1657.99, -3134.38, 12.99),
		Deleter = vector3(-1642.12, -3144.25, 12.99),
		Heading = 330.11
	},
	--[[ Sandy_Shores_Airport = {
		Marker = vector3(1723.84, 3288.29, 40.16),
		Spawner = vector3(1710.85, 3259.06, 40.69),
		Deleter = vector3(1714.45, 3246.75, 40.07),
		Heading = 104.66
	}, ]]
	Grapeseed_Airport = {
		Marker = vector3(2152.83, 4797.03, 40.19),
		Spawner = vector3(2122.72, 4804.85, 40.78),
		Deleter = vector3(2082.36, 4806.06, 40.07),
		Heading = 115.04
	}
}

Config.AircraftPounds = {
	Los_Santos_Airport = {
		Marker = vector3(-1243.0, -3391.92, 12.94),
		Spawner = vector3(-1272.27, -3382.46, 12.94),
		Heading = 330.25
	}
}
-- End of Aircrafts

-- Start of Boats
Config.BoatGarages = {
	Los_Santos_Dock = {
		Marker = vector3(-736.0668, -1324.7938, 1.5952),
		Spawner = vector3(-718.87, -1320.18, -0.47),
		Deleter = vector3(-731.15, -1334.71, -0.47),
		Heading = 45.0
	},
	Sandy_Shores_Dock = {
		Marker = vector3(1333.2, 4269.92, 30.5),
		Spawner = vector3(1334.61, 4264.68, 29.86),
		Deleter = vector3(1323.73, 4269.94, 29.86),
		Heading = 87.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-283.74, 6629.51, 6.3),
		Spawner = vector3(-290.46, 6622.72, -0.47),
		Deleter = vector3(-304.66, 6607.36, -0.47),
		Heading = 52.0
	}
}

Config.BoatPounds = {
	Los_Santos_Dock = {
		Marker = vector3(-738.67, -1400.43, 4.0),
		Spawner = vector3(-738.33, -1381.51, 0.12),
		Heading = 137.85
	},
	Sandy_Shores_Dock = {
		Marker = vector3(1299.36, 4217.93, 32.91),
		Spawner = vector3(1294.35, 4226.31, 29.86),
		Heading = 345.0
	}, 
	Paleto_Bay_Dock = {
		Marker = vector3(-270.2, 6642.43, 6.36),
		Spawner = vector3(-290.38, 6638.54, -0.47),
		Heading = 130.0
	}
}
-- End of Boats

-- Start of Cars
Config.CarGarages = {

	Mineros_Lavado = {
		Marker = vector3(1862.2706, 273.5728, 163.2734),
		Spawner = vector3(1871.8806, 280.3163, 164.3044),
		Deleter = vector3(1871.8806, 280.3163, 163.3044),
		Heading = 110.3517

	},

	Psg_Base = {
		Marker = vector3(607.1910, 2785.1067, 41.2086),
		Spawner = vector3(602.3497, 2798.5483, 41.9146),
		Deleter = vector3(602.3497, 2798.5483, 41.1146),
		Heading = 85.7745

	},

	LS_Custom = {
		Marker = vector3(842.0056, -928.4807, 25.5989),
		Spawner = vector3(836.8911, -941.7889, 26.4989),
		Deleter = vector3(836.8911, -941.7889, 25.5989),
		Heading = 90.4100

	},


	CercaPoli_GC = {
		Marker = vector3(878.6233, -1221.8290, 24.6582),
		Spawner = vector3(906.8156, -1224.3408, 25.5059),
		Deleter = vector3(906.8156, -1224.3408, 24.6059),
		Heading = 178.5196
	},

	Bennys_GC = {
		Marker = vector3(-208.9662, -1308.0073, 30.2908),
		Spawner = vector3(-185.8168, -1274.2422, 31.2961),
		Deleter = vector3(-185.8168, -1274.2422, 30.2961),
		Heading = 89.9887
	},

	Mineria_Gc = {
		Marker = vector3(2969.7114, 2837.0444, 44.0809),
		Spawner = vector3(2973.9985, 2820.7998, 44.1255),
		Deleter = vector3(2973.9985, 2820.7998, 43.0255),
		Heading = 40.7861
	},

	Hospital_Nuevo = {
		Marker = vector3(-556.8681, 331.7371, 83.4924),
		Spawner = vector3(-576.5706, 323.2478, 84.6672),
		Deleter = vector3(-567.6270, 335.7298, 83.5648),
		Heading = 352.2289
	},
	
	Hospital_City = {
		Marker = vector3(-803.1841, -1112.6296, 9.5342),
		Spawner = vector3(-810.8593, -1104.2773, 10.8109),
		Deleter = vector3(-814.1338, -1095.9932, 9.8333),
		Heading = 305.7293
	},
	
	

	Plaza_Cubo = {
		Marker = vector3(213.4384, -809.4712, 30.0149),
		Spawner = vector3(217.8279, -782.3627, 30.8120),
		Deleter = vector3(217.8279, -782.3627, 30.1120),
		Heading = 4.3209
	},
	Sandy_Shores = {
		Marker = vector3(1737.59, 3710.2, 33.14),
		Spawner = vector3(1737.84, 3719.28, 33.04),
		Deleter = vector3(1722.66, 3713.74, 33.21),
		Heading = 21.22
	},
	Sandyy_Shoress = {
		Marker = vector3(1723.84, 3288.29, 40.16),
		Spawner = vector3(1710.85, 3259.06, 40.69),
		Deleter = vector3(1714.45, 3246.75, 40.07),
		Heading = 104.66
	},
	Paleto_Bay = {
		Marker = vector3(105.36, 6613.59, 31.40),
		Spawner = vector3(128.78, 6622.99, 30.78),
		Deleter = vector3(126.36, 6608.41, 30.86),
		Heading = 315.01
	},
	Ciudad_cincotrescinco = {
		Marker = vector3(-340.88, 266.84, 84.68),
		Spawner = vector3(-345.18,299.11, 85.19),
		Deleter = vector3(-334.1, 284.0, 84.84),
		Heading = 179.19
	},
	Ruta_iz = {
		Marker = vector3(-2959.062, 373.4000, 13.85),
		Spawner = vector3(-2972.12, 356.357, 14.772),
		Deleter = vector3(-2970.01, 372.401, 13.85),
		Heading = 165.01
	},
	Ruto_izz = {
		Marker = vector3(-2206.57, 4276.48, 47.38),
		Spawner = vector3(-2209.52, 4248.92, 47.44),
		Deleter = vector3(-2192.57, 4263.24, 47.60),
		Heading = 60.04
	},
	Casino_esta = {
		Marker = vector3(895.02, 2.28, 78.0),
		Spawner = vector3(901.76, -9.44, 78.76),
		Deleter = vector3(920.04, -30.3, 77.9),
		Heading = 155.97
	},
	Prision_esta = {
		Marker = vector3(1898.96, 2605.22, 45.0),
		Spawner = vector3(1888.96, 2601.58, 45.71),
		Deleter = vector3(1909.85, 2609.33, 44.93),
		Heading = 272.71
	}
	--[[,
	GroveStreet = {
		Marker = vector3(-57.66, -1827.52, 25.89),
		Spawner = vector3(-75.85, -1829.48, 26.94),
		Deleter = vector3(-44.88, -1840.61, 25.21),
		Heading = 322.23
	}]]
	
	
	
}
--[[
Config.CarPounds = {
	Los_Santos = {
		Marker = vector3(408.61, -1625.47, 28.29),
		Spawner = vector3(405.64, -1643.4, 27.61),
		Heading = 229.54
	},
	Sandy_Shores = {
		Marker = vector3(1651.38, 3804.84, 37.65),
		Spawner = vector3(1627.84, 3788.45, 33.77),
		Heading = 308.53
	},
	Paleto_Bay = {
		Marker = vector3(-234.82, 6198.65, 30.94),
		Spawner = vector3(-230.08, 6190.24, 30.49),
		Heading = 140.24
	}
}
--]]


Config.CarPounds = {
	Psg_Deposito = {
		Marker = vector3(603.3477, 2784.8716, 42.2076),
		Spawner = vector3(601.7567, 2806.4233, 41.9364),
		Heading = 96.8978
	},
	Aserrapouns = {
		Marker = vector3(1215.1872558594, -1270.6650390625, 35.375095367432),
		Spawner = vector3(1209.3728027344, -1261.9169921875, 35.226776123047),
		Heading = 79.083740234375
	},
	Los_Santos = {
		Marker = vector3(409.61, -1623.75, 28.39),
		Spawner = vector3(407.54, -1644.32, 30.29),
		Heading = 222.32
	},
	 Plaza_Gc = {
		Marker = vector3(219.5204, -811.3214, 29.6272),
		Spawner = vector3(231.9116, -796.9871, 30.5625),
		Heading = 176.0693
	},
	Casino_Gc = {
		Marker = vector3(886.3795, 7.7933, 77.9026),
		Spawner = vector3(874.9984, -15.5709, 78.7641),
		Heading = 148.0947
	},
	Sieteuno_Seissiete = {
		Marker = vector3(-1286.4927, -260.5735, 39.1921),
		Spawner = vector3(-1294.3947, -265.8352, 39.6484),
		Heading = 130.5477
	},
	Sandy_Gc = {
		Marker = vector3(1705.2509, 3756.8506, 33.3365),
		Spawner = vector3(1710.4283, 3765.4629, 34.3079),
		Heading = 212.2841
	},
	Paleto_Gc = {
		Marker = vector3(123.4461, 6627.3154, 30.9249),
		Spawner = vector3(130.4068, 6621.0591, 31.7531),
		Heading = 229.1343
	},
	Cero_Gc = {
		Marker = vector3(-2203.0862, 4274.1265, 47.3072),
		Spawner = vector3(-2201.7939, 4261.4790, 47.8898),
		Heading = 162.2635
	},
	Ceroaba_Gc = {
		Marker = vector3(-2962.1614, 374.5485, 13.8095),
		Spawner = vector3(-2967.7861, 365.5207, 14.7699),
		Heading = 150.0763
	},
	Alado_Lossantos = {
		Marker = vector3(-158.0391, -185.1044, 42.7835),
		Spawner = vector3(-159.7192, -164.3571, 43.6212),
		Heading = 161.7575
	},
	Alado_Gymnasio = {
		Marker = vector3(-1185.3641, -1507.8164, 3.3797),
		Spawner = vector3(-1192.4929, -1489.6351, 4.3797),
		Heading = 208.6033
	}
	
}
-- End of Cars

-- Start of Private Cars
Config.PrivateCarGarages = {


	Mafia_Gesqw = {
		Marker = vector3(-1551.8835, 18.6940, 57.7754),
		Spawner = vector3(-1552.1908, 27.1665, 58.4050),
		Deleter = vector3(-1552.1908, 27.1665, 57.5050),
		Heading = 340.0743
	},
	Mansion_Play_boy = {
		Marker = vector3(-1533.0680, 100.0055, 56.7597),
		Spawner = vector3(-1525.6147, 91.3891, 56.5242),
		Deleter = vector3(-1525.6147, 91.3891, 55.5242),
		Heading = 226.3656
	},
	GaragePrivado_Uno = {
		Marker = vector3(495.3384, -1338.2101, 29.3216),
		Spawner = vector3(489.6599, -1336.7313, 29.3189),
		Deleter = vector3(489.6599, -1336.7313, 29.3189),
		Heading = 341.6532
	},
	
	Mafia_226 = {
		Marker = vector3(720.7112, -1093.2610, 22.2830),
		Spawner = vector3(709.8685, -1083.8164, 22.4081),
		Deleter = vector3(709.8685, -1083.8164, 22.4081),
		Heading = 359.7659
	},
	 Mafia_838 = {
		Marker = vector3(-1797.7747, 454.6238, 127.3088),
		Spawner = vector3(-1814.3547, 458.8109, 128.3224),
		Deleter = vector3(-1814.3547, 458.8109, 126.5224),
		Heading = 78.4318
	}, 
	
	Monkeys_Garage = {
		Marker = vector3(-321.6018, -148.7222, 35.2150),
		Spawner = vector3(-330.2064, -158.6931, 36.2149),
		Deleter = vector3(-330.2064, -158.6931, 35.3149),
		Heading = 252.0723
	},
    
    
	Mafia_casamikela12 = {
		Marker = vector3(-819.75, 179.38, 71.15),
		Spawner = vector3(-822.71,182.89,70.88),
		Deleter = vector3(-822.71,182.89,70.91),
		Heading = 138.58
	},
	La_Diezocho = {
		Marker = vector3(-1899.63, 2053.85, 139.91),
		Spawner = vector3(-1899.43, 2036.31, 139.78),
		Deleter = vector3(-1899.43, 2036.31, 139.78),
		Heading = 157.79
	},   
    
    No_Names = {
		Marker = vector3(-1457.87, -36.88, 53.73),
		Spawner = vector3(-1464.06, -25.21, 53.68),
		Deleter = vector3(-1464.06, -25.21, 53.68),
		Heading = 233.89
	}, 
    

	Mafia_nb_12 = {
		Marker = vector3(-161.14, 920.41, 234.73),
		Spawner = vector3(-154.88, 923.3, 234.66),
		Deleter = vector3(-168.47, 918.0, 234.73),
		Heading = 225.41
	},
    
    
    
	Mafia_910 = {
		Marker = vector3(-2586.76, 1927.30, 166.32),
		Spawner = vector3(-2588.67, 1930.88, 166.30),
		Deleter = vector3(-2596.11, 1930.07, 166.32),
		Heading = 273.03
	},

	Mafia_1035 = {
		Marker = vector3(1980.93, 3823.54, 31.78),
		Spawner = vector3(1976.69, 3826.83, 31.38),
		Deleter = vector3(1976.69, 3826.83, 31.78),
		Heading = 298.91
	},
    
    
	Mafia_844 = {
		Marker = vector3(-1524.56, 875.78, 180.91),
		Spawner = vector3(-1531.35, 890.63, 180.91),
		Deleter = vector3(-1531.35, 890.63, 180.91),
		Heading = 200.68
	},
    
	Mafia_150 = {
		Marker = vector3(95.8, 594.79, 197.48),
		Spawner = vector3(92.8, 599.79, 197.48),
		Deleter = vector3(92.8, 599.79, 197.48),
		Heading = 123.12
	},
    
	Mafia_vinewood = {
		Marker = vector3(822.03,1043.52,292.57),
		Spawner = vector3(825.03,1039.10,290.57),
		Deleter = vector3(825.03,1039.10,292.57),
		Heading = 257.62
	},
    
	Mafia_vinewoodheli = {
		Marker = vector3(835.32,1053.26,309.54),
		Spawner = vector3(826.96,1057.28,309.45),
		Deleter = vector3(826.96,1057.28,309.45),
		Heading = 257.62
	},
    
    Mafia_losMonos = {
        Marker = vector3(-1728.59,-590.26,37.85),
        Spawner = vector3(-1734.91,-589.37,37.90),
        Deleter = vector3(-1734.91,-589.37,37.90),
        Heading = 339.03
    },

	-- Maze Bank Building Garages
	MazeBankBuilding_Main = {
		Private = "MazeBankBuilding",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveRich = {
		Private = "ExecutiveRich",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveCool = {
		Private = "ExecutiveCool",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	LomBank_Main = {
		Private = "LomBank",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	MazeBankWest_Main = {
		Private = "MazeBankWest",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	IntegrityWay_Main = {
		Private = "IntegrityWay",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	IntegrityWay_IntegrityWay28 = {
		Private = "IntegrityWay28",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	IntegrityWay_IntegrityWay30 = {
		Private = "IntegrityWay30",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	DellPerroHeights_Main = {
		Private = "DellPerroHeights",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	DellPerroHeights_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	DellPerroHeights_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	MiltonDrive_Main = {
		Private = "MiltonDrive",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern1Apartment = {
		Private = "Modern1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern2Apartment = {
		Private = "Modern2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern3Apartment = {
		Private = "Modern3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody1Apartment = {
		Private = "Mody1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody2Apartment = {
		Private = "Mody2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody3Apartment = {
		Private = "Mody3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal1Apartment = {
		Private = "Regal1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal2Apartment = {
		Private = "Regal2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal3Apartment = {
		Private = "Regal3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	RichardMajesticApt2_Main = {
		Private = "RichardMajesticApt2",
		Marker = vector3(-887.5, -349.58, 33.53),
		Spawner = vector3(-886.03, -343.78, 33.53),
		Deleter = vector3(-894.32, -349.33, 33.53),
		Heading = 206.79
	},
	WildOatsDrive_Main = {
		Private = "WildOatsDrive",
		Marker = vector3(-178.65, 503.45, 135.85),
		Spawner = vector3(-189.98, 505.8, 133.48),
		Deleter = vector3(-189.28, 500.56, 132.93),
		Heading = 282.62
	},
	WhispymoundDrive_Main = {
		Private = "WhispymoundDrive",
		Marker = vector3(123.65, 565.75, 183.04),
		Spawner = vector3(130.11, 571.47, 182.42),
		Deleter = vector3(131.97, 566.77, 181.95),
		Heading = 270.71
	},
	NorthConkerAvenue2044_Main = {
		Private = "NorthConkerAvenue2044",
		Marker = vector3(348.18, 443.01, 146.7),
		Spawner = vector3(358.39, 437.06, 144.27),
		Deleter = vector3(351.38, 438.86, 145.66),
		Heading = 285.911
	},
	NorthConkerAvenue2045_Main = {
		Private = "NorthConkerAvenue2045",
		Marker = vector3(370.69, 430.76, 144.11),
		Spawner = vector3(392.88, 434.54, 142.17),
		Deleter = vector3(389.72, 429.95, 141.81),
		Heading = 264.94
	},
	HillcrestAvenue2862_Main = {
		Private = "HillcrestAvenue2862",
		Marker = vector3(-688.71, 597.57, 142.64),
		Spawner = vector3(-683.72, 609.88, 143.28),
		Deleter = vector3(-685.26, 601.08, 142.36),
		Heading = 338.06
	},
	HillcrestAvenue2868_Main = {
		Private = "HillcrestAvenue2868",
		Marker = vector3(-752.75, 624.90, 141.2),
		Spawner = vector3(-749.32, 628.61, 141.48),
		Deleter = vector3(-754.28, 631.58, 141.2),
		Heading = 197.14
	},
	HillcrestAvenue2874_Main = {
		Private = "HillcrestAvenue2874",
		Marker = vector3(-859.01, 695.95, 147.93),
		Spawner = vector3(-860.5978, 706.1143, 149.082),
		Deleter = vector3(-860.5978, 706.1143, 148.082),
		Heading = 280.680
	},
	MadWayneThunder_Main = {
		Private = "MadWayneThunder",
		Marker = vector3(-1290.95, 454.52, 96.66),
		Spawner = vector3(-1297.62, 459.28, 96.48),
		Deleter = vector3(-1298.09, 468.95, 96.0),
		Heading = 285.652
	},
	TinselTowersApt12_Main = {
		Private = "TinselTowersApt12",
		Marker = vector3(-616.74, 56.38, 42.73),
		Spawner = vector3(-620.59, 60.10, 42.73),
		Deleter = vector3(-621.13, 52.69, 42.73),
		Heading = 109.316
	},
	-- End of Single Garages
	-- Start of VENT Custom Garages
	MedEndApartment1_Main = {
		Private = "MedEndApartment1",
		Marker = vector3(240.23, 3102.84, 41.49),
		Spawner = vector3(233.58, 3094.29, 41.49),
		Deleter = vector3(237.52, 3112.63, 41.39),
		Heading = 93.91
	},
	MedEndApartment2_Main = {
		Private = "MedEndApartment2",
		Marker = vector3(246.08, 3174.63, 41.72),
		Spawner = vector3(234.15, 3164.37, 41.54),
		Deleter = vector3(240.72, 3165.53, 41.65),
		Heading = 102.03
	},
	MedEndApartment3_Main = {
		Private = "MedEndApartment3",
		Marker = vector3(984.92, 2668.95, 39.06),
		Spawner = vector3(993.96, 2672.68, 39.06),
		Deleter = vector3(994.04, 2662.1, 39.13),
		Heading = 0.61
	},
	MedEndApartment4_Main = {
		Private = "MedEndApartment4",
		Marker = vector3(196.49, 3027.48, 42.89),
		Spawner = vector3(203.1, 3039.47, 42.08),
		Deleter = vector3(192.24, 3037.95, 42.89),
		Heading = 271.3
	},
	MedEndApartment5_Main = {
		Private = "MedEndApartment5",
		Marker = vector3(1724.49, 4638.13, 42.31),
		Spawner = vector3(1723.98, 4630.19, 42.23),
		Deleter = vector3(1733.66, 4635.08, 42.24),
		Heading = 117.88
	},
	MedEndApartment6_Main = {
		Private = "MedEndApartment6",
		Marker = vector3(1670.76, 4740.99, 41.08),
		Spawner = vector3(1673.47, 4756.51, 40.91),
		Deleter = vector3(1668.46, 4750.83, 40.88),
		Heading = 12.82
	},
	MedEndApartment7_Main = {
		Private = "MedEndApartment7",
		Marker = vector3(15.24, 6573.38, 31.72),
		Spawner = vector3(16.77, 6581.68, 31.42),
		Deleter = vector3(10.45, 6588.04, 31.47),
		Heading = 222.6
	},
	MedEndApartment8_Main = {
		Private = "MedEndApartment8",
		Marker = vector3(-374.73, 6187.06, 30.54),
		Spawner = vector3(-377.97, 6183.73, 30.49),
		Deleter = vector3(-383.31, 6188.85, 30.49),
		Heading = 223.71
	},
	MedEndApartment9_Main = {
		Private = "MedEndApartment9",
		Marker = vector3(-24.6, 6605.99, 30.45),
		Spawner = vector3(-16.0, 6607.74, 30.18),
		Deleter = vector3(-9.36, 6598.86, 30.47),
		Heading = 35.31
	},
	MedEndApartment10_Main = {
		Private = "MedEndApartment10",
		Marker = vector3(-365.18, 6323.95, 28.9),
		Spawner = vector3(-359.49, 6327.41, 28.83),
		Deleter = vector3(-353.47, 6334.57, 28.83),
		Heading = 218.58
	}
	-- End of VENT Custom Garages
}
-- End of Private Cars
