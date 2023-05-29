
Config.TiempoDeEspera    = 300 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Bancos = {
	["fleeca2"] = {
		position = vector3(-2952.97, 484.44, 15.68),
		recompensa = math.random(250000,300000),
		nombreDeTienda = "Banco Fleeca (Costa)",
		tiempoDeRobo = 300, -- seconds
		CantidadGna = 3,
		lastRobbed = 0
	},
	["blainecounty"] = {
		position = vector3(-103.61, 6477.79, 31.63),
		recompensa = math.random(300000,600000),
		nombreDeTienda = "Banco Paleto",
		tiempoDeRobo = 300, -- seconds
		CantidadGna = 3,
		lastRobbed = 0
	},
	["PrincipalBank"] = {
		position = vector3(265.58, 213.63, 101.68),
		recompensa = math.random(4000000,7500000),
		nombreDeTienda = "Banco Central",
		tiempoDeRobo = 360, -- seconds
		CantidadPolis = 5,
		lastRobbed = 0
	},
	["fleecahospital"] = {
		position = vector3(312.64, -288.88, 54.14),
		recompensa = math.random(250000,300000),
		nombreDeTienda = "Banco Fleeca (Hospital)",
		tiempoDeRobo = 360, -- seconds
		CantidadPolis = 2,
		lastRobbed = 0
	},
	["fleecataller"] = {
		position = vector3(-352.14, -59.76, 49.01),
		recompensa = math.random(250000,300000),
		nombreDeTienda = "Banco Fleeca (Taller)",
		tiempoDeRobo = 360, -- seconds
		CantidadPolis = 3,
		lastRobbed = 0
	},
	["fleecalife"] = {
		position = vector3(-1206.6, -338.48, 37.76),
		recompensa = math.random(250000,300000),
		nombreDeTienda = "Banco Fleeca (Life)",
		tiempoDeRobo = 360, -- seconds
		CantidadPolis = 2,
		lastRobbed = 0
	},
	["fleecasandy"] = {
		position = vector3(1173.04, 2716.55, 38.07),
		recompensa = math.random(250000,300000),
		nombreDeTienda = "Banco Fleeca (Sandy shores)",
		tiempoDeRobo = 360, -- seconds
		CantidadGna = 3,
		lastRobbed = 0
	}

}