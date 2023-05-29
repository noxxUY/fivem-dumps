Config                            = {}
Config.Locale                     = 'en'

Config.DrawDistance               = 100.0
Config.MaxInService               = 20
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 15, max = 40 }

Config.Vehicles = {
	'adder',
	'asea',
	'asterope',
	'banshee',
	'buffalo'
}
--poner vehicule list en hearvest
Config.Zones = {
	
	Bennys = {
	
		MechanicActions = {
			Pos   = { x=-224.344,y=-1319.90,z=30.890 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},
	
		MechanicBlip = {
			Pos   = { x = -222.573, y = -1324.09, z = 30.890 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 }
		},

		Garage = {
			Pos   = { x=-178.561, y=-1295.42, z=31.359 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 2
		},
	
		Boss = {
			Pos   = { x=-206.615,y=-1341.66,z=34.894 }, 
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},

		Craft = {
			Pos   = { x = 1015.51, y = -2334.75, z = 29.20 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},

		VehicleSpawnPoint = {
			Pos   = { x = -189.875, y = -1272.12, z = 31.058 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Type  = -1,
			Heading = 179.77
		},

		VehicleDeleter = {
			Pos   = { x = -183.524, y = -1285.64, z = 31.295},
			Size  = { x = 3.0, y = 3.0, z = 1.0 },
			Color = { r = 255, g = 0, b = 0 },
			Type  = 27
		},

		VehicleDelivery = {
			Pos   = { x = 1011.925, y = -133.748, z = 37.685 },
			Size  = { x = 20.0, y = 20.0, z = 3.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = -1
		},
	},	
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
            ['tshirt_1'] = 89,  ['tshirt_2'] = 0,
            ['torso_1'] = 235,   ['torso_2'] = 3,
            ['arms'] = 19,
            ['pants_1'] = 97,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = 152,  ['helmet_2'] = 0,
            ['glasses_1'] = 8,  ['glasses_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
        },
		female = {
            ['tshirt_1'] = 1,  ['tshirt_2'] = 0,
            ['torso_1'] = 245,   ['torso_2'] = 3,
            ['arms'] = 31,
            ['pants_1'] = 100,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	novice = {
		male = {
            ['tshirt_1'] = 89,  ['tshirt_2'] = 0,
            ['torso_1'] = 235,   ['torso_2'] = 3,
            ['arms'] = 19,
            ['pants_1'] = 97,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = 152,  ['helmet_2'] = 0,
            ['glasses_1'] = 8,  ['glasses_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
        },
		female = {
            ['tshirt_1'] = 1,  ['tshirt_2'] = 0,
            ['torso_1'] = 245,   ['torso_2'] = 3,
            ['arms'] = 31,
            ['pants_1'] = 100,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	experimente = {
		male = {
            ['tshirt_1'] = 89,  ['tshirt_2'] = 0,
            ['torso_1'] = 235,   ['torso_2'] = 3,
            ['arms'] = 19,
            ['pants_1'] = 97,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = 152,  ['helmet_2'] = 0,
            ['glasses_1'] = 8,  ['glasses_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
        },
		female = {
            ['tshirt_1'] = 1,  ['tshirt_2'] = 0,
            ['torso_1'] = 245,   ['torso_2'] = 3,
            ['arms'] = 31,
            ['pants_1'] = 100,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	chief = {
		male = {
            ['tshirt_1'] = 89,  ['tshirt_2'] = 0,
            ['torso_1'] = 235,   ['torso_2'] = 3,
            ['arms'] = 19,
            ['pants_1'] = 97,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = 152,  ['helmet_2'] = 0,
            ['glasses_1'] = 8,  ['glasses_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
        },
		female = {
            ['tshirt_1'] = 1,  ['tshirt_2'] = 0,
            ['torso_1'] = 245,   ['torso_2'] = 3,
            ['arms'] = 31,
            ['pants_1'] = 100,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	boss = { -- currently the same as intendent_wear
		male = {
            ['tshirt_1'] = 89,  ['tshirt_2'] = 0,
            ['torso_1'] = 235,   ['torso_2'] = 3,
            ['arms'] = 19,
            ['pants_1'] = 97,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = 152,  ['helmet_2'] = 0,
            ['glasses_1'] = 8,  ['glasses_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
        },
		female = {
            ['tshirt_1'] = 1,  ['tshirt_2'] = 0,
            ['torso_1'] = 245,   ['torso_2'] = 3,
            ['arms'] = 31,
            ['pants_1'] = 100,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['mask_1'] = -1,     ['mask_2'] = 0,
		}
	}
}