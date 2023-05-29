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
	{ title = "Alquiler de bicicletas", colour = 84, id = 226, x = -1033.99, y = -2732.07, z = 20.17 }, -- Airport | https://i.imgur.com/aB5YPjF.jpeg
}

Config.ZonasRojas          = {
	---- punto chaleco ----
	{ x = 1980.923, y = 5173.675, z = 47.62927, r = 120.0, color = 79, alpha = 1250 }, -- Farmeo de marihuana
		----{ x = 2940.20, y = 4623.47, z = 48.72, r = 50.0, color = 79, alpha = 1250 }, -- Proceso de marihuana
		{ x = -1203.703857, y = -1793.917603, z = 3.00, r = 120.0, color = 79, alpha = 1250 }

	---- armas ----
	---- Metanfetamina ---- -- Amapola
	-- { x = 1531.83, y = 3590.7, z = 38.77, r = 80.0, color = 79, alpha = 1250 }, -- Proceso de amapola

	---- Lavado de dinero ----
	-- { x = 48.19, y = 6305.98, z = 32.36, r = 80.0, color = 79, alpha = 1250 }, -- Lavado punto exterior
	-- { x = 1138.02, y = -3198.94, z = -38.66, r = 80.0, color = 79, alpha = 1250 }, -- Lavado punto interior

}

Config.ZonasSegura         = {
	{ x = -268.4, y = -959.5, r = 130.0 }, -- GC Vespucci & Garbarino
	{ x = 216.52, y = -800.06, r = 150.0 }, -- GC Old.
	{ x = 292.53, y = -1078.73, r = 200.0 }, -- Depto.
	{ x = 290.09, y = -553.06, r = 120.0 }, -- Hospital.
	{ x = -783.29, y = -212.56, r = 60.0 }, -- Tienda VIP.
	{ x = -710.7, y = -922.2, r = 70.0 }, -- Tienda VIP.
	{ x = 239.47, y = -1380.96, r = 35.0 }, -- Escuela de manejo
	{ x = 1841.07, y = 3666.45, r = 175.0 }, --HOSPITAL y Comisaria Sandy
	{ x = -236.13, y = 6319.01, r = 25.0 }, --HOSPITAL Paleto
	{ x = -441.32, y = 6018.21, r = 50.0 }, --Comisaria Paleto
	{ x = -6.2, y = -1113.8, r = 200.0 }, -- CONCE Y AMMU GC
	{ x = 405.4, y = -1629.5, r = 100.0 }, -- INCAUTADO
	{ x = -317.3, y = -1527.8, r = 100.0 }, -- BASURERO
	{ x = 1688.1, y = 2559.1, r = 100.0 }, -- carcel
	{ x = 429.4385, y = -799.9782, r = 75.0 }, -- Tienda de Comi
}

Config.ZonasBlancas = {
	{ x = 254.03, y = 219.06, z = 106.28, r = 200.0, color = 0, alpha = 70 }, -- BANCO CENTRAL (PFA)
	{ x = 3559.54, y = 3672.25, z = 28.12, r = 200.0, color = 0, alpha = 70 }, -- HUMANE (PSG)
	{ x = -351.53, y = -49.51, z = 49.03, r = 160.0, color = 0, alpha = 70 }, -- Fleeca ACA (PFA)
	{ x = 314.19, y = -278.62, z = 54.17, r = 160.0, color = 0, alpha = 70 }, -- Fleeca Ayuntamiento (PFA)
	{ x = 1176.19, y = 2711.69, z = 38.09, r = 160.0, color = 0, alpha = 70 }, -- Fleeca Sandy (PSG)
	{ x = -2957.59, y = 482.22, z = 38.09, r = 160.0, color = 0, alpha = 70 }, -- Fleeca Costa (PSG)
	{ x = -1081.86, y = -253.02, z = 31.62, r = 160.0, color = 0, alpha = 70 }, -- Life Invader (PFA)
	{ x = -112.21, y = 6469.29, z = 31.62, r = 120.0, color = 0, alpha = 70 }, -- Mini Blanco (PSG)
	{ x = 24.44, y = -1347.34, z = 28.5, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PFA)
	{ x = -47.38, y = -1758.7, z = 28.44, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PFA)
	{ x = 1164.85, y = -323.67, z = 68.23, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PFA)
	{ x = -1819.53, y = 793.55, z = 137.11, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PFA)
	{ x = 2557.27, y = 380.81, z = 107.64, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PSG)
	{ x = 1697.3, y = 4923.47, z = 41.08, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PSG)
	{ x = 2678.1, y = 3279.4, z = 54.26, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PSG)
	{ x = 549.04, y = 2671.36, z = 41.18, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PSG)
	{ x = 1727.87, y = 6415.25, z = 34.06, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PSG)
	{ x = -70.7, y = 6248.4, z = 31.1, r = 60.0, color = 0, alpha = 70 }, -- 24/7 (PSG)
	{ x = 1392.31, y = 3606.31, z = 33.98, r = 60.0, color = 0, alpha = 70 }, -- Cervecería (PSG)
	{ x = 1983.87, y = 3054.5, z = 46.22, r = 60.0, color = 0, alpha = 70 }, -- Cervecería (PSG)
	{ x = 1134.14 , y = -982.36, z = 45.42, r = 60.0, color = 0, alpha = 70 }, -- Cervecería (PFA)
	{ x = -814.6755, y = 174.813, z = 77.176, r = 60.0, color = 0, alpha = 70 }, -- Casa de Michael (PFA)
	{ x = -1301.1, y = -823.1, z = 17.2, r = 60.0, color = 0, alpha = 70 }, -- MAZE BANK PFA (PFA)
	{ x = 2452.7, y = 4972.9, z = 46.9, r = 100.0, color = 0, alpha = 70 }, -- MAZE BANK PFA (PFA)
}

Config.CarWash = {
	{ x = 167.1034, y = -1719.4704, z = 28.30}, -- Cerca de grove
	{ x = -74.5693, y = 6427.8715, z = 30.20}, -- Paleto bay
	{ x = -699.6325, y = -932.7043, z = 18.20}, -- Badulake 
	{ x = 1362.5385, y = 3592.1274, z = 33.9211}, -- Sandy
	{ x = 23.22, y = -1392.15, z = 29.30}, -- Carwash
}