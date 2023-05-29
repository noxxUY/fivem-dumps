Config = {}

Config.Locale = 'es'

Config.adminCommand = 'gangs' -- command that open gang data for admin
Config.adminGroup   = 'superadmin' -- ace group to access admin command

Config.gangAreaBlipsColor = 9  -- color of blips that show on map which area of gang area ( https://docs.fivem.net/docs/game-references/blips/ )
Config.garageGangBlips = 524  -- type of blips that show on map for impound vehicle ( https://docs.fivem.net/docs/game-references/blips/ )
Config.garageGangBlipsColor = 47  -- color of blips that show on map for impound vehicle ( https://docs.fivem.net/docs/game-references/blips/ )
Config.playerGangBlips = 310  -- type of blips that show on map for member of gang ( https://docs.fivem.net/docs/game-references/blips/ )
Config.playerGangBlipsColor = 1  -- color of blips that show on map for member of gang ( https://docs.fivem.net/docs/game-references/blips/ )

Config.MarkerType = {
	boss = 29 , -- type of Marker that show to member of gang for boss action( https://docs.fivem.net/docs/game-references/markers/ )
	locker = 24 , -- type of Marker that show to member of gang for change cloths( https://docs.fivem.net/docs/game-references/markers/ )
	armory = 21 , -- type of Marker that show to member of gang for armory and inventory ( https://docs.fivem.net/docs/game-references/markers/ )
	vehicle = 36 , -- type of Marker that show to member of gang for vehicle spawner ( https://docs.fivem.net/docs/game-references/markers/ )
	helicopter = 34 , -- type of Marker that show to member of gang for helicopter spawner ( https://docs.fivem.net/docs/game-references/markers/ )
	boat = 35 , -- type of Marker that show to member of gang for boat spawner ( https://docs.fivem.net/docs/game-references/markers/ )
	vehicleConvertor = 24 , -- type of Marker that show to member of gang for change own vehicle to gang vehicle ( https://docs.fivem.net/docs/game-references/markers/ )
}
Config.MarkerColor = {r = 255, g = 0, b = 0} -- color of marker
Config.MarkerSize = {x = 0.5, y = 0.5, z = 0.5} -- size of marker
Config.DrawDistance = 10 -- Distance of player and Marker to draw Marker for player

Config.Bulletproof = { typeNumber = 10, colorNumber = 1 } -- color and type of Bulletproof

Config.OpenActionMenu = 318 -- Button on keyboard that press, the gang action menu opend ( https://docs.fivem.net/docs/game-references/controls/ )
Config.MaxGangActionDistance = 3 -- max distance beatween Gang Memeber and player(vehicle) for drag , cuff , search and ....
Config.handCuffAnimation = false -- hand cuff/uncuff show with animation

Config.vehicleConvertor = { -- coords of place that is for impound and add vehicle to gang
	{ x = 55.27 , y = 3714.27 , z = 39.75 , typeVehicle = {'car','helicopter'} },
	{ x = 147.4 , y = 3820.09 , z = 30.33 , typeVehicle = 'boat' },
}

Config.impoundPrice = 5000 -- price for re spawn vehicle
Config.impoundReSpawnTime = 10 * 60 -- how meny time lenght too player can get vehicle from impound ( second )
Config.fixSpawnVehicle = false -- fix vehicle when spawn from garage
Config.PlateUseSpace = false -- use space in vehicle plate 
Config.PlateLetters = 3 -- how meny letters use in vehicle plate
Config.PlateNumbers = 3 -- how meny numbers use in vehicle plate
Config.ParkVehicles = false -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.

Config.PaySalaryInterval = 35 -- how meny time lenght too pay salary

Config.activeDiscordHook = false  -- send log of gang armory action to discord
Config.discordHookStartWith = '**ConurbanoRP**' -- Start Discord Log with 
Config.discordHookSignature = 'Que la pasen bien! | ConurbanoRP - RolePlay' -- Signature of discord log

Config.Orgs = { 
	[12] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'cb500f',   label = 'Moto' },
				{ name = 'raptor150',  label = 'Raptor' },				
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
			    { name = 'weapon_combatpdw',       price = 10000000 },
			    { name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 14000000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Chalecos Otro Lado', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[13] = {
		Color = { r = 0, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = '06sx2t',  label = 'Moto' },
				{ name = 'yzf',   label = 'Auto 1' },
				{ name = '18velar',   label = 'Auto 2' },
				{ name = 'c63w205',   label = 'Auto 3' },
				{ name = 'rx7rb',   label = 'Auto 4' },
				{ name = 'Shifter_kart',   label = 'Triciclo' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
	Shop = {
			Weapons = {
				 { name = 'weapon_combatpdw',       price = 10000000 },
			    { name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[46] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[86] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[110] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[127] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[207] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[216] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[217] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[223] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[228] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[232] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[234] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[236] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[237] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[250] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[256] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[259] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[266] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[267] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[272] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[279] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[280] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[283] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[284] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[286] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[291] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[298] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[302] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[330] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[334] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[336] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[337] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[341] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[350] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[351] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[352] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[354] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[364] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[365] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[369] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[379] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[380] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[381] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[384] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[384] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[385] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[396] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[397] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[399] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[400] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[401] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[407] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[408] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[416] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[418] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[419] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[420] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[421] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[422] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[423] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[424] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[425] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[426] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[427] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[428] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[429] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[430] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[432] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[433] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[435] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[436] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[437] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[439] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[443] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[445] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[446] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[447] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[450] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[451] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[452] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[453] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[454] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[455] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
     [456] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[457] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[458] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[459] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[460] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[461] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[462] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[463] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[464] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[465] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
  [466] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[467] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[468] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[469] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[470] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[471] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[472] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[473] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[474] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[475] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[476] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[481] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[482] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[483] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[484] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[485] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[486] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[488] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[491] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[492] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[493] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[494] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[495] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[496] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[497] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[498] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[499] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[500] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[501] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[502] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[503] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[504] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[505] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[506] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[507] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[508] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[509] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[510] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[511] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[512] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[513] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[514] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[515] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[516] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[517] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[518] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[519] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[520] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[521] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[522] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[523] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[524] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[525] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[526] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[527] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[528] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[529] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[530] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[531] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[532] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[533] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[534] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[535] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[536] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[537] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[538] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[539] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[540] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[541] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[542] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[543] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[544] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[545] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[546] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[547] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[548] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[549] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[550] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[551] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[552] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[553] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[554] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[555] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[556] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[557] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[558] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[559] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[560] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	
	[561] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[562] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[563] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[564] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[565] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[566] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[567] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[568] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[569] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[570] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[571] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[572] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[573] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[574] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[575] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[576] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[577] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[578] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[579] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[581] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[582] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[583] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[584] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[585] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[586] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[587] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[588] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[589] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[590] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[591] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[592] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[593] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[594] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[595] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[596] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[597] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[598] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[599] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[600] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[601] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[602] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[603] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[604] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[605] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[606] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[607] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[608] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[609] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[610] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[611] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[612] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 12300000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[613] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[614] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[615] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[616] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[617] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[618] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[619] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[620] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[621] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[622] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[623] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[624] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[625] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[626] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[627] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[628] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[629] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[630] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[631] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[632] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[633] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[634] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[635] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[636] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[637] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[638] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[639] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[640] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[641] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[642] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[643] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[644] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[645] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[646] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[647] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[648] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[649] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[650] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[651] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[652] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[653] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[654] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[655] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[656] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[657] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[658] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[659] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[660] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[661] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[662] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[663] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[664] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[665] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[666] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[667] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[668] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[669] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[670] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[671] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[672] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[673] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[674] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[675] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[676] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[677] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[678] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[679] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[680] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[681] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[682] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[683] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[684] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[685] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[686] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[687] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[688] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[689] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[690] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[691] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[692] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[693] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[694] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[695] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[696] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[697] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[698] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[699] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[700] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[701] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[702] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[703] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[704] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[705] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[706] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[707] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[708] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[709] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[710] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[711] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[712] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[713] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[714] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[715] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[716] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[717] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[718] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[719] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[720] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[721] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[722] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[723] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[724] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[725] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[726] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
		[727] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
		[728] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
		[728] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
		[729] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
		[730] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[731] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[732] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[733] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[734] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[735] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[736] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[737] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[738] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[739] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[740] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[741] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[742] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[743] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[744] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[745] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[746] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[747] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[748] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[749] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[750] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[751] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[752] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[753] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[754] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[755] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[756] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[757] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[758] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[759] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[760] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[761] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[762] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[763] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[763] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[764] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[765] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[766] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[767] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[768] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
	[769] = {
		Color = { r = 255, g = 0, b = 0 },
		AuthorizedVehicles = {
			car = {
				{ name = 'xr250',  label = 'Moto' },
				{ name = '21sierra',   label = 'Camioneta' },
			},
			helicopter = {
				{ name = 'supervolito2',  label = 'Helicoptero' },
			},
			boat = {
				{ name = 'jetmax',  label = 'Jetmax' },
      			{ name = 'seashark3',  label = 'Moto de agua' },
			}
		},
		Shop = {
			Weapons = {
						    { name = 'weapon_combatpdw',       price = 10000000 },

			{ name = 'weapon_bullpuprifle',       price = 17010000 },
				{ name = 'WEAPON_SNIPERRIFLE',       price = 25000000 },
				{ name = 'WEAPON_PISTOL',     price = 6000000 },
				{ name = 'weapon_sawnoffshotgun',     price = 5500000 },
				{ name = 'weapon_assaultsmg',     price = 22300000 },
				{ name = 'WEAPON_VINTAGEPISTOL',     price = 5300000 },
				{ name = 'WEAPON_MACHINEPISTOL',     price = 10500000 },
				{ name = 'weapon_assaultrifle',     price = 18300000 },
				{ name = 'weapon_appistol',     price = 15300000 },
				{ name = 'weapon_compactrifle',     price = 1200000 },
				{ name = 'weapon_pistol50',     price = 9500000 },
				{ name = 'weapon_microsmg',     price = 15600000 },
				{ name = 'weapon_gusenberg',     price = 13200200 },
				{ name = 'weapon_mg',     price = 20000000 },
				{ name = 'WEAPON_ADVANCEDRIFLE',     price = 17500200 },
				{ name = 'weapon_assaultrifle_mk2',     price = 20010000 }, 
				
				{ name = 'weapon_bullpupshotgun',     price = 15000000 },
	   				{ name = 'weapon_smg_mk2',     price = 10500000 },
				                                                   
			},
			Items = {
				{ name = 'Nada', item = 'zedegolole2',     price = 1000000 }			
			}
		}
	},
}










