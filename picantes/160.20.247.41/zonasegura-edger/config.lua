Config                     = {}
Config.DrawDistance        = 50.0
Config.ZoneSize            = { x = 0.7, y = 0.7, z = 0.7 }
Config.MarkerColor         = { r = 39, g = 159, b = 219 }

Config.Items               = {
	{ item = "chalecochico", name = "Chaleco Antibalas Liviano", price = 50000 },
	{ item = "chalecopesado", name = "Chaleco Antibalas Pesado", price = 350000 },
	{ item = "suppressor", name = "Accesorio: Silenciador", price = 30000 },
	{ item = "flashlight", name = "Accesorio: Linterna", price = 10000 },
	{ item = "thermal_charge", name = "Carga Térmica", price = 100000 },
	{ item = "secure_card", name = "Tarjeta Blanca", price = 300000 },
	{ item = "id_card_f", name = "Tarjeta Negra", price = 250000 },
}

Config.ItemsLegal          = {
	{ item = "marijuanaEat", name = "Porro", price = 5000 }
}

Config.MarkerZonesAlquiler = {
	{ x = -1034.42, y = -2732.73, z = 19.80 }, -- Airport | https://i.imgur.com/aB5YPjF.jpeg
	{ x = -2285.99, y = 384.47, z = 174.47 }, -- PSG Central
}

Config.BlipZonesAlquiler   = {
	{ title = "Alquiler de bicicletas", colour = 84, id = 226, x = 815.0872, y = -1285.7682, z = 26.2995 }, -- Airport | https://i.imgur.com/aB5YPjF.jpeg
}

Config.ZonasRojas          = {
--Polleria
	{ x = -67.88571, y = 6205.78, z = 31.35242, r = 65.0, color = 79, alpha = 1250 },
	{ x = -128.611, y = 6144.185, z = 31.73987, r = 65.0, color = 79, alpha = 1250 } 

}

Config.ZonasSegura         = {
	{ x = -840.38903, y = -1207.9896, r = 0 }, -- Hospital. -840.3890, -1207.9896, 6.6212, 228.9447
}

Config.ZonasBlancas = {
	{ x = 30.72, y = -1339.98, z = 29.5, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Supermercado Carwash
	{ x = -1219.741, y = -916.2857, z = 11.5, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Cerveceria - Vespucci
	{ x = 1126.114, y = -981.4022, z = 45.5, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Cerveceria - Mission Row
	{ x = 380.19, y = 332.14, z = 103.57, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Supermercado Banco Central
	{ x = 1160.67, y = -314.40, z = 69.23, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Supermercado Taxis
	{ x = -43.40, y = -1749.20, z = 29.43, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Supermercado Grove Street
	{ x = -1099.12, y = -2587.21, z = 13.93, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Supermercado Aeropuerto
	{ x = -106.24, y = 6474.21, z = 31.65, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Mini Banco Paleto
	{ x = -355.1077, y = -53.84176, z = 49.09468, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Fleeca A.C.A
	{ x = -2957.6674804688, y = 481.45776367188, z = 15.697026252747, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Flecca Costa
	{ x = 311.18, y = -283.22, z = 54.17, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Flecca Ayuntamiento
	{ x = 3567.969, y = 3700.589, z = 28.11719, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Laboratorio Humane
	{ x = 1177.213, y = 2711.868, z = 38.09229, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Fleeca Sandy
	{ x = 265.2659, y = 213.5736, z = 101.6666, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Banco Central
	{ x = -1211.54, y = -335.66, z = 37.78, r = 40.0, color = 0, alpha = 70 }, -- (PBA) Fleeca Life-Invader

}

Config.CarWash = {
	{ x = 167.1034, y = -1719.4704, z = 28.30}, -- Cerca de grove
	{ x = -74.5693, y = 6427.8715, z = 30.20}, -- Paleto bay
	{ x = -699.6325, y = -932.7043, z = 18.20}, -- Badulake 
	{ x = 1362.5385, y = 3592.1274, z = 33.9211}, -- Sandy
	{ x = 23.22, y = -1392.15, z = 29.30}, -- Carwash
}