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
Config.PoliceName = 'gna'

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale                     = 'es'

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.ComisariaJail = vector3(-431.97320556641, 5994.7216796875, 31.716251373291) -- Coordenadas para enviar barridas (Rango de 25m) 

Config.gnaStations = {

	PALETO = {

		Blip = {
			Coords  = vector3(-432.63, 6009.69, 31.49), 
			Sprite  = 252, 
			Display = 4,
			Scale   = 0.6,
			Colour  = 22
		},

		Cloakrooms = {
			vector3(-438.41, 6002.59, 31.72)
		},

		Armories = {
			vector3(-438.54, 5990.34, 31.72)
		},

		BossActions = {
			vector3(-433.16, 5995.05, 31.72)
		}

	}

}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'gna Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	officer = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	sergeant = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	lieutenant = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},

	oficial = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},

	inspector = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},

	chief = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	boss = {
		male = {
			['tshirt_1'] = 135,  ['tshirt_2'] = 0,
			['torso_1'] = 516,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 187,   ['pants_2'] = 0,
			['shoes_1'] = 147,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
		},
		female = {
			['tshirt_1'] = 39,  ['tshirt_2'] = 0,
			['torso_1'] = 460,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 7,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
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
Config.KeyToOpenBoatGarage = 38			-- default 38 is E
Config.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.gnaDatabaseName = 'gna'	-- set the exact name from your jobs database for gna

--gna Car Garage:
Config.CarZones = {
	gnaCarGarage = {
		Pos = {
			{x = -466.39, y= 6019.33, z= 31.34},
		}
	}
}

--gna Heli Garage:
Config.HeliZones = {
	gnaHeliGarage = {
		Pos = {
			{x = -474.51, y= 5988.61, z= 31.34},
		}
	}
}


--gna Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Garaje"
Config.EnableCarGarageBlip = false

-- gna Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Garaje Helicopteros"
Config.EnableHeliGarageBlip = false


-- gna Car Garage Marker Settings:
Config.gnaCarMarker = 27 												-- marker type
Config.gnaCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.gnaCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "~b~[E]~s~ Para abrir el garaje"			-- set your desired text here
Config.BorrarCoche = "~b~[E]~s~ Para guardar el coche"			-- set your desired text here

-- gna Heli Garage Marker Settings:
Config.gnaHeliMarker = 27 												-- marker type
Config.gnaHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.gnaHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "~b~[E]~s~ Para abrir el garaje"		-- set your desired text here


-- gna Cars:
Config.gnaVehicles = {
	{ model = 'gnaimpala', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> Chevrolet Impala'},
	{ model = 'gnamondeo', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> Ford Mondeo'},
	{ model = 'gnaranger', label = '<i style="color:powderblue;" class="fa-solid fa-truck-pickup"></i> Ford Ranger'},
	{ model = 'gnasplinter', label = '<i style="color:powderblue;" class="fa-solid fa-truck-pickup"></i> Antidisturbios'},
	{ model = 'gnamondeo', label = '<i style="color:powderblue;" class="fa-solid fa-car"></i> Ford Mondeo'},
	{ model = 'centurionlssd', label = '<i style="color:powderblue;" class="fa-solid fa-truck"></i> Alacrán Blindado'}
}

-- gna Helicopters:
Config.gnaHelicopters = {
	{ model = 'buzzard2', label = '<i style="color:powderblue;" class="fa-solid fa-helicopter"></i> - Buzzard', livery = 0, price = 0 }
}





-- Menu Labels & Titles:
Config.LabelStoreVeh = "Devolver un vehículo"
Config.LabelGetVeh = "Retirar un vehiculo"
Config.TitlegnaGarage = "Garaje Policias"


-- ESX.ShowNotifications:
Config.VehicleParked = "Guardaste el coche en el garage."
Config.NoVehicleNearby = "No estás en un vehiculo."
Config.CarOutFromPolGar = "Sacaste un ~b~Vehiculo~s~!"
Config.HeliOutFromPolGar = "Sacaste un ~b~Helicoptero~s~!"
Config.VehicleLoadText = "Descargando modelo del vehículo, espera."


-- ProgressBars text
Config.Progress1 = "AUTO PARANDAMINE"
Config.Progress2 = "AUTO PUHASTAMINE"

