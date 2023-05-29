Config                            = {}
Config.DrawDistance               = 20.0
Config.Locale = 'en'
Config.DeliveryTime = 1800 -- IN SECOUNDS DEFAULT (18000) IS 5 HOURS / 300 MINUTES
Config.TimeBetweenRobberies = 3600
Config.CutOnRobbery = 100 -- IN PERCENTAGE FROM THE TARGET SHOP
Config.RequiredPolices = 2 -- For the robbery
Config.SellValue = 2 -- This is the shops value divided by 2
Config.ChangeNamePrice = 5000 -- In $ - how much you can change the shops name for

-- CONFIG ITEMS, DON'T FORGET TO ADD CORRECT NUMBER IN THE BRACKETS
Config.Items = {
    [1] = {label = "Agua",       item = "water",        price = 500},
    [2] = {label = "Pan",      item = "bread",       price = 500},
	[3] = {label = "Manzana",      item = "apple",       price = 500},
	[4] = {label = "Lays",      item = "bolchips",       price = 500},
	[5] = {label = "Cupcake",      item = "cupcake",       price = 300},
	[6] = {label = "Chocolate",      item = "chocolate",       price = 300},
	[7] = {label = "Cerveza",      item = "beer",       price = 400},
	[8] = {label = "Vino",      item = "wine",       price = 400},
	[9] = {label = "Vodka",      item = "vodka",       price = 1000},
	[10] = {label = "Champagne",      item = "grand_cru",       price = 1000},
	[11] = {label = "Cafe",      item = "coffee",       price = 500},
	[12] = {label = "Coca-Cola",      item = "cocacola",       price = 500},
	[13] = {label = "Hamburguesa",      item = "hamburger",       price = 500},	
	[14] = {label = "Caña de Pescar",      item = "fishingrod",       price = 1000},
	[15] = {label = "Carnada de pez",      item = "fishbait",       price = 100},
	[16] = {label = "Cebo de Tortuga",      item = "turtlebait",       price = 150},
	[17] = {label = "Pico",      item = "pico",       price = 1000},
	[18] = {label = "Hacha",      item = "hacha",       price = 1000},
	[19] = {label = "Sprite",      item = "sprite",       price = 500},
	[20] = {label = "Sandwich",      item = "sandwich",       price = 500},
	[21] = {label = "Papas Fritas",      item = "papas",       price = 500},
	[22] = {label = "Tacos",      item = "tacos",       price = 500},
	[23] = {label = "Cigarrillos x10",      item = "cigarrillo",       price = 500},
	[24] = {label = "Habano",      item = "habano",       price = 500},
	[25] = {label = "Fanta",      item = "fanta",       price = 500},
}

Config.Images = {
  [1] = {item = "water",   src = "img/water.png"},
  [2] = {item = "bread",   src = "img/bread.png"},
  [3] = {item = "apple",   src = "img/apple.png"},
  [4] = {item = "bolchips",   src = "img/bolchips.png"},
  [5] = {item = "cupcake",   src = "img/cupcake.png"},
  [6] = {item = "chocolate",   src = "img/chocolate.png"},
  [7] = {item = "beer",   src = "img/beer.png"},
  [8] = {item = "wine",   src = "img/wine.png"},
  [9] = {item = "vodka",   src = "img/vodka.png"},
  [10] = {item = "grand_cru",   src = "img/grand_cru.png"},
  [11] = {item = "coffee",   src = "img/coffee.png"},
  [12] = {item = "cocacola",   src = "img/cocacola.png"},
  [13] = {item = "hamburger",   src = "img/hamburger.png"},
  [14] = {item = "fishingrod",   src = "img/fishingrod.png"},
  [15] = {item = "fishbait",   src = "img/fishbait.png"},
  [16] = {item = "turtlebait",   src = "img/turtlebait.png"},
  [17] = {item = "pico",   src = "img/pico.png"},
  [18] = {item = "hacha",   src = "img/hacha.png"},
  [19] = {item = "sprite",   src = "img/sprite.png"}, 
  [20] = {item = "sandwich",   src = "img/sandwich.png"}, 
  [21] = {item = "papas",   src = "img/papas.png"}, 
  [22] = {item = "tacos",   src = "img/tacos.png"}, 
  [23] = {item = "cigarrillo",   src = "img/cigarrillo.png"}, 
  [24] = {item = "habano",   src = "img/habano.png"}, 
  [25] = {item = "fanta",   src = "img/fanta.png"},
}


Config.Zones = {

	[0] = vector3(6.09, -708.89, 44.97),
  
	[1] = {
		Shop = vector3(373.875, 325.896, 102.566),
		Rob = vector3(379.19, 332.08, 102.57),
		para = 'psg'
	},
	[2] = {
		Shop = vector3(2557.458, 382.282, 107.622),
		Rob = vector3(2550.15, 385.37, 107.62),
		para = 'psg'
	},
	[3] = {
		Shop = vector3(-3038.939, 585.954, 6.908),
		Rob = vector3(-3047.08, 586.37, 6.91),
		para = 'police2'
	},
	[4] = {
		Shop = vector3(-1487.553, -379.107, 39.163),
		Rob = vector3(-1480.09, -373.35, 38.16),
		para = 'psg'
	},
	[6] = {
		Shop = vector3(-2968.243, 390.910, 14.043),
		Rob = vector3(-2959.15, 388.54, 13.04),
		para = 'police2'
	},
	[7] = {
		Shop = vector3(2678.916, 3280.671, 54.241),
		Rob = vector3(2673.59, 3286.2, 54.24),
		para = 'gendarme'
	},
	[8] = {
		Shop = vector3(-48.519, -1757.514, 28.421),
		Rob = vector3(-43.7, -1750.58, 28.42),
		para = 'psg'
	},
	[9] = {
		Shop = vector3(1163.373, -323.801, 68.205),
		Rob = vector3(1161.15, -315.73, 68.21),
		para = 'psg'
	},
	[10] = {
		Shop = vector3(-707.501, -914.260, 18.215),
		Rob = vector3(-708.29, -905.99, 18.22),
		para = 'psg'
	},
	[11] = {
		Shop = vector3(-1820.523, 792.518, 137.118),
		Rob = vector3(-1827.32, 798.78, 137.16),
		para = 'police2'
	},
	[12] = {
		Shop = vector3(1698.388, 4924.404, 41.063),
		Rob = vector3(1705.41, 4920.56, 41.06),
		para = 'gendarme'
	},
	[13] = {
		Shop = vector3(1961.464, 3740.672, 31.343),
		Rob = vector3(1959.04, 3747.93, 31.34),
		para = 'gendarme'
	},
	[14] = {
		Shop = vector3(1135.808, -982.281, 45.415),
		Rob = vector3(1126.83, -982.6, 44.42),
		para = 'psg'
	},
	[15] = {
		Shop = vector3(25.88, -1347.1, 28.5),
		Rob = vector3(28.48, -1339.94, 28.5),
		para = 'psg'
	},
	[17] = {
		Shop = vector3(547.431, 2671.710, 41.156),
		Rob = vector3(546.86, 2663.71, 41.16),
		para = 'gendarme'
	},
	[18] = {
		Shop = vector3(-3241.927, 1001.462, 11.830),
		Rob = vector3(-3249.3, 1004.54, 11.83),
		para = 'police2'
	},
	[19] = {
		Shop = vector3(1166.024, 2708.930, 37.157),
		Rob = vector3(1166.89, 2718.14, 36.16),
		para = 'gendarme'
	},
	[20] = {
		Shop = vector3(1729.216, 6414.131, 34.037),
		Rob = vector3(1734.88, 6419.83, 34.04),
		para = 'police2'
	},
	--Paleto mapeada paleto_liquor
	--[[
	[22] = {
		Shop = vector3(-160.3, 6322.69, 30.6),
		Rob = vector3(-168.4, 6318.69, 29.6),
	},
	]]--
	[24] = {
		Shop = vector3(-1222.74, -907.13, 11.33),
		Rob = vector3(-1220.81, -915.99, 10.33),
		para = 'psg'
	},
	[25] = {
		Shop = vector3(-119.09, 6384.04, 31.18),
		Rob = vector3(-104.94, 6386.42, 31.18),
		para = 'police2'
	},
}
