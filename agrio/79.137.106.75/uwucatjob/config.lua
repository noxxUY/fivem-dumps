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
    { name = 'cat_car',  label = 'UwuCat Vehiculo 1' },
    { name = 'gl63', label = 'UwuCat Vehiculo 2'},
    { name = 'chiron17', label = 'UwuCat Vehiculo 3'}
}

Config.Blips = {
    
    Blip = {
        Pos     =  {x=-584.92749023438, y=-1061.8286132813, z=22.337768554688, h=277.79528808594},
        Sprite  = 93,
        Display = 4,
        Scale   = 0.8,
        Colour  = 27,
      },

}

Config.Zones = {

    Cloakrooms = {
        Pos   =  {x=-586.58898925781, y=-1049.9604492188, z=22.337768554688, h=277.79528808594},
        Size  = { x = 1.2, y = 1.2, z = 1.6 },
        Color = { r = 255, g = 187, b = 0 },
        Type  = 22,
    },

    Vaults = {
        Pos   = {x=-588.59338378906, y=-1068.3560791016, z=22.337768554688, h=246.61416625977},
        Size  = { x = 1.3, y = 1.3, z = 1.6 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 42,
    },

    Fridge = {
        Pos   =  {x=-584.92749023438, y=-1061.8286132813, z=22.337768554688, h=277.79528808594},
        Size  = { x = 0.4, y = 0.4, z = 0.6 },
        Color = { r = 0, g = 248, b = 255 },
        Type  = 42,
    },

    Vehicles = {
        Pos          =  {x=-601.23956298828, y=-1059.4813232422, z=22.539916992188, h=121.88976287842},
        SpawnPoint   =  {x=-618.03955078125, y=-1058.7164306641, z=21.78173828125, h=87.874015808105},
        Size         = { x = 1.8, y = 1.8, z = 2.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 36,
        Heading      = 87.43,
    },

    VehicleDeleters = {
        Pos   = {x=-615.21759033203, y=-1077.4945068359, z=22.169189453125, h=187.08660888672},
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
        Pos   =  {x=-596.96704101563, y=-1053.3890380859, z=22.337768554688, h=345.82678222656},
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
            { name = 'aguauwu',      label = 'Agua Uwu',   price = 1 },
            { name = 'cupcakeuwu',      label = 'Cupcake Uwu',   price = 1 },
            { name = 'rhumfruit',       label = 'Mixto de Frutas Uwu',    price = 2 },
            { name = 'beer',     label = 'Cerveza Uwu',  price = 7 },
            { name = 'chips',        label = 'Patatas fritas Uwu',         price = 1 }
          --  { name = 'tequila',    label = 'Hielo', price = 2 },
           -- { name = 'martini',    label = 'Hielo', price = 5 }
        },
    },

    NoAlcool = {
        Pos   = { x = 178.028, y = 307.467, z = 104.392 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'aguauwu',      label = 'Agua Uwu',   price = 1 },
            { name = 'cupcakeuwu',      label = 'Cupcake Uwu',   price = 1 },
            { name = 'icetea',      label = 'Te Helado Uwu',   price = 1 },
            { name = 'energy',      label = 'Bebida Energetica Uwu',   price = 1 },
            { name = 'limonade',    label = 'Limonada Uwu', price = 1 }
        },
    },

    Apero = {
        Pos   = { x = 98.675, y = -1809.498, z = 26.095 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'aguauwu',      label = 'Agua Uwu',   price = 1 },
            { name = 'cupcakeuwu',      label = 'Cupcake Uwu',   price = 1 },
            { name = 'bolpistache',     label = 'Bolsa de Pistacho Uwu',      price = 1 },
            { name = 'chips',        label = 'Patatas fritas Uwu',         price = 1 }
          --  { name = 'saucisson',       label = 'Hielo',        price = 1 },
           -- { name = 'grapperaisin',    label = 'Hielo',     price = 1 }
        },
    },

    Ice = {
        Pos   = { x = 26.979, y = -1343.457, z = 28.517 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'ice',     label = 'Hielo Uwu',      price = 1 },
            { name = 'icetea',     label = 'Te Helado Uwu',      price = 1 },
            { name = 'juice',     label = 'Zumo de frutas helado Uwu',      price = 1 },
            { name = 'menthe',  label = 'Jugo mentolado Uwu',   price = 1 }
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
  barman_outfit = {
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
