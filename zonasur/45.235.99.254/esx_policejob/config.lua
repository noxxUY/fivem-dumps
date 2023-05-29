Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = false
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 5 * 60000

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = 30
Config.Locale                     = 'es'
Config.LicenseEnable = true

Config.Owner = 'steam:110000106e6d6fc'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Pos     = { x = 425.97, y = -981.13, z = 29.76 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {		
			recruit = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
			},	
			officer = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },	
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },				
			},
			sergeant = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
			},
			lieutenant = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
			},
			inspect = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
			},
			subcomi = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
			},
			comi = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
			},
			boss = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
			},
		},

		Cloakrooms = {
			{ x=458.2616,y=-992.993,z=30.689 -0.95 },
			--{ x=447.5814,y=-997.026,z=35.062 -0.95 },
		},

		Armories = {
			--{ x = 479.2380, y = -996.778, z = 29.74 },
		},

		Vehicles = {
			{
				Spawner    = { x=442.1642,y=-1014.63,z=28.641 },
				SpawnPoints = {
					--450.1887,-1018.70,28.220,92.515525817871
					{ x = 450.1887, y = -1018.70, z = 28.220, heading = 92.515525817871, radius = 6.0 }
				}
			},
			
			{
				Spawner    = { x=473.0348,y=-1019.10,z=28.104 },
				--475.7662,-1022.12,27.792,272.24124145508
				SpawnPoints = {
					{ x = 475.7662, y = -1022.12, z = 27.792,272, heading = 272.24124145508, radius = 6.0 }
				}
			}
			
		},

		Helicopters = {
			{
				Spawner    = { x = 463.33, y = -982.24, z = 43.69 },
				SpawnPoint = { x = 449.61, y = -981.17, z = 44.08, heading = 90.86, radius = 10.0 },
			}
		},
		
		HelicoptersDeleters = {
			{ x = 449.61, y = -981.17, z = 42.74 }
		},

		VehicleDeleters = {
			{ x = 463.0, y = -1019.85, z = 27.16 },
			{x=478.8299,y=-1022.28,z=28.013 - 0.98}
		},

		BossActions = {
			{ x=452.0803,y=-973.135,z=30.689 }
		},
		
		Uniforms = {
			swat = {
				male = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['mask_1'] = 52,	['mask_2'] = 0,
					['torso_1'] = 50,   ['torso_2'] = 0,
					['arms'] = 50,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 125,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['bags_1'] = 0,    ['bags_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['glasses_1'] = 0,  ['glasses_2'] = 0,
					['bproof_1'] = 16,  ['bproof_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 343,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 34,
                    ['pants_1'] = 136,   ['pants_2'] = 1,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = 124,  ['helmet_2'] = 0,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = 55,    ['mask_2'] = 0,               
					['bproof_1'] = 16,  ['bproof_2'] = 0
				}
			},
			recruit = {
				male = {
					['tshirt_1'] = 59,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 22,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 41,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 107,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 152,  ['tshirt_2'] = 0,
					['torso_1'] = 224,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 97,   ['pants_2'] = 0,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
	officer = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 22,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		}
	},
	sergeant = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 33,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 0,   ['pants_2'] = 10,
			['shoes_1'] = 29,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 95,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		}
	},
	lieutenant = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 50,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 20,   ['shoes_2'] = 7,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
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
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		}
	},
	inspect = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 22,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
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
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		}
	},
	subcomi = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 50,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 20,   ['shoes_2'] = 7,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
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
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		}
	},
	comi = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 95,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 48,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 20,   ['shoes_2'] = 7,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
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
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		}
	},
	boss = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 43,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 11,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 21,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0
		}
	},
	bullet = {
		male = {
			['bproof_1'] = 16,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 1
		}
	},
	police = {
		male = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
		},
		female = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
		}
	},
	gilet = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 0
		}
	},
	},
	
	AuthorizedVehicles = {
	Shared = {
		{
			model = 'police3',
			label = 'Ford Explorer'
		},
		{
			model = 'police2',
			label = 'Chevrolet Impala'
		},
		{
			model = 'pranger',
			label = 'Ford Ranger'
		},
		{
			model = 'police',
			label = 'Ford Focus'
		},		
		{
			model = 'tchcop',
			label = 'TOYOTA COROLLA'
		},	
	},

	recruit = {

	},

	officer = {

	},

	sergeant = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		},
		{
			model = 'policeb',
			label = 'Moto Enduro'
		},
		{
			model = 'motobm',
			label = 'Moto BMW'
		},
	},

	lieutenant = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		},
		{
			model = 'policeb',
			label = 'Moto Enduro'
		},
		{
			model = 'motobm',
			label = 'Moto BMW'
		},
	},
	
	inspect = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		},
		{
			model = 'policeb',
			label = 'Moto Enduro'
		},
		{
			model = 'motobm',
			label = 'Moto BMW'
		},
	},
	
	subcomi = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		},
		{
			model = 'policeb',
			label = 'Moto Enduro'
		},
		{
			model = 'motobm',
			label = 'Moto BMW'
		},
	},
	
	comi = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		},
		{
			model = 'policeb',
			label = 'Moto Enduro'
		},
		{
			model = 'motobm',
			label = 'Moto BMW'
		},
		{
			model = 'polchiron',
			label = 'Bugatti'
		},
		{
			model = 'polamggtr',
			label = 'AMG'
		},
	},

	boss = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		},
		{
			model = 'policeb',
			label = 'Moto Enduro'
		},
		{
			model = 'motobm',
			label = 'Moto BMW'
		},
		{
			model = 'polchiron',
			label = 'Bugatti'
		},
		{
			model = 'polamggtr',
			label = 'AMG'
		},
	}
},

},
--[[
	Sandy = {

		Blip = {
			Pos     = { x = 1854.11, y = 3685.43, z = 34.27 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 52,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			recruit = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
			},	
			officer = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
			},
			sergeant = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
			},
			lieutenant = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
			},
			inspect = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
			},
			subcomi = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
			},
			comi = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
			},
			boss = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
			},
		},

		Cloakrooms = {
			{ x = 1855.64, y = 3692.75, z = 33.27 },
		},

		Armories = {
			{ x = 1842.87, y = 3688.87, z = 33.27 },
		},

		Vehicles = {
			{
				Spawner    = { x = 1861.75, y = 3686.35, z = 34.28 },
				SpawnPoints = {
					{ x = 1864.87, y = 3681.31, z = 33.49, heading = 209.78, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner    = { x = 1870.68, y = 3660.89, z = 33.81 },
				SpawnPoint = { x = 1864.83, y = 3647.71, z = 36.23, heading = 28.91, radius = 10.0},
			}
		},
		
		HelicoptersDeleters = {
			{ x = 1864.12, y = 3649.06, z = 34.89 }
		},

		VehicleDeleters = {
			{ x=1864.700, y=3682.116, z=33.696 - 0.95 }
		},

		BossActions = {
			{ x=1845.471, y=3680.186, z=34.267 }
		},
		
		Uniforms = {
			swat = {
				male = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['mask_1'] = 55,	['mask_2'] = 0,
					['torso_1'] = 50,   ['torso_2'] = 0,
					['arms'] = 50,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 125,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['bags_1'] = 0,    ['bags_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['glasses_1'] = 0,  ['glasses_2'] = 0
				},
				female = {
					['tshirt_1'] = 14,  ['tshirt_2'] = 0,
					['mask_1'] = 55,	['mask_2'] = 0,
					['torso_1'] = 43,   ['torso_2'] = 0,
					['arms'] = 49,
					['pants_1'] = 61,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 124,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['glasses_1'] = 5,  ['glasses_2'] = 0
				}
			},
			recruit = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			officer = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			sergeant = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			lieutenant = { 
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			inspect = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			subcomi = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			comi = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			boss = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 35,   ['pants_2'] = 0,
					['shoes_1'] = 21,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 48,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 31,
					['pants_1'] = 32,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 105,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0
				}
			},
			bullet = {
				male = {
					['bproof_1'] = 20,  ['bproof_2'] = 9
				},
				female = {
					['bproof_1'] = 21,  ['bproof_2'] = 0
				}
			},
			police = {
				male = {
					['helmet_1'] = 125,  ['helmet_2'] = 0
				},
				female = {
					['helmet_1'] = 125,  ['helmet_2'] = 0
				}
			},
			gilet = {
				male = {
					['tshirt_1'] = 59,  ['tshirt_2'] = 0
				},
				female = {
					['tshirt_1'] = 36,  ['tshirt_2'] = 0
				}
			}
		},
	
		AuthorizedVehicles = {
			Shared = {
				{
					model = 'sheriff',
					label = 'Focus Gendarmeria'
				},
				{
					model = 'sheriff2',
					label = 'Amarok Gendarmeria'
				}
			},

			recruit = {

			},

			officer = {

			},

			sergeant = {

			},

			lieutenant = {

			},
	
			inspect = {

			},
	
			subcomi = {
	
			},
	
			comi = {

			},

			boss = {

			}
		},
	},
]]--
}

-- https://wiki.rage.mp/index.php?title=Vehicles

Config.AuthorizedHelicoptero = {

	{
		model = 'polmav',
		label = 'POLICIA'
	},

}

Config.AuthorizedVehicles = {
	Shared = {
		{
			model = 'police3',
			label = 'Ford Explorer'
		},
		{
			model = 'policeb',
			label = 'Moto Enduro'
		},
		{
			model = 'policeb2',
			label = 'BF400 Policia'
		},
		{
			model = 'police2',
			label = 'Chevrolet Impala'
		},
		{
			model = 'pranger',
			label = 'Ford Ranger'
		},
		{
			model = 'police',
			label = 'Ford Focus'
		},
		{
			model = 'tchcop',
			label = 'TOYOTA COROLLA'
		},
	},

	recruit = {

	},

	officer = {

	},

	sergeant = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		}
	},

	lieutenant = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		}
	},
	
	inspect = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		}
	},
	
	subcomi = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		}
	},
	
	comi = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		}
	},

	boss = {
		{
			model = 'riot',
			label = 'Police Riot'
		},
		{
			model = 'fbi2',
			label = 'FIB SUV'
		},
		{
			model = 'policet',
			label = 'Police Transporter'
		}
	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	swat = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['mask_1'] = 55,	['mask_2'] = 0,
			['torso_1'] = 50,   ['torso_2'] = 0,
			['arms'] = 50,
			['pants_1'] = 33,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 125,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['mask_1'] = 55,	['mask_2'] = 0,
			['torso_1'] = 43,   ['torso_2'] = 0,
			['arms'] = 49,
			['pants_1'] = 61,   ['pants_2'] = 9,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 124,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0
		}
	},
	recruit = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 22,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 224,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 22,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
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
	sergeant = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 4,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 50,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 20,   ['shoes_2'] = 7,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
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
	inspect = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 208,   ['torso_2'] = 22,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 9,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
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
	subcomi = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 50,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 20,   ['shoes_2'] = 7,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
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
	comi = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 95,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 4,   ['pants_2'] = 4,
			['shoes_1'] = 20,   ['shoes_2'] = 7,
			['helmet_1'] = 107,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
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
	boss = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 43,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 11,
			['pants_1'] = 4,   ['pants_2'] = 1,
			['shoes_1'] = 20,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 5,  ['glasses_2'] = 0,
			['chain_1'] = 125,    ['chain_2'] = 0,
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
	bullet = {
		male = {
			['bproof_1'] = 16,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 1
		}
	},
	police = {
		male = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
		},
		female = {
			['helmet_1'] = 125,  ['helmet_2'] = 0
		}
	},
	gilet = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 0
		}
	}

}