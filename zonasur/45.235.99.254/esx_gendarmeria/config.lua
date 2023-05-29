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
Config.HandcuffTimer              = 20 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = 30
Config.Locale                     = 'es'
Config.LicenseEnable = true

Config.PoliceStations = {
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
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				--{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
			},	
			officer = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
			},
			sergeant = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
			},
			lieutenant = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
			},
			inspect = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
			},
			subcomi = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
			},
			comi = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
			},
			boss = {
				{ name = 'WEAPON_NIGHTSTICK',       price = 200 },
				{ name = 'WEAPON_COMBATPISTOL',     price = 300 },
				{ name = 'WEAPON_FLARE',        price = 300 },
				{ name = 'binoculars',        price = 300 },
				{ name = 'flashlight',        price = 300 },
				{ name = 'silenciador',        price = 300 },
				{ name = 'WEAPON_STUNGUN',          price = 500 },
				{ name = 'WEAPON_FLAREGUN',         price = 60 },
				--{ name = 'WEAPON_ASSAULTSMG',       price = 1250 },
				--{ name = 'WEAPON_SMG',       price = 1250 },
				{ name = 'WEAPON_CARBINERIFLE',        price = 300 },
				{ name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
				{ name = 'WEAPON_SMOKEGRENADE',        price = 300 },
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'GADGET_PARACHUTE',        price = 300 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'WEAPON_ASSAULTSMG',        price = 300 },
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
			{ x = 1845.47, y = 3680.07, z = 34.27 }
		},
		
		Uniforms = {
			swat = {
				male = {
					['tshirt_1'] = 122,  ['tshirt_2'] = 0,
					['mask_1'] = 52,	['mask_2'] = 0,
					['torso_1'] = 53,   ['torso_2'] = 0,
					['arms'] = 35,
					['pants_1'] = 129,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 150,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['bags_1'] = 0,    ['bags_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['glasses_1'] = 41,  ['glasses_2'] = 0
				},
				female = {
					['tshirt_1'] = 152,  ['tshirt_2'] = 0,
					['mask_1'] = 55,	['mask_2'] = 0,
					['torso_1'] = 43,   ['torso_2'] = 0,
					['arms'] = 18,
					['pants_1'] = 135,   ['pants_2'] = 1,
					['shoes_1'] = 55,   ['shoes_2'] = 0,
					['helmet_1'] = 114,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['glasses_1'] = 27,  ['glasses_2'] = 4
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0,
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
				}
			},
			boss = {
				male = {
					['tshirt_1'] = 129,  ['tshirt_2'] = 0,
					['torso_1'] = 55,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 30,
					['pants_1'] = 33,   ['pants_2'] = 0,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,     ['mask_2'] = 0
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
					model = 'motobm4',
					label = 'MOTO BMW'
				},
				{
					model = 'sheriff',
					label = 'Focus Gendarmeria'
				},				
				{
					model = 'gnaranger',
					label = 'FORD RANGER',
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
				{
					model = 'vetir',
					label = 'Camion'
				},
				{
					model = 'insurgent2',
					label = 'Blindado'
				},
			},
	
			comi = {
				{
					model = 'vetir',
					label = 'Camion'
				},
				{
					model = 'insurgent2',
					label = 'Blindado'
				},
			},

			boss = {
				{
					model = 'vetir',
					label = 'Camion'
				},
				{
					model = 'insurgent2',
					label = 'Blindado'
				},
			}
		},
	},
}

-- https://wiki.rage.mp/index.php?title=Vehicles

Config.AuthorizedHelicoptero = {

	{
		model = 'polmav',
		label = 'Gendarmeria'
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
		}
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
		},
		{
			model = 'vetir',
			label = 'Camion'
		},
		{
			model = 'insurgent2',
			label = 'Blindado'
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
			model = 'vetir',
			label = 'Camion'
		},
		{
			model = 'insurgent2',
			label = 'Blindado'
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
		},
		{
			model = 'vetir',
			label = 'Camion'
		},
		{
			model = 'insurgent2',
			label = 'Blindado'
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
		},
		{
			model = 'vetir',
			label = 'Camion'
		},
		{
			model = 'insurgent2',
			label = 'Blindado'
		}
	}
}