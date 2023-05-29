Config                            = {}
Config.Locale                     = 'en'

Config.DrawDistance               = 100.0
Config.MaxInService               = 20
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 15, max = 40 }

Config.Owner = 'steam:110000106e6d6fc'
Config.Owner2 = 'steam:11000013f541204'

Config.Vehicles = {
	'adder',
	'asea',
	'asterope',
	'banshee',
	'buffalo'
}
--poner vehicule list en hearvest
Config.Zones = {	
	Ciudad_Conse = {	
		MechanicActions = {
			Pos   = { x=-686.754,y=-762.186,z=31.528 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},
	
		MechanicBlip = {
			Pos   = { x=-690.582,y=-788.048,z=26.109 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 }
		},
	
		Boss = {
			Pos   = { x=-695.708,y=-790.170,z=31.528 }, ---178.39, -1295.49, 30.36
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},
		
		Garage = {
			Pos   = { x=-710.949,y=-759.267,z=26.182 }, ---178.39, -1295.49, 30.36
			Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 255, g = 255, b = 0 },
			Type  = 36
		},

		VehicleSpawnPoint = {
			Pos   = { x=-720.675,y=-744.085,z=27.200},
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Type  = -1,
			Heading = 85.256629943848 
		},

		VehicleDeleter = {
			Pos   = { x=-720.675,y=-744.085,z=27.200 },
			Size  = { x = 3.0, y = 3.0, z = 1.0 },
			Color = { r = 255, g = 0, b = 0 },
			Type  = 27
		},
	},	
	--[[
	Santos = {	
		MechanicActions = {
			Pos   = { x=-345.532,y=-123.010,z=39.009 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},
	
		MechanicBlip = {
			Pos   = { x=-339.164,y=-135.845,z=39.009 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 }
		},
	
		Boss = {
			Pos   = { x=-347.470,y=-133.296,z=39.009 }, ---178.39, -1295.49, 30.36
			Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},
		
		Garage = {
			Pos   = { x=-350.009,y=-112.615,z=39.430 }, ---178.39, -1295.49, 30.36
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 2
		},

		VehicleSpawnPoint = {
			Pos   = { x=-356.984,y=-114.794,z=38.093 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Type  = -1,
			Heading = 71.681762695313
		},

		VehicleDeleter = {
			Pos   = { x=-352.149,y=-116.644,z=38.753 },
			Size  = { x = 3.0, y = 3.0, z = 1.0 },
			Color = { r = 255, g = 0, b = 0 },
			Type  = 27
		},
	},	
	]]--
}

--[[
Camisa 2 251
Color 8
Pantalón 97
Color 8
Mochila 44
Color 0
Ropa BENNYS

]]
Config.Uniforms = {
	recrue = {
		male = {
            ['tshirt_1'] = 155,  ['tshirt_2'] = 0,
            ['torso_1'] = 97,   ['torso_2'] = 0,
            ['arms'] = 52, 
            ['pants_1'] = 26,   ['pants_2'] = 0,
            ['shoes_1'] = 26,   ['shoes_2'] = 2,
            ['helmet_1'] = 66,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = 7,     ['ears_2'] = 1,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        },
		female = {
            ['tshirt_1'] = 191,  ['tshirt_2'] = 0,
            ['torso_1'] = 49,   ['torso_2'] = 1,
            ['arms'] = 0,
            ['pants_1'] = 92,   ['pants_2'] = 4,
            ['shoes_1'] = 50,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = 0,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        }
	},
	novice = {
		male = {
            ['tshirt_1'] = 155,  ['tshirt_2'] = 0,
            ['torso_1'] = 97,   ['torso_2'] = 0,
            ['arms'] = 52, 
            ['pants_1'] = 26,   ['pants_2'] = 0,
            ['shoes_1'] = 26,   ['shoes_2'] = 2,
            ['helmet_1'] = 66,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = 7,     ['ears_2'] = 1,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        },
		female = {
            ['tshirt_1'] = 191,  ['tshirt_2'] = 0,
            ['torso_1'] = 49,   ['torso_2'] = 1,
            ['arms'] = 0,
            ['pants_1'] = 92,   ['pants_2'] = 4,
            ['shoes_1'] = 50,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = 0,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        }
	},
	experimente = {
		male = {
            ['tshirt_1'] = 155,  ['tshirt_2'] = 0,
            ['torso_1'] = 97,   ['torso_2'] = 0,
            ['arms'] = 52, 
            ['pants_1'] = 26,   ['pants_2'] = 0,
            ['shoes_1'] = 26,   ['shoes_2'] = 2,
            ['helmet_1'] = 66,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = 7,     ['ears_2'] = 1,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        },
		female = {
            ['tshirt_1'] = 191,  ['tshirt_2'] = 0,
            ['torso_1'] = 49,   ['torso_2'] = 1,
            ['arms'] = 0,
            ['pants_1'] = 92,   ['pants_2'] = 4,
            ['shoes_1'] = 50,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = 0,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        }
	},
	chief = {
		male = {
            ['tshirt_1'] = 155,  ['tshirt_2'] = 0,
            ['torso_1'] = 97,   ['torso_2'] = 0,
            ['arms'] = 52, 
            ['pants_1'] = 26,   ['pants_2'] = 0,
            ['shoes_1'] = 26,   ['shoes_2'] = 2,
            ['helmet_1'] = 66,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = 7,     ['ears_2'] = 1,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        },
		female = {
            ['tshirt_1'] = 191,  ['tshirt_2'] = 0,
            ['torso_1'] = 49,   ['torso_2'] = 1,
            ['arms'] = 0,
            ['pants_1'] = 92,   ['pants_2'] = 4,
            ['shoes_1'] = 50,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = 0,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        }
	},
	boss = { -- currently the same as intendent_wear
		male = {
            ['tshirt_1'] = 155,  ['tshirt_2'] = 0,
            ['torso_1'] = 97,   ['torso_2'] = 0,
            ['arms'] = 52, 
            ['pants_1'] = 26,   ['pants_2'] = 0,
            ['shoes_1'] = 26,   ['shoes_2'] = 2,
            ['helmet_1'] = 66,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = 7,     ['ears_2'] = 1,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        },
		female = {
            ['tshirt_1'] = 191,  ['tshirt_2'] = 0,
            ['torso_1'] = 49,   ['torso_2'] = 1,
            ['arms'] = 0,
            ['pants_1'] = 92,   ['pants_2'] = 4,
            ['shoes_1'] = 50,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['glasses_1'] = 0,  ['glasses_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = 0,     ['mask_2'] = 0,
            ['bproof_1'] = 85,  ['bproof_2'] = 23,
        }
	}
}