Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.MissCraft                  = 10 -- %

--[[
Config.Venta = {
	Barman1 = vector3(-1393.23, -606.644, 30.319),
	Barman2 = vector3(-1387.37, -614.414, 30.319),
}
]]--

Config.Owner = 'steam:110000144ed8d4f'
Config.Owner2 = nil
Config.BossActions = vector3(-1364.42,-622.960,30.325)

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
    {value='soda', label='Soda', price=500}, --basicneeds
    {value='jusfruit', label='Jugo de Frutas', price=500}, --basicneeds
    {value='energy', label='Speed', price=500},
    {value='drpepper', label='Dr. Lemon', price=500},
    {value='limonade', label='Limonada', price=500}, --basicneeds
    {value='bolchips', label='Papas Fritas', price=500},
    {value='whiskycoca', label='Whisky Con Coca', price=500},
    {value='vodkaenergy', label='Vodka Con Speed', price=500},
    {value='rhumcoca', label='Rhum Con Coca', price=500},
    {value='mojito', label='Mojito', price=500},
}

Config.Zones = {
    Vaults = {
        Pos   = { x=311.8704,y=-228.314,z=54.221},
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 3,
    },
    BossActions = {
        Pos   = { x=323.9346,y=-233.149,z=54.221 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 2,
    },
}

Config.Uniforms = {
	barman = {
		male = {
			['tshirt_1'] =59,  ['tshirt_2'] =0,
            ['torso_1'] = 70,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] =86,   ['pants_2'] =23,
            ['shoes_1'] =51,   ['shoes_2'] = 0,
            ['chain_1'] = 0,  ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
        },
        female = {
            ['tshirt_1'] =59,  ['tshirt_2'] =70,
            ['torso_1'] = 40,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 40,
            ['pants_1'] =86,   ['pants_2'] =23,
            ['shoes_1'] =25,   ['shoes_2'] = 4,
            ['chain_1'] = 118,  ['chain_2'] = 0
		}
	},
	dancer = {
		male = {
			['tshirt_1'] =59,  ['tshirt_2'] =0,
            ['torso_1'] = 70,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] =86,   ['pants_2'] =23,
            ['shoes_1'] =51,   ['shoes_2'] = 0,
            ['chain_1'] = 0,  ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
		},
		female = {
			['tshirt_1'] =59,  ['tshirt_2'] =70,
			['torso_1'] = 40,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] =86,   ['pants_2'] =23,
			['shoes_1'] =25,   ['shoes_2'] = 4,
			['chain_1'] = 118,  ['chain_2'] = 0
		}
	},
	viceboss = {
		male = {
			['tshirt_1'] =59,  ['tshirt_2'] =0,
            ['torso_1'] = 70,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] =86,   ['pants_2'] =23,
            ['shoes_1'] =51,   ['shoes_2'] = 0,
            ['chain_1'] = 0,  ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
		},
		female = {
			['tshirt_1'] =59,  ['tshirt_2'] =70,
			['torso_1'] = 40,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] =86,   ['pants_2'] =23,
			['shoes_1'] =25,   ['shoes_2'] = 4,
			['chain_1'] = 118,  ['chain_2'] = 0
		}
	},
	boss = {
		male = {
			['tshirt_1'] =59,  ['tshirt_2'] =0,
            ['torso_1'] = 70,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] =86,   ['pants_2'] =23,
            ['shoes_1'] =51,   ['shoes_2'] = 0,
            ['chain_1'] = 0,  ['chain_2'] = 0,
			['mask_1'] = -1,     ['mask_2'] = 0,
			['glasses_1'] = 8,  ['glasses_2'] = 0,
		},
		female = {
			['tshirt_1'] =59,  ['tshirt_2'] =70,
			['torso_1'] = 40,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] =86,   ['pants_2'] =23,
			['shoes_1'] =25,   ['shoes_2'] = 4,
			['chain_1'] = 118,  ['chain_2'] = 0
		}
	},
}
