return {
	['testburger'] = {
		label = 'Burger de prueba',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'comiendo',
			prop = 'hamburguesa',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = '¿Qué deliciosa hamburguesa, verdad?'
		},
		buttons = {
			{
				label = 'Lamer',
				action = function(slot)
					print('Lamiste la hamburguesa')
				end
			},
			{
				label = 'Exprimir',
				action = function(slot)
					print('Exprimiste la hamburguesa :(')
				end
			}
		},
		consume = 0.3
	},
	
	['bandage'] = {
		label = 'Vendaje',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},
	
	['black_money'] = {
		label = 'Dinero negro',
	},
	
	['burger'] = {
		label = 'Hamburguesa',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'comiendo',
			prop = 'hamburguesa',
			usetime = 2500,
			notification = 'Comiste una deliciosa hamburguesa'
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
			notification = 'Calmaste tu sed con eCola'
		}
	},
	
	['parachute'] = {
		label = 'Paracaídas',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},
	
	['garbage'] = {
		label = 'Basura',
	},
	
	['paperbag'] = {
		label = 'Bolsa de papel',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},
	
	['identification'] = {
		label = 'Identificación',
	},

	['panties'] = {
		label = 'Calzones',
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
		label = 'Ganzua',
		weight = 160,
	},

	['phone'] = {
		label = 'Celular',
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
		label = 'Dinero',
	},

	['mustard'] = {
		label = 'Mostaza',
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
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Chaleco antibalas',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Ropa',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Residuos de metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["blindfold"] = {
		label = "Venda",
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

	["bread"] = {
		label = "Pan",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Kit de carroceria",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Herramientas de carroceria",
		weight = 2,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Ropa",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Cobre",
		weight = 10,
		stack = true,
		close = true,
	},

	["cuff"] = {
		label = "Esposas",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
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

	["essence"] = {
		label = "Combustible",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Pez",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Kit de reparación",
		weight = 3,
		stack = false,
		close = true,
	},

	["fixtool"] = {
		label = "Herramientas",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Bidón de combustible",
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

	["iron"] = {
		label = "Metal",
		weight = 120,
		stack = true,
		close = true,
	},

	["key"] = {
		label = "Llaves",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Botiquin",
		weight = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
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

	["rope"] = {
		label = "Soga",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
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

	["washed_stone"] = {
		label = "Piedra lavada",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["nitro50shot"] = {
		label = "50L de Nitro",
		weight = 1,
		stack = true,
		close = true,
	},

	["nitro100shot"] = {
		label = "100L de Nitro",
		weight = 1,
		stack = true,
		close = true,
	},

	["nitro200shot"] = {
		label = "200L de Nitro",
		weight = 1,
		stack = true,
		close = true,
	},

	["hose"] = {
		label = "Manguera",
		weight = 5,
		stack = true,
		close = true,
	},

['repairparts'] = {
	label = 'Partes para reparar motor',
	weight = 250,
	stack = false,
	close = true,
},

['street_tires'] = {
	label = 'Neumaticos de calle',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},
['sports_tires'] = {
	label = 'Neumaticos deportivos',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},
['racing_tires'] = {
	label = 'Neumaticos de carrera',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},
['drag_tires'] = {
	label = 'Neumaticos de drag',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['transmition_clutch'] = {
	label = 'Embrague de transmision OEM',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_flywheel'] = {
	label = 'Volante OEM',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_oil'] = {
	label = 'Aceite de motor OEM',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_sparkplug'] = {
	label = 'Juego de bugías',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_gasket'] = {
	label = 'Juegos de juntas de cabezales OEM',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_airfilter'] = {
	label = 'Filtro de aire de admisión OEM',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_fuelinjector'] = {
	label = 'Inyectores de combustible OEM',
	weight = 150,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['engine_pistons'] = {
	label = 'Juego de pistones OEM',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_connectingrods'] = {
	label = 'Kit de bielas OEM',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_valves'] = {
	label = 'Kit de valvulas OEM',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_block'] = {
	label = 'Bloque OEM',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_crankshaft'] = {
	label = 'Cigueñal OEM',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['engine_camshaft'] = {
	label = 'Arbol de lebas OEM',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},



 

['ecu'] = {
	label = 'ECU',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},

['drift_tires'] = {
	label = 'Neumaticos de Drift',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['lsdf'] = {
	label = 'Diferencial de deslizamiento limitado (Frontal)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['lsdr'] = {
	label = 'Diferencial de deslizamiento limitado (Trasero)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['tcs'] = {
	label = 'Sistema de control de tracción (TCS)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['esc'] = {
	label = 'Sistema de control de estabilidad (ESC)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['closerationgears'] = {
	label = 'Engranajes de relación cerrada',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['cvttranny'] = {
	label = 'Transmisión CVT',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['abs'] = {
	label = 'Sistema de freno antibloqueo',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axletorsionfront'] = {
	label = 'Torsión del eje (Frontal)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axletorsionrear'] = {
	label = 'Torsión del eje (Trasero)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axlesolidfront'] = {
	label = 'Eje Solido (Frontal)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axlesolidrear'] = {
	label = 'Eje Solido (Trasero)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['kers'] = {
	label = 'Sistema de recuperación de energía cinética (KERS)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['offroadtune1'] = {
	label = 'Offroad Tune 1',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['offroadtune2'] = {
	label = 'Offroad Tune 2',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['stanced'] = {
	label = 'Stanced Tune',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['frontwheeldrive'] = {
	label = 'Transmisión de la rueda delantera',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['allwheeldrive'] = {
	label = 'Transmisión en todas las ruedas',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['rearwheeldrive'] = {
	label = 'Transmisión de la rueda trasera',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['oem_brakes'] = {
	label = 'Frenos OEM',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['oem_suspension'] = {
	label = 'Suspension OEM',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['oem_gearbox'] = {
	label = 'Caja de cambios OEM',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['elite_brakes'] = {
	label = 'Frenos Elite',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_suspension'] = {
	label = 'Suspension Elite',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_gearbox'] = {
	label = 'Caja de cambios Elite',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_clutch'] = {
	label = 'Embrague de transmisión Elite',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_flywheel'] = {
	label = 'Volante Elite',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_oil'] = {
	label = 'Aceite Elite',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_sparkplug'] = {
	label = 'Kit de bujías Elite',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_gasket'] = {
	label = 'Kit de juntas de culata Elite',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_airfilter'] = {
	label = 'Filtro de aire de admisión de élite',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_fuelinjector'] = {
	label = 'Inyectores de combustible de élite',
	weight = 150,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['elite_pistons'] = {
	label = 'Kit de Pistones Elite',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_connectingrods'] = {
	label = 'Kit de Bielas Elite',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_valves'] = {
	label = 'Kit de válvulas Elite',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_block'] = {
	label = 'Bloque de motor Elite',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_crankshaft'] = {
	label = 'Cigüeñal de élite',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_camshaft'] = {
	label = 'Árbol de levas de élite',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_brakes'] = {
	label = 'Frenos PRO',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_suspension'] = {
	label = 'Suspension PRO',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_gearbox'] = {
	label = 'Caja de cambios PRO',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_clutch'] = {
	label = 'Transmisión PRO',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_flywheel'] = {
	label = 'Volante PRO',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_oil'] = {
	label = 'Aceite PRO',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_sparkplug'] = {
	label = 'Kit de bujías PRO',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_gasket'] = {
	label = 'Kit de juntas de cabeza PRO',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_airfilter'] = {
	label = 'Filtro de aire de admisión PRO',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_fuelinjector'] = {
	label = 'Inyectores de combustible PRO',
	weight = 150,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['pro_pistons'] = {
	label = 'Kit de pistones PRO',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_connectingrods'] = {
	label = 'Kit de bielas PRO',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_valves'] = {
	label = 'Kit de válvulas PRO',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_block'] = {
	label = 'Bloque PRO',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_crankshaft'] = {
	label = 'Cigüeñal PRO',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_camshaft'] = {
	label = 'Árbol de levas PRO',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['racing_brakes'] = {
	label = 'Frenos de carrera',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_suspension'] = {
	label = 'Suspension de carrera',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_gearbox'] = {
	label = 'Caja de cambios de carrera',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_clutch'] = {
	label = 'Embrague de transmisión de carrera',
	weight = 100,
	stack = true,
	client = {
		--status = { hunger = -150000, thirst = -50000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_flywheel'] = {
	label = 'Volante de carrera',
	weight = 100,
	stack = true,
	client = {
		--status = { hunger = -150000, thirst = -50000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_oil'] = {
	label = 'Aceite de carrera',
	weight = 100,
	stack = true,
	client = {
		--status = { hunger = -150000, thirst = -50000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_sparkplug'] = {
	label = 'Kit de bugias de carrera',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_gasket'] = {
	label = 'Juego de juntas de culata de carrera',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_airfilter'] = {
	label = 'Filtro de aire de admisión de carrera',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_fuelinjector'] = {
	label = 'Inyectores de combustible de carrera',
	weight = 150,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['racing_pistons'] = {
	label = 'Kit de pistones de carrera',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_connectingrods'] = {
	label = 'Kit de bielas de carreras',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_valves'] = {
	label = 'Kit de válvulas de cabeza de carrera',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_block'] = {
	label = 'bloque de carrera',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_crankshaft'] = {
	label = 'Cigüeñal de carrera',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_camshaft'] = {
	label = 'Árbol de levas de carrera',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['ultimate_brakes'] = {
	label = 'Frenos Ultimate',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_suspension'] = {
	label = 'Suspension Ultimate',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_gearbox'] = {
	label = 'Caja de cambios ultimate',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_clutch'] = {
	label = 'Embrague de transmisión Ultimate',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_flywheel'] = {
	label = 'Volante Ultimate',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_oil'] = {
	label = 'Aceite Ultimate',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_sparkplug'] = {
	label = 'Kit de bujías Ultimate',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_gasket'] = {
	label = 'Kit de juntas de culata definitivo',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_airfilter'] = {
	label = 'Filtro de aire de admisión Ultimate',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_fuelinjector'] = {
	label = 'Inyectores de combustible Ultimate',
	weight = 150,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['ultimate_pistons'] = {
	label = 'Kit de pistones definitivo',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_connectingrods'] = {
	label = 'Kit definitivo de bielas',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_valves'] = {
	label = 'Kit de válvulas de cabeza Ultimate',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_block'] = {
	label = 'Bloque Ultimate',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_crankshaft'] = {
	label = 'Cigüeñal Ultimate',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_camshaft'] = {
	label = 'árbol de levas Ultimate',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['rubber'] = {
	label = 'Goma',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['sulfur'] = {
	label = 'Azufre',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['steel'] = {
	label = 'Acero',
	weight = 200,
	stack = true,
	close = true,
	description = nil,
},
['polyester'] = {
	label = 'Poliéster',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['bottle'] = {
	label = 'Botella',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['methane'] = {
	label = 'Methano',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['chip'] = {
	label = 'Chip',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['board'] = {
	label = 'Junta',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},

['copper'] = {
	label = 'Cobre',
	weight = 20,
	stack = true,
},

['iron'] = {
	label = 'Metal',
	weight = 20,
	stack = true,
},

['aluminum'] = {
	label = 'Aluminio',
	weight = 20,
	stack = true,
},

['topdress'] = {
		label 		= 'Vestido',
		description = 'Parte del torso',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d', flag = 51 },
			usetime = 1200,
		}
	},
  ['jacket'] = {
		label 		= 'Chaqueta',
		description = 'Abrigo',
		weight 		= 2,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d', flag = 51 },
			usetime = 1200,
		}
	},
  ['trousers'] = {
		label 		= 'Pantalones',
		description = 'La parte de abajo',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 're@construction', clip = 'out_of_breath', flag = 51 },
			usetime = 1200,
		}
	},
  ['shoes'] = {
		label 		= 'Calzados',
		description = 'Zapatillas, zapatos',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'random@domestic', clip = 'pickup_low', flag = 0 },
			usetime = 1200,
		}
	},
  ['hat'] = {
		label 		= 'Sombrero',
		description = 'Sombrero',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'missheist_agency2ahelmet', clip = 'take_off_helmet_stand', flag = 51 },
			usetime = 1200,
		}
	},
  ['glasses'] = {
		label 		= 'Anteojos',
		description = 'gafas, etc...',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'clothingspecs', clip = 'take_off', flag = 51 },
			usetime = 1200,
		}
	},
  ['earaccess'] = {
		label 		= 'Accesorios para las orejas',
		description = 'accesorios',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'mp_cp_stolen_tut', clip = 'b_think', flag = 51 },
			usetime = 1200,
		}
	},
  ['chain'] = {
		label 		= 'Accesorios de torso',
		description     = 'Accesorios de torso',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'clothingtie', clip = 'try_tie_positive_a', flag = 51 },
			usetime = 2500,
		}
	},
  ['watch'] = {
		label 		= 'Reloj',
		description     = 'Reloj de mano',
		weight 		= 1,
		stack 		= false,
		close 		= true,
		client = {
			anim = { dict = 'nmt_3_rcm-10', clip = 'cs_nigel_dual-10', flag = 51 },
			usetime = 900,
		}
	},
['vehicle_shell'] = {
    label = 'Carroceria de vehiculo',
    weight = 1,
    stack = false,
    close = true,
},

['vehicle_blueprints'] = {
    label = 'Carroceria de vehiculo',
    weight = 5,
    stack = false,
    close = true,
},

['door'] = {
    label = 'Puerta',
    weight = 2,
    stack = true,
    close = true,
},
['bonnet'] = {
    label = 'Capó',
    weight = 5,
    stack = false,
    close = true,
},
['trunk'] = {
    label = 'Baúl',
    weight = 5,
    stack = false,
    close = true,
},
['wheel'] = {
    label = 'Rueda',
    weight = 5,
    stack = false,
    close = true,
},
['seat'] = {
    label = 'Asiento',
    weight = 3,
    stack = false,
    close = true,
},
['engine'] = {
    label = 'Motor',
    weight = 25,
    stack = false,
    close = true,
},
['transmition'] = {
    label = 'transmisión',
    weight = 5,
    stack = false,
    close = true,
},
['exhaust'] = {
    label = 'Caño de escape',
    weight = 5,
    stack = false,
    close = false,
},
['brake'] = {
    label = 'Freno',
    weight = 1,
    stack = false,
    close = true,
},

['paint'] = {
    label = 'Pîntura',
    weight = 1,
    stack = false,
    close = true,
},

---• NOT SURE, IF THIS NEED TO BE IN THERE •---
['paint_white'] = {
    label = 'Blanco',
    weight = 1,
    stack = false,
    close = true,
},

['paint_red'] = {
    label = 'Rojo',
    weight = 1,
    stack = false,
    close = true,
},

['paint_pink'] = {
    label = 'Rosa',
    weight = 1,
    stack = false,
    close = true,
},

['paint_blue'] = {
    label = 'Azul',
    weight = 1,
    stack = False,
    close = false,
},

['paint_yellow'] = {
    label = 'Amarillo',
    weight = 1,
    stack = false,
    close = false,
},

['paint_green'] = {
    label = 'Verde',
    weight = 1,
    stack = false,
    close = false,
},

['paint_orange'] = {
    label = 'Naranja',
    weight = 1,
    stack = false,
    close = false,
},

['paint_brown'] = {
    label = 'Marron',
    weight = 1,
    stack = false,
    close = false,
},

['paint_purple'] = {
    label = 'Violeta',
    weight = 1,
    stack = false,
    close = false,
},

['paint_grey'] = {
    label = 'Gris',
    weight = 1,
    stack = false,
    close = false,
},

['paint_black'] = {
    label = 'Negro',
    weight = 1,
    stack = false,
    close = false,
},

['enginegago'] = {
    label = 'MOTOR',
    weight = 0,
    stack = false,
    close = true,
    description = 'Motor customizado'
},
  
	["turbostreet"] = {
		label = "Turbo de calle",
		weight = 1,
		stack = false,
		close = true,
	},

	["turboracing"] = {
		label = "Turbo de carrera",
		weight = 1,
		stack = false,
		close = true,
	},

	["turbosports"] = {
		label = "Turbo Deportivo",
		weight = 1,
		stack = false,
		close = true,
	},

	["turboultimate"] = {
		label = "Turbo Ultimate",
		weight = 1,
		stack = false,
		close = true,
	},

['facemask'] = {
	label = 'Barbijo',
	description = 'Te protege del covid',
	weight = 115,
	consume = 0.2,
	client = {
		export = 'renzu_illness.faceMask',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['multivitamins'] = {
	label = 'Eternal Multi Vitamins',
	description = 'Multivitamins contain micronutrients to help your overall health.',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['diatabs'] = {
	label = 'Diatabs',
	description = 'Helps reduce Diarrea',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['acetaminophen'] = {
	label = 'Acetaminophen',
	description = 'Helps reduce fever cause by dengue',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},
['offlotion'] = {
	label = 'Off Lotion',
	description = 'Helps Mosquito stay away',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['antihistamine'] = {
	label = 'Anti Histamine',
	description = 'Antihistamines are drugs which treat allergic rhinitis, common cold, influenza, and other allergies like chikenpox.',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['ambroxol'] = {
	label = 'Ambroxol',
	description = 'Ambroxol is used for conditions where there are a lot of thick mucus in the airway passages.',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['baraclude'] = {
	label = 'Baraclude',
	description = 'helps to decrease the amount of hepatitis B virus in your body',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['metronidazole'] = {
	label = 'Metronidazole',
	description = 'Metronidazole is an antibiotic that is used to treat a wide variety of infections. like Tetanus',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},

['molnupiravir'] = {
	label = 'Molnupiravir',
	description = 'Molnupiravir is authorized for the treatment of mild-to-moderate COVID-19 in adults 18',
	weight = 115,
	client = {
		export = 'renzu_illness.useItem',
		anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
		disable = { move = true, car = true, combat = true },
		usetime = 2500,
	}
},


	["silver_bar"] = {
		label = "Silver Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["silver_ore"] = {
		label = "Silver ore",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron_ore"] = {
		label = "Iron ore",
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
		label = "Spray Remover",
		weight = 1,
		stack = true,
		close = true,
	},

	["pickaxe"] = {
		label = "Pickaxe",
		weight = 5000,
		stack = false,
		close = true,
	},

	["coal"] = {
		label = "Coal",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold_ore"] = {
		label = "Gold ore",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold_bar"] = {
		label = "Gold Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron_bar"] = {
		label = "Iron Bar",
		weight = 1,
		stack = true,
		close = true,
	},

['racingtablet'] = {
    label = 'Racing tablet',
    weight = 1,
    description = 'Seems like something to do with cars.',
    stack = false,
    client = {
        export = 'rahe-racing.racingtablet',
    }
},


	["bironlack_spray_paint"] = {
		label = "Bironlack Spray Paint",
		weight = 1,
		stack = true,
		close = true,
	},

	["sponge"] = {
		label = "Esponja",
		weight = 1,
		stack = true,
		close = true,
	},

	["general_spray_paint"] = {
		label = "Spray de pintura comun",
		weight = 1,
		stack = true,
		close = true,
	},

	["meat"] = {
		label = "Carne fresca",
		weight = 1,
		stack = true,
		close = true,
	},

	["leather"] = {
		label = "Cuero",
		weight = 1,
		stack = true,
		close = true,
	},

	["towing_rope"] = {
		label = "Soga de remolque",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldbar"] = {
		label = "Lingote de oro",
		weight = 100,
		stack = true,
		close = true,
	},

	["goldwatch"] = {
		label = "Reloj de oro",
		weight = 200,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Taladro",
		weight = 1,
		stack = true,
		close = true,
	},

	["accesscard"] = {
		label = "Tarjeta de acceso",
		weight = 10,
		stack = true,
		close = true,
	},

	["hackerDevice"] = {
		label = "Dispositivo para hacking",
		weight = 10,
		stack = true,
		close = true,
	},

	["hammerwirecutter"] = {
		label = "Herramientas para cortar toda la luz",
		weight = 10,
		stack = true,
		close = true,
	},

	["goldnecklace"] = {
		label = "Collar de oro",
		weight = 150,
		stack = true,
		close = true,
	},

	["bag"] = {
		label = "Bolso",
		weight = 1,
		stack = true,
		close = true,
	},

	["thermite_bomb"] = {
		label = "Bomba de termita",
		weight = 1,
		stack = true,
		close = true,
	},

	["c4_bomb"] = {
		label = "Bomba C4",
		weight = 1,
		stack = true,
		close = true,
	},

	["laptop"] = {
		label = "Notebook",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutter"] = {
		label = "Cutter",
		weight = 1,
		stack = true,
		close = true,
	},

	["hack_usb"] = {
		label = "Pendrive con malware",
		weight = 1,
		stack = true,
		close = true,
	},

	["gas_bomb"] = {
		label = "Bomba de gas",
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

	["laptop_h"] = {
		label = "Laptop Hacker",
		weight = 1,
		stack = true,
		close = true,
	},

	["carparts"] = {
		label = "Pièces de carrosseries",
		weight = -1,
		stack = true,
		close = true,
	},

	["ticket"] = {
		label = "Tickets de prison",
		weight = -1,
		stack = true,
		close = true,
	},

	["mining_goldnugget"] = {
		label = "Pepita de oro",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_ironbar"] = {
		label = "Lingote de metal",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_ironfragment"] = {
		label = "Fragmento de metal",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_pan"] = {
		label = "Cepillo para piedras",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_pickaxe"] = {
		label = "Pico",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_stone"] = {
		label = "Piedra",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_washedstone"] = {
		label = "Piedra lavada",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_copperbar"] = {
		label = "Lingote de cobre",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_copperfragment"] = {
		label = "Fragmento de cobre",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_goldbar"] = {
		label = "Lingote de oro",
		weight = 1,
		stack = true,
		close = true,
	},

	["emerald"] = {
		label = "Emerald",
		weight = 200,
		stack = true,
		close = true,
	},
	['backpack'] = {
		label = 'backpack',
		weight = 20,
		stack = false,
		consume = 0,
		client = {
			export = 'wasabi_backpack.openBackpack'
		}
	},

	["tree_bark"] = {
		label = "tree_bark",
		weight = 1,
		stack = true,
		close = true,
	},

	["tree_lumber"] = {
		label = "tree_lumber",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood_plank "] = {
		label = "wood_plank ",
		weight = 1,
		stack = true,
		close = true,
	},

	["processed_wood"] = {
		label = "processed wood",
		weight = 15,
		stack = false,
		close = true,
	},

	["gatom"] = {
		label = "Gato Muerto",
		weight = 1,
		stack = true,
		close = true,
	},

	["plastico"] = {
		label = "Plastico",
		weight = 1,
		stack = true,
		close = true,
	},

	["polvora"] = {
		label = "Polvora",
		weight = 1,
		stack = true,
		close = true,
	},

	["armas"] = {
		label = "Caja de armas",
		weight = 1,
		stack = true,
		close = true,
	},

	["14r1"] = {
		label = "Yamaha R1 [14r1]",
		weight = 1,
		stack = true,
		close = true,
	},

	["180sx"] = {
		label = "Nissan 180SX [180sx]",
		weight = 1,
		stack = true,
		close = true,
	},

	["2020rmz"] = {
		label = "Suzuki RMZ450 [2020rmz]",
		weight = 1,
		stack = true,
		close = true,
	},

	["206fn"] = {
		label = "Peugeot 206 [206fn]",
		weight = 1,
		stack = true,
		close = true,
	},

	["22b"] = {
		label = "Subaru Impreza [22b]",
		weight = 1,
		stack = true,
		close = true,
	},

	["240sxhr"] = {
		label = "Nissan 240Sx [240sxhr]",
		weight = 1,
		stack = true,
		close = true,
	},

	["4881"] = {
		label = "Ferrari 488 [4881]",
		weight = 1,
		stack = true,
		close = true,
	},

	["500abarth"] = {
		label = "Fiat 500 Abarth [500abarth]",
		weight = 1,
		stack = true,
		close = true,
	},

	["amarok"] = {
		label = "Volkswagen Amarok [amarok]",
		weight = 1,
		stack = true,
		close = true,
	},

	["artura22wb"] = {
		label = "Mclaren Artura [artura22wb]",
		weight = 1,
		stack = true,
		close = true,
	},

	["autos1"] = {
		label = "Caja de Autos t1",
		weight = 1,
		stack = true,
		close = true,
	},

	["autos2"] = {
		label = "Caja de Autos t2",
		weight = 1,
		stack = true,
		close = true,
	},

	["autos3"] = {
		label = "Caja de Autos t3",
		weight = 1,
		stack = true,
		close = true,
	},

	["gcmpanameratst21"] = {
		label = "Porsche Panamera [gcmpanameratst21]",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldwing"] = {
		label = "Honda Goldwing 1800 [goldwing]",
		weight = 1,
		stack = true,
		close = true,
	},

	["porrs73"] = {
		label = "Porsche 911 Carrera 1973 [porrs73]",
		weight = 1,
		stack = true,
		close = true,
	},

	["gs1200"] = {
		label = "BMW GS1200R [gs1200]",
		weight = 1,
		stack = true,
		close = true,
	},

	["gsxr19"] = {
		label = "Suzuki GSX R1000R [gsxr19]",
		weight = 1,
		stack = true,
		close = true,
	},

	["gt17"] = {
		label = "Ford GT 40 Vip Edition [gt17]",
		weight = 1,
		stack = true,
		close = true,
	},

	["gt63samg"] = {
		label = "Mercedes benz GT 63 [gt63samg]",
		weight = 1,
		stack = true,
		close = true,
	},

	["gxone"] = {
		label = "Koegnisegg Agera GX One [gxone]",
		weight = 1,
		stack = true,
		close = true,
	},

	["rmodi8mlb"] = {
		label = "BMW I8 [rmodi8mlb]",
		weight = 1,
		stack = true,
		close = true,
	},

	["rmodmustang"] = {
		label = "Ford Mustang GT BOSS [rmodmustang]",
		weight = 1,
		stack = true,
		close = true,
	},

	["Hayabusa"] = {
		label = "Suzuki Hayabusa [Hayabusa]",
		weight = 1,
		stack = true,
		close = true,
	},

	["HDIron883"] = {
		label = "Harley Davidson Iron 883 [HDIron883]",
		weight = 1,
		stack = true,
		close = true,
	},

	["senna"] = {
		label = "Mclaren Senna [senna]",
		weight = 1,
		stack = true,
		close = true,
	},

	["hycadeevo"] = {
		label = "Mitsubishi Evo3 VIP EDITION [190eevo3]",
		weight = 1,
		stack = true,
		close = true,
	},

	["Imola"] = {
		label = "Pagani Huayra Vip Edition [lmola]",
		weight = 1,
		stack = true,
		close = true,
	},

	["bnr32"] = {
		label = "Nissan GTR R32 [bnr32]",
		weight = 1,
		stack = true,
		close = true,
	},

	["boricua"] = {
		label = "Volkswagen Bora [boricua]",
		weight = 1,
		stack = true,
		close = true,
	},

	["items"] = {
		label = "Caja de items",
		weight = 1,
		stack = true,
		close = true,
	},

	["katana2"] = {
		label = "Suzuki Katana [katana2]",
		weight = 1,
		stack = true,
		close = true,
	},

	["zx10r"] = {
		label = "Kawazaki Zx10R [zx10r]",
		weight = 1,
		stack = true,
		close = true,
	},

	["rc213vs"] = {
		label = "Honda Rcv 213s [rc213vs]",
		weight = 1,
		stack = true,
		close = true,
	},

	["superlag12"] = {
		label = "Ducati Panigale 1299 Super leggera [superlag12]",
		weight = 1,
		stack = true,
		close = true,
	},

	["lbdy01"] = {
		label = "Lamborghini Veneno [lbdy01]",
		weight = 1,
		stack = true,
		close = true,
	},

	["cb650r"] = {
		label = "Honda CB650R [cb650r]",
		weight = 1,
		stack = true,
		close = true,
	},

	["cbr1000rrr"] = {
		label = "Honda CBR 1000 [cbr1000rrr]",
		weight = 1,
		stack = true,
		close = true,
	},

	["cbtwister"] = {
		label = "Honda twister 250 [cbtwister]",
		weight = 1,
		stack = true,
		close = true,
	},

	["celgt4"] = {
		label = "Toyota Celica [celgt4]",
		weight = 1,
		stack = true,
		close = true,
	},

	["choilambo"] = {
		label = "Choi Lamborghini Huracan [choilambo]",
		weight = 1,
		stack = true,
		close = true,
	},

	["clio"] = {
		label = "Clio Williams [clio]",
		weight = 1,
		stack = true,
		close = true,
	},

	["RufusVanquish"] = {
		label = "Aston Martin Vanquish [RufusVanquish]",
		weight = 1,
		stack = true,
		close = true,
	},

	["motos1"] = {
		label = "Caja de motos t1",
		weight = 1,
		stack = true,
		close = true,
	},

	["motos2"] = {
		label = "Caja de motos t2",
		weight = 1,
		stack = true,
		close = true,
	},

	["mt03"] = {
		label = "Yamaha MT03 [mt03]",
		weight = 1,
		stack = true,
		close = true,
	},

	["mt10"] = {
		label = "Yamaha MT10 [mt10]",
		weight = 1,
		stack = true,
		close = true,
	},

	["mv2019"] = {
		label = "MV Augusta Brutale 1000 [mv2019]",
		weight = 1,
		stack = true,
		close = true,
	},

	["desmo"] = {
		label = "Ducati Desmo Desmosedici [desmo]",
		weight = 1,
		stack = true,
		close = true,
	},

	["nh2r"] = {
		label = "Kawazaki H2R [nh2r]",
		weight = 1,
		stack = true,
		close = true,
	},

	["toysupmk4"] = {
		label = "Toyota Supra Mk4 [toysupmk4]",
		weight = 1,
		stack = true,
		close = true,
	},

	["tmax"] = {
		label = "Yamaha TMax 500 [tmax]",
		weight = 1,
		stack = true,
		close = true,
	},

	["ek9"] = {
		label = "Honda Civic Ek9 [ek9]",
		weight = 1,
		stack = true,
		close = true,
	},

	["srad"] = {
		label = "Suzuki GSX R750 [srad]",
		weight = 1,
		stack = true,
		close = true,
	},

	["smc690"] = {
		label = "KTM 690R [smc690]",
		weight = 1,
		stack = true,
		close = true,
	},

	["skyline"] = {
		label = "Nissan GTR R34 [skyline]",
		weight = 1,
		stack = true,
		close = true,
	},

	["yzfsm"] = {
		label = "Yamaha Yz450F [yzfsm]",
		weight = 1,
		stack = true,
		close = true,
	},

	["z32"] = {
		label = "Nissan 300Zx [z32]",
		weight = 1,
		stack = true,
		close = true,
	},

	["filthynsx"] = {
		label = "Honda NSX VIP EDITION [filthynsx]",
		weight = 1,
		stack = true,
		close = true,
	},

	["r6"] = {
		label = "Yamaha R6",
		weight = 1,
		stack = true,
		close = true,
	},

	["r1250r"] = {
		label = "BMW R1250R [r1250r]",
		weight = 1,
		stack = true,
		close = true,
	},

	["na1"] = {
		label = "Honda NSX R1 [na1]",
		weight = 1,
		stack = true,
		close = true,
	},

	["focusrs"] = {
		label = "Focus RS [focusrs]",
		weight = 1,
		stack = true,
		close = true,
	},

	["casino_chips"] = {
		label = "Fichas de casino",
		weight = 1,
		stack = true,
		close = true,
	},

	["indiancdh"] = {
		label = "Indian Chief Dark Horse [indiancdh]",
		weight = 1,
		stack = true,
		close = true,
	},

	["lgss"] = {
		label = "Lamborghini Gallarado [lgss]",
		weight = 1,
		stack = true,
		close = true,
	},

	["lhuracan"] = {
		label = "Lamborghini Huracan [lhuracan]",
		weight = 1,
		stack = true,
		close = true,
	},

	["stol"] = {
		label = "Table",
		weight = 1,
		stack = true,
		close = true,
	},

	["femaleseed"] = {
		label = "Female Seed",
		weight = 1,
		stack = true,
		close = true,
	},

	["fertilizer"] = {
		label = "Fertilizer",
		weight = 3,
		stack = true,
		close = true,
	},

	["wetbud"] = {
		label = "Wet Bud",
		weight = 1,
		stack = true,
		close = true,
	},

	["ventilator"] = {
		label = "Ventialor",
		weight = 1,
		stack = true,
		close = true,
	},

	["bengala"] = {
		label = "bengala",
		weight = 1,
		stack = true,
		close = true,
	},

	["grijalica"] = {
		label = "Grijalica",
		weight = 1,
		stack = true,
		close = true,
	},

	["bottledwater"] = {
		label = "Water",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocaine"] = {
		label = "Lademaradona",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocaine_processing_table"] = {
		label = "Tabla de procesamiento quimico",
		weight = 1,
		stack = true,
		close = true,
	},

	["coca_seed"] = {
		label = "Semilla de coca",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_lemonhaze_seed"] = {
		label = "Semilla LemonHaze Feminizada",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_lemonhaze"] = {
		label = "Cogollos LemonHaze",
		weight = 1,
		stack = true,
		close = true,
	},

	["casino_ticket"] = {
		label = "Ticket de casino",
		weight = 1,
		stack = true,
		close = true,
	},

	["coca"] = {
		label = "Hoja de coca",
		weight = 1,
		stack = true,
		close = true,
	},

	["pgt3rs19"] = {
		label = "Porsche 911 GT3 RS [pgt3rs19]",
		weight = 1,
		stack = true,
		close = true,
	},

	["gxa90"] = {
		label = "Toyota Supra MK5 [gxa90]",
		weight = 1,
		stack = true,
		close = true,
	},

	["ocnetrongt"] = {
		label = "Audi E-TRON [ocnetrongt]",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_ak47_seed"] = {
		label = "Semilla Feminizada de Ak47",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_ak47"] = {
		label = "Flores AK47",
		weight = 1,
		stack = true,
		close = true,
	},

	["stock_tires"] = {
		label = "Neumaticos Stock",
		weight = 1,
		stack = true,
		close = true,
	},

	["shark"] = {
		label = "Shark",
		weight = 10,
		stack = false,
		close = true,
	},

	["turtlebait"] = {
		label = "Carnada de tortuga",
		weight = 2,
		stack = true,
		close = true,
	},

	["fishbait"] = {
		label = "Carnada para peces",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingrod"] = {
		label = "Caña de pescar",
		weight = 2,
		stack = true,
		close = true,
	},

	["turtle"] = {
		label = "Tortuga Marina",
		weight = 3,
		stack = false,
		close = true,
	},

	["stingray"] = {
		label = "Manta Raya",
		weight = 5,
		stack = false,
		close = true,
	},

	["killerwhale"] = {
		label = "Orca",
		weight = 20,
		stack = false,
		close = true,
	},

	["sharkhammer"] = {
		label = "Tiburon Martillo",
		weight = 8,
		stack = false,
		close = true,
	},

	["sharktiger"] = {
		label = "Tiburon Tigre",
		weight = 12,
		stack = false,
		close = true,
	},

	["dolphin"] = {
		label = "Delfin",
		weight = 10,
		stack = false,
		close = true,
	},
['moneywash_keycard'] = {
	label = 'Tarjeta para lavanderia',
	weight = 1,
	stack = false,
	description = 'This can be used to access the LaundryMat.'
},

['moneywash_ticket'] = {
	label = 'Ticket de lavado',
	weight = 1,
	stack = false,
	description = 'This can be used at the LaundryMat to start a wash.'
},

	["grandmcextreme"] = {
		label = "Grand McExtreme",
		weight = 1,
		stack = true,
		close = true,
	},

	["topfries"] = {
		label = "Top Fries",
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

	["mcfish"] = {
		label = "McFish",
		weight = 1,
		stack = true,
		close = true,
	},

	["agua"] = {
		label = "Water",
		weight = 1,
		stack = true,
		close = true,
	},

	["mcroyaldeluxe"] = {
		label = "McRoyal Deluxe",
		weight = 1,
		stack = true,
		close = true,
	},

	["cbo"] = {
		label = "CBO",
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

	["hamburgesa"] = {
		label = "Burger",
		weight = 1,
		stack = true,
		close = true,
	},

	["hamburgesadepollo"] = {
		label = "Chicken Burger",
		weight = 1,
		stack = true,
		close = true,
	},

	["cerveza"] = {
		label = "Beer",
		weight = 1,
		stack = true,
		close = true,
	},

	["happymeal"] = {
		label = "Happy Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["patatasfritas"] = {
		label = "Chips",
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

	["monsterenergy"] = {
		label = "Monster Energy",
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

	["bigchickensupreme"] = {
		label = "Big Chicken Supreme",
		weight = 1,
		stack = true,
		close = true,
	},

	["bigcrispybbq"] = {
		label = "Big Crispy BBQ",
		weight = 1,
		stack = true,
		close = true,
	},

	["bigdoublecheese"] = {
		label = "Big Double Cheese",
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

	["colacao"] = {
		label = "Colacao",
		weight = 1,
		stack = true,
		close = true,
	},

	["combomeal"] = {
		label = "Combo Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["mcpollo"] = {
		label = "McChibken",
		weight = 1,
		stack = true,
		close = true,
	},

	["cuartodelibra"] = {
		label = "Quarter Pounder",
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

	["cocacola"] = {
		label = "Coca-Cola",
		weight = 1,
		stack = true,
		close = true,
	},

        ["curitas"] = {
		label = "Vendas",
		weight = 1,
		stack = true,
		close = true,
	},

        ["mkit"] = {
		label = "MediKit",
		weight = 10,
		stack = true,
		close = true,
	},

        ["paracetamol"] = {
		label = "Antibioticos",
		weight = 1,
		stack = true,
		close = true,
	}, 

	["bubleetea"] = {
		label = "BubleeTea",
		weight = 1,
		stack = true,
		close = true,
	},
        ["capuchino"] = {
		label = "Capuchino",
		weight = 1,
		stack = true,
		close = true,
	},
        ["dango"] = {
		label = "Dango",
		weight = 1,
		stack = true,
		close = true,
	},
        ["donas"] = {
		label = "Donas",
		weight = 1,
		stack = true,
		close = true,
	},
        ["flan"] = {
		label = "Flan",
		weight = 1,
		stack = true,
		close = true,
	},
       ["frapuchino"] = {
		label = "Frapuchino",
		weight = 1,
		stack = true,
		close = true,
	},
       ["galletita"] = {
		label = "Galletita",
		weight = 1,
		stack = true,
		close = true,
	},
       ["galletitafortuna"] = {
		label = "Galleta Fortuna",
		weight = 1,
		stack = true,
		close = true,
	},
       ["helados"] = {
		label = "Helado",
		weight = 1,
		stack = true,
		close = true,
	},
       ["jugodenaranja"] = {
		label = "Jugo",
		weight = 1,
		stack = true,
		close = true,
	},
       ["leche"] = {
		label = "Leche",
		weight = 1,
		stack = true,
		close = true,
	},
       ["manzanacaramelo"] = {
		label = "Manzana Caramelizada",
		weight = 1,
		stack = true,
		close = true,
	},
       ["helado"] = {
		label = "Helado",
		weight = 1,
		stack = true,
		close = true,
	},
       ["milkshake"] = {
		label = "MilkShake",
		weight = 1,
		stack = true,
		close = true,
	},
       ["mocha"] = {
		label = "Mocha",
		weight = 1,
		stack = true,
		close = true,
	},
       ["pastel"] = {
		label = "Pastel",
		weight = 1,
		stack = true,
		close = true,
	},
       ["tecaliente"] = {
		label = "Té",
		weight = 1,
		stack = true,
		close = true,
	},
       ["tostadas"] = {
		label = "Tostada",
		weight = 1,
		stack = true,
		close = true,
	},
       ["uwucoffee"] = {
		label = "Café",
		weight = 1,
		stack = true,
		close = true,
	},
       ["wafles"] = {
		label = "Waffles",
		weight = 1,
		stack = true,
		close = true,
	},


	["vehgps"] = {
		label = "Vehicle GPS",
		weight = 1,
		stack = true,
		close = true,
	},

	["repairkit"] = {
		label = "Repair Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["bulletproof"] = {
		label = "Bullet-Proof Vest",
		weight = 1,
		stack = true,
		close = true,
	},

	["weabox"] = {
		label = "Weapon Box",
		weight = 1,
		stack = true,
		close = true,
	},

	["weaclip"] = {
		label = "Weapon Clip",
		weight = 1,
		stack = true,
		close = true,
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxygenmask"] = {
		label = "Oxygen Mask",
		weight = 1,
		stack = true,
		close = true,
	},

	["tirekit"] = {
		label = "Tire Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["firstaidkit"] = {
		label = "First Aid Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["firstaidkit"] = {
		label = "First Aid Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["champagne"] = {
		label = "Champagne",
		weight = 1,
		stack = true,
		close = true,
	},

	["daiquiri"] = {
		label = "Daiquiri",
		weight = 1,
		stack = true,
		close = true,
	},

	["sangria"] = {
		label = "Sangria",
		weight = 1,
		stack = true,
		close = true,
	},

	["beer"] = {
		label = "Cerveza",
		weight = 1,
		stack = true,
		close = true,
	},

	["tequila"] = {
		label = "Tequila",
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

	["whisky"] = {
		label = "Whisky",
		weight = 1,
		stack = true,
		close = true,
	},

	["fernet"] = {
		label = "Fernet",
		weight = 1,
		stack = true,
		close = true,
	},

	["gancia"] = {
		label = "Gancia",
		weight = 1,
		stack = true,
		close = true,
	},

	["cubalibre"] = {
		label = "Cuba Libre",
		weight = 1,
		stack = true,
		close = true,
	},

	["vodka"] = {
		label = "Vodka",
		weight = 1,
		stack = true,
		close = true,
	},

	["wine"] = {
		label = "Vino",
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

	["capirinha"] = {
		label = "Capirinha",
		weight = 1,
		stack = true,
		close = true,
	},

	["margarita"] = {
		label = "Margarita",
		weight = 1,
		stack = true,
		close = true,
	},

	["coffee"] = {
		label = "Café",
		weight = 1,
		stack = true,
		close = true,
	},

	["cola"] = {
		label = "Manaos",
		weight = 1,
		stack = true,
		close = true,
	},

	["mcdonalds_drink"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["juice_orage"] = {
		label = "Bagio de naranja",
		weight = 1,
		stack = true,
		close = true,
	},

	["redgull"] = {
		label = "Redbull",
		weight = 1,
		stack = true,
		close = true,
	},

	["water"] = {
		label = "Agua",
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

	["energy"] = {
		label = "Monster",
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

	["loka"] = {
		label = "Vino toro",
		weight = 1,
		stack = true,
		close = true,
	},

	["quini"] = {
		label = "Boleto Quini",
		weight = 1,
		stack = true,
		close = true,
	},

	["pron"] = {
		label = "Revista Playboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["cigar"] = {
		label = "Habano",
		weight = 1,
		stack = true,
		close = true,
	},

	["cigarett"] = {
		label = "Red Point suelto",
		weight = 1,
		stack = true,
		close = true,
	},

	["cigarettepack"] = {
		label = "Camel",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple"] = {
		label = "Manzana",
		weight = 1,
		stack = true,
		close = true,
	},

	["banana"] = {
		label = "Banana",
		weight = 1,
		stack = true,
		close = true,
	},

	["lays"] = {
		label = "Lays",
		weight = 1,
		stack = true,
		close = true,
	},

	["fr_fries"] = {
		label = "Papas fritas",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheesebows"] = {
		label = "Chisitos",
		weight = 1,
		stack = true,
		close = true,
	},

	["marabou"] = {
		label = "Macritas",
		weight = 1,
		stack = true,
		close = true,
	},

	["donut_sby"] = {
		label = "Dona Frutilla",
		weight = 1,
		stack = true,
		close = true,
	},

	["donut_chc"] = {
		label = "Dona Chocolate",
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

	["macka"] = {
		label = "Maruchan",
		weight = 1,
		stack = true,
		close = true,
	},

	["sportlunch"] = {
		label = "Almuerzo saludable",
		weight = 1,
		stack = true,
		close = true,
	},

	["pizza_pep"] = {
		label = "Pizza",
		weight = 1,
		stack = true,
		close = true,
	},

	["taco3"] = {
		label = "Taco",
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

	["burguer"] = {
		label = "Hamburguesa",
		weight = 1,
		stack = true,
		close = true,
	},

	["sandwich"] = {
		label = "Sanguche",
		weight = 1,
		stack = true,
		close = true,
	},

	["spikespack"] = {
		label = "Pinchos",
		weight = 1,
		stack = true,
		close = true,
	},

	["drugscales"] = {
		label = "Balanza",
		weight = -1,
		stack = true,
		close = true,
	},

	["lowgradefemaleseed"] = {
		label = "Semilla feminizada Regular",
		weight = -1,
		stack = true,
		close = true,
	},

	["lowgradefert"] = {
		label = "Fertilizante de baja calidad",
		weight = -1,
		stack = true,
		close = true,
	},

	["bagofdope"] = {
		label = "Bolsa con flores",
		weight = -1,
		stack = true,
		close = true,
	},

	["highgradefemaleseed"] = {
		label = "Semilla feminizada Premium",
		weight = -1,
		stack = true,
		close = true,
	},

	["highgradefert"] = {
		label = "Fertilizante deluxe",
		weight = -1,
		stack = true,
		close = true,
	},

	["trimmedweed"] = {
		label = "Marihuana cosechada",
		weight = -1,
		stack = true,
		close = true,
	},

	["wateringcan"] = {
		label = "Regadera",
		weight = -1,
		stack = true,
		close = true,
	},

	["purifiedwater"] = {
		label = "Agua Purificada",
		weight = -1,
		stack = true,
		close = true,
	},

	["dopebag"] = {
		label = "Bolsa Ziplock",
		weight = -1,
		stack = true,
		close = true,
	},

	["plantpot"] = {
		label = "Maceta",
		weight = -1,
		stack = true,
		close = true,
	},

	["codeine"] = {
		label = "Codeine",
		weight = 1,
		stack = true,
		close = true,
	},

	["highgrademaleseed"] = {
		label = "Male Dope Seed+",
		weight = -1,
		stack = true,
		close = true,
	},

	["hydrogen"] = {
		label = "Hydrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice"] = {
		label = "Ice",
		weight = 1,
		stack = true,
		close = true,
	},

	["carbon"] = {
		label = "Carbon",
		weight = 1,
		stack = true,
		close = true,
	},

	["muriatic_acid"] = {
		label = "Muriatic Acid",
		weight = 1,
		stack = true,
		close = true,
	},

	["drink_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_ecstasy"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_lean"] = {
		label = "Lean",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_lsd"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_meth"] = {
		label = "Meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["nitrogen"] = {
		label = "Nitrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxygen"] = {
		label = "Oxygen",
		weight = 1,
		stack = true,
		close = true,
	},

	["sodium_hydroxide"] = {
		label = "Sodium hydroxide",
		weight = 1,
		stack = true,
		close = true,
	},

	["pseudoefedrine"] = {
		label = "Pseudoefedrine",
		weight = 1,
		stack = true,
		close = true,
	},

	["liquid_sulfur"] = {
		label = "Liquid Sulfur",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_sulfur"] = {
		label = "Red Sulfur",
		weight = 1,
		stack = true,
		close = true,
	},

	["jolly_ranchers"] = {
		label = "Jolly Ranchers",
		weight = 1,
		stack = true,
		close = true,
	},

	["ammonium_nitrate"] = {
		label = "Ammonium nitrate",
		weight = 1,
		stack = true,
		close = true,
	},

	["lowgrademaleseed"] = {
		label = "Male Dope Seed",
		weight = -1,
		stack = true,
		close = true,
	},

	["cajaloteria"] = {
		label = "Caja de loteria",
		weight = 1,
		stack = true,
		close = true,
	},

	["cajapolenta"] = {
		label = "Caja de polenta",
		weight = 1,
		stack = true,
		close = true,
	},

	["mazdaanime"] = {
		label = "Mazda F-RX7 Anime Edition [mazdaanime]",
		weight = 1,
		stack = true,
		close = true,
	},

	["evija"] = {
		label = "Lotus Evija [evija]",
		weight = 1,
		stack = true,
		close = true,
	},

	["autos4"] = {
		label = "Caja de autos T4",
		weight = 1,
		stack = true,
		close = true,
	},

	["r35lb"] = {
		label = "GTR R35 Lightning [r35lb]",
		weight = 1,
		stack = true,
		close = true,
	},

	["bbdawn"] = {
		label = "Rolls Royce BBDawn [bbdawn]",
		weight = 1,
		stack = true,
		close = true,
	},

	["bcps"] = {
		label = "Bugatti Chiron Lightning [bcps]",
		weight = 1,
		stack = true,
		close = true,
	},

	["mclareng"] = {
		label = "Mclaren Prototype [mclareng]",
		weight = 1,
		stack = true,
		close = true,
	},

	["cajarandom"] = {
		label = "Caja Random",
		weight = 1,
		stack = true,
		close = true,
	},

	["laferrari17"] = {
		label = "Ferrari La Ferrari Lightning [laferrari17]",
		weight = 1,
		stack = true,
		close = true,
	},

	["190eevo3"] = {
		label = "Mitsubishi Evo 3 Lightning [190eevo3]",
		weight = 1,
		stack = true,
		close = true,
	},
}