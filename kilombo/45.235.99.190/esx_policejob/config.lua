Config                            = {}

Config.DrawDistance               = 15.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds     = false -- Enable if you're using esx_optionalneeds
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = false -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

-- BOTÓN DE PÁNICO
Config.blipTime = 30
Config.PoliceName = 'police'

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale                     = 'es'

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.ComisariaJail = vector3(460.87393188477, -987.00854492188, 34.201278686523) -- Coordenadas para enviar barridas (Rango de 25m)

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(460.87393188477, -987.00854492188, 34.201278686523),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.6,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(471.50802612305, -990.31024169922, 25.734672546387)
		},

		Armories = {
			vector3(484.60763549805, -1005.1583862305, 25.734663009644)
		},

		--[[Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			}
		},]]

		BossActions = {
			vector3(463.05252075195, -978.90679931641, 30.689361572266)
		}

	}

}

--[[Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}]]

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 1,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 2,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 3,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 11,  bproof_2 = 1
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},

	gilet_wear = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
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


Config.policeDatabaseName = 'police'	-- set the exact name from your jobs database for police

--police Car Garage:
Config.CarZones = {
	policeCarGarage = {
		Pos = {
			{x = 435.44, y= -977.19, z= 25.73},
		}
	}
}

--police Heli Garage:
Config.HeliZones = {
	policeHeliGarage = {
		Pos = {
			{x = 449.32, y= -981.11, z= 43.69},
		}
	}
}


--police Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Garaje"
Config.EnableCarGarageBlip = false

-- police Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Garaje Helicopteros"
Config.EnableHeliGarageBlip = false


-- police Car Garage Marker Settings:
Config.policeCarMarker = 27 												-- marker type
Config.policeCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.policeCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "~b~[E]~s~ Para abrir el garaje"			-- set your desired text here
Config.BorrarCoche = "~b~[E]~s~ Para guardar el coche"			-- set your desired text here

-- police Heli Garage Marker Settings:
Config.policeHeliMarker = 27 												-- marker type
Config.policeHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.policeHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "~b~[E]~s~ Para abrir el garaje"		-- set your desired text here


-- police Cars:
Config.policeVehicles = {
	{ model = 'anpc_l200', label = '<i style="color:powderblue;" class="fa-solid fa-truck-pickup"></i> - Mitsubishi L200 (Blindada)'},
	{ model = 'pfafocus', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Ford Focus Secreta'},
	{ model = 'pfaimpala', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Chevrolet Impala'},
	{ model = 'pfamondeo', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Ford Mondeo'},
	{ model = 'pfaranger', label = '<i style="color:powderblue;" class="fa-solid fa-truck-pickup"></i> - Ford Ranger'},
	{ model = 'pfasplinter', label = '<i style="color:powderblue;" class="fa-solid fa-truck-pickup"></i> - Antidisturbios'},
	{ model = 'pfatt', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Audi TTrs'},
	{ model = 'tfft', label = '<i style="color:powderblue;" class="fa-solid fa-truck-pickup"></i> - Antidisturbios con agua'},
	{ model = '08evopol', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Evo Doem'},
	{ model = 'polgresley', label = '<i style="color:powderblue;" class="fa-solid fa-truck-pickup"></i> - Bravado PFA'},
	{ model = 'polgs350', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Lexus PFA'},
	{ model = 'police2', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> - Mercedes Rápida acción'},
	{ model = 'bearcatBCSO', label = '<i style="color:powderblue;" class="fa-solid fa-truck"></i> - Camión G.E.O.F'}
}

-- police Helicopters:
Config.policeHelicopters = {
	{ model = 'Polmav', label = '<i style="color:powderblue;" class="fa-solid fa-helicopter"></i> - Helicoptero Maverick', livery = 0, price = 0 },
	{ model = 'mwannihilator', label = '<i style="color:powderblue;" class="fa-solid fa-helicopter"></i> - Helicoptero DOEM', livery = 0, price = 0 }
}





-- Menu Labels & Titles:
Config.LabelStoreVeh = "Devolver un vehículo"
Config.LabelGetVeh = "Retirar un vehiculo"
Config.TitlepoliceGarage = "Garaje Policias"


-- ESX.ShowNotifications:
Config.VehicleParked = "Guardaste el coche en el garage."
Config.NoVehicleNearby = "No estás en un vehiculo."
Config.CarOutFromPolGar = "Sacaste un ~b~Vehiculo~s~!"
Config.HeliOutFromPolGar = "Sacaste un ~b~Helicoptero~s~!"
Config.VehicleLoadText = "Descargando modelo del vehículo, espera."


-- ProgressBars text
Config.Progress1 = "AUTO PARANDAMINE"
Config.Progress2 = "AUTO PUHASTAMINE"

