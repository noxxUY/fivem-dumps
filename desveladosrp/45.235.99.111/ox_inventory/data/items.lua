return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Vendas',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dinero sucio',
	},

	['burger'] = {
		label = 'Hamburguesa',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Comiste una Mega Dibu!'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Ganzúa',
		weight = 160,
	},

	['phone'] = {
		label = 'Teléfono',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Agua',
		weight = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Te has refrescado'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['jerrycan'] = {
		label = 'Bidon de nafta',
		weight = 12000,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["accesscard"] = {
		label = "Tarjeta de acceso",
		weight = 1,
		stack = true,
		close = true,
	},

	["alive_chicken"] = {
		label = "Gallina viva",
		weight = 1,
		stack = true,
		close = true,
	},

	["armor"] = {
		label = "Chaleco antibalas",
		weight = 1,
		stack = true,
		close = true,
	},

	["baggio"] = {
		label = "Jugo Baggio",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Soplete",
		weight = 2,
		stack = true,
		close = true,
	},

	["bolcacahuetes"] = {
		label = "Mani",
		weight = 1,
		stack = true,
		close = true,
	},

	["bolchips"] = {
		label = "Chips",
		weight = 1,
		stack = true,
		close = true,
	},

	["bolnoixcajou"] = {
		label = "Nueces",
		weight = 1,
		stack = true,
		close = true,
	},

	["bolpistache"] = {
		label = "Pistachos",
		weight = 1,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Pan",
		weight = 1,
		stack = true,
		close = true,
	},

	["cafe"] = {
		label = "Cafe con leche",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 5,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Herramientas",
		weight = 2,
		stack = true,
		close = true,
	},

	["celownikdluga"] = {
		label = "Mira rifle",
		weight = -1,
		stack = true,
		close = true,
	},

	["chemicals"] = {
		label = "Quimicos",
		weight = 5,
		stack = true,
		close = true,
	},

	["chemicalslisence"] = {
		label = "Licencia de quimicos",
		weight = 5,
		stack = true,
		close = true,
	},

	["chicle"] = {
		label = "Chicle",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate"] = {
		label = "Chocolate",
		weight = 1,
		stack = true,
		close = true,
	},

	["chori"] = {
		label = "Choripan",
		weight = 1,
		stack = true,
		close = true,
	},

	["cindor"] = {
		label = "Cindor",
		weight = 1,
		stack = true,
		close = true,
	},

	["clip"] = {
		label = "Cargador",
		weight = 1,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Ropa",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocacola"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["coca_leaf"] = {
		label = "Hoja de coca",
		weight = 5,
		stack = true,
		close = true,
	},

	["coke"] = {
		label = "Coca",
		weight = 5,
		stack = true,
		close = true,
	},

	["contract"] = {
		label = "Contrato",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "cobre",
		weight = 1,
		stack = true,
		close = true,
	},

	["croquettes"] = {
		label = "Croquetas",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Madera cortada",
		weight = 1,
		stack = true,
		close = true,
	},

	["cut_money"] = {
		label = "Cut cash",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamante",
		weight = 1,
		stack = true,
		close = true,
	},

	["dj_tip"] = {
		label = "DJ tips",
		weight = 15,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Taladro",
		weight = 1,
		stack = true,
		close = true,
	},

	["drpepper"] = {
		label = "Dr. Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["empanadas"] = {
		label = "Empanada",
		weight = 1,
		stack = true,
		close = true,
	},

	["energy"] = {
		label = "Monster energy",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Tela",
		weight = 1,
		stack = true,
		close = true,
	},

	["fanta"] = {
		label = "Fanta",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Pescado",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishbait"] = {
		label = "Carnada de pez",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingrod"] = {
		label = "Caña de pescar",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Herramientas de reparo",
		weight = 2,
		stack = true,
		close = true,
	},

	["flashlight"] = {
		label = "Linterna",
		weight = 1,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Botella de gas",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Oro",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldbar"] = {
		label = "Barra de oro",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldnecklace"] = {
		label = "Collar de oro",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldwatch"] = {
		label = "Reloj de oro",
		weight = 1,
		stack = true,
		close = true,
	},

	["golem"] = {
		label = "Golem",
		weight = 1,
		stack = true,
		close = true,
	},

	["grapperaisin"] = {
		label = "Bunch of grapes",
		weight = 1,
		stack = true,
		close = true,
	},

	["grip"] = {
		label = "Empuñadura",
		weight = 1,
		stack = true,
		close = true,
	},

	["hackerDevice"] = {
		label = "Dispositivo de hackeo",
		weight = 1,
		stack = true,
		close = true,
	},

	["hammerwirecutter"] = {
		label = "Martillo y corta alambre",
		weight = 1,
		stack = true,
		close = true,
	},

	["heroin"] = {
		label = "Heroina",
		weight = 5,
		stack = true,
		close = true,
	},

	["hydrochloric_acid"] = {
		label = "Acido clorhídrico",
		weight = 5,
		stack = true,
		close = true,
	},

	["ice"] = {
		label = "Ice",
		weight = 1,
		stack = true,
		close = true,
	},

	["icetea"] = {
		label = "Ice Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Hierro",
		weight = 1,
		stack = true,
		close = true,
	},

	["jager"] = {
		label = "Fernet con Coca",
		weight = 1,
		stack = true,
		close = true,
	},

	["jagerbomb"] = {
		label = "Jägerbomb",
		weight = 1,
		stack = true,
		close = true,
	},

	["jagercerbere"] = {
		label = "Jäger Cerberus",
		weight = 1,
		stack = true,
		close = true,
	},

	["jeton"] = {
		label = "Fichas de Casino",
		weight = 1,
		stack = true,
		close = true,
	},

	["jewels"] = {
		label = "Joyas",
		weight = 1,
		stack = true,
		close = true,
	},

	["jusfruit"] = {
		label = "Jugo de frutas",
		weight = 1,
		stack = true,
		close = true,
	},

	["kompensator"] = {
		label = "Compensador",
		weight = -1,
		stack = true,
		close = true,
	},

	["lays"] = {
		label = "Papas frita",
		weight = 1,
		stack = true,
		close = true,
	},

	["limonade"] = {
		label = "Limonada",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsa"] = {
		label = "LSA",
		weight = 5,
		stack = true,
		close = true,
	},

	["lsd"] = {
		label = "LSD",
		weight = 5,
		stack = true,
		close = true,
	},

	["manaos"] = {
		label = "Manaos de uva",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marihuana",
		weight = 5,
		stack = true,
		close = true,
	},

	["martini"] = {
		label = "Champagne",
		weight = 1,
		stack = true,
		close = true,
	},

	["mate"] = {
		label = "Mate",
		weight = 1,
		stack = true,
		close = true,
	},

	["medialunas"] = {
		label = "Medialuna",
		weight = 1,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 0,
		stack = true,
		close = true,
	},

	["menthe"] = {
		label = "Menta",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth"] = {
		label = "Meta",
		weight = 5,
		stack = true,
		close = true,
	},

	["metreshooter"] = {
		label = "Shooter meter",
		weight = 1,
		stack = true,
		close = true,
	},

	["mixapero"] = {
		label = "Aperitif Mix",
		weight = 1,
		stack = true,
		close = true,
	},

	["mogul"] = {
		label = "Gomita",
		weight = 1,
		stack = true,
		close = true,
	},

	["mojito"] = {
		label = "Mojito",
		weight = 1,
		stack = true,
		close = true,
	},

	["moneywash"] = {
		label = "Dinero limpio",
		weight = 5,
		stack = true,
		close = true,
	},

	["oreo"] = {
		label = "Oreos",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Filet de pollo",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Madera empaquetada",
		weight = 1,
		stack = true,
		close = true,
	},

	["pancho"] = {
		label = "Pancho",
		weight = 1,
		stack = true,
		close = true,
	},

	["pendrive"] = {
		label = "Pendrive",
		weight = 1,
		stack = true,
		close = true,
	},

	["pepsi"] = {
		label = "Pepsi",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Aceite",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Aceite procesado",
		weight = 1,
		stack = true,
		close = true,
	},

	["platin50"] = {
		label = "Skin pistola .50",
		weight = -1,
		stack = true,
		close = true,
	},

	["poppyresin"] = {
		label = "Resina",
		weight = 5,
		stack = true,
		close = true,
	},

	["repairkit"] = {
		label = "Repairkit",
		weight = 3,
		stack = true,
		close = true,
	},

	["rhum"] = {
		label = "Gancia",
		weight = 1,
		stack = true,
		close = true,
	},

	["rhumcoca"] = {
		label = "Ron con coca",
		weight = 1,
		stack = true,
		close = true,
	},

	["rhumfruit"] = {
		label = "Ron con jugo",
		weight = 1,
		stack = true,
		close = true,
	},

	["saucisson"] = {
		label = "Panchos",
		weight = 1,
		stack = true,
		close = true,
	},

	["shark"] = {
		label = "Tiburón",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Pollo muerto",
		weight = 1,
		stack = true,
		close = true,
	},

	["soda"] = {
		label = "Soda",
		weight = 1,
		stack = true,
		close = true,
	},

	["sodium_hydroxide"] = {
		label = "Hidróxido de sodio",
		weight = 5,
		stack = true,
		close = true,
	},

	["sorted_money"] = {
		label = "Sorted money",
		weight = 1,
		stack = true,
		close = true,
	},

	["spray"] = {
		label = "Spray",
		weight = 1,
		stack = true,
		close = true,
	},

	["spray_remover"] = {
		label = "Acetona",
		weight = 1,
		stack = true,
		close = true,
	},

	["sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Piedra",
		weight = 1,
		stack = true,
		close = true,
	},

	["sulfuric_acid"] = {
		label = "Acido sulfúrico",
		weight = 5,
		stack = true,
		close = true,
	},

	["Suppressor"] = {
		label = "Silenciador",
		weight = 1,
		stack = true,
		close = true,
	},

	["teqpaf"] = {
		label = "Teq'paf",
		weight = 1,
		stack = true,
		close = true,
	},

	["tequila"] = {
		label = "Termidor",
		weight = 1,
		stack = true,
		close = true,
	},

	["thionyl_chloride"] = {
		label = "Cloruro de tionilo",
		weight = 5,
		stack = true,
		close = true,
	},

	["tortas"] = {
		label = "Torta frita",
		weight = 1,
		stack = true,
		close = true,
	},

	["towing_rope"] = {
		label = "Soga",
		weight = 1,
		stack = true,
		close = true,
	},

	["turtle"] = {
		label = "Tortuga de mar",
		weight = 1,
		stack = true,
		close = true,
	},

	["turtlebait"] = {
		label = "Carnada de tortuga",
		weight = 1,
		stack = true,
		close = true,
	},

	["vodka"] = {
		label = "Smirnoff",
		weight = 1,
		stack = true,
		close = true,
	},

	["vodkaenergy"] = {
		label = "Vodka-energy",
		weight = 1,
		stack = true,
		close = true,
	},

	["vodkafruit"] = {
		label = "Jugo loco",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["whisky"] = {
		label = "Quilmes",
		weight = 1,
		stack = true,
		close = true,
	},

	
	["combomeal"] = {
		label = "Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["bigmac"] = {
		label = "Big Mac",
		weight = 1,
		stack = true,
		close = true,
	},

	["mcpollo"] = {
		label = "Mc Pollo",
		weight = 1,
		stack = true,
		close = true,
	},

	["mcroyaldeluxe"] = {
		label = "Mc Royal Deluxe",
		weight = 1,
		stack = true,
		close = true,
	},

	["cbo"] = {
		label = "Mc Light",
		weight = 1,
		stack = true,
		close = true,
	},

	["cuartodelibra"] = {
		label = "Cuarto de libra",
		weight = 1,
		stack = true,
		close = true,
	},

	["grandmcextreme"] = {
		label = "Mc extreme",
		weight = 1,
		stack = true,
		close = true,
	},

	["bigchickensupreme"] = {
		label = "suprema de pollo",
		weight = 1,
		stack = true,
		close = true,
	},

	["bigcrispybbq"] = {
		label = "Mc BBQ",
		weight = 1,
		stack = true,
		close = true,
	},

	["bigdoublecheese"] = {
		label = "Doble con queso",
		weight = 1,
		stack = true,
		close = true,
	},

	["hamburgesa"] = {
		label = "Hamburguesa",
		weight = 1,
		stack = true,
		close = true,
	},

	["hamburgesadepollo"] = {
		label = "Hamburguesa de pollo",
		weight = 1,
		stack = true,
		close = true,
	},

	["mcfish"] = {
		label = "Mc fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["happymeal"] = {
		label = "Cajita feliz",
		weight = 1,
		stack = true,
		close = true,
	},

	["nestea"] = {
		label = "Nestea",
		weight = 1,
		stack = true,
		close = true,
	},

	["agua"] = {
		label = "agua",
		weight = 1,
		stack = true,
		close = true,
	},

	["monsterenergy"] = {
		label = "Monster Energy",
		weight = 1,
		stack = true,
		close = true,
	},

	["cerveza"] = {
		label = "Cerveza Artesanal",
		weight = 1,
		stack = true,
		close = true,
	},

	["aquarius"] = {
		label = "Aquarius",
		weight = 1,
		stack = true,
		close = true,
	},

	["sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["colacao"] = {
		label = "Colacao",
		weight = 1,
		stack = true,
		close = true,
	},

	["nuggets"] = {
		label = "Nuggets",
		weight = 1,
		stack = true,
		close = true,
	},

	["patatasfritas"] = {
		label = "Papas fritas",
		weight = 1,
		stack = true,
		close = true,
	},

	["topfries"] = {
		label = "Papas grandes",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["whiskycoca"] = {
		label = "Whiscola",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Madera",
		weight = 1,
		stack = true,
		close = true,
	},

	["woodheavyp"] = {
		label = "Skin pistola pesada",
		weight = -1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Lana",
		weight = 1,
		stack = true,
		close = true,
	},

	["yusuf"] = {
		label = "Skin",
		weight = 1,
		stack = true,
		close = true,
	},

	["receipt"] = {
		label = "W.C receipt",
		weight = 1,
		stack = true,
		close = true,
	},

	["killerwhale"] = {
		label = "Ballena asesina",
		weight = 1,
		stack = true,
		close = true,
	},

	["sharkhammer"] = {
		label = "Tiburón martillo",
		weight = 1,
		stack = true,
		close = true,
	},

	["sharktiger"] = {
		label = "Tiburón tigre",
		weight = 1,
		stack = true,
		close = true,
	},

	["stingray"] = {
		label = "Mantarraya",
		weight = 1,
		stack = true,
		close = true,
	},

	["dolphin"] = {
		label = "Delfín",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["pizza"] = {
		label = "Pizza",
		weight = 1,
		stack = true,
		close = true,
	},
}