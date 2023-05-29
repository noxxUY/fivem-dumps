Config                            = {}
Config.Jobs						  = {} 

Config.DrawDistance               = 5.0 -- Distance in GTA units you will see the markers
Config.DrawTextDistance			  = 2.0 -- Distance in GTA units from which you will see the DrawTex3D (if is enabled)
Config.Draw3DText = true -- If true, a 3D floating text will be displayed above the marker
Config.Locale                     = 'en'
Config.UseAnimations			  = true -- Enables/Diasbles animations for fixing vehicle, writing bills and etc. ...
Config.UseMythic_Progressbar	  = true -- Enables/Diasbles opening Mythic progress bar while doing an animation
Config.NeedItemCuffs			  = false -- Enables/Diasbles requirement of handcuffs as item
Config.UseLegacyFuel			  = false -- If true, your vehicle after taking it from garage will have 100% fuel (requires LegacyFuel script)
Config.ShowImpoundNotification	  = true -- Choose, if you want to play an animation while impounding a vehicle
Config.MenuAlign 				  = 'right' -- Position of ESX Menu
Config.CuffItemName				  = 'cuffs' -- The item name in database you need to have in your inventory to bee able to cuff somebody
Config.RemoveCuffs 				  = false -- Wether to remove cuffs on cuffing or not, requires Config.NeedItemCuffs set to true
Config.DiscordLoggingActionsMenu  = true -- If the actions from F6 menu should be logged to the Discord
Config.SocietyOwnedVehicles		  = false -- If true, vehicles will be fetched from the database, make sure to have database:

--[[
	`plate`, `vehicle`, `stored`, `type` (air | car)	
]]


-- Custom markers
Config.DefaultMarker = { -- The marker that will be shown when you are not close enough
	Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
	Color = {r = 255, g = 0, b = 0}, -- The color of the marker
	BouncingMarker = false, -- If the marker should go UP and Down
	RotatingMarker = true, -- If the marker should rotate
	Marker = 21, -- Type of the marker
	Disabled = false -- To disable marker and keep only classic markers (they won't be changing when you get closer)
}

Config.BossGrades = { -- Allowed grades to open the bossmenu
	['boss'] = true
}

Config.MotionTexts = { -- Texts that will be shown in the motion texts
	['Armory'] = '[E] Armario',
	['Vehicles'] = '[E] Vehiculos',
	['Cloakroom'] = '[E] Guardarropa',
	['Craft'] = '[E] Elaboración',
	['Selling'] = '[E] Venta',
	['BossActions'] = '[E] Acciones del jefe',
	['VehicleDeleter'] = '[E] Estacionar vehículo',
	['Aircrafts'] = '[E] Aviones'
}

-- Custom events (edit in case you use any custom events)
Config.customEvents = {
    ['esx_billing:sendBill'] = 'esx_billing:sendBill', -- You can change the event if you for example use anticheats/you have editted event like esx_billing:sendSuperSecretEventSquizerBill
    ['esx_society:openBossMenu'] = 'esx_society:openBossMenu',
	['esx:setJob'] = 'esx:setJob',
	['esx_ambulancejob:revive'] = 'esx_ambulancejob:revive',
	['mythic_progressbar:client:progress'] = 'mythic_progbar:client:progress',
	['esx:getSharedObject'] = 'esx:getSharedObject'
}


Config.NonJobActions = { -- With these jobs you will be available to collect of other jobs without the job needed
	Enabled = false, -- If the non job actions should be enabled
	Jobs = {
		['mafia01'] = true,
		['militar'] = true,
		['fiscalia'] = true
	},
	AllowedActions = {
		['Selling'] = false, -- Marker types they are allowed, for now you can only disable these, not add any more
		['Collecting'] = false,
		['Craft'] = false
	}
}

Config.Blips = {
	militar = {
		BlipCoords = vector3(-2420.54, 3271.88, 32.98), -- Coords for the blip
		Sprite = 576, -- Blips sprite (icon on the map)
		Scale = 0.7, -- Size of the blip
		Colour = 28, -- Color of the blip
		Name = 'Militares' -- Name of the blip
	},
	fbis = {
		BlipCoords = vector3(2519.6941, -333.4998, 94.0922), -- Coords for the blip
		Sprite = 88, -- Blips sprite (icon on the map)
		Scale = 0.7, -- Size of the blip
		Colour = 72, -- Color of the blip
		Name = 'FBI' -- Name of the blip
	},
	
	
	-- jobvip = {
	-- 	BlipCoords = vector3(-279.6564, -923.6833, 31.2149), -- Coords for the blip
	-- 	Sprite = 304, -- Blips sprite (icon on the map)
	-- 	Scale = 0.7, -- Size of the blip
	-- 	Colour = Gold, -- Color of the blip
	-- 	Name = 'Tienda VIP', -- Name of the blip
	-- 	Jobs = { -- Remove the whole Jobs table to make the blip public or eventualy set it to Jobs = 'none'
	-- 		['jobvip'] = true
	-- 	}
	-- } 
}

Config.AntiDupe = {
	Enabled = true,
	Time = math.random(1,3),
	AnimN = 'shakeoff_1',
	AnimDict = 'move_m@_idles@shake_off'
}

-- Config.Jobs.jobvip = {
--     Zones = {
-- 		armory = {
-- 			Pos = vector3(-279.8534, -923.1960, 31.2147), -- Postion of the marker
-- 			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
-- 			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
-- 			Marker = 22, -- Type of the marker
-- 			Type = 'Armory',
-- 			BuyWeapon = true, 
-- 			BuyWeaponGrade = 0,
-- 			GetWeaponGrade = 5,
-- 			GetStockGrade = 5,
-- 			BuyItems = true,
-- 			ShopItems = {
-- 				shared = { -- Each job grade will see these items	
-- 					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
-- 					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
-- 					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
-- 					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
-- 					{item = 'suppressor', price = 25000, label = 'Silenciador'},
-- 					{item = 'flashlight', price = 25000, label = 'Linterna'},
-- 					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
-- 					{item = 'bandage', price = 800, label = 'Vendajes'},
					
-- 				},
-- 				boss = { -- Only boss will see these items		
-- 				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
-- 				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
-- 				},
-- 			},
-- 		},	 

		
-- 		DelCasino = {
-- 			Pos = vector3(986.4254, 68.5694, 78.4761), -- Postion of the marker
-- 			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
-- 			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
-- 			Marker = 22, -- Type of the marker
-- 			Type = 'Armory',
-- 			BuyWeapon = true, 
-- 			BuyWeaponGrade = 0,
-- 			GetWeaponGrade = 5,
-- 			GetStockGrade = 5,
-- 			BuyItems = true,
-- 			ShopItems = {
-- 				shared = { -- Each job grade will see these items	
-- 				--	{item = 'clip', price = 500, label = 'Cargadores'},
-- 				--	-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
-- 				--	{item = 'cuffs', price = 200, label = 'Esposas'},
-- 				--	{item = 'bandage', price = 800, label = 'Vendajes'},
-- 				},
-- 				boss = { -- Only boss will see these items		
-- 				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
-- 				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
-- 				},
-- 			},
-- 		},
		
-- 		BossActions = {
-- 				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
-- 				Size = {x = 0.7, y = 0.7, z = 0.7},
-- 				Color = {r = 204, g = 204, b = 0},
-- 				Marker = 22,
-- 				Type = 'BossActions',
-- 		},	

-- 	},  
	
-- 	AuthorizedAirCrafts = {
-- 		shared = {},
-- 		oro = {},
-- 		platino = {},
-- 		diamante = {},
-- 		black = {
-- 			{model = 'swift2', label = 'swift2', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'havok', label = 'havok', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'seasparrow', label = 'seasparrow', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'volatus', label = 'volatus', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'seasparrow2', label = 'seasparrow2', props = {plate = 'BLACK', modXenon = true}},
-- 		},
-- 		reinado = {
-- 			{model = 'swift2', label = 'swift2', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'havok', label = 'havok', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'seasparrow', label = 'seasparrow', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'volatus', label = 'volatus', props = {plate = 'BLACK', modXenon = true}},
-- 			{model = 'seasparrow2', label = 'seasparrow2', props = {plate = 'BLACK', modXenon = true}},
-- 		},
-- 		boss = { -- These vehicles + Shared Vehicles will have Boss rank
-- 			{
-- 				model = 'frogger',
-- 				label = 'frogger',
-- 				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
-- 			}
			
			
-- 		}
-- 	},
	
-- 	AuthorizedVehicles = { 
-- 		shared = {}, 
-- 		oro = { 
-- 			{model = 'SRT8', label = 'SRT8', props = {plate = 'VIP ORO', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'S1000RR', label = 'S1000RR', props = {plate = 'VIP ORO', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RS62', label = 'RS62', props = {plate = 'VIP ORO', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RMODMUSTANG', label = 'RMODMUSTANG', props = {plate = 'VIP ORO', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = '718CAYMANS', label = '718CAYMANS', props = {plate = 'VIP ORO', color1 = 1, color2 = 1, modTransmission = 3} },
-- 		},
-- 		platino = { 
-- 			{model = 'SRT8', label = 'SRT8', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'S1000RR', label = 'S1000RR', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RS62', label = 'RS62', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RMODMUSTANG', label = 'RMODMUSTANG', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = '718CAYMANS', label = '718CAYMANS', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'HURPERNOV', label = 'HURPERNOV', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'JESKO2020', label = 'JESKO2020', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'LP700R', label = 'LP700R', props = {plate = 'VIP PLAT', color1 = 1, color2 = 1, modTransmission = 3} },
-- 		},
-- 		diamante = { 
-- 			{model = 'SRT8', label = 'SRT8', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'S1000RR', label = 'S1000RR', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RS62', label = 'RS62', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RMODMUSTANG', label = 'RMODMUSTANG', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = '718CAYMANS', label = '718CAYMANS', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'HURPERNOV', label = 'HURPERNOV', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'JESKO2020', label = 'JESKO2020', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'LP700R', label = 'LP700R', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'TAMPA4', label = 'TAMPA4', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'TRX', label = 'TRX', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'NISSANTITAN17', label = 'NISSANTITAN17', props = {plate = 'VIP DIAM', color1 = 1, color2 = 1, modTransmission = 3} },
-- 		},
-- 		black = { 
-- 			{model = 'SRT8', label = 'SRT8', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'S1000RR', label = 'S1000RR', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RS62', label = 'RS62', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RMODMUSTANG', label = 'RMODMUSTANG', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = '718CAYMANS', label = '718CAYMANS', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'HURPERNOV', label = 'HURPERNOV', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'JESKO2020', label = 'JESKO2020', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'LP700R', label = 'LP700R', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'TAMPA4', label = 'TAMPA4', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'TRX', label = 'TRX', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'NISSANTITAN17', label = 'NISSANTITAN17', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'OYCVAL', label = 'OYCVAL', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RMODGT63', label = 'RMODGT63', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'C7', label = 'C7', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'ABEXIGE12', label = 'ABEXIGE12', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'AMGGTRLIGHT', label = 'AMGGTRLIGHT', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'URUSTC', label = 'URUSTC', props = {plate = 'VIPBLACK', color1 = 1, color2 = 1, modTransmission = 3} },
-- 		},
-- 		reinado = { 
-- 			{model = 'SRT8', label = 'SRT8', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'S1000RR', label = 'S1000RR', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RS62', label = 'RS62', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RMODMUSTANG', label = 'RMODMUSTANG', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = '718CAYMANS', label = '718CAYMANS', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'HURPERNOV', label = 'HURPERNOV', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'JESKO2020', label = 'JESKO2020', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'LP700R', label = 'LP700R', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'TAMPA4', label = 'TAMPA4', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'TRX', label = 'TRX', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'NISSANTITAN17', label = 'NISSANTITAN17', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'OYCVAL', label = 'OYCVAL', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'RMODGT63', label = 'RMODGT63', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'C7', label = 'C7', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'ABEXIGE12', label = 'ABEXIGE12', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'AMGGTRLIGHT', label = 'AMGGTRLIGHT', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'URUSTC', label = 'URUSTC', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'rmodmi8lb', label = 'rmodmi8lb', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'bmwm8', label = 'bmwm8', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = '765ltmso', label = '765ltmso', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 			{model = 'MG63PxxBK', label = 'MG63PxxBK', props = {plate = 'VIP REY', color1 = 1, color2 = 1, modTransmission = 3} },
-- 		},
-- 		boss = {}
-- 	},	

-- 	AllowedActions = {
-- 		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
-- 		HasBodyActions = false, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
-- 		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
-- 		CanRevive = false, -- This adds revive possibility to F6 menu
-- 		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
-- 		Deposit = false, -- If the boss will be able to deposit
-- 		Grades = true, -- If the boss will have access to grades menu
-- 		Withdraw = false, -- If the boss will have access to withdraw
-- 		Employees = false, -- If the boss will have access to the employyess menu
-- 	},

-- 	AuthorizedWeapons = {
-- 		plata = {
-- 			{weapon = 'WEAPON_MACHINEPISTOL', price = 300000},
-- 			{weapon = 'WEAPON_ASSAULTSMG', price = 450000},
-- 			{weapon = 'WEAPON_GUSENBERG', price = 350000},
-- 			{weapon = 'WEAPON_FLARE', price = 50000},
-- 			{weapon = 'WEAPON_BOTTLE', price = 50000},
-- 			},
-- 		oro = {
-- 			{weapon = 'WEAPON_MACHINEPISTOL', price = 300000},
-- 			{weapon = 'WEAPON_ASSAULTSMG', price = 450000},
-- 			{weapon = 'WEAPON_GUSENBERG', price = 350000},
-- 			{weapon = 'WEAPON_FLARE', price = 50000},
-- 			{weapon = 'WEAPON_BOTTLE', price = 50000},
-- 			{weapon = 'WEAPON_APPISTOL', price = 6000000},
-- 			},
-- 		platino = {
-- 			{weapon = 'WEAPON_MACHINEPISTOL', price = 300000},
-- 			{weapon = 'WEAPON_ASSAULTSMG', price = 450000},
-- 			{weapon = 'WEAPON_GUSENBERG', price = 350000},
-- 			{weapon = 'WEAPON_FLARE', price = 50000},
-- 			{weapon = 'WEAPON_BOTTLE', price = 50000},
-- 			{weapon = 'WEAPON_APPISTOL', price = 6000000},
			
-- 			},
-- 		diamante = {
-- 			{weapon = 'WEAPON_MACHINEPISTOL', price = 300000},
-- 			{weapon = 'WEAPON_ASSAULTSMG', price = 450000},
-- 			{weapon = 'WEAPON_GUSENBERG', price = 350000},
-- 			{weapon = 'WEAPON_FLARE', price = 50000},
-- 			{weapon = 'WEAPON_BOTTLE', price = 50000},
-- 			{weapon = 'WEAPON_APPISTOL', price = 6000000},
-- 			},
-- 		black = {
-- 			{weapon = 'WEAPON_MACHINEPISTOL', price = 300000},
-- 			{weapon = 'WEAPON_ASSAULTSMG', price = 450000},
-- 			{weapon = 'WEAPON_GUSENBERG', price = 350000},
-- 			{weapon = 'WEAPON_FLARE', price = 50000},
-- 			{weapon = 'WEAPON_BOTTLE', price = 50000},
-- 			{weapon = 'WEAPON_APPISTOL', price = 6000000},
-- 			},
-- 		reinado = {
-- 			{weapon = 'WEAPON_MACHINEPISTOL', price = 300000},
-- 			{weapon = 'WEAPON_ASSAULTSMG', price = 450000},
-- 			{weapon = 'WEAPON_GUSENBERG', price = 350000},
-- 			{weapon = 'WEAPON_FLARE', price = 50000},
-- 			{weapon = 'WEAPON_BOTTLE', price = 50000},
-- 			{weapon = 'WEAPON_APPISTOL', price = 6000000},
-- 			},
-- 		boss = { -- This weapon can be bought only of the boss of the current job
-- 			-- -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
-- 		}
-- 	},
-- }


Config.Jobs.mafia01 = {
    Zones = {
		armory = {
			Pos = vector3(1395.4574,1141.8029,-114.6407), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	 
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, -37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},			
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		{weapon = 'WEAPON_SMG',  price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia02 = {
    Zones = {
		armory = {
			Pos = vector3(976.7756, -103.5984, 74.8451), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(981.0060, -105.1017, 74.8487), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(983.8225, -110.4150, 74.2604), heading = 123.3874, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(983.8225, -110.4150, 73.2604),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'elegy', label = 'elegy',props = {plate = 'MAFIA01', modXenon = true}},
			{ model = 'dubsta2', label = 'dubsta2',props = {plate = 'MAFIA01', modXenon = true}},
			{ model = 'sunrise1', label = 'sunrise1',props = {plate = 'MAFIA01', modXenon = true}}
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		-- {weapon = 'WEAPON_SMG', price = 100000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		}
	},
}


Config.Jobs.mafia03 = {
    Zones = {
		armory = {
		
			Pos = vector3(-1943.1510, 449.6118, 102.9284), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-1943.2324, 443.8579, 102.7031), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-1937.9841, 459.1267, 102.5184), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-1948.9006, 461.0577, 101.8111), heading = 96.3993, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1948.9006, 461.0577, 100.9111),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
		VehicleDeletePoints = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-475.4622, 5988.6294, 31.3367),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
				Pos = vector3(-459.0649, 5986.4663, 31.3081),
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Aircrafts',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
					{coords = vector3( -475.4622, 5988.6294, 31.3367), heading = 301.6521, radius = 6.0}
				},
		},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'sunrise1', label = 'sunrise1',props = {plate = 'ARMA', modXenon = true}},
			{ model = 'Cypher', label = 'Cypher',props = {plate = 'ARMA', modXenon = true}},
			{ model = 'Elegy', label = 'Elegy',props = {plate = 'ARMA', modXenon = true}},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		--	{ model = 'Dubsta2', label = 'Dubsta2'}
		}
	},


	-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{model = 'buzzard2',label = 'buzzard2',props = {plate = 'ARMA', modXenon = true} },
			{model = 'supervolito2',label = 'supervolito2',props = {plate = 'ARMA', modXenon = true} },
			{model = 'maverick',label = 'maverick',props = {plate = 'ARMA', modXenon = true} },
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{model = 'maverick',label = 'maverick',props = {plate = 'ARMA', modXenon = true} },
			
			
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia04 = {
     Zones = {
		armory = {
			Pos = vector3(2639.2400, 4246.7734, 44.7715), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					-- {item = 'flashlight', price = 10000, label = 'Linterna'},
					-- {item = 'scope', price = 70000, label = 'Mira'},
					-- {item = 'grip', price = 150000, label = 'Grip'},
					-- {item = 'clip_extended', price = 100000, label = 'Cargador Extendido'},
					-- {item = 'suppressor', price = 200000, label = 'Silenciador'},
					-- {item = 'tint_gold', price = 250000, label = 'Pintura Dorada'},
					-- {item = 'attachment_remover', price = 1500, label = 'Removedor de Complementos'},
				},
				boss = { -- Only boss will see these items		
					-- -- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- -- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(2642.4441, 4249.8374, 44.7859), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(2646.5508, 4256.1084, 44.7765), heading = 306.7273, radius = 6.0}
				}
			},	
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(2646.5508, 4256.1084, 43.8765),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
	--[[	VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1544.6051, 847.8768, 180.9591),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-1535.9948, 851.7346, 181.7785),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-1544.6051, 847.8768, 181.9591), heading = 231.2892, radius = 6.0}
			}
		}, ]]
		
	},



	-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'dubsta2', label = 'dubsta2',props = {plate = 'MAFIA04', modXenon = true}},
			{ model = 'gauntlet4', label = 'gauntlet4',props = {plate = 'MAFIA04', modXenon = true}},
			{ model = 'M4COMP', label = 'M4COMP',props = {plate = 'MAFIA04', modXenon = true}},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank

		}
	},


	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
	-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{model = 'swift2',label = 'swift2',props = {plate = 'SQZ1', modXenon = true} },
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{model = 'swift2',label = 'swift2',props = {plate = 'SQZ1', modXenon = true} },
			
			
		}
	},
	
}

Config.Jobs.mafia05 = {
    Zones = {
		armory = {
			Pos = vector3(340.9055, -2710.18, 5.976562), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},
		
		Vehicles = {
				Pos = vector3(325.0813, -2724.185, 5.976562), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(317.5229, -2730.1553, 5.9876), heading = 102.0657, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(317.5229, -2730.1553, 4.9876),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		--[[ 
		
		 VehicleDeletePoint2 = { -- helicoptero
				Pos = vector3(293.8250, -2759.8755, 4.9999),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},

		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(305.4872, -2739.2625, 6.0833),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(293.8250, -2759.8755, 5.9999), heading = 97.5596, radius = 6.0}
				}
			},  ]]
		
	},
	


	-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'Neon', label = 'Neon',props = {plate = 'MAFIA05', modXenon = true}},
			{ model = 'demonhawk', label = 'demonhawk',props = {plate = 'MAFIA05', modXenon = true}},
			{ model = 'hakuchou', label = 'hakuchou',props = {plate = 'MAFIA05', modXenon = true}}
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		
		}
	},
	
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{
				model = 'swift2',
				label = 'swift2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'swift2',
				label = 'swift2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		}
	},
	
}


Config.Jobs.mafia06 = {
    Zones = {
		armory = {
			Pos = vector3(-1484.7688, -27.3683, 57.8917), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	
	
		Vehicles = {
				Pos = vector3(-1461.1931, -40.0319, 54.6815), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-1463.6962, -25.3659, 54.6476), heading = 53.5165, radius = 6.0}
				}
			},	
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1470.2500, -19.0974, 53.6472),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
			
			--[[
		VehicleDeletePoint = { -- helicoptero
				Pos = vector3(-354.9749, 29.6031, 47.7702),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},

			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-354.9749, 29.6031, 47.7702),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-354.9749, 29.6031, 46.7702), heading = 103.8362, radius = 6.0}
				}
			}, 
			]]
	},
	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'baller4', label = 'baller4', props = {plate = 'MAFIA06', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'nero2', label = 'nero2', props = {plate = 'MAFIA06', color1 = 1, color2 = 1} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA06', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia07 = {
    Zones = {
		armory = {
			Pos = vector3(3311.5554, 5176.1025, 19.6146), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- -- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- -- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

	Vehicles = {
				Pos = vector3(3323.1672, 5169.5938, 18.4152), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(3327.1389, 5150.8887, 18.3017), heading = 125.87, radius = 6.0}
				}
			},	
	VehicleDeletePoint = { 
				Pos = vector3(3327.1389, 5150.8887, 17.3017),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},			
	},
	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'contender', label = 'contender', props = {plate = 'MAFIA07', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'amarok', label = 'amarok', props = {plate = 'MAFIA07', color1 = 1, color2 = 1} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA07', color1 = 1, color2 = 1} },
		},
		boss = {}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia08 = {
    Zones = {
		armory = {
			Pos = vector3(58.8116, -98.3187, 58.2042), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

	Vehicles = {
				Pos = vector3(51.6102, -96.4993, 57.5019), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(50.8837, -104.2094, 56.1350), heading = 247.7842, radius = 6.0}
				}
			},	
	VehicleDeletePoint3 = { 
				Pos = vector3(50.8837, -104.2094, 55.2350),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},		
--[[
	VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1805.5690, 456.5367, 127.2840),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
	HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-1805.5690, 456.5367, 128.2840),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-1805.5690, 456.5367, 128.2840), heading = 231.2892, radius = 6.0}
				}
			}, 

]]
			
	},
	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA08', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'ignus', label = 'ignus', props = {plate = 'MAFIA08', color1 = 1, color2 = 1, modTransmission = 3} },
			 {model = 'hakuchou2 ', label = 'hakuchou2 ', props = {plate = 'MAFIA08', color1 = 1, color2 = 1, modTransmission = 3} },
		},
		boss = {}
	},
	
		-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},
	
	
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = {
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
	
	

}

-- desahabilitada 


Config.Jobs.mafia09 = {
    Zones = {
		armory = {
			Pos = vector3(979.8721, -715.8799, 58.0239), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},
		
		

		Vehicles = {
				Pos = vector3(984.1700, -713.8903, 57.8153), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(984.3446, -708.1044, 57.5319), heading = 312.0959, radius = 6.0}
				}
			},	

		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(984.3446, -708.1044, 56.6319),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},

--[[
	VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(986.6090, -712.0430, 57.1129),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
	HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(986.6090, -712.0430, 58.0129),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(986.6090, -712.0430, 58.0129), heading = 315.4587, radius = 6.0}
			}
		}, ]]			
			
			
	},
	

	AuthorizedVehicles = { 
		shared = { 
			{model = 'prototipo', label = 'prototipo', props = {plate = 'mafia09', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'kamacho', label = 'kamacho', props = {plate = 'mafia09', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'mafia09', color1 = 1, color2 = 1, modTransmission = 3} },
			
		},
		boss = {}
	},
	
	
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = {
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia10 = {
    Zones = {
		armory = {
			Pos = vector3(464.4222, 3565.4297, 33.2386), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(458.4777, 3566.5679, 33.2386), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(458.3778, 3573.6196, 33.2386), heading = 348.0915, radius = 6.0}
				}
			},	
			
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(458.3778, 3573.6196, 32.3386),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	

		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(438.4110, 3569.0251, 37.5074),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(456.3023, 3564.5620, 33.2386),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(438.4110, 3569.0251, 38.3074), heading = 828185, radius = 6.0}
				}
			},


	},

	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'f620', label = 'f620', props = {plate = 'MAFIA10', color1 = 1, color2 = 1, modTransmission = 3} },
			{ model = 'dominator3', label = 'dominator3', props = {plate = 'MAFIA10', color1 = 1, color2 = 1, modTransmission = 3} },
			{ model = 'demonhawk2', label = 'demonhawk2', props = {plate = 'MAFIA10', color1 = 1, color2 = 1, modTransmission = 3} },
			{ model = 'supervolito', label = 'supervolito', props = {plate = 'MAFIA10', color1 = 1, color2 = 1, modTransmission = 3} },
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank

		}
	},

	
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} }
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} }
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 8000},
			{weapon = 'WEAPON_BAT', price = 6000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
			{weapon = 'WEAPON_PISTOL_MK2', price = 85000},
			{weapon = 'WEAPON_SMG_MK2', price = 250000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job,
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia11 = {
    Zones = {
		armory = {
			Pos = vector3(-2789.6782, 1423.2118, 104.5144), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- -- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- -- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-2778.4275, 1432.7968, 100.9314), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-2777.7720, 1427.2335, 100.9284), heading = 316.9449, radius = 6.0}
				}
			},	
			
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-2777.7720, 1427.2335, 99.8284),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
		 VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-2808.2234, 1402.7390, 102.9703),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-2803.5823, 1408.9178, 104.0148),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-2808.2234, 1402.7390, 104.0703), heading = 228.9639, radius = 6.0}
			}
		},  
		
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'rmodx6', label = 'rmodx6', props = {plate = 'MAFIA11', color1 = 1, color2 = 1, modTransmission = 3}},
			{ model = 'coquette4', label = 'coquette4', props = {plate = 'MAFIA11', color1 = 1, color2 = 1, modTransmission = 3}},
			{ model = 'hakuchou2', label = 'hakuchou2', props = {plate = 'MAFIA11', color1 = 1, color2 = 1, modTransmission = 3}},
			 
			
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank

		}
	},

	

	AuthorizedAirCrafts = {
		shared = { -- These vehicles + Shared Vehicles will have Boss rank
		{
			model = 'Volatus',
			label = 'Volatus',
			props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
		} 
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'Volatus',
				label = 'Volatus',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			} 
		}
	},
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 8000},
			{weapon = 'WEAPON_BAT', price = 6000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
			{weapon = 'WEAPON_PISTOL_MK2', price = 85000},
			{weapon = 'WEAPON_SMG_MK2', price = 250000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia12 = {
    Zones = {
		armory = {
			Pos = vector3(-661.8445, 678.7078, 153.9106), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	 			

		Vehicles = {
				Pos = vector3(-662.8007, 671.8683, 150.4543), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-662.8007, 671.8683, 150.4543), heading = 300.2043, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { 
				Pos = vector3(-669.3260, 670.2618, 149.5673),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},
			
			
	},
	


	AuthorizedVehicles = { 
		shared = { 
			{model = 'demonhawk', label = 'demonhawk', props = {plate = 'MAFIA12', color1 = 1, color2 = 1, modTransmission = 3}},
			{model = 'hakuchou2', label = 'hakuchou2', props = {plate = 'MAFIA12', color1 = 1, color2 = 1, modTransmission = 3}},
			{model = 'Elegy', label = 'Elegy', props = {plate = 'MAFIA12', color1 = 1, color2 = 1, modTransmission = 3}},
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			 -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia13 = {
    Zones = {
		armory = {
			Pos = vector3(-1495.9999, 438.2805, 112.4978), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		}, 			

		Vehicles = {
				Pos = vector3(-1505.2920, 434.6835, 111.1406), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-1503.0776, 424.9479, 111.1056), heading = 42.9968, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { 
				Pos = vector3(-1503.0776, 424.9479, 111.1056),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},
--[[
	HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-1511.9010, 434.3978, 110.7594),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-1511.9010, 434.3978, 110.7594), heading = 110.4683, radius = 6.0}
			}
		},
			
	VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1511.9010, 434.3978, 109.7594),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
		},	 ]]
			
},
	
		AuthorizedVehicles = { 
		shared = { 
			{model = 'italirsx', label = 'italirsx', props = {plate = 'MAFIA13', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'pariah', label = 'pariah', props = {plate = 'MAFIA13', color1 = 1, color2 = 1, modTransmission = 3}  },
			{model = 'demonhawk', label = 'demonhawk', props = {plate = 'MAFIA13', color1 = 1, color2 = 1, modTransmission = 3}  },
			
		},
		boss = {}
	},
	
	--[[
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
					{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	}, ]]
	


	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia14 = {
    Zones = {
		armory = {
			Pos = vector3(-1570.4729, 23.6901, 59.5538), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(-1559.9739, 28.4678, 58.6300), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-1554.2998, 23.5632, 58.5835), heading = 347.7340, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { 
				Pos = vector3(-1554.2998, 23.5632, 57.5835),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},

			
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	
		AuthorizedVehicles = { 
		shared = { 
			{model = 'r1', label = 'r1', props = {plate = 'MAFIA14', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'Caracara2', label = 'Caracara2', props = {plate = 'MAFIA14', color1 = 1, color2 = 1} },
			{model = 'Komoda', label = 'Komoda', props = {plate = 'MAFIA14', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		 -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}





Config.Jobs.mafia15 = {
    Zones = {
		armory = {
			Pos = vector3(-57.9882, 982.3013, 234.5773), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	 
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


	Vehicles = {
				Pos = vector3(-115.3535, 988.6191, 235.7509), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-129.1884, 1002.1541, 235.7321), heading = 200.6955, radius = 6.0}
				}
			},	
	VehicleDeletePoint = { 
				Pos = vector3(-129.1884, 1002.1541, 234.6321),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},
		
	 HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-115.8970, 997.0341, 235.7802),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-117.2021, 1003.9738, 235.7566), heading = 110.4683, radius = 6.0}
			}
		}, 
			
	VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-117.2021, 1003.9738, 234.6566),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
		},
			
			
	},
	
	

	AuthorizedVehicles = { 
		shared = { 
			{model = 'krieger', label = 'krieger', props = {plate = 'MAFIA15', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'le7b', label = 'le7b', props = {plate = 'MAFIA15', color1 = 1, color2 = 1} },
			{model = 'dominator3', label = 'dominator3', props = {plate = 'MAFIA15', color1 = 1, color2 = 1} },
			{model = 'VELOCIRAPTOR', label = 'VELOCIRAPTOR', props = {plate = 'MAFIA15', color1 = 1, color2 = 1} },
			{model = 'dubsta3', label = 'dubsta3', props = {plate = 'MAFIA15', color1 = 1, color2 = 1} },
			{model = '208gti', label = '208gti', props = {plate = 'MAFIA15', color1 = 1, color2 = 1} },
			
		},
		boss = {}
	},
	
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
					{
				model = 'swift2',
				label = 'swift2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'swift2',
				label = 'swift2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	}, 
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = {
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
		{weapon = 'WEAPON_PISTOL_MK2', price = 85000},
		{weapon = 'WEAPON_SMG_MK2', price = 250000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		 -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia16 = {
    Zones = {
		armory = {
			Pos = vector3(-1549.3131, -88.9201, 54.9292), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					--[[ {item = 'flashlight', price = 10000, label = 'Linterna'},
					{item = 'scope', price = 70000, label = 'Mira'},
					{item = 'grip', price = 150000, label = 'Grip'},
					{item = 'clip_extended', price = 100000, label = 'Cargador Extendido'},
					{item = 'suppressor', price = 200000, label = 'Silenciador'},
					{item = 'tint_gold', price = 250000, label = 'Pintura Dorada'},
					{item = 'attachment_remover', price = 1500, label = 'Removedor de Complementos'}, ]]
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},			


	Vehicles = {
				Pos = vector3(-1542.2528, -86.2727, 54.3297), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-1541.9122, -75.9219, 53.0345), heading = 338.8918, radius = 6.0}
				}
			},	
	VehicleDeletePoint = { 
				Pos = vector3(-1541.9122, -75.9219, 54.1345),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},
			
			
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1566.6090, -82.2679, 53.0345),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-1556.5338, -86.0180, 54.3296),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-1566.6090, -82.2679, 54.1345), heading = 271.7032, radius = 6.0}
			}
		}, 

	},

	AuthorizedVehicles = { 
		shared = { 
			{model = 'toros', label = 'toros', props = {plate = 'MAFIA16', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'dubsta2', label = 'dubsta2', props = {plate = 'MAFIA16', color1 = 1, color2 = 1} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA16', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
					{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	}, 
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	

	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia17 = {
    Zones = {
		armory = {
			Pos = vector3(1399.7620, 1139.7090, 114.3357), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(1406.1729, 1107.6008, 114.8286), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(1413.2872, 1118.4406, 114.8395), heading = 88.5126, radius = 6.0}
				}
		},	
		VehicleDeletePoint2 = { 
				Pos = vector3(1413.2872, 1118.4406, 113.8395),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},	
		
		
		--[[ VehicleDeletePoint = { 
				Pos = vector3(1461.2029, 1112.3234, 113.4340),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(1440.0052, 1111.6785, 114.2079),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(1461.2029, 1112.3234, 114.3340), heading = 20.4059, radius = 6.0}
			}
		}, ]]

	},
	
		AuthorizedVehicles = { 
		shared = { 
			{model = 'schafter4', label = 'schafter4', props = {plate = 'MAFIA17', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'bati2', label = 'bati2', props = {plate = 'MAFIA17', color1 = 1, color2 = 1} },
			{model = 'bf400', label = 'bf400', props = {plate = 'MAFIA17', color1 = 1, color2 = 1} },
			{model = 'c63w205', label = 'c63w205', props = {plate = 'MAFIA17', color1 = 1, color2 = 1} },
			{model = 'gxg63', label = 'gxg63', props = {plate = 'MAFIA17', color1 = 1, color2 = 1} },
			{model = 'TRX', label = 'TRX', props = {plate = 'MAFIA17', color1 = 1, color2 = 1} },
			{model = 'Rmodx6', label = 'Rmodx6', props = {plate = 'MAFIA17', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	
	
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
					{ model = 'frogger', label = 'frogger',props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			-- {}
		}
	},
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia18 = {
    Zones = {
		armory = {
			Pos = vector3(-1995.2555, 300.4827, 91.9647), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		}, 	

		Vehicles = {
				Pos = vector3(-1996.7178, 295.5244, 91.7649), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-1990.3538, 292.1131, 91.7515), heading = 190.2065, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(-1990.3538, 292.1131, 90.6515),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},
		
			--[[
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-2001.7698, 337.7793, 90.1406),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-2008.5084, 330.7188, 91.3653),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-2001.7698, 337.7793, 91.2406), heading = 20.4059, radius = 6.0}
			}
		}, ]]
		
	},



	AuthorizedVehicles = { 
		shared = { 
			{model = 'growler', label = 'growler', props = {plate = 'MAFIA18', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'caracara2', label = 'caracara2', props = {plate = 'MAFIA18', color1 = 1, color2 = 1} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA18', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	

	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia19 = {
    Zones = {
		armory = {
			Pos = vector3(791.8401, 2176.7893, 52.6484), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
				},
				boss = { -- Only boss will see these items		
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		}, 	


		Vehicles = {
				Pos = vector3(787.2310, 2180.1897, 52.6484), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(795.9450, 2204.0454, 51.7453), heading = 66.6341, radius = 6.0}
				}
			},	
			
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(795.9450, 2204.0454, 50.9453),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
		--[[	
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-151.9033, 937.4122, 234.6255),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-151.4424, 924.7136, 235.6556),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-151.9033, 937.4122, 235.6255), heading = 224.4816, radius = 6.0}
			}
		}, ]]
		
	},
	
	

	AuthorizedVehicles = { 
		shared = { 
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA19', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'neon', label = 'neon', props = {plate = 'MAFIA19', color1 = 1, color2 = 1} },
			{model = 'bf400', label = 'bf400', props = {plate = 'MAFIA19', color1 = 1, color2 = 1} },
			
			
		},
		boss = {}
	},	
	
		-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia20 = {
    Zones = {
		armory = {
			Pos = vector3(-655.4249, 803.9020, 198.9916), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(-658.9291, 804.1576, 199.0107), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-661.4520, 809.2892, 199.6009), heading = 35.8999, radius = 6.0}
				}
		},	
		VehicleDeletePoint2 = { 
				Pos = vector3(-661.4520, 809.2892, 199.6009),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},			
	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'kuruma', label = 'kuruma', props = {plate = 'MAFIA20', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'demonhawk', label = 'demonhawk', props = {plate = 'MAFIA20', color1 = 1, color2 = 1} },
			{model = 'sultan', label = 'sultan', props = {plate = 'MAFIA20', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 15000},
			{weapon = 'WEAPON_BAT', price = 16000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia21 = {
    Zones = {
		armory = {
			Pos = vector3(-476.9069, 648.3465, 144.3866), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					-- {item = 'flashlight', price = 100000, label = 'Linterna'},
					-- {item = 'scope', price = 120000, label = 'Mira'},
					-- {item = 'grip', price = 150000, label = 'Grip'},
					-- {item = 'clip_extended', price = 100000, label = 'Cargador Extendido'},
					-- {item = 'suppressor', price = 200000, label = 'Silenciador'},
					-- {item = 'tint_gold', price = 250000, label = 'Pintura Dorada'},
					-- {item = 'attachment_remover', price = 1500, label = 'Removedor de Complementos'},
				},
				boss = { -- Only boss will see these items		
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-461.6484, 635.2458, 144.1842), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-462.3941, 641.8748, 144.1885), heading = 45.6516, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-462.3941, 641.8748, 143.2885),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			--[[
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(4903.1948, -5744.4458, 25.3235),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(4903.1948, -5744.4458, 26.3235),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(4903.1948, -5744.4458, 26.3235), heading = 313.4759, radius = 6.0}
				}
			},
			]]
			
	
	},
	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'dubsta2', label = 'dubsta2', props = {plate = 'Mafia21', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'gauntlet4', label = 'gauntlet4', props = {plate = 'Mafia21', color1 = 1, color2 = 1} },
			{model = 'SCIJO', label = 'SCIJO', props = {plate = 'Mafia21', color1 = 1, color2 = 1} },
			
		},
		
			boss = {}
	
	},
	
	

	-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} },
			{ model = 'swift2',	label = 'swift2',	props = {plate = 'SQZ1', modXenon = true} },
			
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} },
			{ model = 'swift2',	label = 'swift2',	props = {plate = 'SQZ1', modXenon = true} },
		}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = {
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}




Config.Jobs.mafia22 = {
    Zones = {
		armory = {
			Pos = vector3(1385.7408, -593.0104, 74.4855), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(1379.1329, -591.7606, 74.3395), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(1379.4541, -597.2366, 74.3379), heading = 54.2226, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(1379.4541, -597.2366, 73.2379),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},
	--[[	VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(1369.3000, -638.1284, 73.3379),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
		},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(1373.9767, -625.2514, 74.3379),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(1369.3000, -638.1284, 74.3379), heading = 135.3417, radius = 6.0}
				}
		}, ]]
	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'veto2', label = 'veto2', props = {plate = 'Mafia22', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'openwheel1', label = 'openwheel1', props = {plate = 'Mafia22', color1 = 1, color2 = 1} },
			{model = 'FPACEHM', label = 'FPACEHM', props = {plate = 'Mafia22', color1 = 1, color2 = 1} },
		},
		boss = {}
	},

	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} }
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} }
		}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 8000},
			{weapon = 'WEAPON_BAT', price = 6000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 8000000}
		}
	},
}

Config.Jobs.mafia23 = {
    Zones = {
		armory = {
			Pos = vector3(967.9433, -1828.5635, 31.2397), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(971.5672, -1829.4071, 31.2784), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(976.4907, -1826.2804, 31.1560), heading = 356.1632, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(976.4907, -1826.2804, 30.0560),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},			
	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'tailgater2', label = 'tailgater2', props = {plate = 'MAFIA23', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'Sanchez', label = 'Sanchez', props = {plate = 'MAFIA23', color1 = 1, color2 = 1} },
			{model = 'Hilux', label = 'Hilux', props = {plate = 'MAFIA23', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		-- {weapon = 'WEAPON_SMG', price = 100000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		--	-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia24 = {
    Zones = {
		armory = {
			Pos = vector3(2178.4309, 3497.2700, 45.3823), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(2181.4045, 3503.8337, 45.3698), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(2171.6277, 3508.1455, 45.4953), heading = 61.9711, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(2171.6277, 3508.1455, 44.4953),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},		


		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(2176.9001, 3515.7417, 44.4092),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(2184.2581, 3507.1406, 45.2350),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(2176.9001, 3515.7417, 45.4092), heading = 58.2471, radius = 6.0}
				}
			},
			
	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'caracara2', label = 'Caracara2', props = {plate = 'MAFIA24', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'dubsta3', label = 'Dubsta3', props = {plate = 'MAFIA24', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'mesa3', label = 'Mesa3', props = {plate = 'MAFIA24', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'fiat600', label = 'fiat600', props = {plate = 'MAFIA24', color1 = 1, color2 = 1, modTransmission = 3} },
		},
		boss = {}
	},
	
	


	-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} },
			{ model = 'swift2',	label = 'swift2',	props = {plate = 'SQZ1', modXenon = true} },
			
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} },
			{ model = 'swift2',	label = 'swift2',	props = {plate = 'SQZ1', modXenon = true} },
		}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	

	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
		{weapon = 'WEAPON_PISTOL_MK2', price = 85000},
		{weapon = 'WEAPON_SMG_MK2', price = 250000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia25 = {
    Zones = {
		armory = {
			Pos = vector3(866.6473, 2876.8972, 56.9468), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					
				},
				boss = { -- Only boss will see these items		
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(862.4611, 2877.3538, 57.9826), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(871.9778, 2857.0962, 56.8718), heading = 200.0287, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(871.9778, 2857.0962, 55.8718),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},	
			
	},

	AuthorizedVehicles = { 
		shared = { 
			{model = 'Coquette4', label = 'Coquette4', props = {plate = 'MAFIA25', color1 = 1, color2 = 1, modTransmission = 1} },
			{model = 'Toros', label = 'Toros', props = {plate = 'MAFIA25', color1 = 1, color2 = 1} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA25', color1 = 1, color2 = 1} },  
			
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 8000},
			{weapon = 'WEAPON_BAT', price = 6000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia26 = {
    Zones = {
		armory = {
			Pos = vector3(-806.3008, 790.8665, 202.1871), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(-814.1809, 803.3094, 202.1859), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-812.2614, 807.1960, 202.1316), heading = 17.7889, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(-812.2614, 807.1960, 201.2316),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},	


			
	},



	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA26', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'dubsta3', label = 'dubsta3', props = {plate = 'MAFIA26', color1 = 1, color2 = 1} },
			{model = 'dominator3', label = 'dominator3', props = {plate = 'MAFIA26', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia27 = {
    Zones = {
		armory = {
			Pos = vector3(231.7807, 672.3538, 189.9456), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 60000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	

		Vehicles = {
				Pos = vector3(231.4577, 678.0688, 189.6842), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(224.3369, 680.1456, 189.3819), heading = 104.3059, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(224.3369, 680.1456, 188.3819),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},
	--[[	VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(153.5387, 686.5007, 208.8111),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(160.4952, 675.0886, 207.2556),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(153.5387, 686.5007, 207.8111), heading = 35.8484, radius = 6.0}
				}
			}, ]]
	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'dubsta3', label = 'dubsta3', props = {plate = 'Bahamas', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'Bahamas', color1 = 1, color2 = 1} },
			{model = 'prototipo', label = 'prototipo', props = {plate = 'Bahamas', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger', label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} }
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger', label = 'Frogger', props = {plate = 'SQZ1', modXenon = true} }
		}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = true, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 8000},
			{weapon = 'WEAPON_BAT', price = 6000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SMG', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		 -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia28 = {
    Zones = {
		armory = {
			Pos = vector3(2418.8142, 4020.5774, 36.8340), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(2417.3833, 4015.6443, 36.8438), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(2426.1536, 4010.2046, 36.6771), heading = 247.0020, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(2426.1536, 4010.2046, 35.7771),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},		

--[[
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-870.4384, -47.9181, 37.4224),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-877.1218, -52.6516, 38.1091),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-870.4384, -47.9181, 38.4224), heading = 56.2981, radius = 6.0}
				}
			},		 ]]
	},

	AuthorizedVehicles = { 
		shared = { 
			{model = 'hilux', label = 'hilux', props = {plate = 'MAFIA', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'dubsta3', label = 'Sanchez', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{model = 'tyrant', label = 'tyrant', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
		-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} }
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} }
		}
	},
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		--	-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia29 = {
    Zones = {
		armory = {
			Pos = vector3(-1474.1863, 506.5647, 117.6033), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
			--		-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(-1470.6210, 509.9783, 117.6425), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-1472.3994, 514.9321, 117.8936), heading = 23.5868, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(-1472.3994, 514.9321, 116.7936),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},		
		--[[

		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1481.3451, 496.0918, 116.1804),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-1472.6730, 501.7632, 117.5965),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-1481.3451, 496.0918, 117.1804), heading = 187.9899, radius = 6.0}
			}
		}, 
		]]

	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'sultanrs', label = 'sultanrs', props = {plate = 'MAFIA29', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'Dubsta3', label = 'Dubsta3', props = {plate = 'MAFIA29', color1 = 1, color2 = 1} },
			{model = 'italirsx', label = 'italirsx', props = {plate = 'MAFIA29', color1 = 1, color2 = 1} },
			{model = 'sclkuz', label = 'sclkuz', props = {plate = 'MAFIA29', color1 = 1, color2 = 1} },
			{model = 'Sunrise1', label = 'Sunrise1', props = {plate = 'MAFIA29', color1 = 1, color2 = 1} },
			
		},
		boss = {}
	},
	
	
		-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'supervolito2',
				label = 'supervolito2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	}, 
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.mafia30 = {
    Zones = {
		armory = {
			Pos = vector3(-1088.5288, -1672.2648, 4.6997), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(-1076.0254, -1670.5598, 4.4305), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-1070.5728, -1670.6700, 4.4473), heading = 41.0818, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(-1070.5728, -1670.6700, 4.4473),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},		

	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'dubsta3', label = 'dubsta3', props = {color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'sunrise1', label = 'sunrise1', props = {color1 = 1, color2 = 1} },
			{model = 'bf400', label = 'bf400', props = {color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
					{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank

		}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_PISTOL50', price = 70000},
		}
	},
}



Config.Jobs.mafia31 = {
    Zones = {
		armory = {
			Pos = vector3(-902.5157, 191.4184, 69.4460), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(-905.5119, 195.4535, 69.5016), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-910.6731, 189.4037, 69.4430), heading = 178.7514, radius = 6.0}
				}
		},	
		VehicleDeletePoint = { 
				Pos = vector3(-910.6731, 189.4037, 69.4430),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
		},			
	},


	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'zr350', label = 'zr350', props = {plate = 'MAFIA31', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'sunrise1', label = 'sunrise1', props = {plate = 'MAFIA31', color1 = 1, color2 = 1} },
			{model = 'jester4', label = 'jester4', props = {plate = 'MAFIA31', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_PISTOL50', price = 70000},
		}
	},
}


Config.Jobs.mafia32 = {
    Zones = {
		armory = {
			Pos = vector3(-1876.5247, 2062.5544, 145.5739), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	


		Vehicles = {
				Pos = vector3(-1896.46, 2052.62, 140.93), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-1922.31, 2044.56, 140.73), heading = 257.67, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1922.31, 2044.56, 139.76),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
			
		 VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1913.0299, 2043.6008, 139.5369),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-1928.7236, 2059.7671, 140.8370),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-1913.0299, 2043.6008, 140.7369), heading = 181.9582, radius = 6.0}
				}
			}, 


		
	},
	
	AuthorizedVehicles = { 
		shared = { 
			{model = 'sclkuz', label = 'sclkuz', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{model = 'Tampa2', label = 'Tampa2', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{model = 'italirsx', label = 'italirsx', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
		},
		boss = {}
	},	
	
		-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{
				model = 'swift2',
				label = 'swift2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			},
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'volatus',
				label = 'volatus',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	}, 
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 

		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		{weapon = 'WEAPON_PISTOL_MK2', price = 85000},
		{weapon = 'WEAPON_SMG_MK2', price = 250000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		}
	},
}

Config.Jobs.mafia33 = {
    Zones = {
		armory = {
		
			Pos = vector3(2728.0986, 4142.1406, 44.2880), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(2724.9751, 4146.6289, 43.8382), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(2717.0642, 4141.1040, 43.9805), heading = 86.6154, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(2717.0642, 4141.1040, 42.9805),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'sunrise1', label = 'sunrise1'},
			{ model = 'Caracara2', label = 'Caracara2'},
			{ model = 'Komoda', label = 'Komoda'}
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			 -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia34 = {
    Zones = {
		armory = {
		
			Pos = vector3(-77.6714, 364.1959, 112.4415), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-78.8058, 366.9763, 112.4582), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-84.4209, 362.3010, 112.4582), heading = 242.5230, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-84.4209, 362.3010, 111.3582),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'sunrise1', label = 'sunrise1'},
			{ model = 'Everon', label = 'Everon'},
			{ model = 'Ninef', label = 'Ninef'}
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 15000},
			{weapon = 'WEAPON_BAT', price = 16000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			{weapon = 'WEAPON_PISTOL50', price = 70000},
		}
	},
}


Config.Jobs.mafia35 = {
    Zones = {
		armory = {
			Pos = vector3(1272.1672, -1712.2626, 54.7714), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(1278.2158, -1723.2301, 54.6550), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(1281.2178, -1731.7109, 52.6737), heading = 111.8909, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(1281.2178, -1731.7109, 51.6737),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
			
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'sunrise1', label = 'sunrise1'},
			{ model = 'baller4', label = 'baller4'},
			{ model = 'raiden', label = 'raiden'},
			
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = {
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		 -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia36 = {
    Zones = {
		armory = {
		
			Pos = vector3(-1277.3862, 497.2287, 97.8904), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-1273.6479, 501.3501, 97.4758), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-1270.7078, 507.8190, 97.2642), heading = 173.5790, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1270.7078, 507.8190, 96.1642),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'demonhawk', label = 'demonhawk'},
			{ model = 'krieger', label = 'krieger'},
			{ model = 'caracara2', label = 'caracara2'}
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		 -- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia37 = {
    Zones = {
		armory = {
		
			Pos = vector3(737.6837, -1077.9343, 22.1687), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(731.9291, -1089.0193, 22.1690), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(716.3353, -1087.6183, 22.3511), heading = 73.6968, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(716.3353, -1087.6183, 21.3511),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'Contender', label = 'Contender'},
			{ model = 'r1', label = 'r1'},
			{ model = 'Sanchez', label = 'Sanchez'}
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 8000},
			{weapon = 'WEAPON_BAT', price = 6000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia38 = {
    Zones = {
		armory = {
		
			Pos = vector3(9.4059, 528.9142, 170.6350), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'}, 
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(12.1260, 542.7311, 175.9010), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(14.1951, 548.4592, 176.1799), heading = 105.3325, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(14.1951, 548.4592, 175.1799),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'toros', label = 'toros'},
			{ model = 'caracara2', label = 'caracara2'},
			{ model = 'sunrise1', label = 'sunrise1'}
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.mafia39 = {
    Zones = {
		armory = {
			Pos = vector3(-3219.2473, 811.0178, 8.9475), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
					-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
					-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	
	Vehicles = {
				Pos = vector3(-3202.2676, 828.3107, 8.9309), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36, Type = 'Vehicles',
				SpawnPoints = { 
					{coords = vector3(-3213.9519, 832.8899, 8.9309), heading = 230.4949, radius = 6.0}
				}
			},	
	VehicleDeletePoint = { 
				Pos = vector3(-3213.9519, 832.8899, 7.9309),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1, Type = 'VehicleDeleter',
			},
	},

	AuthorizedVehicles = { 
		shared = { 
			{model = 'zentorno', label = 'zentorno', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{model = 'Toros', label = 'Toros', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{ model = 'chiron110', label = 'chiron110'},
		},
		boss = {}
	},
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
					{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'frogger',
				label = 'frogger',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},
	

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = true, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	

	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		-- {weapon = 'WEAPON_SNIPERRIFLE', price = 8000000}
		}
	},
}




Config.Jobs.mafia40 = {
    Zones = {
		armory = {
		
			Pos = vector3(-537.1243, 508.1190, 112.4440), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-527.0569, 524.2194, 112.2855), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-528.2350, 530.3088, 111.7042), heading = 44.3309, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-528.2350, 530.3088, 110.7042),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'elegy2', label = 'elegy2'},
			{ model = 'reaper', label = 'reaper'},
			{ model = 'sunrise1', label = 'sunrise1'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},


	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
					{
				model = 'swift2',
				label = 'swift2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{
				model = 'swift2',
				label = 'swift2',
				props = {plate = 'SQZ1', modXenon = true} -- Here you can add all vehicle mods you want, documentation can be found here: https://esx-framework.github.io/es_extended/client/functions/game/setvehicleproperties/#valid-table-content
			}
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia41 = {
    Zones = {
		armory = {
		
			Pos = vector3(-718.1573, 449.7312, 106.9091), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-732.1489, 443.7228, 106.9035), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-736.9631, 446.8785, 106.7093), heading = 9.0397, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-736.9631, 446.8785, 105.7093),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'M5TOURING2NCS', label = 'M5TOURING2NCS'},
			{ model = 'velociraptor', label = 'velociraptor'},
			{ model = 'Hilux', label = 'Hilux'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia42 = {
    Zones = {
		armory = {
		
			Pos = vector3(-658.8210, 887.3315, 229.2489), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-662.7235, 893.9682, 229.248), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-667.8553, 910.0596, 230.0033), heading = 66.0458, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-667.8553, 910.0596, 229.2033),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'adder', label = 'adder'},
			{ model = 'toros', label = 'toros'},
			{ model = 'hakuchou2', label = 'hakuchou2'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_PISTOL50', price = 70000},
		}
	},
}



Config.Jobs.mafia43 = {
    Zones = {
		armory = {
		
			Pos = vector3(315.9326, 501.8443, 153.1798), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(314.8615, 497.4137, 153.0920), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(320.7640, 496.0123, 152.4827), heading = 275.1147, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(320.7640, 496.0123, 151.4827),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'Everon', label = 'Everon'},
			{ model = 'sugoi', label = 'sugoi'},
			{ model = 'sunrise1', label = 'sunrise1'},
			
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 8000},
			{weapon = 'WEAPON_BAT', price = 6000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia44 = {
    Zones = {
		armory = {
		
			Pos = vector3(3310.7588, 5176.3574, 19.6146), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(3322.6338, 5168.4150, 18.4362), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(3325.5037, 5151.9014, 18.2895), heading = 115.1938, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(3325.5037, 5151.9014, 17.2895),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'Tezeract', label = 'Tezeract'},
			{ model = 'Krieger', label = 'Krieger'},
			{ model = 'Velociraptor', label = 'Velociraptor'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		--	-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia45 = {
    Zones = {
		armory = {
		
			Pos = vector3(-1051.9702, 431.4926, 77.0636), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-1063.2793, 437.1381, 73.8637), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-1068.9261, 437.7918, 73.7374), heading = 42.1082, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1068.9261, 437.7918, 72.7374),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
		{ model = 'amarok', label = 'amarok'},
		{ model = 'prototipo', label = 'prototipo'},
		{ model = 'sunrise1', label = 'sunrise1'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia46 = {
    Zones = {
		armory = {
		
			Pos = vector3(-1957.9961, -538.4974, 11.8994), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-1961.7184, -545.5482, 11.8096), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-1973.8153, -546.7212, 11.682), heading = 45.6911, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1973.8153, -546.7212, 10.682),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'sunrise1', label = 'sunrise1'},
			{ model = 'schafter6', label = 'schafter6'},
			{ model = 'sugoi', label = 'sugoi'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
			{weapon = 'WEAPON_KNIFE', price = 15000},
			{weapon = 'WEAPON_BAT', price = 16000},
			{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
			{weapon = 'WEAPON_MINISMG', price = 60000},
			{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
			{weapon = 'WEAPON_PISTOL', price = 40000},
			{weapon = 'WEAPON_PISTOL50', price = 70000},
			{weapon = 'WEAPON_MICROSMG', price = 80000},
			-- {weapon = 'WEAPON_SMG', price = 100000},
			-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia47 = {
    Zones = {
		armory = {
		
			Pos = vector3(1029.6577, -409.5511, 65.9493), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(1019.6212, -415.4936, 65.9451), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(1025.2076, -421.4648, 65.5337), heading = 220.4484, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(1025.2076, -421.4648, 64.6337),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'dominator6', label = 'dominator6'},
			{ model = 'dubsta3', label = 'dubsta3'},
			{ model = 'comet2', label = 'comet2'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		{weapon = 'WEAPON_BAT', price = 16000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia48 = {
    Zones = {
		armory = {
		
			Pos = vector3(-1910.6592, 128.4927, 82.4507), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-1883.1503, 124.6034, 81.7646), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-1888.5994, 122.4357, 81.6946), heading = 347.7006, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-1887.5994, 123.4357, 81.6946),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'visione', label = 'visione'},
			{ model = 'bf400', label = 'bf400'},
			{ model = 'dubsta3', label = 'dubsta3'},
			{ model = 'GXG63', label = 'GXG63'},
			{ model = 'e53', label = 'e53'},
			
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},

		-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} }
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} }
		}
	},
	


	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000},
		{weapon = 'WEAPON_PISTOL_MK2', price = 85000},
		{weapon = 'WEAPON_SMG_MK2', price = 250000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia49 = {
    Zones = {
		armory = {
		
			Pos = vector3(-214.3366, 400.3944, 111.1083), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-200.6340, 405.8132, 110.9106), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-200.9923, 411.1820, 110.3439), heading = 340.1970, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-200.9923, 411.1820, 109.3439),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'sunrise1', label = 'sunrise1'},
			{ model = 'Cypher', label = 'Cypher'},
			{ model = 'Elegy', label = 'Elegy'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.mafia50 = {
    Zones = {
		armory = {
		
			Pos = vector3(-126.5877, 589.3262, 204.5180), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-538.8318, -205.5636, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-137.0094, 593.8889, 204.5255), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-146.0060, 602.1620, 203.5446), heading = 261.5718, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-146.0060, 602.1620, 202.6446),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
		-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'cypher', label = 'cypher'},
			{ model = 'jester4', label = 'jester4'},
			{ model = 'audsq517', label = 'audsq517'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},



	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 8000},
		{weapon = 'WEAPON_BAT', price = 6000},
		{weapon = 'WEAPON_DOUBLEACTION', price = 30000},
		{weapon = 'WEAPON_MINISMG', price = 60000},
		{weapon = 'WEAPON_DBSHOTGUN', price = 60000},
		{weapon = 'WEAPON_PISTOL', price = 40000},
		{weapon = 'WEAPON_PISTOL50', price = 70000},
		{weapon = 'WEAPON_MICROSMG', price = 80000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		-- {weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 150000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.militar = {
     Zones = {
		armory = {
			Pos = vector3{-2420.54, 3271.88, 32.98}, -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
				},
				boss = { -- Only boss will see these items		
				--	{item = 'cuffs', price = 200, label = 'Esposas'},
				},
			},
		},
			  	
		Cloakroom = {
				Pos = vector3(-2417.2434, 3268.8154, 32.9779), -- This is the place where you can change your saved clothes (you have to buy then in clotheshop)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'Cloakroom',
		},
		
		BossActions = {
				Pos = vector3(-2390.1123, 3287.4424, 32.9778), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(-2425.56, 3274.32, 32.98), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-2419.31, 3288.25, 32.83), heading = 232.51, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-2419.31, 3288.25, 31.83),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-2401.83, 3310.98, 31.83),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(-2410.18, 3267.61, 32.98),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(-2401.83, 3310.98, 32.83), heading = 240.19, radius = 6.0}
			}
		},
		
	},


	DefaultClothes = {
		ReloadSkin = 'Ropa Default', -- Set to false to disallow changing clothes to previous one
		["Ropa Militar"] = {
			JobGrades = 'all', -- You can set it to all to make it available to all the job grades

			male = { -- Set the clothes for male peds
				tshirt_1 = 57,  tshirt_2 = 0, -- You can remove or add any lines,
				torso_1 = 218,   torso_2 = 0, -- That your skinchanger script supports
				decals_1 = 0,   decals_2 = 0,
				arms = 59,
				pants_1 = 31,   pants_2 = 0,
				shoes_1 = 53,   shoes_2 = 0,
				helmet_1 = 5,  helmet_2 = 0,
				mask_1 = 130,     mask_2 = 1
			},
			female = { -- Set the clothes for female peds
				tshirt_1 = 0,  tshirt_2 = 0,
				torso_1 = 0,   torso_2 = 0,
				decals_1 = 0,   decals_2 = 0,
				arms = 0,
				pants_1 = 0,   pants_2 = 0,
				shoes_1 = 0,   shoes_2 = 0,
				helmet_1 = 1,  helmet_2 = 0,
				chain_1 = 0,    chain_2 = 0,
				ears_1 = 0,     ears_2 = 0
			}

		}
	},

	-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'africat', label = 'africat'},
			{ model = 'barracks', label = 'barracks'},
			{ model = 'barracks3', label = 'barracks3'},
			{ model = 'crusader', label = 'crusader'},
			{ model = 'vetir', label = 'vetir'},
			{ model = 'h6', label = 'h6'},
			{ model = '17cheyenne', label = '17cheyenne'},
			-- { model = 'dune3', label = 'dune3'},
			{ model = 'mesa3', label = 'mesa3'},
			{ model = 'winky', label = 'winky'},
			{ model = 'squaddie', label = 'squaddie'},
			{ model = 'sprintermilitar', label = 'sprintermilitar'},
			-- { model = 'unarmwl', label = 'unarmwl'},
			{ model = 'unarm', label = 'unarm'},
			-- { model = 'm3', label = 'm3'},
			 
			
		},
		teniente = {
		--	{ model = 'mocpacker', label = 'mocpacker'},
		},
		tenientepr = {
		--	{ model = 'mocpacker', label = 'mocpacker'},
		},
		capitan = {
		--	{ model = 'mocpacker', label = 'mocpacker'},
		},
		mayor = {
		--	{ model = 'mocpacker', label = 'mocpacker'},
		},
		coronel = {
		--	{ model = 'mocpacker', label = 'mocpacker'},
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		--	{ model = 'zhaba', label = 'zhaba', props = {plate = 'SQZ', modXenon = false} },
		--	{ model = 'mocpacker', label = 'mocpacker'},
		}
	},


	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = true, -- This allows vehicle interaction in F6 menu
		CanRevive = true, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = true, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_NIGHTSTICK', price = 5000},
		{weapon = 'WEAPON_STUNGUN', price = 5000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 5000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 70000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 200000},
		-- {weapon = 'WEAPON_SMG', price = 100000},
		{weapon = 'WEAPON_COMBATPDW' ,price = 90000},
		{weapon = 'WEAPON_SPECIALCARBINE', price = 150000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 300000}
		
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
	-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} },
			{ model = 'mh60l',	label = 'mh60l',	props = {plate = 'SQZ1', modXenon = true} },
			
			
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} }
		}
	},
	
}


Config.Jobs.fbi = {
     Zones = {
		armory = {
			Pos = vector3{2517.9971, -355.5972, 94.1359}, -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
					{item = 'pistolclip', price = 500, label = 'Cargadores Pistol'},
					{item = 'smgclip', price = 600, label = 'Cargadores SMG'},
					{item = 'rifleclip', price = 800, label = 'Cargadores Rifles'},
					{item = 'shotgunclip', price = 900, label = 'Cargadores Rifles'},
					{item = 'suppressor', price = 25000, label = 'Silenciador'},
					{item = 'flashlight', price = 25000, label = 'Linterna'},
					-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesado'},
					{item = 'bandage', price = 800, label = 'Vendajes'},
					{item = 'cuffs', price = 200, label = 'Esposas'},
				},
				boss = { -- Only boss will see these items		
				--	{item = 'cuffs', price = 200, label = 'Esposas'},
				},
			},
		},
			  	
		Cloakroom = {
				Pos = vector3(2513.7314, -345.5471, 101.8934), -- This is the place where you can change your saved clothes (you have to buy then in clotheshop)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'Cloakroom',
		},
		
		BossActions = {
				Pos = vector3(-539.1142, -205.4505, 37.6498), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},

		Vehicles = {
				Pos = vector3(2520.3999, -361.0620, 94.1200), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(2524.1150, -376.9779, 92.9934), heading = 182.7049, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(2524.1150, -376.9779, 92.0934),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		VehicleDeletePoint2 = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(2512.3557, -341.9602, 117.1854),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},			
		HeliSpawn = { -- This is marker which opens you menu where you choose which plane you want to spawn.
			Pos = vector3(2504.8662, -340.1387, 118.0234),
			Size = {x = 0.7, y = 0.7, z = 0.7},
			Color = {r = 204, g = 204, b = 0},
			Marker = 36,
			Type = 'Aircrafts',
			SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want, smae as vehicles
				{coords = vector3(2512.3557, -341.9602, 118.1854), heading = 328.6025, radius = 6.0}
			} 
		},
		
	},


	DefaultClothes = {
		ReloadSkin = 'Default clothes', -- Set to false to disallow changing clothes to previous one
		["Ropa FBI"] = {
			JobGrades = 'all', -- You can set it to all to make it available to all the job grades

			male = { 
				tshirt_1 = 55, tshirt_2 = 0,
				torso_1 = 5,   torso_2 = 1,
				decals_1 = 0,   decals_2 = 0,
				arms = 19,
				pants_1 = 9,  pants_2 = 1,
				shoes_1 = 25,   shoes_2 = 0,
				helmet_1 = -1,  helmet_2 = 0,
				chain_1 = 0,    chain_2 = 0,
				ears_1 = 0,     ears_2 = 0,
				mask_1 = 0,  mask_2 = 0,
			bproof_1 = 12,  bproof_2 = 2
			},
			female = { -- Set the clothes for female peds
				tshirt_1 = 0,  tshirt_2 = 0,
				torso_1 = 0,   torso_2 = 0,
				decals_1 = 0,   decals_2 = 0,
				arms = 0,
				pants_1 = 0,   pants_2 = 0,
				shoes_1 = 0,   shoes_2 = 0,
				helmet_1 = 1,  helmet_2 = 0,
				chain_1 = 0,    chain_2 = 0,
				ears_1 = 0,     ears_2 = 0
			}

		}
	},

	-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'motofbi', label = 'motofbi'},
			{ model = 'C63W205', label = 'C63W205'},
			{ model = 'carfbi', label = 'carfbi'},
			{ model = 'fbiraptor', label = 'fbiraptor'},
			{ model = 'bfbi', label = 'bfbi'},
			{ model = 'Sclkuzv3', label = 'Blindado Nuevo!'}
			
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		--	{ model = 'zhaba', label = 'zhaba', props = {plate = 'SQZ', modXenon = false} }
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = true, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_COMBATPDW', price = 20000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 100000},
        {weapon = 'WEAPON_SPECIALCARBINE', price = 150000},
        {weapon = 'WEAPON_ADVANCEDRIFLE', price = 200000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 200000},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 100000}, 
		
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		--	-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
	-- End of authorized Weapons and Start of authorized AirCrafts
	AuthorizedAirCrafts = {
		shared = { -- These vehicles will have in garage every job rank
			{ model = 'frogger',	label = 'Frogger',	props = {plate = 'SQZ1', modXenon = true} }
		}, -- These are empty, so you need to define for each rank or simply add vehicles to shared
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
			{ model = 'frogger',	label = 'Frogger',		props = {plate = 'SQZ1', modXenon = true} }
		}
	},
}

Config.Jobs.casino = {
    Zones = {
		armory = {
			Pos = vector3(986.4254, 68.5694, 78.4761), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
				--	{item = 'clip', price = 500, label = 'Cargadores'},
				--	-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
				--	{item = 'cuffs', price = 200, label = 'Esposas'},
				--	{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		
		BossActions = {
				Pos = vector3(959.4801, 71.6964, 112.5546), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	
			
	},

	AuthorizedVehicles = { 
		shared = { 
			{model = 'hilux', label = 'Hilux', props = {plate = 'MAFIA', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'mvso', label = 'Agusta Brutale', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = false, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = false, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = true, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}



Config.Jobs.jobale = {
    Zones = {
		armory = {
			Pos = vector3(-1564.9160, 420.1013, 109.6607), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
				--	{item = 'clip', price = 500, label = 'Cargadores'},
				--	-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
				--	{item = 'cuffs', price = 200, label = 'Esposas'},
				--	{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(959.4801, 71.6964, 112.5546), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	
			
	},

	AuthorizedVehicles = { 
		shared = { 
		--	{model = 'hilux', label = 'Hilux', props = {plate = 'MAFIA', color1 = 1, color2 = 1, modTransmission = 3} },
		--	{model = 'mvso', label = 'Agusta Brutale', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
		},
		boss = {}
	},
	
	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = false, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = true, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		-- {weapon = 'WEAPON_KNIFE', price = 15000},
		},
		boss = { -- This weapon can be bought only of the boss of the current job
		--	-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}

Config.Jobs.fiscalia = {
    Zones = {
		armory = {
			Pos = vector3(-556.0677, -185.3546, 38.2211), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
				--	{item = 'clip', price = 500, label = 'Cargadores'},
				--	-- {item = 'nb-armourhigh', price = 10000, label = 'Chaleco Pesasdo'},
				--	{item = 'cuffs', price = 200, label = 'Esposas'},
				--	{item = 'bandage', price = 800, label = 'Vendajes'},
				},
				boss = { -- Only boss will see these items		
				--	-- {item = 'id_card_f', price = 120000, label = 'Tarjeta Puerta Blindada'},
				--	-- {item = 'id_card', price = 120000, label = 'Tarjeta Identificacion'},
				},
			},
		},
		
		BossActions = {
				Pos = vector3(959.4801, 71.6964, 112.5546), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	
		
		Vehicles = {
				Pos = vector3(-536.5489, -158.4905, 38.4634), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-556.3350, -161.1783, 37.0932), heading = 104.6645, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-556.3350, -161.1783, 37.0932),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},
	},

	AuthorizedVehicles = { 
		shared = { 
			{model = 'stafford', label = 'Stafford', props = {plate = 'MAFIA', color1 = 1, color2 = 1, modTransmission = 3} },
			{model = 'windsor2', label = 'Windsor2', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{model = 'patriot2', label = 'Patriot 2', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{model = 'xls2', label = 'Xls2', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			{model = 'stretch', label = 'Stretch', props = {plate = 'MAFIA', color1 = 1, color2 = 1} },
			
		},
		boss = {}
	},
	
	
	AllowedActions = {
		Billing = true, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = false, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = false, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = { 
		{weapon = 'WEAPON_KNIFE', price = 15000}
		},
		boss = { -- This weapon can be bought only of the boss of the current job
			-- {weapon = 'WEAPON_SNIPERRIFLE', price = 10000000},
		}
	},
}


Config.Jobs.prosegur = {
    Zones = {
		armory = {
		
			Pos = vector3(-77.6714, 364.1959, -112.4415), -- Postion of the marker
			Size = {x = 0.7, y = 0.7, z = 0.7}, -- Size of the marke
			Color = {r = 204, g = 204, b = 0}, -- The color of the marker
			Marker = 22, -- Type of the marker
			Type = 'Armory',
			BuyWeapon = true, 
			BuyWeaponGrade = 0,
			GetWeaponGrade = 1,
			GetStockGrade = 1,
			BuyItems = true,
			ShopItems = {
				shared = { -- Each job grade will see these items	
				},
				boss = { -- Only boss will see these items		
				},
			},
		},	
		
		BossActions = {
				Pos = vector3(-1301.4943, -572.7827, 41.1882), -- This is the place where you open BossMenu (only grade with name boss is allowed (depends on your esx_society edits)
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 22,
				Type = 'BossActions',
		},	

		Vehicles = {
				Pos = vector3(-78.8058, 366.9763, -112.4582), -- This is the spawnpoint where you see menu with vehicles which you can spawn
				Size = {x = 0.7, y = 0.7, z = 0.7},
				Color = {r = 204, g = 204, b = 0},
				Marker = 36,
				Type = 'Vehicles',
				SpawnPoints = { -- Here you configure spawnpoints, where the vehicle will be spawned (Chcecks if the spawnpoint is clear), you can add as much as you want
					{coords = vector3(-84.4209, 362.3010, -112.4582), heading = 242.5230, radius = 6.0}
				}
			},	
		VehicleDeletePoint = { -- here you add vehicle deleter points. It can delete helicopters, car, bikes, boats...
				Pos = vector3(-84.4209, 362.3010, -111.3582),
				Size = {x = 3.5, y = 3.5, z = 1.0},
				Color = {r = 255, g = 0, b = 0},
				Marker = 1,
				Type = 'VehicleDeleter',
			},	
		
	},
	
	-- End of zones and start of authorized vehicles
	AuthorizedVehicles = { -- Vehicles which be shown in the menu for the defined job
		shared = { -- These vehicles will have in garage every job rank
		},
		boss = { -- These vehicles + Shared Vehicles will have Boss rank
		}
	},

	AllowedActions = {
		Billing = false, -- Adds "Billing" to the interaction menu, the society is society_*player_job_name* (players job is police -> society is society_police)
		HasBodyActions = false, -- Adds Body Action such as Cuffing, Dragging, Taking out of vehicle, Putting in vehicle ...
		HasMechanicActions = false, -- This allows vehicle interaction in F6 menu
		CanRevive = false, -- This adds revive possibility to F6 menu
		CanWash = false, -- This manages if the boss can wash dirty money in BossMenu
		Deposit = true, -- If the boss will be able to deposit
		Grades = true, -- If the boss will have access to grades menu
		Withdraw = false, -- If the boss will have access to withdraw
		Employees = false, -- If the boss will have access to the employyess menu
	},
	
	AuthorizedWeapons = {
		shared = {},
		boss = { -- This weapon can be bought only of the boss of the current job
		}
	},
}
