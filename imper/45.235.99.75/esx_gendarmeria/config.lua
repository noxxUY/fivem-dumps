Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.DiscordWebHook2 = "https://discord.com/api/webhooks/1085730140627157043/j8alTjjWqq7YRcIunmvkTkt5LjuBoMHCqEmyjEjeRxMbyaQRGUKQN1DiEyZfsBzX7HBb" -- Link al discord webhook matias#1111
Config.DiscordWebHook = "https://discord.com/api/webhooks/1022307705060347964/YcylvR-JTRVpTdiJYjFu0UF4vptV4arJKT6L9ptryLEoy-N5SxFNcL_R-zTODyvMBdfa" -- Link al discord webhook matias#1111
Config.DiscordWebHookFooter = "Imperial RP" -- Footer del discord embed webhook matias#1111
Config.DiscordWebHookColor = '16440430' -- Color del embed matias#1111

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.GendarmerieStations = {

	Gendarmerie = {

		Blip = {
			Coords  = vector3(1859.21, 3687.32, 34.25),
			Sprite  = 60, 
			Display = 4,
			Scale   = 0.8,
			Colour  = 26
		},
		Cloakrooms = {
			vector3(1858.53, 3694.42, 34.23)
		}, 

		Armories = {
			vector3(1860.8, 3689.54, 34.26)
		},   
		Vehicles = {
			{
				Spawner = vector3(1850.23, 3675.02, 33.79),
				InsideShop = vector3(1850.23, 3675.02, 33.79),
				SpawnPoints = {  
					{ coords = vector3(1855.07, 3665.93, 34.06), heading = 81.18, radius = 6.0 },
					{ coords = vector3(1855.07, 3665.93, 34.06), heading = 81.18, radius = 6.0 },
					--{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(0.0, -0.0, 0.0),
				InsideShop = vector3(0.0, -0.0, -0.0),
				SpawnPoints = {
					{ coords = vector3(0.0, -0.0, 0.0), heading = 0.0, radius = 6.0 },
					{ coords = vector3(0.0, -0.0, 0.0), heading = 0.0, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{ 
				Spawner = vector3(1863.63, 3663.48, 33.54),
				InsideShop = vector3(1863.63, 3663.48, 33.54),
				SpawnPoints = {
					{ coords = vector3(1863.63, 3663.48, 33.54), heading = 20.53, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(1842.16, 3690.71, 34.2)
		} 

	} 

}


Config.AuthorizedWeapons = {
	recruit = {
		
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehicles = {

	Shared = {

	},

	recruit = {
				{ model = 'polpatriotf2', label = 'Vehiculo Doem Blindado', price = 0 },
				{ model = 'doemxz', label = 'Vehiculo Doem Raptor', price = 0 },
				{ model = 'doem', label = 'Vehiculo Doem Camioneta', price = 0 },
                { model = 'blackmamba', label = 'Vehiculo Doem todo terreno', price = 0 }

	},

	officer = {
                { model = 'polpatriotf2', label = 'Vehiculo Doem Blindado', price = 0 },
				{ model = 'doemxz', label = 'Vehiculo Doem Raptor', price = 0 },
				{ model = 'doem', label = 'Vehiculo Doem Camioneta', price = 0 },
                { model = 'blackmamba', label = 'Vehiculo Doem todo terreno', price = 0 }
	},

	sergeant = {
		{ model = 'polpatriotf2', label = 'Vehiculo Doem Blindado', price = 0 },
				{ model = 'doemxz', label = 'Vehiculo Doem Raptor', price = 0 },
				{ model = 'doem', label = 'Vehiculo Doem Camioneta', price = 0 },
                { model = 'blackmamba', label = 'Vehiculo Doem todo terreno', price = 0 }
	},

	intendent = {
		{ model = 'polpatriotf2', label = 'Vehiculo Doem Blindado', price = 0 },
				{ model = 'doemxz', label = 'Vehiculo Doem Raptor', price = 0 },
				{ model = 'doem', label = 'Vehiculo Doem Camioneta', price = 0 },
                { model = 'blackmamba', label = 'Vehiculo Doem todo terreno', price = 0 }

	},

	lieutenant = {
				{ model = 'polpatriotf2', label = 'Vehiculo Doem Blindado', price = 0 },
				{ model = 'doemxz', label = 'Vehiculo Doem Raptor', price = 0 },
				{ model = 'doem', label = 'Vehiculo Doem Camioneta', price = 0 },
                { model = 'blackmamba', label = 'Vehiculo Doem todo terreno', price = 0 }

	},

	chef = {
				{ model = 'polpatriotf2', label = 'Vehiculo Doem Blindado', price = 0 },
				{ model = 'doemxz', label = 'Vehiculo Doem Raptor', price = 0 },
				{ model = 'doem', label = 'Vehiculo Doem Camioneta', price = 0 },
                { model = 'blackmamba', label = 'Vehiculo Doem todo terreno', price = 0 }

	},

	boss = {
				{ model = 'polpatriotf2', label = 'Vehiculo Doem Blindado', price = 0 },
				{ model = 'doemxz', label = 'Vehiculo Doem Raptor', price = 0 },
				{ model = 'doem', label = 'Vehiculo Doem Camioneta', price = 0 },
                { model = 'blackmamba', label = 'Vehiculo Doem todo terreno', price = 0 }


	}
}

Config.AuthorizedHelicopters = {
	recruit = {
				

	},

	officer = {
			

	},

	sergeant = {
				{ model = 'frogger', label = 'Helicoptero doem', price = 0 },
				

	},

	intendent = { 
	{ model = 'frogger', label = 'Helicoptero doem', price = 0 },
				

	},

	lieutenant = { 
	{ model = 'frogger', label = 'Helicoptero doem', price = 0 },
				

	},

	chef = { 
	{ model = 'frogger', label = 'Helicoptero doem', price = 0 },
				

	},

	boss = { 
	{ model = 'frogger', label = 'Helicoptero doem', price = 0 },
				

	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 12,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			['torso_1'] = 190,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 12,     ['bproof_2'] = 2
		}
	},
	officer_wear = {
	male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 12,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			['torso_1'] = 190,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 12,     ['bproof_2'] = 2
		}
	},
	sergeant_wear = {
	male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 12,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			['torso_1'] = 190,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 12,     ['bproof_2'] = 2
		}
	},
	intendent_wear = {
	male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 12,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			['torso_1'] = 190,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 12,     ['bproof_2'] = 2
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 12,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			['torso_1'] = 190,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 12,     ['bproof_2'] = 2
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 12,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			['torso_1'] = 190,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 12,     ['bproof_2'] = 2
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 12,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			['torso_1'] = 190,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 12,     ['bproof_2'] = 2
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 4,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 4,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}