Config = {}

Config.Zones = {
	Quimicos = {
		Pos = vector3(1395.373, 3623.608, 34.012), --NPC SACAR QUIMICOS
		Marker = -1,
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		bool = true,
		Hint = 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~',
	},
	Quimicos2 = {
		Pos = vector3(3598.500, 3669.628, 32.871), --Carga de Quimicos 1
		Marker = 1,
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		bool = false,
		Hint = 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~',
	},
	Quimicos3 = {
		Pos = vector3(3597.601, 3661.530, 32.871), --Carga de Quimicos 2
		Marker = 1,
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		bool = false,
		Hint = 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~',
	},
	EntregaBolsa = {
		Pos = vector3(3593.936, 3673.818, 32.871),
		Marker = 1,
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		bool = false,
		Hint = 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~',
	},
	EntregaBolsa2 = {
		Pos = vector3(3591.298, 3658.974, 32.871),
		Marker = 1,
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		bool = false,
		Hint = 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~',
	},
	Quimicos4 = {
		Pos = vector3(1416.168, 3622.866, 33.860), --Devuelvo camioneta con quimicos
		Marker = 1,
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		bool = false,
		Hint = 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~',
	},
	RopaCoca = {
		Pos = vector3(1395.799, 3614.767, 38.941 - 0.95),
		Marker = 1,
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		bool = true,
		Hint = 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~',
	},
}
	--Metanfetamina
	--primer farmeo de efedrina
	Config.FarmeoEfedrina = vector3(1443.214,6331.834,23.981)
	Config.FarmeoAdrenalina = vector3(-439.847,6338.926,12.730)
	Config.VentaDeMeta = vector3(-2175.57,4294.909,48.060)
	
	--MARIHUANA
	Config.MariVenta = vector3(-287.638,2535.741,75.692)
	Config.MariSpawnC = vector4(-283.868, 2543.842, 74.238, 0.66)
	Config.MariLlegada = vector3(1204.735, -3117.60, 5.5403)
	
	Config.PaqueteMari3 = {x=1409.04,y=3666.781,z=33.05161}
	Config.Mari_Llegada = {x=95.94296, y=-2449.23, z=0.8577}
	Config.Mari_Secado = {x=1975.555,y=3818.625,z=32.436}
	
	--COCA 2023
	Config.FarmeoCoca = {
		vector4(880.5788,-1139.49,26.038,270.95278930664),
		vector4(880.5136,-1141.93,26.038,270.78558349609),
		vector4(880.5930,-1144.53,26.038,276.57705688477),
		vector4(882.2279,-1144.46,26.038,88.805305480957),
		vector4(882.2362,-1141.81,26.038,89.552772521973),
		vector4(882.2482,-1139.35,26.038,88.922660827637),
	}
	Config.Quimicos2023 = {x=-1080.37,y=-1671.41,z=3.7049}
	Config.VentaDeCoca = vector3(104.8028,-1975.86,20.956)


	--Quimicos
	--Config.Quimicos = {x=1395.373, y=3623.608, z=34.012} --NPC SACAR QUIMICOS
	Config.QuimicosCargaMarca = {x=3587.854, y=3667.473, z=33.879} --Marca de Gps para la carga de quimicos
	Config.Quimicos2 = {x=3598.500, y=3669.628, z=32.871} --Carga de Quimicos 1
	Config.Quimicos3 = {x=3597.601, y=3661.530, z=32.871} --Carga de Quimicos 2
	Config.Quimicos4 = {x=1416.168, y=3622.866, z=33.860} --Devuelvo camioneta con quimicos
	Config.EntregaBolsa = {x=3593.936, y=3673.818, z=33.871}
	Config.EntregaBolsa2 = {x=3591.298, y=3658.974, z=33.871}
	Config.Cocaina = {x=606.07,y=-3091.05,z=5.07}
	Config.Camioneta = vector4(1393.487, 3628.219, 34.695, 109.38)
	Config.PrecioCamioneta = 10000
	Config.RopaCoca = vector3(1395.799, 3614.767, 38.941)
	
	Config.VentaCoca = {x=-35.5443, y=2871.650, z=58.610}
	Config.CamionVentaCoca = vector4(-46.0048, 2882.971, 59.043, 156.25)
	Config.LleadaVentaCoca = vector3(2434.820, 4983.757, 45.004)
	Config.EntregoBolsa = {x=2443.566, y=4968.993, z=46.810}
	Config.DevolverCamion = {x=-46.0744, y=2883.044, z=57.813}
	
	Config.ProcesoCoca = {
		{x=1389.158, y=3605.343, z=38.941, h=287.5},
		{x=1389.898, y=3603.190, z=38.941, h=288.42},
		{x=1389.223, y=3608.530, z=38.941, h=12.81},
	}

	
	Config.SellFish2 = {x = 3801.09, y = 4475.79, z = 5.00} --Place where players can sell their fish
	Config.SellTurtle = {x = 222.15, y = 2580.16, z = 45.0} --Place where players can sell their turtles 
	Config.SellShark = {x = 29.08 , y = 3665.84, z = 39.5} --Place where players can sell their sharks
	Config.Gobernador = {x = -806.6, y = 171.2, z = 71.83} --casa gobernador
	
	
	Config.Entrada = {x=-2071.04, y=-1028.87, z=4.89}
	Config.Salida = vector3(-2071.31,-1018.61,3.05)
	Config.SalidaGo = {x=-2071.31,y=-1018.61,z=2.06}
	Config.EntradaTo = vector3(-2071.04,-1028.87,4.89)
	
	Config.AlquierMoto = {x=713.4,y=4093.93,z=34.73}
	Config.RequiredPolices = 4
	Config.Time = 1800
	Config.lastrobbed = 0	
	Config.Mucama = {x=1335.64,y=-522.63,z=71.25}
	Config.KeyPrecio = 40000

	
	--ROBO A YATE
	Config.Yate = {x=-2084.94,y=-1014.26,z=4.88}
	Config.RequiredPolicesYate = 5
	Config.lastrobbedYate = 0
	Config.TimeYate = 1800
	Config.RoboYateMoney = 1000000
	
	--ROBO A YATE PALETO
	Config.Yate2 = {x=-1430.11,y=6759.896,z=5.8841 - 1}
	Config.RequiredPolicesYate2 = 1
	Config.lastrobbedYate2 = 0
	Config.TimeYate2 = 1800
	Config.RoboYate2Money = 1000000
	
	--##ROBO A CASINO##--	
	Config.RobaCasino = {x=1114.837, y=243.8513, z=-45.84} --Inicio Robo Oficina de Arriba
	Config.RequiredPolicesCasino = 8
	Config.lastrobbedCasino = 0
	Config.TimeCasino = 1800
	Config.RoboCasinoMoney = 750000
	
	--ROBO A POLLERO--
	Config.RobaPollos = {x=-67.7932, y=6255.510, z=31.090}
	Config.RequiredPolicesPollos = 5
	Config.lastrobbedPollos = 0
	Config.TimePollos = 1800
	Config.RoboPollosMoney = 750000
	
	
	--ROBO CASA FRANKLIN
	Config.RobaFran = {x=-7.55093, y=524.1195, z=174.95}
	Config.RequiredPolicesFran = 5
	Config.lastrobbedFran = 0
	Config.TimeFran = 1800
	Config.RoboFranMoney = 750000
	
	--ROBO PORTA AVIONES
	Config.RobaPA = {x=3061.588,y=-4714.33,z=6.0772}
	Config.RequiredPolicesPA = 6
	Config.lastrobbedPA = 0
	Config.TimePA = 1800
	Config.RoboPAMoney = 1500000
	Config.DropCajas = 12
	
	Config.DropPorta = {
		--vector3(),
	}
	
	--ROBO SUBTE
	Config.RobaSubte = {x=-842.328,y=-124.751,z=28.184}
	Config.RequiredPolicesSubte = 6
	Config.lastrobbedSubte = 0
	Config.TimeSubte = 1800
	Config.RoboSubteMoney = 1000000
	
	
	--Robo Frigorifico
	Config.RobaCarne = {x=992.9555,y=-2133.22,z=30.475}
	Config.RequiredPolicesCarne = 4
	Config.lastrobbedCarne = 0
	Config.TimeCarne = 1800
	Config.RoboCarneMoney = 1000000
	
	Config.Dropeos = {
		vector3(0.038032, 524.3848, 174.62),
		vector3(1.671818, 530.8173, 174.62),
		vector3(-8.94544, 521.7064, 174.62),
		vector3(-11.2397, 517.7356, 174.62),
		vector3(-6.09806, 530.8088, 174.99),
		vector3(-7.87548, 530.2562, 174.99),
		vector3(-0.33087, 536.6234, 175.34),
		vector3(-2.01470, 525.5753, 170.63),
		vector3(9.227390, 529.6643, 170.61),
		vector3(10.15846, 527.6980, 170.61),
		vector3(-5.75976, 530.4206, 170.61),
		vector3(-10.3690, 531.1335, 170.61),
		vector3(4.589455, 529.5134, 170.63),
		vector3(-0.43829, 522.8339, 170.63),
		vector3(-2.09610, 525.4200, 170.63)
	}
	
	--ROBO A MANSION GREPESED
	Config.RobaMansion = {x=2451.936, y=4969.081, z=46.571}
	Config.RequiredPolicesMansion = 8
	Config.lastrobbedMansion = 0
	Config.TimeMansion = 7200
	Config.RoboMansionMoney = 2000000
	
	--##TP ASCENSORES##--
	
	Config.FastTravelsPrompt = {	
		--Casino Diamond
		{
			From = vector3(1107.057, 243.0830, -45.84),
			To = {coords = vector3(959.7272, 32.49656, 120.22), heading = 141.21},
			Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
			Prompt = 'Subir'
		},
			
		{
			From = vector3(959.7272, 32.49656, 120.22),
			To = {coords = vector3(1107.057, 243.0830, -45.84), heading=258.79},
			Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
			Prompt = 'Bajar'
		},
		
		{
			From = vector3(1146.576, 240.7381, -51.04),
			To = {coords = vector3(980.2261, 22.55413, 80.990), heading = 235.32},
			Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
			Prompt = 'Salir'
		},
			
		{
			From = vector3(980.2261, 22.55413, 80.990),
			To = {coords = vector3(1146.576, 240.7381, -51.04), heading=354.31},
			Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
			Prompt = 'Entrar'
		},
	}
	
	
Config.Uniforms = {
	coca = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 67,   ['torso_2'] = 2,
			['arms'] = 88,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['pants_1'] = 40,   ['pants_2'] = 2,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['mask_1'] = 38,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bracelets_1'] = -1,
			['watches_1'] = -1, ['watches_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 61,   ['torso_2'] = 2,
			['arms'] = 101,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['pants_1'] = 40,   ['pants_2'] = 2,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['mask_1'] = 38,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bracelets_1'] = -1,
			['watches_1'] = -1, ['watches_2'] = 0
		}
	}
}

