Config = {}
Config.Locale = 'es' -- The local you want to use for your server
Config.TruckPlateNumb = 0  -- This starts the custom plate for trucks at 0
Config.MaxStops	= 10 -- Total number of stops a person is allowed to do before having to return to depot.
Config.MaxBags = 8 -- Total number of bags a person can get out of a bin
Config.MinBags = 4 -- Min number of bags that a bin can contain.
Config.BagPay = 50 -- The amount paid to each person per bag
Config.StopPay = 30 -- Total pay for the stop before bagpay.
Config.JobName = 'garbage'  -- use this to set the jobname that you want to be able to do garbagecrew 

--Config.UseWorkClothing = true	-- This feature has been removed until I can find the issue with removing player loadout on reload

Config.Trucks = {
  'trash',
  'trash',
}

Config.DumpstersAvaialbe = {
  218085040,
  666561306,
  -58485588,
  -206690185,
  1511880420,
  682791951,
  -387405094,
  364445978,
  1605769687,
  -1831107703,
  -515278816,
  -1790177567,
}

Config.VehicleSpawn = {pos = vector3(2925.53,4449.69, 47.83),} --Punto donde se spawnea camion

Config.Zones = {
	[1] = {type = 'Zone', size = 5.0 , name = 'endmission', pos = vector3(2860.26,4410.96, 49.18)}, --Devuelves el camión
	[2] = {type = 'Zone', size = 3.0 , name = 'timeclock', pos = vector3(2891.19,4391.64, 50.32)}, -- Te pones la ropa del treabajo o te la quitas
	[3] = {type = 'Zone', size = 3.0 , name = 'vehiclelist', pos = vector3(2907.86,4397.48, 50.25)}, --Donde coges el camion
}

Config.Collections = {
  [1] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(565.18,2803.34, 42.11)}, --Esto todo es los puntos para trabajar
  [2] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(1681.6,3571.19, 35.47)},
  [3] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(2904.56,4364.14, 50.33)},
  [4] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(845.55,2192.72, 52.23)},
  [5] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-318.57,6082.1, 31.31)},
  [6] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-2176.99,4260.0, 48.96)},
  [7] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-683.71,5788.13, 17.33)},
  [8] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(1462.15,6540.0, 14.67)},
  [9] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(2455.47,4054.59, 38.06)},
  [10] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(2570.57,4278.38, 41.83)}, 
  [11] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(1713.07,4713.64, 42.26)}, 
  [12] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(179.86,6443.44, 31.29)}, 
  [13] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(1741.93,6408.55, 35.09)},
  [14] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-842.84,5406.27, 34.62)},
  [15] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(2904.14,4364.97, 50.33)}, 
  [16] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1113.43, 2719.79, 18.88)},
  [17] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(1713.06,4714.13, 42.15)}, --No se puede coger
  [18] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-385.76,6043.56, 31.5)},
  [19] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-135.37,1910.42, 197.55)}, 
  [20] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(1330.27,4327.28, 38.05)},
}