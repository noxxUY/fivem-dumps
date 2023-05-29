Config                            = {}
Config.Locale                     = 'en'

Config.DrawDistance               = 100.0
Config.MaxInService               = 20
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 15, max = 40 }

Config.Owner = 'steam:1100001448da209'

Config.Vehicles = {
	'adder',
	'asea',
	'asterope',
	'banshee',
	'buffalo'
}
--poner vehicule list en hearvest
Config.Zones = {

	Ciudad = {
	
		MechanicActions = {
			Pos   = { x=-341.439,y=-162.154,z=44.587 - 0.95 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},
	
		MechanicBlip = {
			Pos   = { x=-317.934,y=-118.225,z=39.017 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 }
		},

		Garage = {
			Pos   = { x=-352.452,y=-156.585,z=39.013 }, ---178.39, -1295.49, 30.36
			Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 255, g = 255, b = 0 },
			Type  = 36
		},
	
		Boss = {
			Pos   = { x=-339.784,y=-157.387,z=44.587 }, ---178.39, -1295.49, 30.36
			Size  = { x = 0.5, y = 0.5, z = 0.5 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 2
		},

		Craft = {
			Pos   = { x = 1015.51, y = -2334.75, z = 29.20 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = 27
		},

		VehicleSpawnPoint = {
			Pos   = { x=-356.746,y=-159.590,z=38.728},
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Type  = -1,
			Heading = 51.521339416504
		},

		VehicleDeleter = {
			Pos   = { x=-356.746,y=-159.590,z=38.728 - 0.95 },
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

Config.Towables = {
	vector3(-2480.9, -212.0, 17.4),
	vector3(-2723.4, 13.2, 15.1),
	vector3(-3169.6, 976.2, 15.0),
	vector3(-3139.8, 1078.7, 20.2),
	vector3(-1656.9, -246.2, 54.5),
	vector3(-1586.7, -647.6, 29.4),
	vector3(-1036.1, -491.1, 36.2),
	vector3(-1029.2, -475.5, 36.4),
	vector3(75.2, 164.9, 104.7),
	vector3(-534.6, -756.7, 31.6),
	vector3(487.2, -30.8, 88.9),
	vector3(-772.2, -1281.8, 4.6),
	vector3(-663.8, -1207.0, 10.2),
	vector3(719.1, -767.8, 24.9),
	vector3(-971.0, -2410.4, 13.3),
	vector3(-1067.5, -2571.4, 13.2),
	vector3(-619.2, -2207.3, 5.6),
	vector3(1192.1, -1336.9, 35.1),
	vector3(-432.8, -2166.1, 9.9),
	vector3(-451.8, -2269.3, 7.2),
	vector3(939.3, -2197.5, 30.5),
	vector3(-556.1, -1794.7, 22.0),
	vector3(591.7, -2628.2, 5.6),
	vector3(1654.5, -2535.8, 74.5),
	vector3(1642.6, -2413.3, 93.1),
	vector3(1371.3, -2549.5, 47.6),
	vector3(383.8, -1652.9, 37.3),
	vector3(27.2, -1030.9, 29.4),
	vector3(229.3, -365.9, 43.8),
	vector3(-85.8, -51.7, 61.1),
	vector3(-4.6, -670.3, 31.9),
	vector3(-111.9, 92.0, 71.1),
	vector3(-314.3, -698.2, 32.5),
	vector3(-366.9, 115.5, 65.6),
	vector3(-592.1, 138.2, 60.1),
	vector3(-1613.9, 18.8, 61.8),
	vector3(-1709.8, 55.1, 65.7),
	vector3(-521.9, -266.8, 34.9),
	vector3(-451.1, -333.5, 34.0),
	vector3(322.4, -1900.5, 25.8)
}

--[[
for k,v in ipairs(Config.Towables) do
	Config.Zones['Towable' .. k] = {
		Pos   = v,
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end
]]

Config.Uniforms = {
	recrue = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 131,   ['torso_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 102,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 76,  ['helmet_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 184,  ['tshirt_2'] = 0,
			['torso_1'] = 128,   ['torso_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 76,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	novice = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 131,   ['torso_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 102,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 76,  ['helmet_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 184,  ['tshirt_2'] = 0,
			['torso_1'] = 128,   ['torso_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 76,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	experimente = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 131,   ['torso_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 102,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 76,  ['helmet_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 184,  ['tshirt_2'] = 0,
			['torso_1'] = 128,   ['torso_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 76,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	chief = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 131,   ['torso_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 102,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 76,  ['helmet_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 184,  ['tshirt_2'] = 0,
			['torso_1'] = 128,   ['torso_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 76,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		}
	},
	boss = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 131,   ['torso_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 76,  ['helmet_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 184,  ['tshirt_2'] = 0,
			['torso_1'] = 128,   ['torso_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 76,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 75,  ['helmet_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
		}
	}
}