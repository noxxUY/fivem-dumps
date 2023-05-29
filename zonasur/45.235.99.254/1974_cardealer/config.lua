Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = true
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'


Config.Items = {
	{value="hamburger", label="Hamburguesa", price=500},
	{value="tacos", label="Tacos", price=500},
	{value="cocacola", label="Coca-Cola", price=500},
	{value="sprite", label="Sprite", price=500},
	{value="beer", label="Cerveza", price=500},
	{value="grand_cru", label="Champagne", price=1000},
	{value="wine", label="Vino", price=500},
    {value='vodka', label='Vodka', price=500},
    {value='rhum', label='Rhum', price=500},
    {value='whisky', label='Whisky', price=500},
    {value='tequila', label='Tequila', price=500},
    {value='martini', label='Martini Blanco', price=500},
    {value='soda', label='Soda', price=500},
    {value='jusfruit', label='Jugo de Frutas', price=500},
    {value='energy', label='Speed', price=500},
    {value='drpepper', label='Dr. Lemon', price=500},
    {value='limonade', label='Limonada', price=500},
    {value='bolchips', label='Papas Fritas', price=500},
    {value='whiskycoca', label='Whisky Con Coca', price=500},
    {value='vodkaenergy', label='Vodka Con Speed', price=500},
    {value='rhumcoca', label='Rhum Con Coca', price=500},
    {value='mojito', label='Mojito', price=500},
}

Config.AuthorizedVehicles = {
    { name = 'rentalbus',  label = 'Galaxy Bus' },
}

Config.AuthorizedHelicoptero = {

	{
		model = 'supervolito',
		label = 'Automotores'
	},

}

Config.Blips = {  
    Blip = {
      Pos     = { x = 355.1791, y = 301.5476, z = 103.75 },
      Sprite  = 614,
      Display = 4,
      Scale   = 0.8,
      Colour  = 48,
    },
}

Config.Zones = {
	Automotores = {
		Cloakrooms = {
			{
				Pos   = { x=-27.5591,y=-1104.03,z=26.422},
				Size  = { x = 0.4, y = 0.4, z = 0.4 },
				Color = { r = 255, g = 187, b = 255 },
				Type  = 3,
			}
		},

		Vaults = {
			{
				Pos   = { x=-29.5830,y=-1108.31,z=26.422},
				Size  = { x = 0.4, y = 0.4, z = 0.4 },
				Color = { r = 30, g = 144, b = 255 },
				Type  = 3,
			}
		},

		BossActions = {
			{
				Pos   = { x=-32.0510,y=-1114.28,z=26.422},
				Size  = { x = 0.4, y = 0.4, z = 0.4 },
				Color = { r = 0, g = 100, b = 0 },
				Type  = 3,
			}
		},
		
		Helicopters = {
			{
				Pos          = { x=-56.4950,y=-1085.90,z=35.206 },
				SpawnPoint   = { x = -47.9619, y = -1094.70, z = 35.007 },
				Size         = { x = 0.4, y = 0.4, z = 0.4 },
				Color        = { r = 255, g = 255, b = 0 },
				Type         = 34,
				Heading      = 70.508865356445,
			}
		},

		HelicopterDeleters = {
			{
				Pos   = { x=-50.6016,y=-1094.12,z=35.072 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 255, g = 255, b = 0 },
				Type  = 0,
			}
		},
		
		FastTravelsPrompt = {	
			{
				Pos = {x=-50.1403,y=-1088.94,z=26.422},
				To = vector4(-50.0841,-1088.04,35.153,155.80851745605),
				Prompt = 'Presiona ~INPUT_CONTEXT~ para ~g~SUBIR.',
				Type = 3,
				Size  = { x = 0.4, y = 0.4, z = 0.4 },
				Color = { r = 102, g = 0, b = 102 },
			},		
			{
				Pos = {x=-50.0841,y=-1088.04,z=35.153},
				To = vector4(-50.1403,-1088.94,26.422,161.0305480957),
				Prompt = 'Presiona ~INPUT_CONTEXT~ para ~g~BAJAR.',
				Type = 3,
				Size  = { x = 0.4, y = 0.4, z = 0.4 },
				Color = { r = 102, g = 0, b = 102 },
			},
		},
	}
}


Config.Uniforms = {
	vendedor = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 40,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] = 28,   ['pants_2'] = 2,
			['shoes_1'] = 38,   ['shoes_2'] = 4,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
				['torso_1'] = 8,    ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 44,   ['pants_2'] = 4,
			['shoes_1'] = 0,    ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 2
		}
	},
	vendedor2 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 40,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] = 28,   ['pants_2'] = 2,
			['shoes_1'] = 38,   ['shoes_2'] = 4,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
				['torso_1'] = 8,    ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 44,   ['pants_2'] = 4,
			['shoes_1'] = 0,    ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 2
		}
	},
	boss = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 40,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] = 28,   ['pants_2'] = 2,
			['shoes_1'] = 38,   ['shoes_2'] = 4,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
				['torso_1'] = 8,    ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 44,   ['pants_2'] = 4,
			['shoes_1'] = 0,    ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 2
		}
	},
}
