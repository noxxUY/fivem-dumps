Config                            = {}

Config.DrawDistance               = 10.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 575  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders
Config.NPCJobEarnings             = {min = 200, max = 400}
Config.MinimumDistance            = 100 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destionations.

Config.Locale                     = 'fr'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 10 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 500


--Config.RespawnPoint = { coords = vector3(306.19, -1439.08, 29.78), heading = 114.16 }
Config.RespawnPoint = { coords = vector3(1815.59, 3669.38, 34.28), heading = 114.16 }
Config.RespawnPoint2 = { coords = vector3(-330.09, 6150.08, 32.38), heading = 133.16 }

Config.Hospitals = {

	CentralLosSantos = {

        Blip = {
            coords = vector3(309.4945, -595.3582, 43.2821),
            sprite = 61,
            color = 3,
            scale  = 1.5
        },

        AmbulanceActions = {
            vector3(301.6747, -599.433, 43.2821)
        },

        Pharmacies = {
           vector3(303.7451, -600.5275, 43.2821)
        },
        Blip2 = {
            coords = vector3(-248.24, 6327.58, 32.40),
            sprite = 61,
            color = 3,
            scale  = 1.5
        },

        AmbulanceActions2 = {
            vector3(-248.24, 6327.58, 32.40)
        },

        Pharmacies2 = {
            vector3(-252.92, 6318.42, 32.40)
        },

        Vehicles = {
            {
                Spawner = vector3(340.0088, -576.4879, 28.79126),
                InsideShop = vector3(319.9121, -541.767, 28.72375),
                Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
                SpawnPoints = {
                    { coords = vector3(333.1385, -575.3275, 28.79126), heading = 342.99212646484, radius = 4.0 },
                }
            },

            {
                Spawner = vector3(-272.89, 6333.65, 32.47),
                InsideShop = vector3(-277.59, 6327.66, 32.43),
                Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
                SpawnPoints = {
                    { coords = vector3(-268.47, 6310.091, 32.37), heading = 223.28, radius = 4.0 },
                }
            },

            {
                Spawner = vector3(-1202.4, -1799.749, 3.904053),
                InsideShop = vector3(-277.59, 6327.66, 32.43),
                Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
                SpawnPoints = {
                    { coords = vector3(-1209.521, -1798.141, 3.904053), heading = 223.28, radius = 4.0 },
                }
            },{
                Spawner = vector3(-1202.347, -1794.646, 3.904053),
                InsideShop = vector3(-277.59, 6327.66, 32.43),
                Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
                SpawnPoints = {
                    { coords = vector3(-1270.84, -1832.796, 0.06225586), heading = 223.28, radius = 4.0 },
                }
            },


        },

        Helicopters = {--paleto
            {
                Spawner = vector3(-263.08, 6329.38, 37.55),
                InsideShop = vector3(-246.28, 6317.62, 37.80),
                Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
                SpawnPoints = {
                    { coords = vector3(331.8198, -578.2022, 28.79126), heading = 227.76, radius = 10.0 }
                }
            },
            {
                Spawner = vector3(340.6549, -589.8066, 74.15088),
                InsideShop = vector3(352.378, -587.8945, 74.15088),
                Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
                SpawnPoints = {
                    { coords = vector3(352.378, -587.8945, 74.15088), heading = 249.44882202148, radius = 10.0 }
                }
            }
        }
    }
}

Config.AuthorizedVehicles = {

	ambulance = {
		--{ model = 'sprintersamur', label = 'Ambulancia', price = 1},
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--{ model = 'emsx4', label = 'X4', price = 1},
		--{ model = 'firetruk', label = 'Camion de bombero', price = 1}
	},

	doctor = {
		--{ model = 'sprintersamur', label = 'Ambulancia', price = 1},
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--{ model = 'mt09pn', label = 'Moto', price = 1},
		--{ model = 'bmwdgpe', label = 'BMW Cruz Roja', price = 1},
		--{ model = 'emsx4', label = 'X4', price = 1},
		--{ model = 'lguard', label = 'Lguard', price = 1},
		--{ model = 'blazer2', label = 'Blazer2', price = 1},{ model = 'seashark2', label = 'seashark2', price = 1},
		--{ model = 'firetruk', label = 'Camion de bombero', price = 1}
	},

	chief_doctor = {
		--{ model = 'sprintersamur', label = 'Ambulancia', price = 1},
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--{ model = 'mt09pn', label = 'Moto', price = 1},
	--	{ model = 'bmwdgpe', label = 'BMW Cruz Roja', price = 1},
	  --  { model = 'bmwsamur', label = 'BMW Samur', price = 1},
		--{ model = 'emsx4', label = 'X4', price = 1},
		--{ model = 'volvoems', label = 'Volvo', price = 1},{ model = 'lguard', label = 'Lguard', price = 1},
	--	{ model = 'blazer2', label = 'Blazer2', price = 1},{ model = 'felon', label = 'Felon', price = 1},{ model = 'kamacho', label = 'kamacho', price = 1},{ model = 'stockade', label = 'Stockade', price = 1},{ model = 'seashark2', label = 'seashark2', price = 1},
		--{ model = 'firetruk', label = 'Camion de bombero', price = 1}
	},

	boss = {
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--{ model = 'sprintersamur', label = 'Ambulancia', price = 1},
		--{ model = 'mt09pn', label = 'Moto', price = 1},
		--{ model = 'bmwdgpe', label = 'BMW Cruz Roja', price = 1},
	  --  { model = 'bmwsamur', label = 'BMW Samur', price = 1},
		--{ model = 'porschesamur', label = 'Porsche Samur', price = 1},
		--{ model = 'emsx4', label = 'X4', price = 1},
		--{ model = 'volvoems', label = 'Volvo', price = 1},{ model = 'lguard', label = 'Lguard', price = 1},
		--{ model = 'blazer2', label = 'Blazer2', price = 1},{ model = 'felon', label = 'Felon', price = 1},{ model = 'kamacho', label = 'kamacho', price = 1},{ model = 'stockade', label = 'Stockade', price = 1},{ model = 'seashark2', label = 'seashark2', price = 1},
		--{ model = 'firetruk', label = 'Camion de bombero', price = 1}
	},
	medico_esp = {
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--	{ model = 'sprintersamur', label = 'Ambulancia', price = 1},
		--{ model = 'mt09pn', label = 'Moto', price = 1},
		--{ model = 'bmwdgpe', label = 'BMW Cruz Roja', price = 1},
		--{ model = 'emsx4', label = 'X4', price = 1},{ model = 'lguard', label = 'Lguard', price = 1},
		--{ model = 'blazer2', label = 'Blazer2', price = 1},{ model = 'seashark2', label = 'seashark2', price = 1},
	 --   { model = 'bmwsamur', label = 'BMW Samur', price = 1},
		--{ model = 'porschesamur', label = 'Porsche Samur', price = 1},
		--{ model = 'firetruk', label = 'Camion de bombero', price = 1}
	},
	doctor_2 = {
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--{ model = 'sprintersamur', label = 'Ambulancia', price = 1},
		--{ model = 'mt09pn', label = 'Moto', price = 1},
		--{ model = 'bmwdgpe', label = 'BMW Cruz Roja', price = 1},
		--{ model = 'emsx4', label = 'X4', price = 1},{ model = 'lguard', label = 'Lguard', price = 1},
		--{ model = 'blazer2', label = 'Blazer2', price = 1},{ model = 'seashark2', label = 'seashark2', price = 1},
	    --{ model = 'bmwsamur', label = 'BMW Samur', price = 1},
		--{ model = 'porschesamur', label = 'Porsche Samur', price = 1},
		--{ model = 'firetruk', label = 'Camion de bombero', price = 1}
	},

	jefeseguridad = {
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--{ model = 'stockade', label = 'Stockade', price = 1},{ model = 'felon', label = 'Felon', price = 1},{ model = 'kamacho', label = 'kamacho', price = 1},
	},

	seguridad = {
		{ model = 'emsnspeedo', label = 'Ambulancia', price = 1},
		--{ model = 'stockade', label = 'Stockade', price = 1},{ model = 'felon', label = 'Felon', price = 1},{ model = 'kamacho', label = 'kamacho', price = 1},
	},
	

}

Config.AuthorizedHelicopters = {

	medico_esp = {
		{ model = 'supervolitoems', label = 'Helicoptero Rescate', price = 1 }
	},

	doctor_2 = {
		{ model = 'supervolitoems', label = 'Helicoptero Rescate', price = 1 }
	},

	chief_doctor = {
		{ model = 'supervolitoems', label = 'Helicoptero Rescate', price = 1 }
	},

	boss = {
		{ model = 'supervolitoems', label = 'Helicoptero Rescate', price = 1 }
	}

}







Config.Uniforms = {
	[1] = { -- Enfermero a prueba
	  male = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 584,  ['torso_2'] = 2,
		['decals_1'] = 0,  ['decals_2'] = 0,
		['arms'] = 92,
		['pants_1'] = 48,   ['pants_2'] =0,
		['shoes_1'] = 4,   ['shoes_2'] = 13,
		['helmet_1'] = -1, ['helmet_2'] = 0,
		['chain_1'] = 126,  ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bproof_1'] = -1,   ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 14, ['tshirt_2'] = 0,
		['torso_1'] = 576,  ['torso_2'] = 2,
		['decals_1'] = 0,  ['decals_2'] = 0,
		['arms'] = 106,
		['pants_1'] = 50,   ['pants_2'] = 0,
		['shoes_1'] = 4,   ['shoes_2'] = 13,
		['helmet_1'] = -1, ['helmet_2'] = 0,
		['chain_1'] = 96,   ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bproof_1'] = -1,   ['bproof_2'] = 0
	  }
	},
	[2] = { -- Enfermero
	  male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 584,   ['torso_2'] = 1,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 92,
		['pants_1'] = 48,   ['pants_2'] = 0,
		['shoes_1'] = 4,   ['shoes_2'] = 13,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 126,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bproof_1'] = -1,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 14,  ['tshirt_2'] = 0,
		['torso_1'] = 576,   ['torso_2'] = 1,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 106,
		['pants_1'] = 50,   ['pants_2'] = 0,
		['shoes_1'] = 4,   ['shoes_2'] = 13,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 96,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bproof_1'] = -1,  ['bproof_2'] = 0
	  }
	},
	[3] = { -- Medico a prueba y medico
    male = { 
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 584,  ['torso_2'] = 3,
        ['decals_1'] = 0,  ['decals_2'] = 0,    
        ['arms'] = 92,
        ['pants_1'] = 48,   ['pants_2'] = 0,
        ['shoes_1'] = 4,    ['shoes_2'] = 13,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 126,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0,
    },
    female = {
        ['tshirt_1'] = 14, ['tshirt_2'] = 0,
        ['torso_1'] = 576,  ['torso_2'] = 3,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 106,
        ['pants_1'] = 50,   ['pants_2'] = 0,
        ['shoes_1'] = 4,   ['shoes_2'] = 13,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 96,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
},
	[4] = {-- Medico especialista
    male = {
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 572,  ['torso_2'] = 6,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 86,
        ['pants_1'] = 20,   ['pants_2'] = 0,
        ['shoes_1'] = 165,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 126,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
    female = {
        ['tshirt_1'] = 14, ['tshirt_2'] = 0,
        ['torso_1'] = 773,  ['torso_2'] = 0,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 101,
        ['pants_1'] = 133,   ['pants_2'] = 3,
        ['shoes_1'] = 178,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 96,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
},
	[5] = {-- Jefe de medicos
    male = {
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 573,  ['torso_2'] = 6,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 86,
        ['pants_1'] = 20,   ['pants_2'] = 0,
        ['shoes_1'] = 165,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 126,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
    female = {
        ['tshirt_1'] = 14, ['tshirt_2'] = 0,
        ['torso_1'] = 774,  ['torso_2'] = 0,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 101,
        ['pants_1'] = 133,   ['pants_2'] = 3,
        ['shoes_1'] = 178,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 96,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
},

	[6] = {-- Escala Doctor
    male = {
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 590,  ['torso_2'] = 15,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 86,
        ['pants_1'] = 20,   ['pants_2'] = 0,
        ['shoes_1'] = 165,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 126,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
    female = {
        ['tshirt_1'] = 14, ['tshirt_2'] = 0,
        ['torso_1'] = 603,  ['torso_2'] = 15,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 101,
        ['pants_1'] = 133,   ['pants_2'] = 3,
        ['shoes_1'] = 178,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 96,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
},

[7] = {-- Directiva
    male = {
        ['tshirt_1'] = 253, ['tshirt_2'] = 7,
        ['torso_1'] = 593,  ['torso_2'] = 5,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 86,
        ['pants_1'] = 20,   ['pants_2'] = 0,
        ['shoes_1'] = 165,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 126,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
    female = {
        ['tshirt_1'] = 284, ['tshirt_2'] = 7,
        ['torso_1'] = 620,  ['torso_2'] = 5,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['arms'] = 101,
        ['pants_1'] = 133,   ['pants_2'] = 3,
        ['shoes_1'] = 178,   ['shoes_2'] = 6,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 96,  ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = -1,   ['bproof_2'] = 0
    },
},

	[8] = {-- Unidad Motorizada
  male = {
	['tshirt_1'] = 15, ['tshirt_2'] = 0,
	['torso_1'] = 219,  ['torso_2'] = 6,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 88,
	['pants_1'] = 130,   ['pants_2'] = 4,
	['shoes_1'] = 9,   ['shoes_2'] = 3,
	['helmet_1'] = -1, ['helmet_2'] = 0,
	['chain_1'] = 126,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = -1,   ['bproof_2'] = 0
},
   female = {
	['tshirt_1'] = 14, ['tshirt_2'] = 0,
	['torso_1'] = 112,  ['torso_2'] = 2,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 101,
	['pants_1'] = 136,   ['pants_2'] = 3,
	['shoes_1'] = 9,   ['shoes_2'] = 13,
	['helmet_1'] = -1, ['helmet_2'] = 0,
	['chain_1'] = 96,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = -1,   ['bproof_2'] = 0
},
},

[9] = {-- Unidad Aerea
  male = {
	['tshirt_1'] = 15, ['tshirt_2'] = 0,
	['torso_1'] = 600,  ['torso_2'] = 24,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 85,
	['pants_1'] = 130,   ['pants_2'] = 4,
	['shoes_1'] = 9,   ['shoes_2'] = 3,
	['helmet_1'] = 0, ['helmet_2'] = 0,
	['chain_1'] = 126,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = -1,   ['bproof_2'] = 0
},
   female = {
	['tshirt_1'] = 14, ['tshirt_2'] = 0,
	['torso_1'] = 608,  ['torso_2'] = 24,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 109,
	['pants_1'] = 136,   ['pants_2'] = 3,
	['shoes_1'] = 9,   ['shoes_2'] = 13,
	['helmet_1'] = -1, ['helmet_2'] = 0,
	['chain_1'] = 96,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = -1,   ['bproof_2'] = 0
},
},

[10] = {-- Unidad Socorrista
  male = {
	['tshirt_1'] = 213, ['tshirt_2'] = 0,
	['torso_1'] = 644,  ['torso_2'] = 0,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 89,
	['pants_1'] = 14,   ['pants_2'] = 12,
	['shoes_1'] = 5,   ['shoes_2'] = 0,
	['helmet_1'] = -1, ['helmet_2'] = 0,
	['chain_1'] = 126,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = 98,   ['bproof_2'] = 0
},
   female = {
	['tshirt_1'] = 14, ['tshirt_2'] = 0,
	['torso_1'] = 247,  ['torso_2'] = 0,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 102,
	['pants_1'] = 226,   ['pants_2'] = 1,
	['shoes_1'] = 5,   ['shoes_2'] = 1,
	['helmet_1'] = -1, ['helmet_2'] = 0,
	['chain_1'] = 97,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = 100,   ['bproof_2'] = 0
},
},
[11] = {-- Tactico
male = {
	['tshirt_1'] = 15, ['tshirt_2'] = 0,
	['torso_1'] = 219,  ['torso_2'] = 6,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 88,
	['pants_1'] = 130,   ['pants_2'] = 4,
	['shoes_1'] = 9,   ['shoes_2'] = 3,
	['helmet_1'] = 150, ['helmet_2'] = 24,
	['chain_1'] = 126,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = 4,   ['bproof_2'] = 1
},
female = {
	['tshirt_1'] = 14, ['tshirt_2'] = 0,
	['torso_1'] = 112,  ['torso_2'] = 2,
	['decals_1'] = 0,  ['decals_2'] = 0,
	['arms'] = 101,
	['pants_1'] = 136,   ['pants_2'] = 3,
	['shoes_1'] = 9,   ['shoes_2'] = 13,
	['helmet_1'] = 149, ['helmet_2'] = 24,
	['chain_1'] = 97,  ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = 138,   ['bproof_2'] = 0
},
},

}
