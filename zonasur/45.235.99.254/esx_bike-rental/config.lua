Config                            = {}
Config.Locale                     = 'en'

--- #### BASICS
Config.EnablePrice = true -- false = bikes for free
Config.EnableEffects = false
Config.EnableBlips = true


--- #### PRICES	
Config.PriceTriBike = 500
Config.PriceScorcher = 500
Config.PriceCruiser = 500
Config.PriceBmx = 500
Config.PriceMonopatin = 1500

--- #### MARKER EDITS
Config.TypeMarker = 38 --512
Config.MarkerScale = { x = 1.000, y = 1.000, z = 0.500}
Config.MarkerColor = { r = 0, g = 255, b = 255}
	
Config.MarkerZones = { 

    JobCenter = {
		Blip = {
			TypeMarker = 38,
			MarkerColor = { r = 0, g = 255, b = 255},
			MarkerScale = {x = 1.000, y = 1.000, z = 0.500},
			DrawMarker = 27,
		},
		Spawn = {
			Marker = {x = -241.17,y = -992.1,z = 29.29},
			Spawner = {x = -241.17,y = -992.1,z = 29.29, h = 249.46},
			Delete = {x=-240.22,y=-989.26,z=28.34},
		},
		Bikes = {
			{ 	
				value = "bmx",
				label = "BMX",
				price = 1000
			},
			{ 	
				value = "tribike2",
				label = "tribike2",
				price = 1000
			},
			{ 	
				value = "scorcher",
				label = "Mountain Bike",
				price = 1000
			},
			{ 	
				value = "cruiser",
				label = "cruiser",
				price = 1000
			},
		}
	},
	
    AeroPuerto = {
		Blip = {
			TypeMarker = 38,
			MarkerColor = { r = 0, g = 255, b = 255},
			MarkerScale = {x = 1.000, y = 1.000, z = 0.500},
			DrawMarker = 27,
		},
		Spawn = {
			Marker = {x = -1035.8,y = -2726.69,z = 13.76},
			Spawner = {x = -1035.8,y = -2726.69,z = 13.76, h = 329.19},
			Delete = {x=-1037.98,y=-2725.58,z=12.81},
		},
		Bikes = {
			{ 	
				value = "bmx",
				label = "BMX",
				price = 1000
			},
			{ 	
				value = "tribike2",
				label = "tribike2",
				price = 1000
			},
			{ 	
				value = "scorcher",
				label = "Mountain Bike",
				price = 1000
			},
			{ 	
				value = "cruiser",
				label = "cruiser",
				price = 1000
			},
		}
	},
	
    Paleto = {
		Blip = {
			TypeMarker = 38,
			MarkerColor = { r = 0, g = 255, b = 255},
			MarkerScale = {x = 1.000, y = 1.000, z = 0.500},
			DrawMarker = 27,
		},
		Spawn = {
			Marker = {x = -768.97,y = 5596.79,z = 33.61},
			Spawner = {x = -768.97,y = 5596.79,z = 33.61, h = 168.41},
			Delete = {x=-772.87,y=5594.14,z=32.54},
		},
		Bikes = {
			{ 	
				value = "bmx",
				label = "BMX",
				price = 1000
			},
			{ 	
				value = "tribike2",
				label = "tribike2",
				price = 1000
			},
			{ 	
				value = "scorcher",
				label = "Mountain Bike",
				price = 1000
			},
			{ 	
				value = "cruiser",
				label = "cruiser",
				price = 1000
			},
			{ 	
				value = "blazer",
				label = "Cuatriciclo",
				price = 1000
			},
			{ 	
				value = "sanchez2",
				label = "Moto Enduro Sanchez",
				price = 1000
			},
		}
	},
	
	Sandy_Botes = {
		Blip = {
			TypeMarker = 35,
			MarkerColor = { r = 0, g = 255, b = 255},
			MarkerScale = {x = 5.000, y = 5.000, z = 2.500},
			DrawMarker = 1,
		},
		Spawn = {
			Marker = {x=714.85,y=4101.67,z=35.79},
			Spawner = {x=706,y=4102.97,z=30.35,h=176.02},
			Delete = {x=707.4,y=4099.89,z=29.5},
			TP = {x=711.99,y=4110.27,z=31.3,h=183.63}
		},
		Bikes = {
			{ 	
				value = "seashark",
				label = "Moto de Agua",
				price = 2500
			},
			{ 	
				value = "seashark3",
				label = "Moto de Agua 2",
				price = 2500
			},
			{ 	
				value = "dinghy4",
				label = "Gomon",
				price = 2500
			},	
		}
	},	
	
	Playa_Ciudad = {
		Blip = {
			TypeMarker = 35,
			MarkerColor = { r = 0, g = 255, b = 255},
			MarkerScale = {x = 5.000, y = 5.000, z = 2.500},
			DrawMarker = 1,
		},
		Spawn = {
			Marker = {x=-1624.41, y=-1165.55, z=1.8720},
			Spawner = {x=-1628.50, y=-1169.06, z=0.4434,h=125.93},
			Delete = {x=-1628.50, y=-1169.06, z=0.4434},
			TP = {x=-1624.41, y=-1165.55, z=1.4720,h=307.28}
		},
		Bikes = {
			{ 	
				value = "seashark",
				label = "Moto de Agua",
				price = 2500
			},
			{ 	
				value = "seashark3",
				label = "Moto de Agua 2",
				price = 2500
			},
			{ 	
				value = "dinghy4",
				label = "Gomon",
				price = 2500
			},	
		}
	},
	
	Piletas = {
		Blip = {
			TypeMarker = 35,
			MarkerColor = { r = 0, g = 255, b = 255},
			MarkerScale = {x = 5.000, y = 5.000, z = 2.500},
			DrawMarker = 1,
		},
		Spawn = {
			Marker = {x=-3056.79, y=13.04333, z=1.5346},
			Spawner = {x=-3063.57, y=2.214271, z=0.6906,h=146.16},
			Delete = {x=-3063.57, y=2.214271, z=0.6906},
			TP = {x=-3056.79, y=13.04333, z=1.5346,h=320.38}
		},
		Bikes = {
			{ 	
				value = "seashark",
				label = "Moto de Agua",
				price = 2500
			},
			{ 	
				value = "seashark3",
				label = "Moto de Agua 2",
				price = 2500
			},
			{ 	
				value = "dinghy4",
				label = "Gomon",
				price = 2500
			},	
		}
	},
	
	Monte_Chiliad = {
		Blip = {
			TypeMarker = 40,
			MarkerColor = { r = 0, g = 255, b = 255},
			MarkerScale = {x = 5.000, y = 5.000, z = 2.500},
			DrawMarker = 1,
		},
		Spawn = {
			Marker = {x=501.4596, y=5600.851, z=796.58},
			Spawner = {x=500.5181, y=5594.181, z=794.99,h=174.57},
			Delete = {x=501.4705, y=5594.452, z=795.61},
			TP = {x=501.4596, y=5600.851, z=796.58,h=174.84}
		},
		Bikes = {
			{ 	
				value = "microlight",
				label = "Parapente Motorizado",
				price = 2500,
			},
			{ 	
				value = "GADGET_PARACHUTE",
				label = "Paracaidas",
				price = 2500,
			},
		},
	},
}


-- Edit blip titles
Config.BlipZones = { 
   {title="Alquiler de Biciletas", colour=2, id=38, x = -241.17,y = -992.1,z = 29.25},
   {title="Alquiler de Biciletas", colour=2, id=38, x = -1035.8,y = -2726.69,z = 13.76},
   {title="Alquiler de Biciletas", colour=2, id=512, x = -768.97,y = 5596.79,z = 33.61},
   {title="Alquiler de Botes", colour=2, id=471, x=714.85,y=4101.67,z=34.79},
   {title="Alquiler de Botes", colour=2, id=471, x=-1624.41, y=-1165.55, z=1.4720},
   {title="Alquiler de Botes", colour=2, id=471, x=-3056.79, y=13.04333, z=1.5346},
   {title="Alquiler de Paracaidas", colour=2, id=94, x=501.4596, y=5600.851, z=796.58},
}
