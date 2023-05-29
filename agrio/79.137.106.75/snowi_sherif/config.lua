Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.OnlyFirstname = true
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license
Config.EnableMoneyWash = true
Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.sheriffStations = {

	LSPD = {

        Blip = {
            Coords  = vector3(-439.31, 6020.54, 317.49),
            Sprite  = 60,
            Display = 4,
            Scale   = 1.2
        },

        Cloakrooms = {
            vector3(-438.6066, 6008.255, 36.98022),
        },

        Armories = {
            vector3(-448.9714, 6014.967, 36.98022),

        },

        Vehicles = {
            {
                Spawner =vector3(-469.0417, 6006.343, 31.48718) , --Punto para sacar coche
                InsideShop = vector3(-478.7, 6026.9, 31.35), --Punto de donde se ven los coches para comprar, si quieres no lo cambies este
                SpawnPoints = {
                    { coords = vector3(-472.4044, 6017.486, 31.33557), heading = 86.78, radius = 6.0 }, --Estos todos son puntos donde aparecen los c
                    { coords = vector3(-448.02, 5994.54, 31.34), heading = 90.59, radius = 6.0 },
                    { coords = vector3(-482.53, 6024.83, 31.34), heading = 230.17, radius = 6.0 },
                    { coords = vector3(-473.81, 6015.83, 31.34), heading = 311.94, radius = 6.0 }
                }
            },


        },

        Helicopters = {
            {
                Spawner = vector3(-477.55, 6005.25, 31.36),
                InsideShop = vector3(-378.70, 6051.34, 35.0),
                SpawnPoints = {
                    { coords = vector3(-475.54, 5988.42, 31.36), heading = 310.6, radius = 10.0 }
                }
            },
        },

        BossActions = {
            vector3(-434.6505, 6007.029, 36.98022),
        }

    }

}

Config.AuthorizedWeapons = {
	recruit = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }--]]
	},

	officer = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 }--]]
	},

	sergeant = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1},
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 }--]]
	},

	intendent = {
		--[[{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 }--]]
	},

	lieutenant = {
	--[[	{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 1 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 1 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 1 }--]]
	},

	chef = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1000 },
        { weapon = 'WEAPON_NIGHTSTICK', price = 200 },
        { weapon = 'WEAPON_MACHINEPISTOL', price = 1100 },
        { weapon = 'WEAPON_STUNGUN', price = 250 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 25 },
        { weapon = 'WEAPON_SMG', price = 5000 },
        { weapon = 'WEAPON_CARBINERIFLE', price = 9000 },
        { weapon = 'WEAPON_SPECIALCARBINE', price = 9000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_SNIPERRIFLE', price = 10000 },
        { weapon = 'WEAPON_HEAVYPISTOL', price = 1 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1000 },
        { weapon = 'WEAPON_NIGHTSTICK', price = 200 },
        { weapon = 'WEAPON_MACHINEPISTOL', price = 1100 },
        { weapon = 'WEAPON_STUNGUN', price = 250 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 25 },
        { weapon = 'WEAPON_SMG', price = 5000 },
        { weapon = 'WEAPON_CARBINERIFLE', price = 9000 },
        { weapon = 'WEAPON_SPECIALCARBINE', price = 9000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_SNIPERRIFLE', price = 10000 },
        { weapon = 'WEAPON_HEAVYPISTOL', price = 1 }
	},

	bope = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1000 },
        { weapon = 'WEAPON_NIGHTSTICK', price = 200 },
        { weapon = 'WEAPON_MACHINEPISTOL', price = 1100 },
        { weapon = 'WEAPON_STUNGUN', price = 250 },
        { weapon = 'WEAPON_FLASHLIGHT', price = 25 },
        { weapon = 'WEAPON_SMG', price = 5000 },
        { weapon = 'WEAPON_CARBINERIFLE', price = 9000 },
        { weapon = 'WEAPON_SPECIALCARBINE', price = 9000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
        { weapon = 'WEAPON_SNIPERRIFLE', price = 10000 },
        { weapon = 'WEAPON_HEAVYPISTOL', price = 1 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		--{ model = 'sp1', label = 'Patrulla Sheriff 1', price = 1 },
		--{ model = 'sp3', label = 'Patrulla Sheriff 2', price = 1 },
		--{ model = 'sp9', label = 'Patrulla Sheriff 3', price = 1 },
		{ model = 'Sheriff2', label = 'Sheriff 2', price = 1 },
		{ model = 'Silv', label = 'Sheriff Silv', price = 1 },
		{ model = 'Hellcatred', label = 'Sheriff Hellcatred', price = 1 },
		{ model = 'valor18charg', label = 'Sheriff 18Charg', price = 1 },
		{ model = 'valor20ram', label = 'Sheriff 20Ram', price = 1 },
		{ model = 'gurkha', label = 'Sheriff Blindada', price = 1 },
		{ model = 'psp_bmwgs', label = 'MOTO SHERIFF ', price = 1 },
		{ model = 'polpatriotf', label = 'Patrulla Sheriff 4', price = 1 },
		{ model = 'polpatriotf2', label = 'Patrulla Sheriff 5', price = 1 },
		{ model = '17silvrb', label = 'Nueva patrulla sheriff', price = 1 },
		{ model = 'valor16fpiu', label = 'Ford Explorer Interceptor ', price = 1 },
{ model = 'valorgator', label = 'Mini coche', price = 1 },
		
		
		--{ model = 'sheriffold2', label = 'TEST 4 ', price = 1 },
		--{ model = 'sheriff4', label = 'TEST 5 ', price = 1 },
	},

	recruit = {
	},

	officer = {
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
	},

	sergeant = {
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
	},

	intendent = {
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
	},

	lieutenant = {
		--{ model = 'polsecreta', label = 'X5 Secreta Negro ', price = 1 },	
		--{ model = 'wmfenyrcop', label = 'Lambo', price = 1 },
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
	},
	cazador = {},
	oficialpr = {},
	chef = {
		{ model = 'camaroBB', label = 'Patrulla alto rango', price = 1 },	
		--{ model = 'wmfenyrcop', label = 'Lambo', price = 1 },
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
	},

	boss = {
		{ model = 'camaroBB', label = 'Patrulla alto rango', price = 1 },	
		--{ model = 'polsecreta', label = 'X5 Secreta Negro ', price = 1 },	
		--{ model = 'wmfenyrcop', label = 'Lambo', price = 1 },
		--{ model = 'polcla', label = 'Mercedes GC ', price = 1 },
	},

	bope = {
		{ model = 'camaroBB', label = 'Patrulla alto rango', price = 1},
	}
}


Config.AuthorizedHelicopters = {
	recruit = {},

	--officer = {},

	--sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }		
	},

	chef = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }	
	},

	boss = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 },
		{ model = 'annihilator', label = 'Anihilator', livery = 0, price = 1 }
	},

	bope = {
		{ model = 'as350', label = 'Helicoptero B.O.P.E.', price = 1},
	},
	officer = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }	,
		{ model = 'annihilator', label = 'Anihilator', livery = 0, price = 1 }
	}, 
	sergeant = {{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
	{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 },
	{ model = 'annihilator', label = 'Anihilator', livery = 0, price = 1 }	},
	
}

Config.AuthorizedHelicopters1 = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }		
	},

	chef = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }	
	},

	boss = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'supervolito', label = 'Helicoptero GC', livery = 0, price = 1 }	
	},

	bope = {
		{ model = 'as350', label = 'Helicoptero B.O.P.E.', price = 1},
	}
}
-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
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
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
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
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
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
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
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
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
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
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
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
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
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

	bope_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 33,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
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
			['bproof_1'] = 2,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		}
	}

}