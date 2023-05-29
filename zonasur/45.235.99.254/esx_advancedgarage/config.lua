Config = {}
Config.Locale = 'es'

Config.MenuAlign = 'bottom-right'
Config.DrawDistance = 100

Config.UseCommand = false -- Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
Config.ParkVehicles = true -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
Config.KickPossibleCheaters = true -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
Config.UseCustomKickMessage = false -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.

Config.GiveSocietyMoney = true -- Le damos $100 a mechanic2 por cada auto o bote que se saque de deposito.
Config.ShowVehicleLocation = true -- true = Will show Location of Vehicles in the Garage Menus.
Config.ShowSpacers = true -- true = Shows Spacers in Menus.

Config.PointMarker = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Green Color / Standard Size Circle.
Config.DeleteMarker = {Type = 27, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Red Color / Big Size Circle.
Config.PoundMarker = {Type = 29, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Blue Color / Standard Size Circle.
Config.JPoundMarker = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Red Color / Standard Size Circle.

Config.GarageBlip = {Sprite = 290, Color = 38, Display = 2, Scale = 0.7} -- Public Garage Blip.
Config.BoatBlip = {Sprite = 290, Color = 38, Display = 2, Scale = 0.7} -- Public Garage Blip.
Config.PGarageBlip = {Sprite = 290, Color = 53, Display = 2, Scale = 0.7} -- Private Garage Blip.
Config.PoundBlip = {Sprite = 67, Color = 64, Display = 2, Scale = 0.7} -- Pound Blip.
Config.JGarageBlip = {Sprite = 290, Color = 49, Display = 2, Scale = 0.7} -- Job Garage Blip.
Config.JPoundBlip = {Sprite = 67, Color = 49, Display = 2, Scale = 0.7} -- Job Pound Blip.

Config.PoundWait = 0 -- Cuántos minutos debe esperar alguien antes de abrir nuevamente el menú de libra.
Config.JPoundWait = 0 -- ¿Cuántos minutos debe esperar alguien antes de abrir nuevamente el menú Job Pound?

Config.UseDamageMult = false -- true = Costs more to Store a Broken/Damaged Vehicle.
Config.DamageMult = 5 -- Higher Number = Higher Repair Price.

Config.UsingAdvancedVehicleShop = false -- Set to true if using esx_advancedvehicleshop

Config.UseAmbulanceGarages = true -- true = Allows use of Ambulance Garages.
Config.UseAmbulancePounds = false -- true = Allows use of Ambulance Pounds.
Config.UseAmbulanceBlips = false -- true = Use Ambulance Blips.
Config.AmbulancePoundPrice = 80 -- How much it Costs to get Vehicle from Ambulance Pound.

Config.UsePoliceGarages = true -- true = Allows use of Police Garages.
Config.UsePolicePounds = false -- true = Allows use of Police Pounds.
Config.UsePoliceBlips = false -- true = Use Police Blips.
Config.PolicePoundPrice = 80 -- How much it Costs to get Vehicle from Police Pound.

Config.UseTaxiGarages = true

Config.UseAircraftGarages = true -- true = Allows use of Aircraft Garages.
Config.UseAircraftBlips = true -- true = Use Aircraft Blips.
Config.AircraftPoundPrice = 5000 -- How much it Costs to get Vehicle from Aircraft Pound.

Config.UseBoatGarages = true -- true = Allows use of Boat Garages.
Config.UseBoatBlips = true -- true = Use Boat Blips.
Config.BoatPoundPrice = 3000 -- How much it Costs to get Vehicle from Boat Pound.

Config.UseCarGarages = true -- true = Allows use of Car Garages.
Config.UseCarBlips = true -- true = Use Car Blips.
Config.CarPoundPrice = 3000 -- How much it Costs to get Vehicle from Car Pound.

Config.UsePrivateCarGarages = true -- true = Allows use of Private Car Garages.

Config.UseProSegurGarages = true
Config.UseTelefeGarages = true
Config.UsePFAGarages = true
-- Marker = Enter Location | Spawner = Spawn Location | Spawner2 = Job Aircraft Spawn Location | Deleter = Delete Location
-- Deleter2 = Job Aircraft Delete Location | Heading = Spawn Heading | Heading2 = Job Aircraft Spawn Heading

--PFA GARAGE PALETO

Config.PFAGarages = {
	Los_Santos = {
		Marker = vector3(-456.664,6032.716,31.485),
		Spawner = vector3(-442.887,6038.848,31.340),
		--Spawner2 = vector3(313.36, -1465.17, 46.51),
		Deleter = vector3(-434.922,6032.011,31.340),
		--Deleter2 = vector3(352.32, -587.99, 72.80),
		Heading = 299.50045776367,
		--Heading2 = 318.34
	}
}
-- Start of Ambulance
Config.AmbulanceGarages = {
	Los_Santos = {
		Marker = vector3(-862.545,-1227.45,6.4482),
		Spawner = vector3(-859.521,-1220.74,5.6893),
		--Spawner2 = vector3(313.36, -1465.17, 46.51),
		Deleter = vector3(-859.521,-1220.74,5.6893),
		--Deleter2 = vector3(352.32, -587.99, 72.80),
		Heading = 322.92288208008,
		--Heading2 = 318.34
	}
}

Config.AmbulancePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Ambulance

--Taxi
Config.TaxiGarages = {
	Los_Santos = {
		Marker = vector3(895.1015, -182.985, 73.723),
		Spawner = vector3(897.5101, -183.559, 73.004),
		--Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(899.2106, -180.250, 73.827 - 0.95),
		--Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 237.59,
		--Heading2 = 184.53
	}
}

-- Start of Police
Config.PoliceGarages = {
	Los_Santos = {
		Marker = vector3(425.41, -1003.43, 30.71),
		Spawner = vector3(434.28, -1015.8, 28.83),
		--Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(436.4783,-996.967,25.764 - 0.97),
		--Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 90.46,
		--Heading2 = 184.53
	}
}

-- GC PROSEGUR
Config.ProsegurGarages = {
	Los_Santos = {
		Marker = vector3(-162.826, -584.502, 32.424),
		Spawner = vector3(-168.654, -584.689, 32.238),
		--Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(-166.529, -580.723, 32.424 - 0.95),
		--Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 248.62,
		--Heading2 = 184.53
	}
}

-- GC PROSEGUR
Config.TelefeGarages = {
	Los_Santos = {
		Marker = vector3(-535.170,-906.396,23.864),
		Spawner = vector3(-537.234,-905.285,23.094),
		--Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(-541.443,-912.375,23.861 - 0.95),
		--Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 59.616012573242,
		--Heading2 = 184.53
	}
}

Config.PolicePounds = {
	Los_Santos = {
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
		Deleter = vector3(-1641.94, -3143.92, 13.992 - 0.95),
		Heading = 330.11,
		StoreTP = vector4(-1615.45, -3141.30, 13.991, 59.58)
	},
	Sandy_Shores_Airport = {
		Marker = vector3(1723.84, 3288.29, 40.16),
		Spawner = vector3(1710.85, 3259.06, 40.69),
		Deleter = vector3(1715.167, 3247.023, 41.101 - 0.95),
		Heading = 104.66,
		StoreTP = vector4(1723.84, 3288.29, 40.16, 318.9)
	},
	Grapeseed_Airport = {
		Marker = vector3(2152.83, 4797.03, 40.19),
		Spawner = vector3(2122.72, 4804.85, 40.78),
		Deleter = vector3(2129.365, 4808.616, 41.195 - 0.95),
		Heading = 115.04,
		StoreTP = vector4(2152.83, 4797.03, 40.19, 318.9)
	},
	Cayo_Airport = {
		Marker = vector3(4455.305, -4476.99, 3.2886),
		Spawner = vector3(4451.519, -4494.55, 4.0997),
		Deleter = vector3(4448.911, -4485.97, 4.2214 - 0.95),
		Heading = 198.92,
		StoreTP = vector4(4455.305, -4476.99, 4.2886, 318.9)
	},
}

Config.AircraftPounds = {
	Los_Santos_Airport = {
		Marker = vector3(-1243.02, -3391.99, 13.940),
		Spawner = vector3(-1272.27, -3382.46, 12.94),
		Heading = 330.25
	}
}
-- End of Aircrafts

-- Start of Boats
Config.BoatGarages = {
	Los_Santos_Dock = {
		Marker = vector3(-772.4, -1430.9, 1.5),
		Spawner = vector3(-785.39, -1426.3, 0.0),
		Deleter = vector3(-798.4, -1456.0, 0.0),
		Heading = 146.0,
		StoreTP = vector4(-791.4, -1452.5, 1.5, 318.9)
	},
	Sandy_Shores_Dock = {
		Marker = vector3(3864.9, 4463.9, 2.6),
		Spawner = vector3(3854.4, 4477.2, 0.0),
		Deleter = vector3(3857.0, 4446.9, 0.0),
		Heading = 273.0,
		StoreTP = vector4(3854.7, 4458.6, 1.8, 355.3)
	},
	Muelle_Pesquero = {
		Marker = vector3(-3426.3, 976.0, 8.3), --cambiar por la pesca 1
		Spawner = vector3(-3448.9, 995.0, 0.0),
		Deleter = vector3(-3436.5, 995.0, 0.3),
		Heading = 75.0,
		StoreTP = vector4(-3427.0, 952.6, 8.3, 0.0)
	},
	Paleto_Bay = {
		Marker = vector3(-282.04, 6626.84, 7.25), --cambiar por la pesca 1
		Spawner = vector3(-286.35, 6621.8, -0.25),
		Deleter = vector3(-286.35, 6621.8, 0.0),
		Heading = 48.25,
		StoreTP = vector4(-282.04, 6626.84, 6.25, 317.93)
	},
	Sandy_Laguna = {
		Marker = vector3(714.08, 4152.48, 35.79),
		Spawner = vector3(707.72, 4110.25, 30.52),
		Deleter = vector3(707.72, 4110.25, 29.65),
		Heading = 174.45,
		StoreTP = vector4(712.02, 4110.29, 31.3, 176.23)
	},
	Puerto = {
		Marker = vector3(45.87, -2792.91, 5.72),
		Spawner = vector3(53.53, -2784.43, 0.94),
		Deleter = vector3(53.53, -2784.43, 0.94),
		Heading = 182.85,
		StoreTP = vector4(45.87, -2792.91, 5.72, 358.69)
	},
	Flamingo = {
		Marker = vector3(-2351.66,-559.087,2.4766),
		Spawner = vector3(-2347.26,-553.568,0.8048),
		Deleter = vector3(-2347.26,-553.568,0.1048),
		Heading = 42.206565856934,
		StoreTP = vector4(-2351.57,-558.970,2.4766,134.05244445801)
	},
}

Config.BoatPounds = {
	Los_Santos_Dock = {
		Marker = vector3(-738.67, -1400.43, 5.0),
		Spawner = vector3(-738.33, -1381.51, 0.12),
		Heading = 137.85
	},
	Sandy_Shores_Dock = {
		Marker = vector3(1299.36, 4217.93, 33.91),
		Spawner = vector3(1294.35, 4226.31, 29.86),
		Heading = 345.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-270.2, 6642.43, 7.36),
		Spawner = vector3(-290.38, 6638.54, -0.47),
		Heading = 130.0
	},
}
-- End of Boats

-- Start of Cars
Config.CarGarages = {
	--[[
	playa1 = {
		Marker = vector3(-2031.18, -466.036, 11.603),
		Spawner = vector3(-2034.29, -470.163, 10.581),
		Deleter = vector3(-2052.99, -461.945, 11.608 - 0.95),
		Heading = 228.61
	},
	playa2 = {
		Marker = vector3(-2030.01, -464.713, 11.603),
		Spawner = vector3(-2026.59, -463.002, 10.723),
		Deleter = vector3(-2008.98, -498.780, 11.563 - 0.95),
		Heading = 48.01
	},	
	cubos = {
		Marker = vector3(214.4434,-809.622,31.014),
		Spawner = vector3(227.9415,-806.218,29.773),
		Deleter = vector3(225.2620,-755.761,30.828 - 0.95),
		Heading = 160.47720336914
	},
	]]--
	Los_Santos2 = {
		Marker = vector3(-349.71,-874.81,31.32),
		Spawner = vector3(-355.32, -881.58, 30.3),
		Deleter = vector3(-327.84, -924.39, 30.08),
		Heading = 359.46
	},
	Los_Santos2b = {
		Marker = vector3(-280.21,-888.52,31.32),
		Spawner = vector3(-277.84, -896.56, 30.31),
		Deleter = vector3(-316.83, -928.26, 30.08),
		Heading = 341.14
	},
	Sandy_Shores = {
		Marker = vector3(1737.59, 3710.2, 35.24),
		Spawner = vector3(1737.84, 3719.28, 33.04),
		Deleter = vector3(1722.66, 3713.74, 33.24),
		Heading = 21.22
	},
	Paleto_Bay = {
		Marker = vector3(105.36, 6613.59, 33.50),
		Spawner = vector3(128.78, 6622.99, 30.78),
		Deleter = vector3(126.36, 6608.41, 30.89),
		Heading = 315.01
	},	
	Del_Perro = {
		Marker = vector3(-1511.33, -444.63, 35.59),
		Spawner = vector3(-1519.36, -445.96, 34.68),
		Deleter = vector3(-1526.02, -424.63, 34.45),
		Heading = 212.8
	},	
}

Config.CarPounds = {
	Los_Santos = {
		Marker = vector3(408.61, -1625.47, 29.29),
		Spawner = vector3(405.64, -1643.4, 27.61),
		--Spawner2 = vector3(405.64, -1643.4, 27.61),
		Heading = 229.54
	},
	Sandy_Shores = {
		Marker = vector3(1661.302,3819.933,35.469),
		Spawner = vector3(1668.859,3826.395,34.110),
		Heading = 313.2998046875
	},
	Paleto_Bay = {
		Marker = vector3(-234.82, 6198.65, 31.94),
		Spawner = vector3(-230.08, 6190.24, 30.49),
		Heading = 140.24
	}
}
-- End of Cars

-- Start of Private Cars
Config.PrivateCarGarages = {
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
		Spawner = vector3(-863.68, 698.72, 147.05),
		Deleter = vector3(-855.66, 698.77, 147.81),
		Heading = 341.77
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
