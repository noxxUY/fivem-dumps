Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 600
Config.Locale       = 'en'

Config.Deposito = 2500

Config.Trucks = {
	"coach",
	--"packer",	
	"bus",
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = 436.38, y = -647.44, z = 27.74},
			Size  = {x = 1.5, y = 1.5, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = 453.62, y = -600.55, z = 27.59},
			Size  = {x = 1.5, y = 1.5, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = 462.55, y = -605.26, z = 28.5},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	[1] = {
		Pos   = {x=307.3427, y=-765.540, z=28.231},
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 1
	},	
	[2] = {
		Pos   = {x=394.6311, y=-1018.75, z=28.328},
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 2
	},
	[3] = {
		Pos   = {x=-266.797, y=-852.589, z=30.486},
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 3
	},
	[4] = {
		Pos   = {x=-889.174, y=-1173.50, z=3.7446}, --Hospital
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 4  
	},
	[5] = {
		Pos   = {x=-1186.32, y=-1260.52, z=5.7560}, --Esquina Hospital
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 5
	},
	[6] = {
		Pos   = {x=-1532.04, y=-499.002, z=34.429},
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 6
	},
	[7] = {
		Pos   = {x=-706.589, y=-82.9046, z=36.857}, --Esquina Life Invader
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 7
	},
	[8] = {
		Pos   = {x=-342.291, y=-204.166, z=36.913}, --
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 8
	},
	[9] = {
		Pos   = {x=325.0547, y=-269.635, z=52.808}, --Motel pink
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 9
	},
	[10] = {
		Pos   = {x=479.4540, y=108.4077, z=96.552}, --Pre BC
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 10
	},
	[11] = {
		Pos   = {x=57.09343, y=262.9226, z=108.41}, --mc dondalds
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 11
	},
	[12] = {
		Pos   = {x=-1440.25, y=17.85001, z=51.400}, --golf
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 12
	},
	[13] = {
		Pos   = {x=-2984.25, y=368.0148, z=13.755}, --banco great ocean
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 13
	},
	[14] = {
		Pos   = {x=-2724.20, y=2255.020, z=19.685}, --Puente Militar
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 14
	},
	[15] = {
		Pos   = {x=-2203.38, y=4305.735, z=47.445}, --PutiClub GreatOcean
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 15
	},
	[16] = {
		Pos   = {x=-840.531, y=5436.544, z=33.208}, --Leañdor
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 16
	},
	[17] = {
		Pos   = {x=-154.169, y=6207.059, z=30.210}, --Depo Paleto
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 17
	},
	[18] = {
		Pos   = {x=2593.197, y=5134.087, z=43.746}, --Canabis
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 18
	},
	[19] = {
		Pos   = {x=1678.736, y=4959.371, z=41.464}, --Ypf Grepesed
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 19
	},
	[20] = {
		Pos   = {x=1975.766, y=4599.102, z=39.471}, --Aeropuerto trevor
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[21] = {
		Pos   = {x=1820.149, y=3656.258, z=33.090}, --Hospital de Sandy
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[22] = {
		Pos   = {x=270.0648, y=2664.492, z=43.442}, --Esquina Hotel Sandy
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[23] = {
		Pos   = {x=2007.749, y=2978.634, z=44.367}, --Bola 8
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[24] = {
		Pos   = {x=2556.351, y=2650.671, z=37.869}, --Minero
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[25] = {
		Pos   = {x=2514.646, y=622.7877, z=106.63}, --ypf alternativa
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[26] = {
		Pos   = {x=413.9595, y=-1576.79, z=28.210}, --depo ciudad
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[27] = {
		Pos   = {x=511.7482, y=-709.313, z=23.816}, --Esquina Colectiveros
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	
	RetourCamion = {
			Pos   = {x = 462.55, y = -605.26, z = 27.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 458.35, y = -615.19, z = 27.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},	
}

Config.Livraison2 = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	[1] = {
		Pos   = {x=497.4123, y=-804.671, z=23.771}, --Esquina Bus
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 1
	},	
	[2] = {
		Pos   = {x=386.0035, y=-1585.65, z=28.170}, --Depo
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 2
	},
	[3] = {
		Pos   = {x=2584.857, y=138.9754, z=96.610}, --Ypf Alternativa
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 3
	},
	[4] = {
		Pos   = {x=2579.587, y=2636.019, z=36.722}, --Minero
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 4  
	},
	[5] = {
		Pos   = {x=1964.792, y=2986.985, z=44.626}, --Bola 8
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 5
	},
	[6] = {
		Pos   = {x=338.3560, y=2659.297, z=43.710}, --Motel Sandy
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 6
	},
	[7] = {
		Pos   = {x=1827.253, y=3638.263, z=33.198}, --Hospital de Sandy
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 7
	},
	[8] = {
		Pos   = {x=1967.053, y=4610.246, z=39.470}, --aeropuerto trevor
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 8
	},
	[9] = {
		Pos   = {x=1696.043, y=4952.326, z=42.040}, --ypf grapeseed
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 9
	},
	[10] = {
		Pos   = {x=2641.311, y=5150.306, z=43.740}, --canabis
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 10
	},
	[11] = {
		Pos   = {x=-216.919, y=6171.718, z=30.227}, --Depo Paleto
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 11
	},
	[12] = {
		Pos   = {x=-857.549, y=5454.436, z=33.331}, --Leañdor
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 12
	},
	[13] = {
		Pos   = {x=-2228.26, y=4323.821, z=47.695}, --PutiClub GreatOcean
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 13
	},
	[14] = {
		Pos   = {x=-2745.89, y=2270.020, z=19.783}, --Puente militar
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 14
	},
	[15] = {
		Pos   = {x=-3005.35, y=396.5518, z=13.880}, --Banco Galicia
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 15
	},
	[16] = {
		Pos   = {x=-1417.39, y=29.40009, z=51.392}, --Golf
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 16
	},
	[17] = {
		Pos   = {x=70.73688, y=229.3918, z=107.86}, --mc
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 17
	},
	[18] = {
		Pos   = {x=468.3912, y=84.17633, z=96.665}, --esq bc
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 18
	},
	[19] = {
		Pos   = {x=320.8692, y=-247.266, z=52.789}, --motel
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 19
	},
	[20] = {
		Pos   = {x=-342.807, y=-184.187, z=37.468}, --meca
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[21] = {
		Pos   = {x=-762.522, y=-38.5743, z=36.685}, --vuelta meca
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[22] = {
		Pos   = {x=-1526.16, y=-466.962, z=34.313}, --gc great ocean
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[23] = {
		Pos   = {x=-1194.06, y=-1276.26, z=5.0915}, --esq hospi
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[24] = {
		Pos   = {x=-887.522, y=-1200.25, z=3.8231}, --hospital
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[25] = {
		Pos   = {x=-249.477, y=-883.521, z=29.543}, --gc
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[26] = {
		Pos   = {x=378.9290, y=-1064.46, z=28.266}, --comi
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	[27] = {
		Pos   = {x=330.0131, y=-772.054, z=28.188}, --Esquina cubo
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 5.0, y = 5.0, z = 3.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Paye = 1500,
		num = 20
	},
	
	RetourCamion = {
			Pos   = {x = 462.55, y = -605.26, z = 27.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = 458.35, y = -615.19, z = 27.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},	
}

Config.JobUniforms = {
	male = {
		['sex'] = 0,
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 13,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 11,
		['pants_1'] = 10,   ['pants_2'] = 0,
		['shoes_1'] = 21,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 12,    ['chain_2'] = 2,
		['ears_1'] = -1,     ['ears_2'] = 0
	},
	female = {
		['sex'] = 1,		
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 27,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 6,   ['pants_2'] = 0,
		['shoes_1'] = 13,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0
	}
}
