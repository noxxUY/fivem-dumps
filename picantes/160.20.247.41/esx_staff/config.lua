Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableNonFreemodePeds = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.staffStations = {

  staff = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
     -- { name = 'WEAPON_NIGHTSTICK',       price = 9000 },
    --  { name = 'WEAPON_COMBATPISTOL',     price = 30000 },
     -- { name = 'WEAPON_ASSAULTSMG',       price = 1125000 },
     -- { name = 'WEAPON_ASSAULTRIFLE',     price = 1500000 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 600000 },
     -- { name = 'WEAPON_STUNGUN',          price = 50000 },
     -- { name = 'WEAPON_FLASHLIGHT',       price = 800 },
     -- { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
     -- { name = 'WEAPON_FLAREGUN',         price = 6000 },
      { name = 'GADGET_PARACHUTE',        price = 3000 },
	  { name = 'WEAPON_BAT'		,        price = 3000 },
     -- { name = 'WEAPON_STICKYBOMB',       price = 200000 },
   --   { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
     -- { name = 'WEAPON_FIREWORK',         price = 30000 },
     -- { name = 'WEAPON_GRENADE',          price = 180000 },
     -- { name = 'WEAPON_BZGAS',            price = 120000 },
    --  { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
      { name = 'WEAPON_APPISTOL',         price = 70000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 1100000 },
   --   { name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    --  { name = 'WEAPON_MINIGUN',          price = 700000 },
     -- { name = 'WEAPON_RAILGUN',          price = 2500000 },
    },

	  AuthorizedVehicles = {
		  { name = 'schafter5',  label = 'Véhicule Civil' },
		  { name = 'Akuma',    label = 'Moto' },
		  { name = 'Granger',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
	  },

    Cloakrooms = {
      { x = 144.57633972168, y = -2203.7377929688, z = 3.6880254745483},
    },

    Armories = {
      { x = 146.15225219727, y = -2199.4108886719, z = 3.6880254745483},
    },

    Vehicles = {
      {
        Spawner    = { x = 120.57460021973, y = -2196.5703125, z = 5.0333256721497 },
        SpawnPoint = { x = 126.54863739014, y = -2192.8732910156, z = 5.0333247184753 },
        Heading    = 261.51,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 113.30500793457, y = -3109.3337402344, z = 5.0060696601868 },
        SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 5.0050659179688 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 126.88283538818, y = -2199.6921386719, z = 5.0333247184753 },
      
    },

    BossActions = {
      { x = 150.89761352539, y = -2204.248046875, z = 3.688024520874 },
    },

  },

}

Config.Uniforms = {
	mod_wear = {
		male = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
			['torso_1'] = 179,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 29,
			['pants_1'] = 83,   ['pants_2'] = 2,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 50,  ['helmet_2'] = 0,
			['chain_1'] = 3,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 16,  ['tshirt_2'] = 0,
			['torso_1'] = 102,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 35,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	admin_wear = {
		male = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
			['torso_1'] = 179,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 29,
			['pants_1'] = 83,   ['pants_2'] = 2,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 50,  ['helmet_2'] = 0,
			['chain_1'] = 3,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 16,  ['tshirt_2'] = 0,
			['torso_1'] = 102,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 35,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 20,
			['mask_1'] = 0,  ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	dg_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
			['torso_1'] = 179,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 29,
			['pants_1'] = 83,   ['pants_2'] = 2,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 50,  ['helmet_2'] = 0,
			['chain_1'] = 3,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 101,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 23,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 6,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 3,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	de_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
			['torso_1'] = 179,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 29,
			['pants_1'] = 83,   ['pants_2'] = 2,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 50,  ['helmet_2'] = 0,
			['chain_1'] = 3,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 101,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 23,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 6,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 3,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	owner_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
			['torso_1'] = 179,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 29,
			['pants_1'] = 83,   ['pants_2'] = 2,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 50,  ['helmet_2'] = 0,
			['chain_1'] = 3,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 101,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 3,
			['arms'] = 23,
			['pants_1'] = 69,   ['pants_2'] = 0,
			['shoes_1'] = 6,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 3,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	}
}