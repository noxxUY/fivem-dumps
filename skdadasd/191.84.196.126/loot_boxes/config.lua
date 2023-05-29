Config = {}
-- MORE AVAILABLE ON 5MSCRIPTS.COM
Config.UserLicense = "None"
Config["image_source"] = "nui://r5m-inventory/nui/icons/"
Config.CloseInventoryHudTrigger = "r5m-inventory:closeInventory"

Config["chance"] = {
	[1] = { name = "Common", rate = 50 },
	[2] = { name = "Rare", rate = 40 },
	[3] = { name = "Epic", rate = 8 },
	[4] = { name = "Unique", rate = 1.7} ,
	[5] = { name = "Legendary", rate = 0.1 },
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

	["armas"] = {
		name = "Caja de armas",
		list = {
			{ item = "WEAPON_CERAMICPISTOL", amount=3, tier = 1 },
			{ item = "WEAPON_PISTOL", amount=3, tier = 1 },
			{ item = "WEAPON_MICROSMG", amount=3, tier = 2 },
			{ item = "WEAPON_ASSAULTSMG", amount=2, tier = 3 },
			{ item = "WEAPON_ASSAULTRIFLE", amount=2, tier = 4 },
			{ item = "WEAPON_ASSAULTRIFLE_MK2", amount=1, tier = 5 },

		}
	},
	
-- MORE AVAILABLE ON 5MSCRIPTS.COM

	["items"] = {
		name = "Caja de items",
		list = {
			{ item = "turbostreet", amount=1, tier = 1 },
			{ item = "turboracing", amount=1, tier = 3 },
			{ item = "turbosports", amount=1, tier = 2 },
			{ item = "turboultimate", amount=1, tier = 4 },
			{ money = 10000, tier = 5 },

		}
	},

	["autos1"] = {
		name = "Caja de autos t1",
		list = {
			{ item = "206fn", amount=1, tier = 1 },
			{ item = "500abarth", amount=1, tier = 1 },
			{ item = "clio", amount=1, tier = 1 },
			{ item = "boricua", amount=1, tier = 2 },
			{ item = "ek9", amount=1, tier = 2 },
			{ item = "amarok", amount=1, tier = 3 },
			{ item = "180sx", amount=1, tier = 4 },
			{ item = "celgt4", amount=1, tier = 4 },
			{ item = "evo3", amount=1, tier = 4 },
			{ item = "gcmpanameratst21", amount=1, tier = 5 },
		}
	},

	["autos2"] = {
		name = "Caja de autos t2",
		list = {
			{ item = "240sxhr", amount=1, tier = 1 },
			{ item = "z32", amount=1, tier = 1 },
			{ item = "na1", amount=1, tier = 1 },
			{ item = "22b", amount=1, tier = 2 },
			{ item = "focusrs", amount=1, tier = 2 },
			{ item = "porrs73", amount=1, tier = 3 },
			{ item = "bnr32", amount=1, tier = 4 },
			{ item = "filthynsx", amount=1, tier = 5 },
			{ item = "hycadeevo", amount=1, tier = 5 },
		}
	},

	["autos3"] = {
		name = "Caja de autos t3",
		list = {
			{ item = "pgt3rs19", amount=1, tier = 1 },
			{ item = "skyline", amount=1, tier = 1 },
			{ item = "toysupmk4", amount=1, tier = 1 },
			{ item = "rmodmustang", amount=1, tier = 1 },
			{ item = "gxa90", amount=1, tier = 2 },
			{ item = "gt63samg", amount=1, tier = 2 },
			{ item = "lgss", amount=1, tier = 2 },
			{ item = "lhuracan", amount=1, tier = 3 },
			{ item = "rmodi8mlb", amount=1, tier = 3 },
			{ item = "ocnetrongt", amount=1, tier = 3 },
			{ item = "senna", amount=1, tier = 4 },
			{ item = "4881", amount=1, tier = 4 },
			{ item = "lbdy01", amount=1, tier = 5 },
			{ item = "gxone", amount=1, tier = 5 },
			{ item = "choilambo", amount=1, tier = 5 },
			{ item = "gt17", amount=1, tier = 5 },
			{ item = "Imola", amount=1, tier = 5 },
			{ item = "artura22wb", amount=1, tier = 5 },
			{ item = "RufusVanquish", amount=1, tier = 5 },
		}
	},

	["autos4"] = {
		name = "Caja de autos t4",
		list = {
			{ item = "190eevo3", amount=1, tier = 1 },
			{ item = "bbdawn", amount=1, tier = 1 },
			{ item = "gxone", amount=1, tier = 2 },
			{ item = "choilambo", amount=1, tier = 2 },
			{ item = "Imola", amount=1, tier = 3 },
			{ item = "artura22wb", amount=1, tier = 3 },
			{ item = "RufusVanquish", amount=1, tier = 3 },
			{ item = "mazdaanime", amount=1, tier = 3 },
			{ item = "bcps", amount=1, tier = 4 },
			{ item = "evija", amount=1, tier = 4 },
			{ item = "r35lb", amount=1, tier = 4 },
			{ item = "mclareng", amount=1, tier = 5 },
			{ item = "rmodsupralb", amount=1, tier = 5 },
		}
	},

	["motos1"] = {
		name = "Caja de motos t1",
		list = {
			{ item = "tmax", amount=1, tier = 1 },
			{ item = "yzfsm", amount=1, tier = 1 },
			{ item = "2020rmz", amount=1, tier = 1 },
			{ item = "cbtwister", amount=1, tier = 1 },
			{ item = "hdiron883", amount=1, tier = 2 },
			{ item = "indiancdh", amount=1, tier = 2 },
			{ item = "mt03", amount=1, tier = 2 },
			{ item = "goldwing", amount=1, tier = 3 },
			{ item = "smc690", amount=1, tier = 3 },
			{ item = "katana2", amount=1, tier = 3 },
			{ item = "r1250r", amount=1, tier = 4 },
			{ item = "srad", amount=1, tier = 4 },
			{ item = "mt10", amount=1, tier = 4 },
			{ item = "r6", amount=1, tier = 4 },
			{ item = "gs1200", amount=1, tier = 5 },
			{ item = "gsxr19", amount=1, tier = 5 },
		}
	},

	["motos2"] = {
		name = "Caja de motos t2",
		list = {
			{ item = "gsxr19", amount=1, tier = 1 },
			{ item = "gs1200", amount=1, tier = 1 },
			{ item = "mv2019", amount=1, tier = 2 },
			{ item = "14r1", amount=1, tier = 2 },
			{ item = "superlag12", amount=1, tier = 3 },
			{ item = "hayabusa", amount=1, tier = 3 },
			{ item = "rc213vs", amount=1, tier = 4 },
			{ item = "desmo", amount=1, tier = 4 },
			{ item = "nh2r", amount=1, tier = 5 },
		}
	},
}