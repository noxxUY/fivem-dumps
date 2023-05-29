Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).
Config.Debug                      = ESX.GetConfig().EnableDebug
Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 3000  -- Revive reward, set to 0 if you don't want it enabled
Config.SaveDeathStatus            = true -- Save Death Status?
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders
Config.AntiCombatLog			  = true -- Borrar items y reaparecer en hospi al quitear muerto

Config.Locale                     = 'es'

Config.DistressBlip = {
	Sprite = 303,
	Color = 6,
	Scale = 0.8
}

Config.EarlyRespawnTimer          = 60000 * 2  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 7  -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.RespawnPoints = {
	{coords = vector3(325.35034179688, -593.5654296875, 43.284103393555), heading = 71.870758056641}, -- Ciudad
	{coords = vector3(1836.03, 3670.99, 34.28), heading = 296.06}, -- Sandy 
	{coords = vector3(-242.71208190918, 6326.3266601563, 32.426193237305), heading = 221.96096801758} -- Paleto
	
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(298.6, -584.55, 43.26),
			sprite = 61,
			scale  = 0.7,
			color  = 2
		},

		AmbulanceActions = {
			vector3(299.3, -598.0, 43.2)
		},
				
		
		Pharmacies = {
			vector3(306.87, -601.50, -42.28)
		},

		--[[Vehicles = {
			{
				Spawner = vector3(307.7, -1433.4, 30.0),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(297.2, -1429.5, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(294.0, -1433.1, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(309.4, -1442.5, 29.8), heading = 227.6, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(317.5, -1449.5, 46.5),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(313.5, -1465.1, 46.5), heading = 142.7, radius = 10.0},
					{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}
		},]]

		FastTravels = {
			{
				From = vector3(330.24987792969, -601.06402587891, 43.284004211426),
				To = { coords = vector3(344.21990966797, -583.86419677734, 74.165557861328), heading = 138.6 },
				Marker = { type = 21, x = 0.8, y = 0.8, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = true }
			},

			{
				From = vector3(339.4753112793, -584.05676269531, 74.165542602539),
				To = { coords = vector3(327.64477539063, -600.22888183594, 43.284034729004), heading = 0.0 },
				Marker = { type = 21, x = 0.8, y = 0.8, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = true }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	},

}

Config.Blips = {
	Sandy = {

		Blip = {
			coords = vector3(1827.6103515625, 3680.8288574219, 34.271083831787),
			sprite = 61,
			scale  = 0.7,
			color  = 2
		},

	},
	
	Paleto = {

		Blip = {
			coords = vector3(-264.61090087891, 6318.8447265625, 32.427261352539),
			sprite = 61,
			scale  = 0.7,
			color  = 2
		},

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 5000}
		},

		doctor = {
			{model = 'ambulance', price = 4500}
		},

		chief_doctor = {
			{model = 'ambulance', price = 3000}
		},

		boss = {
			{model = 'ambulance', price = 2000}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'buzzard2', price = 150000}
		},

		chief_doctor = {
			{model = 'buzzard2', price = 150000},
			{model = 'seasparrow', price = 300000}
		},

		boss = {
			{model = 'buzzard2', price = 10000},
			{model = 'seasparrow', price = 250000}
		}
	}
}


-- GARAGE 
-- GARAGE 
-- GARAGE 
-- GARAGE 
-- GARAGE 
-- GARAGE 
-- GARAGE 
-- GARAGE 
-- GARAGE 


Config.KeyToOpenCarGarage = 38			-- default 38 is E
Config.KeyToOpenHeliGarage = 38			-- default 38 is E

Config.ambulanceDatabaseName = 'ambulance'	-- set the exact name from your jobs database for ambulance

--ambulance Car Garage:
Config.CarZones = {
	ambulanceCarGarage = {
		Pos = {
			{x = 279.84, y= -605.6, z= 43.07},
		}
	}
}

--ambulance Heli Garage:
Config.HeliZones = {
	ambulanceHeliGarage = {
		Pos = {
			{x = 351.33, y= -588.14, z= 74.17},
		}
	}
}


--ambulance Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Garaje"
Config.EnableCarGarageBlip = false

-- ambulance Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Garaje Helicopteros"
Config.TitleambulanceGarage = "Garaje - SAME"
Config.EnableHeliGarageBlip = false



-- ambulance Car Garage Marker Settings:
Config.ambulanceCarMarker = 27 												-- marker type
Config.ambulanceCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.ambulanceCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "~b~[E]~s~ Para abrir el garaje"			-- set your desired text here
Config.BorrarCoche = "~b~[E]~s~ Para guardar el coche"			-- set your desired text here

-- ambulance Heli Garage Marker Settings:
Config.ambulanceHeliMarker = 27 												-- marker type
Config.ambulanceHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.ambulanceHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "~b~[E]~s~ Para abrir el garaje"		-- set your desired text here


-- ambulance Cars:
Config.ambulanceVehicles = {
	{ model = 'ambulance', label = '<i style="color:powderblue;" class="fa-solid fa-truck"></i> - Ambulancia'},
	{ model = 'ghispo2', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Maserati Ghibli'},
	{ model = 'motobm', label = '<i style="color:powderblue;" class="fa-solid fa-motorcycle"></i> - Moto BMW'}

}

-- ambulance Helicopters:
Config.ambulanceHelicopters = {
	{ model = 'as350', label = '<i style="color:powderblue;" class="fa-solid fa-helicopter"></i> - Helicoptero SAME', livery = 0, price = 0 }
}



-- Menu Labels & Titles:
Config.LabelStoreVeh = "Devolver un vehículo"
Config.LabelGetVeh = "Retirar un vehiculo"


-- ESX.ShowNotifications:
Config.VehicleParked = "Guardaste el coche en el garage."
Config.NoVehicleNearby = "No estás en un vehiculo."
Config.CarOutFromPolGar = "Sacaste un ~b~Vehiculo~s~!"
Config.HeliOutFromPolGar = "Sacaste un ~b~Helicoptero~s~!"
Config.VehicleLoadText = "Descargando modelo del vehículo, espera."
