 Config = {}
Config.UserLicense = "None"
Config["image_source"] = "nui://inventory/web/assets/icons/"
Config.CloseInventoryHudTrigger = "esx_inventoryhud:closeInventory"

Config["chance"] = {
	[1] = { name = "Common", rate = 50 },
	[2] = { name = "Rare", rate = 35 },
	[3] = { name = "Epic", rate = 10 },
	[4] = { name = "Unique", rate = 4 } ,
	[5] = { name = "Legendary", rate = 1 },
}

Config["broadcast"] = true 
Config["broadcast_tier"] = {
	[1] = false,
	[2] = false,
	[3] = false,
	[4] = false,
	[5] = false,
}

Config["5mscriptscom"] = {
	["cajabronce"] = { -- $200 
		name = "Caja Bronce",
		list = {
			{ money = 80000, tier = 1 },
			{ money = 100000, tier = 2 },
			{ weapon = "weapon_assaultrifle", amount=1, tier = 3},
			{ money = 150000, amount=1, tier = 4 },
			{ black_money = 300000, tier = 4 },
			{ money = 1000000, tier = 5 },
		}
	},
	["cajaplata"] = { -- $400
		name = "Caja Plata",
		list = {
			{ money = 120000, tier = 1 },
			{ money = 150000, tier = 2 },
			{ weapon = "weapon_assaultrifle", amount=1, tier = 3 },
			{ money = 250000, tier = 4 },
			{ black_money = 250000, tier = 4 },
			{ money = 2000000, tier = 5 },
		}
	},
	["cajaoro"] = { -- $600
		name = "Caja Oro",
		list = {
			{ money = 150000, tier = 1 },
			{ money = 250000, tier = 2 },
			{ weapon = "weapon_assaultrifle", amount=1, tier = 3 },
			{ money = 450000, tier = 4 },
			{ black_money = 800000, tier = 4 },
			{ money = 3000000, tier = 5 },
		}
	},
	["cajadiamante"] = { -- $1000
		name = "Caja Diamante",
		list = {
			-- { item = "fulltuning", amount=1, tier = 1 },
			{ money = 750000, tier = 1 },
			{ money = 1000000, tier = 2 },
		--	{ weapon = "weapon_assaultrifle", amount=1, tier = 3 },
			{ money = 1500000, amount=1, tier = 3 },
			{ black_money = 5000000, tier = 4 },
			{ money = 8000000, amount=1, tier = 5 },
		}
	},
	["cajapistol"] = { -- 
		name = "Caja Pistolas",
		list = {
			{ weapon = "weapon_pistol", amount=1, tier = 1 },	
			{ weapon = "weapon_vintagepistol", amount=1, tier = 1 },
			{ weapon = "weapon_snspistol", amount=1, tier = 1 },
			{ weapon = "weapon_pistol50", amount=1, tier = 2 },
			{ weapon = "weapon_heavypistol", amount=1, tier = 3 },
			{ weapon = "weapon_revolver", amount=1, tier = 4 },
			{ weapon = "weapon_appistol", amount=1, tier = 5 },	
		}
	},
	["cajasubfusil"] = { -- 
		name = "Caja Sub Fusiles",
		list = {
			{ weapon = "weapon_microsmg", amount=1, tier = 1 },	
			{ weapon = "weapon_minismg", amount=1, tier = 1 },	
			{ weapon = "weapon_smg", amount=1, tier = 2 },	
			{ weapon = "weapon_machinepistol", amount=1, tier = 3 },
			{ weapon = "weapon_smg_mk2", amount=1, tier = 4 },	
			{ weapon = "weapon_assaultsmg", amount=1, tier = 5 },	
			
		}
	},
	["cajafusil"] = { -- 
		name = "Caja Fusiles",
		list = {
			{ weapon = "weapon_assaultrifle", amount=1, tier = 1 },	
			{ weapon = "weapon_compactrifle", amount=1, tier = 3 },	
			{ weapon = "weapon_bullpuprifle_mk2", amount=1, tier = 5 },	
			{ weapon = "weapon_bullpuprifle", amount=1, tier = 5 },	
			
			
			
		}
	},
	["cajafranco"] = { -- 
		name = "Caja Franco Tiradores",
		list = {
			{ weapon = "weapon_sniperrifle", amount=1, tier = 1 },	
			{ weapon = "weapon_heavysniper", amount=1, tier = 5 },	
		}
	},
	["cajadrop"] = { -- 
		name = "Caja Drop",
		list = {
		--	{ weapon = "weapon_sniperrifle", amount=1, tier = 1 },	
		--	{ weapon = "weapon_heavysniper", amount=1, tier = 5 },	
		}
	},
}
