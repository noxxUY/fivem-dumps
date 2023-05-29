Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 19, g = 173, b = 42, a = 100,  -- red color 24, 84, 40 
	x = 0.6, y = 0.6, z = 0.8,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 29    -- default circle type, low draw distance due to indoors area
}

Config.TiempoDeEspera    = 300 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.PagarEnNegro = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = vector3(1736.32, 6419.47,35.03),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Tienda Paleto Bay",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadGna = 1,
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = vector3(1961.24, 3749.46, 32.34),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Tienda Sandy Shores",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadGna = 1,
		lastRobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = vector3(-709.17, -904.21, 19.21),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Tienda 3x1 (Little Seoul)",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 1,
		lastRobbed = 0
	},
	["bar_one"] = {
		position = vector3(1990.57, 3044.95, 47.21),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Yellow Jack. (Sandy Shores)",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadGna = 1,
		lastRobbed = 0

	},
	["rancho_liquor"] = {
		position = vector3(1126.80, -980.40, 45.41),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Licorería El Rancho Blvd",
		blipRobo = "Robo a licorería",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 1,
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = vector3(-1219.85, -916.27, 11.32),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Licorería San Andreas Avenue",
		blipRobo = "Robo a licorería",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 1,
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = vector3(-43.40, -1749.20, 29.42),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Tienda Grove Street",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 1,
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = vector3(1160.67, -314.40, 69.20),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Tienda Mirror Park Boulevard",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 1,
		lastRobbed = 0
	},
	["tienda_puti"] = {
		position = vector3(30.65, -1339.99, 29.5),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Tienda Stripclub",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 1,
		lastRobbed = 0
	},
	["tienda_pacific"] = {
		position = vector3(380.43, 332.07, 103.57),
		recompensa = math.random(100000, 120000),
		nombreDeTienda = "Tienda Pacific",
		blipRobo = "Robo a tienda",
		soloMafias = false,
		blipTipo = 156,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 1,
		lastRobbed = 0
	},
    ["facebook"] = {
		position = vector3(-1052.18, -232.42, 44.02), 
		recompensa = math.random(1500000, 2500000),
		nombreDeTienda = "Facebook",
		blipRobo = "Robo a Facebook",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 420, -- seconds
		CantidadPolis = 4,
		lastRobbed = 0 
	},
	["humane"] = {
		position = vector3( 3593.04,  3706.83,  29.69),  
		recompensa = math.random(3000000, 4500000),
		nombreDeTienda = "Humane",
		blipRobo = "Robo a Humane",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 420, -- seconds
		CantidadGna = 4,
		lastRobbed = 0
	},
	["mansion"] = {
		position = vector3( -811.82,  175.0,  76.75),
		recompensa = math.random(1000000, 1500000),
		nombreDeTienda = "Mansion",
		blipRobo = "Robo a mansion",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 360, -- seconds
		CantidadPolis = 2,
		lastRobbed = 0
	},
	["yate"] = {
		position = vector3( -2080.39,  -1019.66,  8.97),  
		recompensa = math.random(3000000, 4500000),
		nombreDeTienda = "Yate",
		blipRobo = "Robo a yate",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 420, -- seconds
		CantidadPolis = 3,
		lastRobbed = 0
	},
	["joyeria"] = {
		position = vector3( -622.17,  -230.71,  38.06),  
		recompensa = math.random(2000000, 4000000),
		nombreDeTienda = "Joyeria",
		blipRobo = "Robo a Joyeria",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 420, -- seconds
		CantidadPolis = 3,
		lastRobbed = 0
	},
	 ["polleria"] = {
	 	position = vector3( -77.96, 6224.17, 31.09),  
	 	recompensa = math.random(300000, 500000),
	 	nombreDeTienda = "Pollería",
	 	blipRobo = "Robo a Pollería",
		 soloMafias = false,
	 	blipTipo = 150,
	 	tiempoDeRobo = 300, -- seconds
	 	CantidadGna = 3,
	 	lastRobbed = 0
	 },
	["subte"] = {
		position = vector3( -833.22, -124.06, 28.18),  
		recompensa = math.random(1500000, 2500000),
		nombreDeTienda = "Subte",
		blipRobo = "Robo a Subte",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 3,
		lastRobbed = 0
	},
	["rancho"] = {
		position = vector3( 2439.08, 4969.51, 51.56),  
		recompensa = math.random(250000, 350000),
		nombreDeTienda = "Rancho Abandonado",
		blipRobo = "Robo a Rancho Abandonado",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 300, -- seconds
		CantidadGna = 4,
		lastRobbed = 0
	},
	["estadio"] = {
		position = vector3( -227.44, -2002.29, 24.69),  
		recompensa = math.random(1500000, 2500000),
		nombreDeTienda = "Estadio",
		blipRobo = "Robo a Estadio",
		soloMafias = false,
		blipTipo = 150,
		tiempoDeRobo = 300, -- seconds
		CantidadPolis = 4,
		lastRobbed = 0
	}

		
}
