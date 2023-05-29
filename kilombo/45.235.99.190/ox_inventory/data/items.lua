return {

	['bandage'] = {
		label = 'Vendas',
		weight = 50,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['medikit'] = {
		label = 'Kit Médico',
		weight = 100,
		client = {
			anim = { dict = 'anim@heists@narcotics@funding@gang_idle', clip = 'gang_chatting_idle01', flag = 'gang_chatting_idle01' },
			prop = { model = `prop_ld_health_pack`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 12000,
		}
	},

	['black_money'] = {
		label = 'Dinero negro',
	},

	['burger'] = {
		label = 'Hamburguesa',
		weight = 100,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Te comiste una hamburguesa'
		},
	},

	['cola'] = {
		label = 'Coca-Cola',
		weight = 100,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Te tomaste una Coca cola refrescante'
		}
	},

	['garbage'] = {
		label = 'Basura',
	},


	['identification'] = {
		label = 'Identificación',
	},

	

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	
	['money'] = {
		label = 'Pesos',
	},


	['water'] = {
		label = 'Agua',
		weight = 100,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Tomaste una botella de agua'
		}
	},


	["armor"] = {
		label = "Chaleco Antibalas",
		weight = 1000,
		stack = true,
		close = true,
	},


	["bread"] = {
		label = "Pan",
		weight = 100,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cogollo de marihuana",
		weight = 40,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Kit de carrocería",
		weight = 20,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Herramientas de carrocería",
		weight = 2,
		stack = true,
		close = true,
	},


	["chemicals"] = {
		label = "Quimicos",
		weight = 100,
		stack = true,
		close = true,
	},

	["clip"] = {
		label = "Cargador de municion",
		weight = 50,
		stack = true,
		close = true,
	},

	["coke"] = {
		label = "Merca",
		weight = 40,
		stack = true,
		close = true,
	},

	["dream-copper"] = {
		label = "Cobre",
		weight = 200,
		stack = true,
		close = false,
	},

	["dream-diamonds"] = {
		label = "Diamantes",
		weight = 200,
		stack = true,
		close = false,
	},

	["dream-iron"] = {
		label = "Hierro",
		weight = 200,
		stack = true,
		close = false,
	},

	["dream-lead"] = {
		label = "Plomo",
		weight = 200,
		stack = true,
		close = false,
	},

	["dream-molibden"] = {
		label = "Mercurio",
		weight = 200,
		stack = true,
		close = false,
	},

	["dream-silver"] = {
		label = "Plata",
		weight = 200,
		stack = true,
		close = false,
	},

	["dream-gold"] = {
		label = "Oro",
		weight = 200,
		stack = true,
		close = false,
	},

	["dream-zinc"] = {
		label = "zinc",
		weight = 200,
		stack = true,
		close = false,
	},


	["fanta"] = {
		label = "Fanta Exotic",
		weight = 100,
		stack = true,
		close = true,
	},



	["fixkit"] = {
		label = "Kit de reparación",
		weight = 500,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Herramientas de reparación",
		weight = 20,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Botella de gas",
		weight = 2,
		stack = true,
		close = true,
	},

	["grip"] = {
		label = "Empuñadura",
		weight = 20,
		stack = true,
		close = true,
	},


	["heroin"] = {
		label = "Heroina",
		weight = 80,
		stack = true,
		close = true,
	},

	["hierro"] = {
		label = "Minerales de Hierro",
		weight = 80,
		stack = true,
		close = true,
	},

	["hydrochloric_acid"] = {
		label = "Ácido clorhídrico",
		weight = 15,
		stack = true,
		close = true,
	},



	["linterna"] = {
		label = "Linterna",
		weight = 20,
		stack = true,
		close = true,
	},



	["lsa"] = {
		label = "LSA",
		weight = 100,
		stack = true,
		close = true,
	},

	["lsd"] = {
		label = "Pepa",
		weight = 100,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marihuana",
		weight = 15,
		stack = true,
		close = true,
	},

	["meth"] = {
		label = "Rola",
		weight = 30,
		stack = true,
		close = true,
	},

	["meth_pooch"] = {
		label = "Bolsa de rola",
		weight = 30,
		stack = true,
		close = true,
	},

	["moneywash"] = {
		label = "Licencia lavar dinero",
		weight = 1,
		stack = true,
		close = true,
	},

	["opium"] = {
		label = "Opio",
		weight = 80,
		stack = true,
		close = true,
	},

	["opium_pooch"] = {
		label = "Bolsa de Opio",
		weight = 30,
		stack = true,
		close = true,
	},


	["petroleum"] = {
		label = "Petróleo crudo",
		weight = 120,
		stack = true,
		close = true,
	},

	["petroleumgross"] = {
		label = "Petróleo refinado",
		weight = 100,
		stack = true,
		close = true,
	},


	["poppyresin"] = {
		label = "Resina de Opio",
		weight = 90,
		stack = true,
		close = true,
	},


	["silenciador"] = {
		label = "Silenciador",
		weight = 20,
		stack = true,
		close = true,
	},


	["sodium_hydroxide"] = {
		label = "Hidróxido de sodio",
		weight = 15,
		stack = true,
		close = true,
	},

	["sprite"] = {
		label = "Sprite",
		weight = 100,
		stack = true,
		close = true,
	},

	["sulfuric_acid"] = {
		label = "Ácido sulfúrico",
		weight = 15,
		stack = true,
		close = true,
	},


	["thionyl_chloride"] = {
		label = "Cloruro de tionilo",
		weight = 100,
		stack = true,
		close = true,
	},


	["vehlockpick"] = {
		label = "Ganzúa de vehículo",
		weight = 5,
		stack = true,
		close = true,
	},

	["weed"] = {
		label = "Marihuana",
		weight = 80,
		stack = true,
		close = true,
	},

	["weed_in_pooch"] = {
		label = "Bolsa de Marihuana",
		weight = 30,
		stack = true,
		close = true,
	},

	["trapphone"] = {
		label = "Trap Phone",
		weight = 1,
		stack = true,
		close = true,
	},

	["fdrive"] = {
		label = "Unidad flash",
		weight = 100,
		stack = true,
		close = true,
	},

	["pizza"] = {
		label = "Kebab Pizza",
		weight = 100,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Chalumeaux",
		weight = 2,
		stack = true,
		close = true,
	},

	["bolsa"] = {
		label = "Bolsa para Cabeza",
		weight = 5,
		stack = true,
		close = true,
	},

	["radmask"] = {
		label = "Mascara Antiradiación",
		weight = 3,
		stack = true,
		close = true,
	},

	["hackerDevice"] = {
		label = "Dispositivo de hackeo",
		weight = 10,
		stack = true,
		close = true,
	},

	["secure_card"] = {
		label = "Tarjeta de seguridad",
		weight = 20,
		stack = true,
		close = true,
	},

	["carbon"] = {
		label = "Minerales de Carbón",
		weight = 80,
		stack = true,
		close = true,
	},

	["sim_card"] = {
		label = "Tarjeta SIM",
		weight = 20,
		stack = true,
		close = true,
	},

	["id_card_f"] = {
		label = "Tarjeta de acceso malicioso",
		weight = 20,
		stack = true,
		close = true,
	},

	["cheesebows"] = {
		label = "OLW Ostbågar",
		weight = 100,
		stack = true,
		close = true,
	},

	["labsample"] = {
		label = "Muestra de laboratorio",
		weight = 30,
		stack = true,
		close = true,
	},

	["chemicalslisence"] = {
		label = "Licencia de quimicos",
		weight = 1,
		stack = true,
		close = true,
	},

	["chips"] = {
		label = "OLW 3xLök Chips",
		weight = 100,
		stack = true,
		close = true,
	},

	["cigarett"] = {
		label = "Cigarett",
		weight = 100,
		stack = true,
		close = true,
	},

	["loka"] = {
		label = "Loka Crush",
		weight = 100,
		stack = true,
		close = true,
	},

	["cobre"] = {
		label = "Minerales de Cobre",
		weight = 80,
		stack = true,
		close = true,
	},

	["coca_leaf"] = {
		label = "Hoja de coca",
		weight = 40,
		stack = true,
		close = true,
	},

	["cocacola"] = {
		label = "Coca Cola",
		weight = 100,
		stack = true,
		close = true,
	},

	["macka"] = {
		label = "Skinkmacka",
		weight = 100,
		stack = true,
		close = true,
	},

	["marabou"] = {
		label = "Marabou Mjölkchoklad",
		weight = 100,
		stack = true,
		close = true,
	},

	["tablet"] = {
		label = "Tablet",
		weight = 1,
		stack = true,
		close = true,
	},

	["raw"] = {
		label = "RAW Papel para liar",
		weight = 100,
		stack = true,
		close = true,
	},

	["pouch"] = {
		label = "Bolsa",
		weight = 100,
		stack = true,
		close = true,
	},

	["phone"] = {
		label = "Phone",
		weight = 1,
		stack = true,
		close = true,
	},

	["pastacarbonara"] = {
		label = "Pasta Carbonara",
		weight = 100,
		stack = true,
		close = true,
	},

	["lotteryticket"] = {
		label = "Trisslott",
		weight = 100,
		stack = true,
		close = true,
	},

	["lighter"] = {
		label = "Tändare",
		weight = 10,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Taladro",
		weight = 10,
		stack = true,
		close = true,
	},

	["efdrive"] = {
		label = "Unidad flash cifrada",
		weight = 100,
		stack = true,
		close = true,
	},

	["joint"] = {
		label = "Porro",
		weight = 80,
		stack = true,
		close = true,
	},

	["destornillador"] = {
		label = "Destornillador",
		weight = 200,
		stack = true,
		close = true,
	},

	["wrench"] = {
		label = "Llave Inglesa Stilson",
		weight = 500,
		stack = true,
		close = true,
	},

	["hammer"] = {
		label = "Martillo",
		weight = 500,
		stack = true,
		close = true,
	},
}