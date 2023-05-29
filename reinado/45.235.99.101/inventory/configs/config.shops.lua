Config.Shops = false -- toggle shops plugin | default: true
Config.ShopsBuiltIn = false -- toggle shops built in, add your shops below in Config.ShopLocations | default: false
Config.ShopDelay = 250 -- opening delay of the shop | default: 250
Config.ShopLocations = {
  ["247"] = {
    label = 'Tienda 24/7',
    license = false, -- license name, esx_license required!
    jobs = 'mechanic', -- set to false to disable whitelisting
    job_grades = false, -- set to false to disable grading
    addon_account_name = false, -- adds to specified account when player buys item, set to false to disable addon_account
    blip = {id = 59, color = 2, scale = 0.8, hiddenForOthers = false},
    locations = {
		--[[	vector3(373.8, 325.8, 102.5),
			vector3(2557.4, 382.2, 107.6),
			vector3(-3038.9, 585.9, 6.9),
			vector3(-3241.9, 1001.4, 11.8),
			vector3(547.4, 2671.7, 41.1),
			vector3(1961.4, 3740.6, 32.3),
			vector3(2678.9, 3280.6, 55.2),
			vector3(1729.2, 6414.1, 35.0),
			vector3(814.1589, -782.0623, 26.1750),
			vector3(1135.8, -982.2, 45.4),
			vector3(-1222.9, -906.9, 11.3),
			vector3(-1487.5, -379.1, 39.1),
			vector3(-2968.2, 390.9, 14.0),
			vector3(1166.0, 2708.9, 37.1),
			vector3(1392.5, 3604.6,  33.9),
			vector3(25.8085, -1346.596, 28.49703),
			vector3(127.8,  -1284.7, 28.2), --StripClub
			vector3(-1393.4, -606.6, 29.3), --Tequila la
			vector3(-559.9, 287.0, 81.1), --Bahamamas ]]
			vector3(-5827.9438, 1168.7769, 7.6973), --prision
			vector3(-5834.6572, 1173.5839, 8.6969)
			
			
    },
    items = {
			{type = 'item', 
				name = "bandage",
				 method = 'money',
				price = 750,
				sellPrice = 1
			},
			{type = 'item', 
				name = "fixkit",
				 method = 'money',
				price = 7500,
				sellPrice = 1
			},
			{type = 'item', 
				name = "cocacola",
				 method = 'money',
				price = 100,
				sellPrice = 1
			},
			{type = 'item', 
				name = "fanta",
				 method = 'money',
				price = 100,
				sellPrice = 1
			},
			{type = 'item', 
				name = "sprite",
				 method = 'money',
				price = 100,
				sellPrice = 1
			},
			{type = 'item', 
				name = "loka",
				 method = 'money',
				price = 80,
				sellPrice = 1
			},
			{type = 'item', 
				name = "cheesebows",
				 method = 'money',
				price = 80,
				sellPrice = 1
			},
			{type = 'item', 
				name = "chips",
				 method = 'money',
				price = 70,
				sellPrice = 1
			},
			{
				name = "marabou",
				 method = 'money',
				price = 60,
				sellPrice = 1
			},
			{type = 'item', 
				name = "pizza",
				 method = 'money',
				price = 90,
				sellPrice = 1
			},
			{type = 'item', 
				name = "burger",
				 method = 'money',
				price = 80,
				sellPrice = 1
			},
			{type = 'item', 
				name = "pastacarbonara",
				method = 'money',
				price = 80,
				sellPrice = 1
			},
			{type = 'item', 
				name = "macka",
				 method = 'money',
				price = 75,
				sellPrice = 1
			}
      -- {type = 'weapon', name = 'WEAPON_KNIFE', method = 'money', price = 30, sellPrice = 20},
    }
  } 
 --[[  ["GunShop"] = {
    label = 'Weapon Shop',
    license = "weapon", -- license name, esx_license required!
    jobs = false, -- set to false to disable whitelisting
    job_grades = false, -- set to false to disable grading
    addon_account_name = false, -- adds to specified account when player buys item, set to false to disable addon_account
    blip = {id = 110, color = 1, scale = 0.8, hiddenForOthers = false},
    locations = {
      vector3(-662.1, -935.3, 20.8),
    },
    items = {
    --  {type = 'weapon', name = 'WEAPON_PISTOL', method = 'money', price = 3, sellPrice = 1, ammo = 100},
    }
  } ]]
}