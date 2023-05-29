Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 20 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = 20
Config.Locale                     = 'es'
Config.FreeArmas = true

Config.Time = 7200 --Tiempo para caudal 2 horas
Config.Dinero = 1000000
Config.RequiredPSG = 6

Config.LicenseEnable = true --Chequeo si tiene licencia de helicoptero

Config.CargoDeliveryLocations 	= {
	--{ x = 268.12, y = 273.2,z= 105.53, name = "Banco Central"},
	{ x=1184.695, y=2726.283, z=37.998, name = "Banco Sandy"},
	--{ x = 156.03, y = -1044.46, z = 28.31, name = "Banco Macro"},
	{ x = -2945.65, y = 478.01, z = 14.26, name = "Banco Galicia"},
	{ x = -113.29, y = 6482.36, z = 30.47, name = "Banco Paleto"},
	{ x=2480.880, y=-337.549, z=92.992, name = "FBI"},
	{ x=-2237.39, y=3273.318, z=32.810, name = "Base Militar" },
	--{ x=-1212.95, y=-352.679, z=36.289, name = "Banco Santander"},
	--{ x = -360.1, y = -75.88, z = 44.66, name = "Banco Provincia"}		
}

Config.AuthorizedWeapons = {
	recluta = {
		{type = 'weapon', weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000}, 
		{type = 'weapon', weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_STUNGUN', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_ASSAULTSMG', price = 1000},
		{type =	'item', weapon = 'silenciador', price = 1000}
	},
	
	novato = {
		{type = 'weapon', weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_STUNGUN', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_PUMPSHOTGUN', price = 5000},
		{type = 'weapon', weapon = 'WEAPON_ASSAULTSMG', price = 1000}, 
		--{weapon = 'WEAPON_CARBINERIFLE_MK2', price = 1000},
		{type =	'item', weapon = 'silenciador', price = 1000}
	},

	experimentado = {
		{type = 'weapon', weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_STUNGUN', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 120000},
		{type = 'weapon', weapon = 'WEAPON_PUMPSHOTGUN', price = 5000},
		{type = 'weapon', weapon = 'WEAPON_ASSAULTSMG', price = 1000},
		--{weapon = 'WEAPON_CARBINERIFLE_MK2', price = 1000},
		{type =	'item', weapon = 'silenciador', price = 1000}
	},
	
	entrenador = {
		{type = 'weapon', weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_STUNGUN', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 120000},
		{type = 'weapon', weapon = 'WEAPON_PUMPSHOTGUN', price = 5000},
		{type = 'weapon', weapon = 'WEAPON_SMOKEGRENADE', price = 300 },
		{type = 'weapon', weapon = 'WEAPON_ASSAULTSMG', price = 1000},
		{type = 'weapon', weapon = 'WEAPON_CARBINERIFLE_MK2', price = 1000},
		{type =	'item', weapon = 'silenciador', price = 1000}
	},

	encargado = {
		{type = 'weapon', weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_STUNGUN', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 120000},
		{type = 'weapon', weapon = 'WEAPON_PUMPSHOTGUN', price = 5000},
		{type = 'weapon', weapon = 'WEAPON_SMOKEGRENADE', price = 300 },
		{type = 'weapon', weapon = 'WEAPON_ASSAULTSMG', price = 1000},
		{type = 'weapon', weapon = 'WEAPON_CARBINERIFLE_MK2', price = 1000},
		--{weapon = 'WEAPON_HEAVYSNIPER', price = 1250 },
		{type =	'item', weapon = 'silenciador', price = 1000}
	},

	boss = {
		{type = 'weapon', weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 1000, 4000, nil}, price = 60000},
		{type = 'weapon', weapon = 'WEAPON_NIGHTSTICK', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_STUNGUN', price = 1000 },
		{type = 'weapon', weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 1000, 4000, nil}, price = 120000},
		{type = 'weapon', weapon = 'WEAPON_PUMPSHOTGUN', price = 5000},
		{type = 'weapon', weapon = 'WEAPON_SMOKEGRENADE', price = 300 },
		{type = 'weapon', weapon = 'WEAPON_ASSAULTSMG', price = 1000},
		{type = 'weapon', weapon = 'WEAPON_CARBINERIFLE_MK2', price = 1000},
		{type =	'item', weapon = 'silenciador', price = 1000}
		--{weapon = 'WEAPON_HEAVYSNIPER', price = 1250 },
	}
}

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Pos     = { x = -116.25, y = -604.96, z = 36.28 },
			Sprite  = 60,
			Display = 4,
			Scale   = 0.9,
			Colour  = 7,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL',     price = 50000 },
			{ name = 'WEAPON_PISTOL50',     price = 60000 },
			{ name = 'WEAPON_CARBINERIFLE',        price = 120000 },
			{ name = 'GADGET_PARACHUTE',        price = 1500 },
			{ name = 'binoculars',        price = 1500 },
		},

		Cloakrooms = {
			{ x = -130.02, y = -633.81, z = 167.83 },
		},

		Armories = {
			{ x = -142.21, y = -645.72, z = 167.83 },
		},

		Vehicles = {
			{
				Spawner    = { x = -151.0, y = -580.07, z = 32.42 },
				SpawnPoints = {
					{ x = -152.49, y = -585.6, z = 32.15, heading = 70.34, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner    = { x=-138.331,y=-585.040,z=211.76 },
				SpawnPoint = { x=-144.444,y=-593.251,z=212.16, heading = 333.54534912109, radius = 10.0 },
			}
		},
		
		HelicoptersDeleters = {
			{ x=-144.695,y=-593.359,z=211.77 - 0.96 }
		},

		VehicleDeleters = {
			{ x = -137.74, y = -587.07, z = 31.43 }
		},

		BossActions = {
			{ x = -124.19, y = -641.44, z = 167.83 }
		},
		
		Caudal = {
			{
				Spawner    = { x=-144.757, y=-591.097, z=32.424 },
				SpawnPoints =  {
					{ x=-141.415, y=-594.757, z=32.031, heading = 69.09, radius = 6.0 },
					{ x=140.6727, y=-1063.45, z=29.187, heading = 276.65161132813, radius = 6.0 },
					{ x=755.6039, y=-3195.37, z=6.0731, heading = 269.90853881836, radius = 6.0 },
					{ x=-1200.52, y=-359.145, z=37.171, heading = 289.99038696289, radius = 6.0 },
					{ x=-361.265, y=-77.7531, z=45.663, heading = 68.496017456055, radius = 6.0 },
				},
			},
		},
		
		FastTravelsPrompt = {		
			--Seguridad Privada
			{
				From = vector3(-116.25,-604.96,36.24),
				To = {coords = vector3(-139.09,-620.74,167.82), heading = 100.93},
				Prompt = _U('fast_travel_top')
			},		
			{
				From = vector3(-139.55,-617.46,168.78),
				To = {coords = vector3(-116.25,-604.96,36.28), heading = 243.15},
				Prompt = _U('fast_travel_bottom')
			},
			{
				From = vector3(-144.2,-577.04,32.38),
				To = {coords = vector3(-139.09,-620.74,167.82), heading = 100.93},
				Prompt = _U('fast_travel_top')
			},	
			{
				From = vector3(-141.76,-617.68,168.78),
				To = {coords = vector3(-144.2,-577.04,31.43), heading = 154.79},
				Marker = {x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = true},
				Prompt = _U('fast_travel_bottom')
			},
			--helicoptero
			{
				From = vector3(-137.299,-596.124,206.91),
				To = {coords = vector3(-141.633,-621.012,168.82), heading = 305.47009277344},
				Prompt = _U('fast_travel_bottom')
			},
			{
				From = vector3(-141.633,-621.012,168.82),
				To = {coords = vector3(-137.299,-596.124,206.91), heading = 264.83},
				Prompt = _U('fast_travel_top')
			},
		}
	},
}



-- https://wiki.rage.mp/index.php?title=Vehicles

Config.AuthorizedHelicoptero = {

	{
		model = 'polmav',
		label = 'PROSEGUR'
	},

}

Config.AuthorizedVehicles = {
	Shared = {
		{
			model = 'sheriff2',
			label = 'Duster'
		},
		{
			model = 'motobm3',
			label = 'MOTO BMW'
		},
	},

	recluta = {

	},
	
	novato = {

	},

	experimentado = {

	},
	
	entrenador = {
		
	},
	
	encargado = {
		
	},

	boss = {

	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recluta = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 21,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	novato = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 21,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	experimentado = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 22,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	entrenador = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	encargado = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 26,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 26,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 142,  ['helmet_2'] = 0,
			['chain_1'] = 25,    ['chain_2'] = 2,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 22,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 58,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 2,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	
	bullet_wear = {
		male = {
			['bproof_1'] = 1,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		}
	},
	police_casco = {
		male = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
		},
		female = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
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