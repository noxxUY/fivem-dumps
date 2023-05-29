Config = {}

Config.Blackout = true
Config.Animation = true
Config.OnlyCars = false

Config.Teleport = {

	Enter = {
		Pos = {x= 232.9633, y= -999.57892, z= -98.9999},
		Heading = 357.43,
		View = 10.0,
		Activate = 1.0,
		Text = '~g~[Ir a la Ciudad] \n~s~Presiona la [E]',
		Posout = {x= -262.52380371094, y= -968.81182861328, z= 31.224880218506}
	}
}



Config.LoNpcLoco = {

	-- NPC DE TRABAJOS
    { 
        coords = vec3(-261.7065, -966.0638, 31.2243), -- Coords of sell shop
        heading = 129.2293, -- Heading of ped in pawn shop
        ped = 'a_m_y_bevhills_01', -- Ped model name
        label = 'Centro de Trabajo', -- Label at top of context menu/blip if enabled
        blip = {
            enabled = true, -- Enable blip?
            sprite = 407, -- https://docs.fivem.net/docs/game-references/blips/
            color = 27, -- https://docs.fivem.net/docs/game-references/blips/
            scale = 0.75 -- Scale/size of blip (0.75 default)
        },
        accionped = 'interactivo:trabajoslist', -- Trigger to open menu
        icono = 'fa-solid fa-briefcase',
    },
	--- VENTA DE MINERALES
    { 
        coords = vec3(2951.1262, 2812.3191, 41.8660), -- Coords of sell shop
        heading = 242.1115, -- Heading of ped in pawn shop
        ped = 'cs_brad', -- Ped model name
        label = 'Venta de Materiales', -- Label at top of context menu/blip if enabled
        blip = {
            enabled = true, -- Enable blip?
            sprite = 617, -- https://docs.fivem.net/docs/game-references/blips/
            color = 3, -- https://docs.fivem.net/docs/game-references/blips/
            scale = 0.75 -- Scale/size of blip (0.75 default)
        },
        accionped = 'interactivo:interact', -- Trigger to open menu
        icono = 'fa-solid fa-cube',
        items = {
            { item = 'copper', label = 'Cobre', price = 650, currency = 'money' }, -- Self explanatory I would hope
            { item = 'iron', label = 'Metal', price = 850, currency = 'bank' }, -- Self explanatory I would hope
            { item = 'gold', label = 'Oro', price = 1050, currency = 'bank' }, -- Self explanatory I would hope
            { item = 'diamond', label = 'Diamante', price = 25000, currency = 'bank' }, -- Self explanatory I would hope
        }
    },
	-- NPC PATRON MINERO
	
    { 
        coords = vec3(2958.1702, 2744.9792, 43.5841), -- Coords of sell shop
        heading = 322.3726, -- Heading of ped in pawn shop
        ped = 's_m_m_dockwork_01', -- Ped model name
        label = 'Patron Minero', -- Label at top of context menu/blip if enabled
        blip = {
            enabled = true, -- Enable blip?
            sprite = 617, -- https://docs.fivem.net/docs/game-references/blips/
            color = 3, -- https://docs.fivem.net/docs/game-references/blips/
            scale = 0.75 -- Scale/size of blip (0.75 default)
        },
        accionped = 'interactivo:patronminero', -- Trigger to open menu
        icono = 'fa-solid fa-cog',
    },




    -- -- CAMBIAR DE PJ
	
    -- { 
    --     coords = vec3(229.9513, -1004.9057, -99.0000), -- Coords of sell shop
    --     heading = 262.5365, -- Heading of ped in pawn shop
    --     ped = 'mp_f_freemode_01', -- Ped model name
    --     label = 'Cambiar PJ', -- Label at top of context menu/blip if enabled
    --     blip = {
    --         enabled = false, -- Enable blip?
    --         sprite = 617, -- https://docs.fivem.net/docs/game-references/blips/
    --         color = 3, -- https://docs.fivem.net/docs/game-references/blips/
    --         scale = 0.75 -- Scale/size of blip (0.75 default)
    --     },
    --     accionped = 'esx_skin:openSaveableMenu', -- Trigger to open menu
    --     icono = 'fa-solid fa-cog',
    -- },

    -- Teleport
	
    { 
        coords = vec3(232.9633, -999.5789, -98.9999), -- Coords of sell shop
        heading = 201.6684, -- Heading of ped in pawn shop
        ped = 'a_m_y_vinewood_02', -- Ped model name
        label = '', -- Label at top of context menu/blip if enabled
        blip = {
            enabled = false, -- Enable blip?
            sprite = 617, -- https://docs.fivem.net/docs/game-references/blips/
            color = 3, -- https://docs.fivem.net/docs/game-references/blips/
            scale = 0.75 -- Scale/size of blip (0.75 default)
        },
        accionped = 'esx_skin:openSaveableMenu', -- Trigger to open menu
        icono = 'fa-solid fa-cog',
    },

}

Config.PropJob = {

	{
		prop = 'prop_test_rocks03',
		label = 'Recolectar piedra',
	}
}

Config.Zones = {
    
    {coords = vec3(1881.1339, 251.2038, 162.0212), },
    {coords = vec3(1888.3732, 246.0265, 161.3858),},
    {coords = vec3(1894.5839, 246.6254, 160.3365),},
    {coords = vec3(1902.6222, 250.0966, 160.4218),},
    {coords = vec3(1906.6364, 255.6257, 160.7906),},
    {coords = vec3(1907.7483, 260.3434, 160.6325),},
    {coords = vec3(1906.1523, 267.3837, 161.3777),},
    {coords = vec3(1911.1222, 272.0075, 160.8763),},
    {coords = vec3(1912.0414, 276.0261, 161.3302),},
    {coords = vec3(1911.7915, 281.6472, 161.3186),},
}

Config.Fundicion = {
    {coords = vec3(1110.4929, -2008.5778, 31.8356), },
    {coords = vec3(1087.77, -2004.46, 31.38), },
}

