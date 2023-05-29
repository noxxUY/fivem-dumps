---wip types

---@class OxShop
---@field name string
---@field label? string
---@field blip? { id: number, colour: number, scale: number }
---@field inventory { name: string, price: number, count?: number, currency?: string }
---@field locations? vector3[]
---@field targets? { loc: vector3, length: number, width: number, heading: number, minZ: number, maxZ: number, distance: number, debug?: boolean, drawSprite?: boolean }[]
---@field groups? string | string[] | { [string]: number }
---@field model? number[]

return {
	General = {
		name = 'Tienda',
		blip = {
			id = 59, colour = 69, scale = 0.6
		}, inventory = {
			{ name = 'water', price = 500 },
			{ name = 'cocacola', price = 1000 },
			{ name = 'bread', price = 500 },
			{ name = 'burger', price = 1000 }
		}, locations = {
			vec3(-707.76446533203, -913.92846679688, 19.21558380127), -- 3x1
			vec3(1162.9519042969, -323.79318237305, 69.205032348633), -- Mirror park boulevard
			vec3(-48.67599105835, -1757.6563720703, 29.421020507813), -- Groove Street
			vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15),
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),
			vec3(1135.808, -982.281, 46.415),
			vec3(-1222.915, -906.983, 12.326),
			vec3(-1487.553, -379.107, 40.163),
			vec3(-2968.243, 390.910, 15.043),
			vec3(1166.024, 2708.930, 38.157)
		}, targets = {
			{ loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
			{ loc = vec3(-3039.18, 585.13, 7.91), length = 0.6, width = 0.5, heading = 15.0, minZ = 7.91, maxZ = 8.31, distance = 1.5 },
			{ loc = vec3(-3242.2, 1000.58, 12.83), length = 0.6, width = 0.6, heading = 175.0, minZ = 12.83, maxZ = 13.23, distance = 1.5 },
			{ loc = vec3(1728.39, 6414.95, 35.04), length = 0.6, width = 0.6, heading = 65.0, minZ = 35.04, maxZ = 35.44, distance = 1.5 },
			{ loc = vec3(1698.37, 4923.43, 42.06), length = 0.5, width = 0.5, heading = 235.0, minZ = 42.06, maxZ = 42.46, distance = 1.5 },
			{ loc = vec3(1960.54, 3740.28, 32.34), length = 0.6, width = 0.5, heading = 120.0, minZ = 32.34, maxZ = 32.74, distance = 1.5 },
			{ loc = vec3(548.5, 2671.25, 42.16), length = 0.6, width = 0.5, heading = 10.0, minZ = 42.16, maxZ = 42.56, distance = 1.5 },
			{ loc = vec3(2678.29, 3279.94, 55.24), length = 0.6, width = 0.5, heading = 330.0, minZ = 55.24, maxZ = 55.64, distance = 1.5 },
			{ loc = vec3(2557.19, 381.4, 108.62), length = 0.6, width = 0.5, heading = 0.0, minZ = 108.62, maxZ = 109.02, distance = 1.5 },
			{ loc = vec3(373.13, 326.29, 103.57), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
		}
	},

	 YouTool = {
	 	name = 'Ferretería',
	 	blip = {
	 		id = 566, colour = 69, scale = 0.7
	 	}, inventory = {
	 		{ name = 'hammer', price = 100 },
	 		{ name = 'wrench', price = 100 },
	 		{ name = 'destornillador', price = 100 },
	 		{ name = 'fixtool', price = 300 },
	 		{ name = 'vehlockpick', price = 5000 } -- Poner siempre mucho más caro que el mercado negro
	 	}, locations = {
	 		vec3(2748.4675292969, 3472.6909179688, 55.675662994385)
	 	}
	 },

	Armeria = {
		name = 'Armeria',
		blip = {
			id = 110, colour = 69, scale = 0.6
		}, inventory = {
			{ name = 'ammo-9', price = 100, },
			{ name = 'WEAPON_BAT', price = 4000 },
			{ name = 'WEAPON_SWITCHBLADE', price = 6000 },
			{ name = 'WEAPON_KNIFE', price = 7000 },
			{ name = 'WEAPON_DAGGER', price = 10000 },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 50000, metadata = { registered = true, durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_HEAVYPISTOl', price = 75000, metadata = { registered = true, durability = 100 }, license = 'weapon' }
		}, locations = {
			vec3(-330.2, 6083.8, 31.4)
			-- vec3(-662.180, -934.961, 21.829),
			-- vec3(810.25, -2157.60, 29.62),
			-- vec3(1693.44, 3760.16, 34.71),
			-- vec3(-330.24, 6083.88, 31.45),
			-- vec3(252.63, -50.00, 69.94),
			-- vec3(22.56, -1109.89, 29.80),
			-- vec3(2567.69, 294.38, 108.73),
			-- vec3(-1117.58, 2698.61, 18.55),
			-- vec3(842.44, -1033.42, 28.19)
		}
	},

	ArmeriaVIP = {
		name = 'Armeria VIP',
		blip = {id = 110, colour = 50, scale = 0.7},
		inventory = {
			{ name = 'WEAPON_HEAVYSNIPER', price = 1500000, metadata = { registered = true, serial = 'VIP', durability = 100 }},
			{ name = 'WEAPON_MUSKET', price = 700000, metadata = { registered = true, serial = 'VIP', durability = 100 } },
			{ name = 'WEAPON_REVOLVER', price = 700000, metadata = { registered = true, serial = 'VIP', durability = 100 } },
			{ name = 'WEAPON_DOUBLEACTION', price = 500000, metadata = { registered = true, serial = 'VIP', durability = 100 } }
			-- { name = 'WEAPON_VINTAGEPISTOL', price = 1000, metadata = { registered = true }, license = 'weapon' }
		}, locations = {
			vec3(810.2, -2157.3, 29.6)
		}
	},

	TiendaMafias = {
		name = 'Mafias | Mercado de armas',
		inventory = {
			{ name = 'WEAPON_HEAVYPISTOL', price = 50000, metadata = { registered = true, serial = 'MAFIA', durability = 100 }},
			{ name = 'WEAPON_PISTOL50', price = 150000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_MACHINEPISTOL', price = 100000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 80000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_MICROSMG', price = 200000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_ASSAULTSMG', price = 200000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_SMG', price = 200000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_COMBATMG', price = 350000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_APPISTOL', price = 150000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_COMPACTRIFLE', price = 250000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_ASSAULTRIFLE', price = 250000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_SPECIALCARBINE', price = 250000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_ADVANCEDRIFLE', price = 250000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } },
			{ name = 'WEAPON_SNIPERRIFLE', price = 1000000, metadata = { registered = true, serial = 'MAFIA', durability = 100 } }

			-- { name = 'WEAPON_VINTAGEPISTOL', price = 1000, metadata = { registered = true }, license = 'weapon' }
		}, locations = {
			vec3(2474.3400878906, -427.36352539063, 109.5221862793)
		}
	},

	PoliceArmoury = {
		name = 'Armario P.F.A',
		groups = shared.police,
		-- blip = {id = 110, colour = 84, scale = 0.7},
		inventory = {
			{ name = 'armor', price = 10000 },
			{ name = 'ammo-9', price = 10},
			{ name = 'ammo-rifle', price = 10},
			{ name = 'ammo-rifle2', price = 10},
			{ name = 'ammo-45', price = 10 },
			{ name = 'ammo-shotgun', price = 10},
			{ name = 'ammo-sniper', price = 10},
			{ name = 'ammo-heavysniper', price = 10},
			{ name = 'WEAPON_STUNGUN', price = 5000, metadata = { registered = true, serial = 'POL'} },
			{ name = 'WEAPON_COMBATPISTOL', price = 5000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 5000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_PISTOL50', price = 5000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_APPISTOL', price = 5000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_COMBATPDW', price = 5000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 5000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_CARBINERIFLE', price = 20000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_ADVANCEDRIFLE', price = 20000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_SNIPERRIFLE', price = 50000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_HEAVYSNIPER', price = 80000, metadata = { registered = true, serial = 'POL', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_BZGAS', price = 500, metadata = { registered = true, serial = 'POL' }, license = 'weapon' }
		}, locations = {
			vec3(484.37576293945, -1002.0065307617, 25.734638214111)
		}
	},

	GnaArmoury = {
		name = 'Armario G.N.A',
		groups = {["gna"] = 0},
		-- blip = {id = 110, colour = 84, scale = 0.7},
		inventory = {
			{ name = 'armor', price = 10000 },
			{ name = 'ammo-9', price = 10},
			{ name = 'ammo-rifle', price = 10},
			{ name = 'ammo-rifle2', price = 10},
			{ name = 'ammo-45', price = 10 },
			{ name = 'ammo-shotgun', price = 10},
			{ name = 'ammo-sniper', price = 10},
			{ name = 'ammo-heavysniper', price = 10},
			{ name = 'WEAPON_STUNGUN', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100} },
			{ name = 'WEAPON_COMBATPISTOL', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_PISTOL50', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_APPISTOL', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_COMBATPDW', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_SMG', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 5000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' },
			{ name = 'WEAPON_CARBINERIFLE', price = 20000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_ADVANCEDRIFLE', price = 20000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_SNIPERRIFLE', price = 50000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_HEAVYSNIPER', price = 80000, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_BZGAS', price = 500, metadata = { registered = true, serial = 'GNA', durability = 100 }, license = 'weapon' }
		}, locations = {
			vec3(-430.38, 5995.16, 31.72)
		}
	},

	Medicine = {
		name = 'Armario SAME',
		groups = {
			['ambulance'] = 0
		},
		-- blip = {id = 403, colour = 69, scale = 0.7},
		inventory = {
			{ name = 'medikit', price = 250 },
			{ name = 'bandage', price = 100 }
		}, locations = {
			vec3(306.3687, -601.5139, 43.28406)
		}
	},

	BlackMarket = {
		name = 'Mercado Negro',
		inventory = {
			{ name = 'ammo-9', price = 20 },
			{ name = 'ammo-45', price = 40 },
			{ name = 'ammo-rifle2', price = 30 },
			{ name = 'ammo-rifle', price = 50 },
			{ name = 'ammo-shotgun', price = 100 },
			{ name = 'ammo-heavysniper', price = 150 },
			{ name = 'armor', price = 15000 },
			{ name = 'silenciador', price = 3500 },
			{ name = 'grip', price = 3500 },
			{ name = 'vehlockpick', price = 3500 }
		}, locations = {
			vec3(386.97427368164, 791.85870361328, 187.69357299805)
		}
	},

	VendingMachineDrinks = {
		name = 'Maquina Expendedora',
		inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cocacola', price = 10 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	}
}
