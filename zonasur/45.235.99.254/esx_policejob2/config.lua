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

	Paleto = {

		Blip = {
			Pos     = { x = -444.97, y = 6014.54, z = 31.72 },
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
				{ name = 'silenciador',        price = 300 },
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
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'silenciador',        price = 300 },
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
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				{ name = 'silenciador',        price = 300 },
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
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'silenciador',        price = 300 },
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
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'silenciador',        price = 300 },
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
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'silenciador',        price = 300 },
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
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'silenciador',        price = 300 },
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
				{ name = 'WEAPON_CARBINERIFLE_MK2',        price = 300 },
				{ name = 'WEAPON_HEAVYPISTOL',       price = 1250 },
				--{ name = 'WEAPON_HEAVYSNIPER',       price = 1250 },
				{ name = 'silenciador',        price = 300 },
			},
		},

		Cloakrooms = {
			{ x = -436.410, y = 6004.283, z = 30.716 },
		},

		Armories = {
			{ x = -437.82, y = 5988.26, z = 30.72 },
		},

		Vehicles = {
			{
				Spawner    = { x = -445.96, y = 6023.58, z = 31.50 },
				SpawnPoints = {
					{ x = -441.4, y = 6036.91, z = 31.34, heading = 302.92, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner    = { x = -456.02, y = 6009.56, z = 31.49 },
				SpawnPoint = { x = -475.46, y = 5988.3, z = 31.73, heading = 316.1, radius = 10.0 },
			}
		},
		
		HelicoptersDeleters = {
			{ x = -475.46, y = 5988.3, z = 30.35 }
		},

		VehicleDeleters = {
			{ x = -438.81, y = 6029.19, z = 30.35 }
		},

		BossActions = {
			{ x=-439.872,y=6004.623,z=31.716 }
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
					['glasses_1'] = 0,  ['glasses_2'] = 0,
					
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
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			officer = {
				male = {
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			sergeant = {
				male = {
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 1,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			lieutenant = { -- currently the same as intendent_wear
				male = {
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 3,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			inspect = {
				male = {
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 2,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			subcomi = {
				male = {
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			comi = {
				male = {
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			boss = { -- currently the same as chef_wear
				male = {
					['tshirt_1'] = 153,  ['tshirt_2'] = 0,
					['torso_1'] = 208,   ['torso_2'] = 20,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 59,   ['pants_2'] = 9,
					['shoes_1'] = 24,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['mask_1'] = -1,	['mask_2'] = 0
				},
				female = {
                    ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
                    ['torso_1'] = 329,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 14,
                    ['pants_1'] = 30,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 89,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = -1,    ['mask_2'] = 0
                }
			},
			bullet = {
				male = {
					['bproof_1'] = 16,  ['bproof_2'] = 1
				},
				female = {
					['bproof_1'] = 21,  ['bproof_2'] = 1
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
					model = 'police3',
					label = 'Ford Explorer'
				},
				{
					model = 'police4',
					label = 'Ford Focus'
				},
				{
					model = 'police2',
					label = 'Chevrolet Impala'
				},
				{
					model = 'policeb',
					label = 'Moto Enduro'
				},
				{
					model = 'policeold2',
					label = 'Ford Mondeo'
				},
				{
					model = 'motobm',
					label = 'Moto BMW'
				}
				--[[
				{
					model = 'pranger',
					label = 'Ford Ranger'
				},
				{
					model = 'police',
					label = 'Ford Focus'
				},				
				]]--
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
		},
	},
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
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
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
			['glasses_1'] = 5,  ['glasses_2'] = 0,
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