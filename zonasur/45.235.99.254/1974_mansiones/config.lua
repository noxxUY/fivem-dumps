Config = {}

Config.AlignMenu = "bottom-right"

Config.Mansion = {
	["steam:110000147951a46"] = {
		Baul = {
			Marker = vector3(-792.594,329.0357,187.31),
			Type = 2,
			Label = "~g~[E]~w~ para abrir ~g~Baul",
			Size = {x = 0.5, y = 0.5, z = 0.5},
		},
		Ropa = {
			Marker = vector3(-797.745,327.6505,190.71),
			Type = 3,
			Label = "~g~[E]~w~ para abrir ~g~Armario",
			Size = {x = 0.5, y = 0.5, z = 0.5},
		},		
		Helicoptero = {
			Marker = vector3(-802.419,338.7731,230.63),
			Spawner = vector4(-796.567,337.9442,230.63,181.49717712402),
			Type = 34,
			Label = "~g~[E]~w~ para abrir ~g~Helipuerto",
			Size = {x = 0.5, y = 0.5, z = 0.5},
		},
		Guardar_Helicoptero = {
			Marker = vector3(-796.567,337.9442,230.63),
			Type = 1,
			Label = "~g~[E]~w~ para ~g~Guardar Helicoptero",
			Size = {x = 5.0, y = 5.0, z = 0.5},
		},
		Garage = {
			Marker = vector3(-790.513,308.1323,85.702),
			Spawner = vector4(-800.480,331.9314,85.700,181.02348327637),
			Type = 36,
			Label = "~g~[E]~w~ para abrir ~g~Garage",
			Size = {x = 0.5, y = 0.5, z = 0.5},
		},
		Guardar_Garage = {
			Marker = vector3(-800.480,331.9314,85.700 - 0.99),
			Type = 27,
			Label = "~g~[E]~w~ para ~g~Guardar Vehiculo",
			Size = {x = 5.0, y = 5.0, z = 0.5},
		},		
		FastTravelsPrompt = {
			{
				From = vector3(-776.841,319.2299,85.662 - 0.95),
				To = {coords = vector3(-781.931,314.3372,187.91), heading = 185.30648803711},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = "~g~[E]~w~ para ~g~Subir"
			},
			
			{
				From = vector3(-781.931,314.3372,187.91 - 0.95),
				To = {coords = vector3(-776.841,319.2299,85.662), heading = 155.96310424805},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = "~g~[E]~w~ para ~r~Bajar"
			},
			{
				From = vector3(-787.310,315.7778,187.91 - 0.95),
				To = {coords = vector3(-801.949,334.6707,230.63), heading = 81.013626098633},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = "~g~[E]~w~ para ~g~Subir"
			},
			
			{
				From = vector3(-801.949,334.6707,230.63 - 0.95),
				To = {coords = vector3(-787.310,315.7778,187.91), heading = 90.96435546875},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = "~g~[E]~w~ para ~r~Bajar"
			},
		},
	},
}