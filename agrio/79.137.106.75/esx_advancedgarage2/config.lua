--[[
***** How to Setup a vehicle_names.lua for Custom Addon Vehicles *****
* Create a vehicle_names.lua & past the below Code
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--Example 1: AddTextEntry('SPAWN_NAME_HERE', 'VEHICLE_NAME_HERE')
	--Example 2: AddTextEntry('f350', '2013 Ford F350')
end)
]]

Config = {}
Config.Locale = 'en'

Config.KickPossibleCheaters = false -- If true it will kick the player that tries store a vehicle that they changed the Hash or Plate.
Config.UseCustomKickMessage = false -- If KickPossibleCheaters is true you can set a Custom Kick Message in the locales.

Config.UseDamageMult = true -- If true it costs more to store a Broken Vehicle.
Config.DamageMult = 5000 -- Higher Number = Higher Repair Price.

Config.CarPoundPrice      = 800 -- Car Pound Price.
Config.BoatPoundPrice     = 5000 -- Boat Pound Price.
Config.AircraftPoundPrice = 10000 -- Aircraft Pound Price.

Config.PolicingPoundPrice  = 250 -- Policing Pound Price.
Config.AmbulancePoundPrice = 250 -- Ambulance Pound Price.
Config.AdminPoundPrice     = 600 -- Admin Pound Price.
Config.DismayPoundPrice    = 600 -- Dismay Pound Price.
Config.VagosPoundPrice     = 600 -- Vagos Pound Price.
Config.SheriffPoundPrice   = 300 -- Sheriff Pound Price.
Config.BahamasPoundPrice   = 600 -- Sheriff Pound Price.

Config.UseCarGarages        = true -- Allows use of Car Garages.
Config.UseBoatGarages       = true -- Allows use of Boat Garages.
Config.UseAircraftGarages   = true -- Allows use of Aircraft Garages.
Config.UsePrivateCarGarages = true -- Allows use of Private Car Garages.
Config.UseJobCarGarages     = true -- Allows use of Job Garages.

Config.DontShowPoundCarsInGarage = false -- If set to true it won't show Cars at the Pound in the Garage.
Config.ShowVehicleLocation       = true -- If set to true it will show the Location of the Vehicle in the Pound/Garage in the Garage menu.
Config.UseVehicleNamesLua        = false -- Must setup a vehicle_names.lua for Custom Addon Vehicles.

Config.ShowGarageSpacer1 = false -- If true it shows Spacer 1 in the List.
Config.ShowGarageSpacer2 = false -- If true it shows Spacer 2 in the List | Don't use if spacer3 is set to true.
Config.ShowGarageSpacer3 = false -- If true it shows Spacer 3 in the List | Don't use if Spacer2 is set to true.

Config.ShowPoundSpacer2 = false -- If true it shows Spacer 2 in the List | Don't use if spacer3 is set to true.
Config.ShowPoundSpacer3 = false -- If true it shows Spacer 3 in the List | Don't use if Spacer2 is set to true.

Config.MarkerType   = 36
Config.DrawDistance =  45.0

Config.BlipGarage = {
	Sprite = 524,
	Color = 69,
	Display = 3.0,
	Scale = 0.7
}

Config.BlipGaragePrivate = {
	Sprite = 50,
	Color = 53,
	Display = 2,
	Scale = 0.8
}

Config.BlipPound = {
	Sprite = 569,
	Color = 49,
	Display = 2,
	Scale = 0.8
}

Config.BlipJobPound = {
	Sprite = 530,
	Color = 29,
	Display = 2,
	Scale = 0.8
}

Config.PointMarker = {
	r = 0, g = 255, b = 0,     -- Green Color
	x = 1.2, y = 0.9, z = 1.3  -- Standard Size Circle
}

Config.DeleteMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 1.2, y = 0.9, z = 1.3 -- Big Size Circle
}

Config.PoundMarker = {
	r = 0, g = 0, b = 100,     -- Blue Color
	x = 1.2, y = 0.9, z = 1.3  -- Standard Size Circle
}

Config.JobPoundMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 2.5, y = 2.5, z = 1.8  -- Standard Size Circle
}

-- Start of Jobs

Config.PolicePounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 449.64, y = -1014.01, z = 27.60 },
		SpawnPoint = { x = 426.67, y = -1020.1, z = 28.97, h = 88.55 },
		DeletePoint = { x = 464.2, y = -1019.6, z = 28.83 }
	},
		Pound_Paleto = {
		PoundPoint = { x = -471.64, y = 6035.23, z = 30.50 },
		SpawnPoint = { x = 476.46, y = 6032.05, z = 30.50, h = 227.88 }
	}
}

Config.FespPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = -1780.64, y = 3077.01, z = 32.00 },
		SpawnPoint = { x = -1781.13, y = 3120.81, z = 32.97, h = 240.55 },
		DeletePoint = { x = -1779.42, y = 3128.96, z = 32.83 }
	},
		Pound_Paleto = {
		PoundPoint = { x = -471.64, y = 6035.23, z = 30.50 },
		SpawnPoint = { x = 476.46, y = 6032.05, z = 30.50, h = 227.88 }
	}
}

Config.FBIPounds = {
	Pound_FBI = {
		PoundPoint = { x = 95.93, y = -723.31, z = 33.10 },
		SpawnPoint = { x = 95.93, y = -723.31, z = 33.10 }
	},
}


Config.TaxiPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 915.56, y = -157.19, z = 75.45 },
		SpawnPoint = { x = 426.67, y = -1020.1, z = 28.97, h = 88.55 },
		DeletePoint = { x = 464.2, y = -1019.6, z = 28.83 }
	},
}

Config.AmbulancePounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 369.34, y = -596.29, z = 27.87 },
		SpawnPoint = { x = 364.45, y = -591.42, z = 27.87, h = 161.74 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -260.89, y = 6344.18, z = 31.50 },
		SpawnPoint = { x = -264.92, y = 6340.87, z = 31.50, h = 266.54 }
	}
}

Config.AdminPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 307.31, y = -1433.63, z = 29.0 },
		SpawnPoint = { x = 311.58, y = -1446.22, z = 29.1, h = 220.84 }
	}
}

Config.DismayPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = -831.75, y = 179.17, z = 70.13 },
		SpawnPoint = { x = -832.76, y = 165.46, z = 69.04, h = 140.18 }
	}
}

Config.VagosPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 12.21, y = 546.52, z = 174.92 },
		SpawnPoint = { x = 3.01, y = 548.99, z = 174.95, h = 306.31 }
	}
}

Config.SheriffPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 1863.42, y = 3711.28, z = 32.18 },
		SpawnPoint = { x = 1868.3, y = 3697.53, z = 33.53, h = 207.74 }
	}
}

Config.BahamasPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = -1153.22, y = -1518.42, z = 3.37 },
		SpawnPoint = { x = -1183.71, y = -1501.03, z = 4.38, h = 210.7 }
	}
}
Config.aron = {
	Pound_FBI = {
		PoundPoint = {x=-1792.9912109375, y=458.61096191406, z=128.16479492188, h=354.33071899414},
		SpawnPoint = {x=-1792.9912109375, y=458.61096191406, z=128.16479492188, h=354.33071899414},
	},
}
-- End of Jobs
-- Start of Cars
--[[
	
]]
Config.CarGarages = {
	--[[Garage_CentralLS = {
		GaragePoint = { x = 229.700, y = -800.1149, z = 29.5722 },
		SpawnPoint = { x = 229.700, y = -800.1149, z = 29.5722, h = 157.84 },
		DeletePoint = { x = 215.6, y = -788.6, z = 29.83 }
	},--]]
	--{x=-1530.4747314453, y=-985.912109375, z=13.0029296875, h=136.06298828125}  (punto verde de sacar vehiculos)
-- {x=-1535.1955566406, y=-981.75823974609, z=13.0029296875, h=138.89762878418}  (punto azul de sacar incautados )
-- {x=-1542.5010986328, y=-973.9384765625, z=13.0029296875, h=138.89762878418} (punto rojo de guardar vehiculos )
-- {x=-1536.3165283203, y=-999.58679199219, z=13.0029296875, h=45.354328155518} (punto de spawn de vehiculos )
	Garage_Sandy = {
		GaragePoint = { x = 1737.59, y = 3710.2, z = 34.24 },
		SpawnPoint = { x = 1737.84, y = 3719.28, z = 34.04, h = 21.22 },
		DeletePoint = { x = 1722.66, y = 3713.74, z = 34.31 }
	},
	Garage_Serif = {
		GaragePoint = { x = -309.573, y =  6111.3, z = 31.520 },
		SpawnPoint = { x = -309.573, y =  6111.3, z = 31.520 },
		DeletePoint = { x = -289.991, y =  6129.8, z = 31.4871 }
	},
	Garage_Hospital = {
        GaragePoint = { x = 334.8396, y =  -629.6176, z = 29.27991 },
        SpawnPoint = { x = 342.211, y = -626.7033, z = 29.27991 },
        DeletePoint = { x = 340.8396, y =  -620.3077, z = 29.27991 }
    },
	Garage_Billar = {
		GaragePoint = {x=-1530.4747314453, y=-985.912109375, z=13.0029296875, h=136.06298828125},
		SpawnPoint = {x=-1536.3165283203, y=-999.58679199219, z=13.0029296875, h=45.354328155518},
		DeletePoint = {x=-1542.5010986328, y=-973.9384765625, z=13.0029296875, h=138.89762878418}
	},Garage_Casas1 = {
		GaragePoint =   {x=-709.9912109375, y=644.61096191406, z=155.16479492188, h=354.33071899414},
		SpawnPoint =   {x=-698.66375732422, y=664.29888916016, z=154.32238769531, h=297.63778686523},
		DeletePoint = {x=-711.21759033203, y=656.33404541016, z=155.16479492188, h=150.23622131348},
	},
	Garage_ltk = {
		GaragePoint =   {x=-1792.9912109375, y=458.61096191406, z=128.16479492188, h=354.33071899414},
		SpawnPoint =    {x=-1792.9912109375, y=458.61096191406, z=128.16479492188, h=354.33071899414},
		DeletePoint =  {x=-1794.9912109375, y=404.51096191406, z=113.16479492188, h=354.33071899414},
	},
	Garage_Ems = {
		GaragePoint = { x = -476.59, y = -350.96, z = 24.23 },
		SpawnPoint = { x = -464.824, y = -354.58, z = 24.24, h = 106.22 },
		DeletePoint = { x = -463.39, y = -374.55, z = 24.31 }
	},
	Garage_Segundamano22 = {
		GaragePoint = { x = -3020.89, y = 90.82, z = 11.64 },
		SpawnPoint = { x = -3009.0, y = 103.48, z = 11.94, h = 315.22 },
		DeletePoint = { x = -3020.34, y = 109.74, z = 11.61 }
	},
	Garage_Casino = {
		GaragePoint = { x = 956.16, y = 32.02, z = 81.14 },
		SpawnPoint = { x = 918.14, y = -41.78, z = 78.74, h = 57.72 },
		DeletePoint = { x = 964.69, y = 25.94, z = 80.71 }
	},
	Garage_Correos = {
		GaragePoint = { x = 82.59, y = 95.92, z = 78.74 },
		SpawnPoint = { x = 95.84, y = 65.98, z = 73.44, h = 67.22 },
		DeletePoint = { x = 38.96, y = 95.54, z = 79.01 }
	},
	Garage_Basura = {
		GaragePoint = { x = -332.59, y = -1516.57, z = 27.54 },
		SpawnPoint = { x = -370.04, y = -1534.88, z = 27.54, h = 180.22 },
		DeletePoint = { x = -347.46, y = -1561.14, z = 25.21 }
	},
	Garage_Camion = {
		GaragePoint = { x = 167.39, y = -3236.77, z = 5.54 },
		SpawnPoint = { x = 182.64, y = -3224.48, z = 5.54, h = 356.22 },
		DeletePoint = { x = 164.06, y = -3225.74, z = 5.41 }
	},
	Garage_Vacas = {
		GaragePoint = { x = 2545.59, y = 4659.2, z = 34.24 },
		SpawnPoint = { x = 2552.24, y = 4675.28, z = 34.58, h = 5.22 },
		DeletePoint = { x = 2561.66, y = 4692.74, z = 33.31 }
	},
	Garage_Cosas = {
		GaragePoint = { x = 278.99, y = -346.22, z = 44.24 },
		SpawnPoint = { x = 288.74, y = -329.68, z = 44.58, h = 70.22 },
		DeletePoint = { x = 298.39, y = -333.02, z = 44.24 }
	},
	Garage_OtroCity = {
		GaragePoint = { x = 1032.59, y = -762.72, z = 57.24 },
		SpawnPoint = { x = 1028.04, y = -771.48, z = 57.04, h = 325.22 },
		DeletePoint = { x = 1041.66, y = -790.84, z = 57.31 }
	},
	Garage_Medusa = {
		GaragePoint = {x=734.50549316406, y=-554.55822753906, z=26.769287109375, h=291.96850585938},
		SpawnPoint ={x=720.18463134766, y=-567.65277099609, z=26.179443359375, h=153.07086181641},
		DeletePoint = {x=731.76263427734, y=-560.83514404297, z=26.735473632813, h=39.685039520264}
	},
	Garage_Yellow = {
		GaragePoint = { x = 2012.09, y = 3055.72, z = 46.24 },
		SpawnPoint = { x = 2003.54, y = 3059.08, z = 46.24, h = 57.22 },
		DeletePoint = { x = 1999.16, y = 3081.34, z = 46.2 }
	},
	Garage_Gymw = {
		GaragePoint = { x = -1185.39, y = -1507.72, z = 4.44 },
		SpawnPoint = { x = -1180.74, y = -1486.48, z = 4.44, h = 125.22 },
		DeletePoint = { x = -1197.76, y = -1478.34, z = 4.40 }
	},
	Garage_Paleto = {
		GaragePoint = { x = 84.18, y = 6372.08, z = 31.25 },
		SpawnPoint = { x = 84.18, y = 6372.08, z = 31.2, h = 312.31 },
		DeletePoint = { x = 60.2, y = 6387.67, z = 31.25 }
	},
	Garage_Perico = {
		GaragePoint = { x = 4517.57, y = -4513.78, z = 3.6 },
		SpawnPoint = { x = 4511.98, y = -4521.28, z = 4.1, h = 14.31 },
		DeletePoint = { x = 4491.2, y = -4509.57, z = 3.3 }
	},
	Garage_Prison = {
		GaragePoint = { x = 1855.11, y = 2592.72, z = 45.7 },
		SpawnPoint = { x = 1855.11, y = 2592.72, z = 45.67, h = 274.8 },
		DeletePoint = { x = 1851.79, y = 2600.73, z = 45.8 } -- z = 44.67
        },
	Garage_Groove = {
		GaragePoint = { x = 43.89, y = -1719.86, z = 29.3 },
		SpawnPoint = { x = 12.38, y = -1741.86, z = 28.89, h = 139.46 },
		DeletePoint = { x = 26.49, y = -1741.31, z = 29.3 } 
	},
	Garage_TiendaNorte = {
		GaragePoint = { x = 377.88, y = 288.16, z = 103.255 },
		SpawnPoint = { x = 360.08, y = 289.76, z = 103.255, h = 73.27 },
		DeletePoint = { x = 372.24, y = 271.11, z = 103.255	 }
	},
	Garage_Puerto = {
		GaragePoint = { x = -800.15, y = -1305.29, z = 5.1 },
		SpawnPoint = { x = -800.15, y = -1305.29, z = 5.0, h = 261.49 },
		DeletePoint = { x = -785.93, y = -1286.24, z = 4.6 }
	},
	Garage_EsteCiudad = {
		GaragePoint = { x = 1176.92, y = -1563.95, z = 38.60 },
		SpawnPoint  = { x =  1176.92, y = -1563.95, z = 38.55, h = 270.56 },
		DeletePoint = { x = 1177.04, y = -1540.8, z = 38.6 }
	},
	Garage_AmmunationOeste = {
		GaragePoint = { x = -1155.55, y = 2664.1, z = 18.19 },
		SpawnPoint  = { x = -1155.55, y = 2664.1, z = 18.19, h = 224.76 },
		DeletePoint = { x = -1150.27, y = 2678.49, z = 18.19 }
	},
	Garage_TiendaOeste = {
		GaragePoint = { x = -3152.28, y = 1068.68, z = 20.69 },
		SpawnPoint  = { x = -3152.28, y = 1068.68, z = 20.69, h = 250.08 },
		DeletePoint = { x = -3139.41, y = 1109.18, z = 20.79 }
	},
	Garage_Vanilla = {
        GaragePoint = { x = 150.44, y = -1311.39, z = 28.3 }, --punto donde aparece el puntito verde para sacar coche
        SpawnPoint = { x = 146.47, y = -1277.82, z = 28.15, h = 208.97 }, --Punto donde aparece el coche, aqui es importante que cogais las coords, estando dentro de un coche para que el valor de h: sea el 
        DeletePoint = { x = 151.2, y = -1328.74, z = 28.32 } --Punto rojo donde se borran
},
	Garage_Airport = {
		GaragePoint = { x = -743.1, y = -2006.25, z = 8.88 },
		SpawnPoint  = { x = -736.17, y = -2047.23, z = 8.51, h = 138.59 },
		DeletePoint = { x = -736.1, y = -2006.05, z = 8.88 }
	},
}

Config.CarPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 216.92, y = -809.48, z = 30.72 },
		SpawnPoint = { x = 229.700, y = -800.1149, z = 30.5722, h = 157.84 }
	},
	Pound_Vanilla = {
		PoundPoint = { x = 155.0, y = 1304.68, z = 38.15 }, --punto donde aparece el puntito azul para desincautacion
		 SpawnPoint = { x = 146.47, y = -1277.82, z = 28.15, h = 208.97 }, --Punto donde aparece el coche, aqui es importante que cogais las coords, estando dentro de un coche para que el valor de h: sea el 
	
		  },
	Pound_billar = {
		PoundPoint = {x=-1535.1955566406, y=-981.75823974609, z=13.0029296875, h=138.89762878418},
		SpawnPoint = {x=-1535.1955566406, y=-981.75823974609, z=13.0029296875, h=138.89762878418},
	
	},
	Pound_hOSPI = {
        PoundPoint = { x = 350.8088, y = -623.644, z = 29.27991 },
        SpawnPoint = { x = 342.211, y = -626.7033, z = 29.27991, h = 243.77952575684 }
    },
	Pound_segundamano = {
		PoundPoint = { x = -3014.32, y = 84.88, z = 11.62 },
		SpawnPoint = { x =  -3009.0, y = 103.48, z = 11.94, h = 315.22 }
	},
	Pound_ems = {
		PoundPoint = { x = -471.02, y = -349.18, z = 24.23 },
		SpawnPoint = { x = -464.824, y = -354.58, z = 24.24, h = 106.22 }
	},
	Pound_Cayo = {
		PoundPoint = { x = 4507.82, y = -4509.48, z = 4.32 },
		SpawnPoint = { x = 4519.21, y = -4499.78, z = 4.1722, h = 108.84 }
	},
	Pound_Casino = {
		PoundPoint = { x = 971.92, y = 21.78, z = 80.72 },
		SpawnPoint = { x = 1126.51, y = 62.48, z = 80.34, h = 236.44 }
	},
	Pound_Sandy = {
		PoundPoint = { x = 1730.49, y = 3709.94, z = 34.25 },
		SpawnPoint = { x = 1627.84, y = 3788.45, z = 34.77, h = 308.53 }
	},
	Pound_Car = {
		PoundPoint = { x = 1034.29, y = -767.14, z = 58.25 },
		SpawnPoint = { x = 1046.44, y = -774.15, z = 58.77, h = 268.53 }
	},
	Pound_Vacas = {
		PoundPoint = { x = 2534.29, y = 4665.14, z = 33.55 },
		SpawnPoint = { x = 2544.44, y = 4667.65, z = 33.77, h = 338.53 }
	},
	Pound_Camion = {
		PoundPoint = { x = 164.89, y = -3177.14, z = 5.55 },
		SpawnPoint = { x = 181.44, y = -3172.15, z = 5.77, h = 359.53 }
	},
	Pound_Cerca = {
		PoundPoint = { x = 274.59, y = -342.24, z = 44.55 },
		SpawnPoint = { x = 271.74, y = -319.55, z = 44.77, h = 70.53 }
	},
	Pound_Yellow = {
		PoundPoint = { x = 2015.69, y = 3063.2, z = 46.25 },
		SpawnPoint = { x = 1990.84, y = 3076.05, z = 46.27, h = 60.53 }
	},
	Pound_Gym = {
		PoundPoint = { x = -1193.79, y = -1500.14, z = 4.45 },
		SpawnPoint = { x = -1187.24, y = -1475.85, z = 4.47, h = 125.53 }
	},
	Pound_Paleto = {
		PoundPoint = { x = 89.65, y = 6364.85, z = 31.25 },
		SpawnPoint = { x = 84.18, y = 6372.08, z = 31.25, h = 312.31 }
	},
	Pound_Prison = {
		PoundPoint = { x = 1850.27, y = 2585.64, z = 45.8 },
		SpawnPoint = {  x = 1855.11, y = 2592.72, z = 45.67, h = 274.8 }
	},
	Pound_TiendaNorte = {
		PoundPoint = { x = 394.61, y = 288.9, z = 103.05 },
		SpawnPoint = { x = 377.88, y = 288.16, z = 103.255, h = 71.27 }
	},
	Pound_Puerto = {
		PoundPoint = { x = -765.1, y = -1282.04, z = 5.1 },
		SpawnPoint = { x = -800.15, y = -1305.29, z = 5.0, h = 261.49 }
	},
	Pound_EsteCiudad = {
		PoundPoint = { x = 1181.48, y = -1534.98, z = 38.60 },
		SpawnPoint = { x =  1176.92, y = -1563.95, z = 38.55, h = 270.56 }
	},
	Pound_AmmunationOeste = {
		PoundPoint = { x = -1142.14, y = 2668.42, z = 18.19},
		SpawnPoint = { x = -1155.55, y = 2664.1, z = 18.19, h = 224.76 }
	},
	Pound_TiendaOeste = {
		PoundPoint = { x = -3143.61, y = 1056.54, z = 20.63},
		SpawnPoint = { x = -3152.28, y = 1068.68, z = 20.69, h = 250.08 }
	},
	Pound_Groove = {
		PoundPoint = { x = 51.33, y = -1736.28, z = 29.32},
		SpawnPoint = { x = 22.41, y = -1730.02, z = 28.89, h = 321.13 }
	},
	Pound_Airport = {
		PoundPoint = { x = -767.54, y = -2062.38, z = 9.02},
		SpawnPoint = { x = -739.3, y = -2045.78, z = 8.51, h = 137.66 }
	}
}

-- End of Cars
-- Start of Boats

Config.BoatGarages = {
	Garage_LSDock = {
		GaragePoint = { x = -735.87, y = -1325.08, z = 1.6 },
		SpawnPoint = { x = -718.87, y = -1320.18, z = -0.47477427124977, h = 45.0 },
		DeletePoint = { x = -731.15, y = -1334.71, z = -0.47477427124977 }
	},
	Garage_Perico = {
		GaragePoint = { x = 5140.17, y = -4646.28, z = 1.0 },
		SpawnPoint = { x = 5136.37, y = -4657.88, z = 0.017477427124977, h = 165.0 },
		DeletePoint = { x = 5120.25, y = -4638.16, z = 0.047477427124977 }
	},
	Garage_SandyDock = {
		GaragePoint = { x = 1333.2, y = 4269.92, z = 31.5 },
		SpawnPoint = { x = 1334.61, y = 4264.68, z = 30.86, h = 87.0 },
		DeletePoint = { x = 1323.73, y = 4269.94, z = 30.86 }
	},
	Garage_PaletoDock = {
		GaragePoint = { x = -283.74, y = 6629.51, z = 7.3 },
		SpawnPoint = { x = -290.46, y = 6622.72, z = -0.47477427124977, h = 52.0 },
		DeletePoint = { x=-305.2 , y=6611.86 , z=-0.22 , h= 23.61 }
	}
}

Config.BoatPounds = {
	Pound_LSDock = {
		PoundPoint = { x = -738.67, y = -1400.43, z = 4.0 },
		SpawnPoint = { x = -738.33, y = -1381.51, z = 0.12, h = 137.85 }
	},
	Pound_SandyDock = {
		PoundPoint = { x = 1299.36, y = 4217.93, z = 32.91 },
		SpawnPoint = { x = 1294.35, y = 4226.31, z = 29.86, h = 345.0 }
	},
	Pound_PaletoDock = {
		PoundPoint = { x = -270.2, y = 6642.43, z = 6.36 },
		SpawnPoint = { x = -290.38, y = 6638.54, z = -0.47477427124977, h = 130.0 }
	}
}

-- End of Boats
-- Start of Aircrafts

Config.AircraftGarages = {
	Garage_LSAirport = {
		GaragePoint = { x = -1617.14, y = -3145.52, z = 13.99 },
		SpawnPoint = { x = -1657.99, y = -3134.38, z = 13.99, h = 330.11 },
		DeletePoint = { x = -1642.12, y = -3144.25, z = 14.99 }
	},
	Garage_SandyAirport = {
		GaragePoint = { x = 1723.84, y = 3288.29, z = 41.66 },
		SpawnPoint = { x = 1710.85, y = 3259.06, z = 41.69, h = 104.66 },
		DeletePoint = { x = 1714.45, y = 3246.75, z = 40.57 }
	},
	Garage_Casino = {
		GaragePoint = { x = 974.96, y = 49.62, z = 123.19 },
		SpawnPoint = { x = 1147.73, y = 126.48, z = 81.99, h = 234.11 },
		DeletePoint = { x = 965.26, y = 41.55, z = 123.19 }
	},
	Garage_GrapeseedAirport = {
		GaragePoint = { x = 2152.83, y = 4797.03, z = 41.19 },
		SpawnPoint = { x = 2122.72, y = 4804.85, z = 41.78, h = 115.04 },
		DeletePoint = { x = 2082.36, y = 4806.06, z = 42.07 }
	},
	Sandy = {
		GaragePoint = { x = 4366.10, y = -4573.42, z = 4.24 },
		SpawnPoint = { x = 4252.97, y = -4582.46, z = 4.14, h = 105.25 },
		DeletePoint = { x = 4487.36, y = -4494.76, z = 4.07 }
	},
	Garage_Casas= {
		GaragePoint =  {x=-711.17803955078, y=617.53845214844, z=155.58605957031, h=235.27558898926},
		SpawnPoint =  {x=-711.17803955078, y=617.53845214844, z=155.58605957031, h=235.27558898926},
		DeletePoint = { x = 0.36, y = 0.06, z = 0.07 }
	},
}

Config.AircraftPounds = {
	Pound_LSAirport = {
		PoundPoint = { x = -1243.0, y = -3391.92, z = 13.54 },
		SpawnPoint = { x = -1272.27, y = -3382.46, z = 12.94, h = 330.25 }
	},
	CayoPeriquin = {
		PoundPoint = { x = 4450.90, y = -4482.32, z = 4.54 },
		SpawnPoint = { x = 4345.62, y = -4545.06, z = 4.14, h = 109.25 }
	},
	Sandy = {
		PoundPoint = { x = 1733.80, y = 3299.92, z = 41.24 },
		SpawnPoint = { x = 1629.27, y = 3239.46, z = 40.44, h = 104.25 }
	}
}

-- End of Aircrafts
-- Start of Private Garages

Config.PrivateCarGarages = {
	-- Maze Bank Building Garages
	Garage_MazeBankBuilding = {
		Private = "MazeBankBuilding",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	GarajeLegend = {
		Private = "legendCasa",
		GaragePoint =  {x=-2666.7561035156, y=1309.4110107422, z=147.11059570313, h=79.370079040527},
		SpawnPoint =  {x=-2642.7956542969, y=1307.7890625, z=145.72888183594, h=274.96063232422},
		DeletePoint = {x=-2665.9252929688, y=1304.6768798828, z=147.11059570313, h=82.204727172852}
	},
	GarajeIva = {
		Private = "ivaCasa",
		GaragePoint =   {x=-1539.0593261719, y=891.24395751953, z=181.70324707031, h=215.43309020996},
		SpawnPoint =  {x=-1513.7274169922, y=884.46594238281, z=181.8212890625, h=286.29919433594},
		DeletePoint = {x=-1517.4329833984, y=874.1142578125, z=181.75390625, h=167.24407958984}
	},
	Garage_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveRich = {
		Private = "ExecutiveRich",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveCool = {
		Private = "ExecutiveCool",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	Garage_LomBank = {
		Private = "LomBank",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	Garage_MazeBankWest = {
		Private = "MazeBankWest",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	Garage_IntegrityWay = {
		Private = "IntegrityWay",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	Garage_IntegrityWay28 = {
		Private = "IntegrityWay28",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	Garage_IntegrityWay30 = {
		Private = "IntegrityWay30",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	Garage_DellPerroHeights = {
		Private = "DellPerroHeights",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	Garage_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	Garage_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	Garage_MiltonDrive = {
		Private = "MiltonDrive",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern1Apartment = {
		Private = "Modern1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern2Apartment = {
		Private = "Modern2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern3Apartment = {
		Private = "Modern3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody1Apartment = {
		Private = "Mody1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody2Apartment = {
		Private = "Mody2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody3Apartment = {
		Private = "Mody3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal1Apartment = {
		Private = "Regal1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal2Apartment = {
		Private = "Regal2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal3Apartment = {
		Private = "Regal3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	Garage_RichardMajesticApt2 = {
		Private = "RichardMajesticApt2",
		GaragePoint = { x = -887.5, y = -349.58, z = 33.534 },
		SpawnPoint = { x = -886.03, y = -343.78, z = 33.534, h = 206.79 },
		DeletePoint = { x = -894.324, y = -349.326, z = 33.534 }
	},
	Garage_WildOatsDrive = {
		Private = "WildOatsDrive",
		GaragePoint = { x = -178.65, y = 503.45, z = 135.85 },
		SpawnPoint = { x = -189.98, y = 505.8, z = 133.48, h = 282.62 },
		DeletePoint = { x = -189.28, y = 500.56, z = 132.93 }
	},
	Garage_WhispymoundDrive = {
		Private = "WhispymoundDrive",
		GaragePoint = { x = 123.65, y = 565.75, z = 183.04 },
		SpawnPoint = { x = 130.11, y = 571.47, z = 182.42, h = 270.71 },
		DeletePoint = { x = 131.97, y = 566.77, z = 181.95 }
	},
	Garage_NorthConkerAvenue2044 = {
		Private = "NorthConkerAvenue2044",
		GaragePoint = { x = 348.18, y = 443.01, z = 146.7 },
		SpawnPoint = { x = 358.397, y = 437.064, z = 144.277, h = 285.911 },
		DeletePoint = { x = 351.383, y = 438.865, z = 145.66 }
	},
	Garage_NorthConkerAvenue2045 = {
		Private = "NorthConkerAvenue2045",
		GaragePoint = { x = 370.69, y = 430.76, z = 144.11 },
		SpawnPoint = { x = 392.88, y = 434.54, z = 142.17, h = 264.94 },
		DeletePoint = { x = 389.72, y = 429.95, z = 141.81 }
	},
	Garage_HillcrestAvenue2862 = {
		Private = "HillcrestAvenue2862",
		GaragePoint = { x = -688.71, y = 597.57, z = 142.64 },
		SpawnPoint = { x = -683.72, y = 609.88, z = 143.28, h = 338.06 },
		DeletePoint = { x = -685.259, y = 601.083, z = 142.365 }
	},
	Garage_HillcrestAvenue2868 = {
		Private = "HillcrestAvenue2868",
		GaragePoint = { x = -752.753, y = 624.901, z = 141.2 },
		SpawnPoint = { x = -749.32, y = 628.61, z = 141.48, h = 197.14 },
		DeletePoint = { x = -754.286, y = 631.581, z = 141.2 }
	},
	Garage_HillcrestAvenue2874 = {
		Private = "HillcrestAvenue2874",
		GaragePoint = { x = -859.01, y = 695.95, z = 147.93 },
		SpawnPoint = { x = -863.681, y = 698.72, z = 147.052, h = 341.77 },
		DeletePoint = { x = -855.66, y = 698.77, z = 147.81 }
	},
	Garage_MadWayneThunder = {
		Private = "MadWayneThunder",
		GaragePoint = { x = -1290.95, y = 454.52, z = 96.66 },
		SpawnPoint = { x = -1297.62, y = 459.28, z = 96.48, h = 285.652 },
		DeletePoint = { x = -1298.088, y = 468.952, z = 96.0 }
	},
	Garage_TinselTowersApt12 = {
		Private = "TinselTowersApt12",
		GaragePoint = { x = -616.74, y = 56.38, z = 42.736 },
		SpawnPoint = { x = -620.588, y = 60.102, z = 42.736, h = 109.316 },
		DeletePoint = { x = -621.128, y = 52.691, z = 42.735 }
	},
	-- End of Single Garages
	-- Start of VENT Custom Garages
	Garage_MedEndApartment1 = {
		Private = "MedEndApartment1",
		GaragePoint = { x = 240.23, y = 3102.84, z = 41.49 },
		SpawnPoint = { x = 233.58, y = 3094.29, z = 41.49, h = 93.91 },
		DeletePoint = { x = 237.52, y = 3112.63, z = 41.39 }
	},
	Garage_MedEndApartment2 = {
		Private = "MedEndApartment2",
		GaragePoint = { x = 246.08, y = 3174.63, z = 41.72 },
		SpawnPoint = { x = 234.15, y = 3164.37, z = 41.54, h = 102.03 },
		DeletePoint = { x = 240.72, y = 3165.53, z = 41.65 }
	},
	Garage_MedEndApartment3 = {
		Private = "MedEndApartment3",
		GaragePoint = { x = 984.92, y = 2668.95, z = 39.06 },
		SpawnPoint = { x = 993.96, y = 2672.68, z = 39.06, h = 0.61 },
		DeletePoint = { x = 994.04, y = 2662.1, z = 39.13 }
	},
	Garage_MedEndApartment4 = {
		Private = "MedEndApartment4",
		GaragePoint = { x = 196.49, y = 3027.48, z = 42.89 },
		SpawnPoint = { x = 203.1, y = 3039.47, z = 42.08, h = 271.3 },
		DeletePoint = { x = 192.24, y = 3037.95, z = 42.89 }
	},
	Garage_MedEndApartment5 = {
		Private = "MedEndApartment5",
		GaragePoint = { x = 1724.49, y = 4638.13, z = 42.31 },
		SpawnPoint = { x = 1723.98, y = 4630.19, z = 42.23, h = 117.88 },
		DeletePoint = { x = 1733.66, y = 4635.08, z = 42.24 }
	},
	Garage_MedEndApartment6 = {
		Private = "MedEndApartment6",
		GaragePoint = { x = 1670.76, y = 4740.99, z = 41.08 },
		SpawnPoint = { x = 1673.47, y = 4756.51, z = 40.91, h = 12.82 },
		DeletePoint = { x = 1668.46, y = 4750.83, z = 40.88 }
	},
	Garage_MedEndApartment7 = {
		Private = "MedEndApartment7",
		GaragePoint = { x = 15.24, y = 6573.38, z = 31.72 },
		SpawnPoint = { x = 16.77, y = 6581.68, z = 31.42, h = 222.6 },
		DeletePoint = { x = 10.45, y = 6588.04, z = 31.47 }
	},
	Garage_MedEndApartment8 = {
		Private = "MedEndApartment8",
		GaragePoint = { x = -374.73, y = 6187.06, z = 30.54 },
		SpawnPoint = { x = -377.97, y = 6183.73, z = 30.49, h = 223.71 },
		DeletePoint = { x = -383.31, y = 6188.85, z = 30.49 }
	},
	Garage_MedEndApartment9 = {
		Private = "MedEndApartment9",
		GaragePoint = { x = -24.6, y = 6605.99, z = 30.45 },
		SpawnPoint = { x = -16.0, y = 6607.74, z = 30.18, h = 35.31 },
		DeletePoint = { x = -9.36, y = 6598.86, z = 30.47 }
	},
	Garage_MedEndApartment9 = {
		Private = "Taxi",
		GaragePoint = { x = 915.56, y = -157.19, z = 75.45 },
		SpawnPoint = { x = -16.0, y = 6607.74, z = 30.18, h = 35.31 },
		DeletePoint = { x = -9.36, y = 6598.86, z = 30.47 }
	},
	Garage_MedEndApartment10 = {
		Private = "MedEndApartment10",
		GaragePoint = { x = -365.18, y = 6323.95, z = 28.9 },
		SpawnPoint = { x = -359.49, y = 6327.41, z = 28.83, h = 218.58 },
		DeletePoint = { x = -353.47, y = 6334.57, z = 28.83 }
	}
	-- End of VENT Custom Garages
}

-- End of Private Garages
