	Config                            = {}
Config.DrawDistance               = 20.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 1000, max = 2000 }
Config.Locale = 'en'
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf
Config.Vehicles = {
	'adder',
	'asea',
	'asterope',
	'banshee',
	'buffalo'
}

Config.Zones = {

	bytaveActions = {
		Pos   = { x = 170.8793, y = -1671.57, z = 29.757 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 0, g = 204, b = 0 },
		Type  = 22,
	},

	Craft = {
		Pos   = { x = -85.38, y = -1802.71, z = 200.0 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 0, g = 204, b = 0 },
		Type  = 21,
	},

	VehicleSpawnPoint = {
		Pos   = { x = 173.5093, y = -1666.16, z = 29.586 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1,
	},

	VehicleDeleter = {
		Pos   = { x = 184.0243, y = -1674.17, z = 29.586 },
		Size  = { x = 3.0, y = 3.0, z = 3.0 },
		Color = { r = 204, g = 0, b = 0 },
		Type  = 1,
	},

	VehicleDelivery = {
		Pos   = { x = 184.0243, y = -1674.17, z = 29.586 },
		Size  = { x = 20.0, y = 20.0, z = 3.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1,
	}

}

Config.Towables = {
	{ ['x'] = 933.8, ['y'] = -937.31, ['z'] = 38.70 },
	{ ['x'] = 942.18, ['y'] = -935.69, ['z'] = 38.70 },
	{ ['x'] = 950.45, ['y'] = -935.02, ['z'] = 38.80 },
	{ ['x'] = 959.51, ['y'] = -941.79, ['z'] = 38.80 },
	{ ['x'] = 960.8, ['y'] = -952.27, ['z'] = 38.80 },
	{ ['x'] = 921.42, ['y'] = -945.06, ['z'] = 38.80 },
	{ ['x'] = 910.29, ['y'] = -946.14, ['z'] = 38.80 },
}

for i=1, #Config.Towables, 1 do
	Config.Zones['Towable' .. i] = {
		Pos   = Config.Towables[i],
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end
-- SP © License | Discord : https://discord.gg/39mJqPU / https://discord.gg/3wwzfmf