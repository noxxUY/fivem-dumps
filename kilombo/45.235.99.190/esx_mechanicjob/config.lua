Config                            = {}
Config.Locale = 'es'

Config.DrawDistance               = 10.0 -- How close you need to be in order for the markers to be drawn (in GTA units).
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true -- Enable society managing.
Config.EnableSocietyOwnedVehicles = false

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.Vehicles = {
	'asea',
	'baller3'
}
-- BENNYS
Config.Zones_Mechanic = {

	MechanicActions = {
		Pos   = vector3(-201.83, -1318.48, 31.09),
		Size  = { x = 0.7, y = 0.7, z = 0.5 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 21
	},

	Craft = {
		Pos   = vector3(-215.84, -1318.46, 30.89),
		Size  = { x = 0.5, y = 0.5, z = 0.3 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	},

	VehicleSpawnPoint = {
		Pos   = vector3(-186.03, -1301.72, 30.3),
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = vector3(-181.59266662598, -1307.5126953125, 30.292537689209),
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
		Eliminar = true
	}

}
-- LOS SANTOS
Config.Zones_Mechanic2 = {

	MechanicActions = {
		Pos   = vector3(-350.62, -130.82, 39.01),
		Size  = { x = 0.7, y = 0.7, z = 0.5 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 21
	},

	Craft = {
		Pos   = vector3(-323.14672851563, -145.92686462402, 39.015804290771),
		Size  = { x = 0.5, y = 0.5, z = 0.3 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	},

	VehicleSpawnPoint = {
		Pos   = vector3(-365.66, -115.8, 38.7),
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = vector3(-384.65, -108.36, 37.69),
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
		Eliminar = true
	}

}
-- RED LINE
Config.Zones_Mechanic3 = {

	MechanicActions = {
		Pos   = vector3(279.55, -182.38, 54.06),
		Size  = { x = 0.7, y = 0.7, z = 0.5 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 21
	},

	Craft = {
		Pos   = vector3(293.95, -186.65, 54.06),
		Size  = { x = 0.5, y = 0.5, z = 0.3 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	},

	VehicleSpawnPoint = {
		Pos   = vector3(274.53720092773, -172.7053527832, 60.543125152588),
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = vector3(290.89239501953, -231.26849365234, 53.941513061523),
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
		Eliminar = true
	}

}