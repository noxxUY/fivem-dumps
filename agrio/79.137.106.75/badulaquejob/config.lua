Config                            = {}
Config.DrawDistance               = 50.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'
Config.HandcuffTimer              = 10 * 60000 -- 10 mins
Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'g63mg',  label = 'badulake Vehiculo 1' },
    { name = 'gl63', label = 'badulake Vehiculo 2'},
  --  { name = 'chiron17', label = 'badulake Vehiculo 3'}
}

Config.Blips = {
    
    Blip = {
        Pos     = { x = -1395.58, y = -605.05, z = 30.32 },
        Sprite  = 93,
        Display = 4,
        Scale   = 0.8,
        Colour  = 27,
      },

}

Config.Zones = {

    Cloakrooms = {
        Pos   ={x=-705.96923828125, y=-905.48571777344, z=19.20361328125, h=175.74803161621},
        Size  = { x = 1.2, y = 1.2, z = 1.6 },
        Color = { r = 255, g = 187, b = 0 },
        Type  = 22,
    },

    Vaults = {
        Pos   ={x=-705.65277099609, y=-914.28131103516, z=19.20361328125, h=87.874015808105},
        Size  = { x = 1.3, y = 1.3, z = 1.6 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 42,
    },

    Fridge = {
        Pos   = { x = 748.2, y = -573.09, z = 29.32 },
        Size  = { x = 0.4, y = 0.4, z = 0.6 },
        Color = { r = 0, g = 248, b = 255 },
        Type  = 42,
    },

    Vehicles = {
        Pos          = {x=-703.56921386719, y=-920.36041259766, z=19.00146484375, h=87.874015808105},
        SpawnPoint   = {x=-728.49230957031, y=-917.48571777344, z=19.00146484375, h=90.708656311035},
        Size         = { x = 1.8, y = 1.8, z = 2.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 36,
        Heading      = 90.43,
    },

    VehicleDeleters = {
        Pos   = {x=-727.39782714844, y=-908.65057373047, z=19.00146484375, h=351.49606323242},
        Size  = { x = 3.0, y = 3.0, z = 1.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 36,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = {x=-713.23516845703, y=-909.37579345703, z=19.20361328125, h=31.181102752686},
        Size  = { x = 0.5, y = 0.5, z = 0.8 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 2,
    },

-----------------------
-------- SHOPS --------

    Flacons = {
        Pos   = { x = -2955.242, y = 385.897, z = 14.041 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'jager',      label = _U('jager'),   price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'rhum',       label = _U('rhum'),    price = 2 },
            { name = 'whisky',     label = _U('whisky'),  price = 7 },
            { name = 'tequila',    label = _U('tequila'), price = 2 },
            { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },

    NoAlcool = {
        Pos   = { x = 178.028, y = 307.467, z = 104.392 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'soda',        label = _U('soda'),     price = 4 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            { name = 'icetea',      label = _U('icetea'),   price = 4 },
            { name = 'energy',      label = _U('energy'),   price = 7 },
            { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'limonade',    label = _U('limonade'), price = 1 }
        },
    },

    Apero = {
        Pos   = { x = 98.675, y = -1809.498, z = 26.095 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'bolcacahuetes',   label = _U('bolcacahuetes'),    price = 7 },
            { name = 'bolnoixcajou',    label = _U('bolnoixcajou'),     price = 10 },
            { name = 'bolpistache',     label = _U('bolpistache'),      price = 15 },
            { name = 'bolchips',        label = _U('bolchips'),         price = 5 },
            { name = 'saucisson',       label = _U('saucisson'),        price = 25 },
            { name = 'grapperaisin',    label = _U('grapperaisin'),     price = 15 }
        },
    },

    Ice = {
        Pos   = { x = 26.979, y = -1343.457, z = 28.517 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'ice',     label = 'Hielo',      price = 1 },
            { name = 'menthe',  label = 'Jugo mentolado',   price = 2 }
        },
    },

}


-----------------------
----- TELEPORTERS -----

--[[Config.TeleportZones = {
  EnterBuilding = {
    Pos       = { x = -1391.37, y = -616.4, z = 30.72 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
     Marker    = 21,
    Hint      = '[E] Para entrar',
    Teleport  =  { x = -1392.8, y = -612.05, z = 30.32 },
  },
    
  ExitBuilding = {
    Pos       = { x = -1392.8, y = -612.05, z = 30.32 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 21,
    Hint      = '[E] Para salir',
    Teleport  = { x = -1391.37, y = -616.4, z = 30.72 },
  },--]]

--[[
  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },

}--]]


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  empleado = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 120,   ['torso_2'] = 8,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 7,
        ['pants_1'] = 17,   ['pants_2'] = 0,
        ['shoes_1'] = 17,   ['shoes_2'] = 0,
        --['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
        ['torso_1'] = 27,    ['torso_2'] = 3,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 5,
        ['pants_1'] = 14,   ['pants_2'] = 0,
        ['shoes_1'] = 50,    ['shoes_2'] = 1,
       -- ['chain_1'] = 0,    ['chain_2'] = 2
    }
  },
}
