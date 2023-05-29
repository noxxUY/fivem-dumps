Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
Config.FishTime = {a = 20000, b = 44000}
	
	--------------------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
Config.FishPrice = {a = 1000, b = 1500} --Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
Config.TurtlePrice = {a = 10800, b = 15200} --Will get dirty money
Config.SharkPrice = {a = 25000, b = 30000} --Will get dirty money
Config.OrcaPrice = {a = 50000, b = 100000} --Will get dirty money

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------
Config.Ventas = {	
	fish = vector3(-3251.2, 991.5, 11.49), --Place where players can sell their fish
	fish2 = vector3(3801.09, 4475.79, 5.00), --Place where players can sell their fish
	turtle = vector3(222.15, 2580.16, 45.0), --Place where players can sell their turtles 
	shark = vector3(29.08 , 3665.84, 39.5), --Place where players can sell their sharks
	orca = vector3(125.9888, -2202.41, 6.0333), --venta de orcas
}
	
Config.BoatDelete = {
	{x = -3435.0, y = 935.0, z = 0.5, xs = -3427.13, ys = 951.66, zs = 8.37, h = 318.9}, --Place where players can sell their sharks
	{x = 3864.44, y = 4476.56, z = 0.47, xs = 3860.52, ys = 4463.82, zs = 2.72, h = 87.38}
}
	

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.Pesca1 = vector3(-3426.7,955.66,7.35)
Config.Pesca2 = {x = 3855.0,y = 4463.7,z = 1.6, xs = 3887.56,ys = 4463.38,zs = 0.69,h = 271.93}

Config.MarkerZonesFish = { 
    {x = -3426.7,y = 955.66,z = 7.35, xs = -3448.0,ys = 960.0,zs = 0.5,h = 90.6},
	{x = 3855.0,y = 4463.7,z = 1.6, xs = 3887.56,ys = 4463.38,zs = 0.69,h = 271.93},
}

Config.Muelles = {
	[1] = vector3(1299.359, 4217.930, 33.902),
	[2] = vector3(1338.131, 4225.544, 33.915),
	[3] = vector3(713.6080, 4093.732, 34.727),
	[4] = vector3(1417.917, 3813.065, 32.228),
	[5] = vector3(1523.551, 3916.277, 31.615),
	[6] = vector3(1733.070, 3984.776, 31.978),
	[7] = vector3(-1611.52, 5259.741, 3.9741),
	[8] = vector3(-3426.87, 967.7149, 8.3466),
	[9] = vector3(-1845.13, -1252.06, 8.6157),
	[10] = vector3(-277.650, 6638.000, 7.5321),
}


