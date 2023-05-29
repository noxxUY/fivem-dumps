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

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.armeriaStations = {

	armeria = {

		Blip = {
			Coords  = vector3(2639.88, 5208.23, 44.74),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 26
		},

		Cloakrooms = {
			vector3(820.66, -2158.98, 29.62)
		}, 

		Armories = {
			--vector3(2624.19, 5226.00, 49.63)
		}, 

		Vehicles = { 
			{ 
				Spawner = vector3(822.19, -2140.38, 29.03),
				InsideShop = vector3(822.19, -2140.38, 29.03),
				SpawnPoints = {
					{ coords = vector3(822.19, -2140.38, 29.03), heading = 81.18, radius = 6.0 },
					--{ coords = vector3(2603.34, 5305.27, 44.67), heading = 88.87, radius = 6.0 },
					--{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					--{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{  
				Spawner = vector3(0.0, 0.0, 0.0),
				InsideShop = vector3(0.0, 0.0, 0.0),
				SpawnPoints = {
					{ coords = vector3(0.0, 0.0, 0.0), heading = 0.0, radius = 6.0 },
					{ coords = vector3(0.0, 0.0, 0.0), heading = 0.0, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(2635.81, 5243.06, 43.51),
				InsideShop = vector3(2626.56, 5297.18, 43.26),
				SpawnPoints = {
					{ coords = vector3(2629.92, 5254.70, 45.86), heading = 20.53, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(824.93, -2155.16, 29.62)
		} 

	}

}


Config.AuthorizedWeapons = {
	recruit = {
		
	},

	officer = {
	
	},

	sergeant = {
	
	},

	intendent = {
	
	},

	lieutenant = {
	
	},

	chef = {
		
	},

	boss = {
		
	}
}

Config.AuthorizedVehicles = {

	Shared = {

	},

	recruit = {
		{ model = 'armeria', label = 'Camioneta', price = 0 }
		

	},

	officer = {
	{ model = 'armeria', label = 'Camioneta', price = 0 },
	},

	sergeant = {
		{ model = 'armeria', label = 'Camioneta', price = 0 },
	},

	intendent = {
     { model = 'armeria', label = 'Camioneta', price = 0 },
	},

	lieutenant = {
		{ model = 'armeria', label = 'Camioneta', price = 0 },
	},

	chef = {
		{ model = 'armeria', label = 'Camioneta', price = 0 },
	},

	boss = {
		{ model = 'armeria', label = 'Camioneta', price = 0 },
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {
		{ model = 'supervolito', label = 'Hélicoptère de Gendarmerie', livery = 0, price = 0 }
	},

	boss = {
		{ model = 'supervolito', label = 'Hélicoptère de Gendarmerie', livery = 0, price = 0 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 138,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 128,   ['pants_2'] = 1,
			['shoes_1'] = 9,   ['shoes_2'] = 5,
			['helmet_1'] = 135,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 138,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 128,   ['pants_2'] = 1,
			['shoes_1'] = 9,   ['shoes_2'] = 5,
			['helmet_1'] = 135,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 138,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 128,   ['pants_2'] = 1,
			['shoes_1'] = 9,   ['shoes_2'] = 5,
			['helmet_1'] = 135,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 138,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 128,   ['pants_2'] = 1,
			['shoes_1'] = 9,   ['shoes_2'] = 5,
			['helmet_1'] = 135,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 138,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 128,   ['pants_2'] = 1,
			['shoes_1'] = 9,   ['shoes_2'] = 5,
			['helmet_1'] = 135,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 138,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 128,   ['pants_2'] = 1,
			['shoes_1'] = 9,   ['shoes_2'] = 5,
			['helmet_1'] = 135,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 138,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 128,   ['pants_2'] = 1,
			['shoes_1'] = 9,   ['shoes_2'] = 5,
			['helmet_1'] = 135,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			--['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			--['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			--['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			--['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}