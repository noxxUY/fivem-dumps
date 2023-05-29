Config = {}
Config.Webhook = 'https://discordapp.com/api/webhooks/1091795055632732180/-NRM-YKOSTsHX15oOsYwJ8ZecdGNEmnyCSf6B7gazYSPqJdRV1jPuTSRx-rfoj2XmEzA'
Config.Locale = 'en'
Config.Notify = 'esx:showNotification'
Config.MaxDistance = 10.0 --Max interact distance

Config.Blips = {
    ['car'] = {
        Garage = {
            Name = 'Garaje',
            Type = 289,
            Size = 0.5,
            Color = 3
        },
        Impound = {
            Name = 'Confiscados',
            Type = 357,
            Size = 0.4,
            Color = 1
        },
    },
    ['air'] = {
        Garage = {
            Name = 'Helipuerto',
            Type = 360,
            Size = 0.5,
            Color = 17
        },
        Impound = {
            Name = 'Aeroconfiscados',
            Type = 357,
            Size = 0.5,
            Color = 3
        },
    },
    ['boat'] = {
        Garage = {
            Name = 'Embarcadero',
            Type = 357,
            Size = 0.5,
            Color = 17
        },
        Impound = {
            Name = 'Botes Confiscados',
            Type = 357,
            Size = 0.5,
            Color = 3
        },
    },
}

Config.Garages = {

    --Autos
    {
        Visible = true, --Garaje central
        Type = 'car',
        Position = vector3(220.1418, -800.1686, 30.7227),
        SpawnPosition = vector4(229.3425, -801.4708, 30.5659, 161.8591) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Garaje Sandy
        Type = 'car',
        Position = vector3(1878.44, 3760.1, 32.94),
        SpawnPosition = vector4(1880.14, 3757.73, 32.93, 215.54) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Garaje taller
        Type = 'car',
        Position = vector3(729.08, -2131.38, 29.35),
        SpawnPosition = vector4(736.5830078125, -2124.4113769531, 29.778570175171, 257.49197387695) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Garaje casino
        Type = 'car',
        Position = vector3(893.99, -55.52, 78.76),
        SpawnPosition = vector4(901.01, -55.52, 78.76, 160) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Garaje Playa
        Type = 'car',
        Position = vector3(-2183.39, -375.92, 13.16),
        SpawnPosition = vector4(-2177.23, -383.95, 13.27, 160) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Garaje Paleto
        Type = 'car',
        Position = vector3(-187.17, 6223.53, 31.59),
        SpawnPosition = vector4(-195.41,  6227.9,  31.59, 160) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Garaje Aeropuerto
        Type = 'car',
        Position = vector3(-938.22, -2446.01, 13.00),
        SpawnPosition = vector4(-947.15,  -2446.52,  13.00, 160) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Garaje Confiscados Ciudad
        Type = 'car',
        Position = vector3(465.3740234375, -1686.8038330078, 29.284236907959),
        SpawnPosition = vector4(459.4104309082, -1679.1860351563, 29.291442871094, 46.204795837402) --vector4(x, y, z, heading)
    },
    {
        Visible = false, --Garaje Placasito
        Type = 'car',
        Position = vector3(1371.8133544922, -583.88000488281, 74.369018554688),
        SpawnPosition = vector4(1371.0821533203, -574.61236572266, 74.377601623535, 74.694145202637) --vector4(x, y, z, heading)
    },





    -- Aviones
    {
        Visible = true, --Aeropuerto Ciudad.
        Type = 'air',
        Position = vector3(-1182.7245, -2852.9495, 14.0404),
        SpawnPosition = vector4(-1178.4406, -2845.8442, 13.9457, 333.0016) --vector4(x, y, z, heading)
    },

    {
        Visible = true, --Aeropuerto trevor.
        Type = 'air',
        Position = vector3(1739.37, 3267.15,41.22),
        SpawnPosition = vector4(1718.94, 3257.69, 41.13, 333.0016) --vector4(x, y, z, heading)
    },




    -- Barcos
    {
        Visible = false, --Blip visible on map.
        Type = 'boat',
        Position = vector3(-802.3275, -1415.8136, 1.5952),
        SpawnPosition = vector4(-803.2337, -1421.8733, -0.4749, 230.6403) --vector4(x, y, z, heading)
    },
}


Config.ImpoundPrice = 3000 --Price to return your vehicle.

Config.Impounds = {
    {
        Visible = true, --Ciudad
        Type = 'car',
        Position = vector3(401.7906, -1631.6171, 29.2920),
        SpawnPosition = vector4(407.8341, -1645.6790, 29.2921, 228.1345) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Sandy.
        Type = 'car',
        Position = vector3(2399.9611816406, 3108.5578613281, 48.16036605835),
        SpawnPosition = vector4(2391.451171875, 3107.6159667969, 48.167461395264, 67.037734985352) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Paleto.
        Type = 'car',
        Position = vector3(123.74075317383, 6609.9428710938, 31.873458862305),
        SpawnPosition = vector4(124.72472381592, 6598.7749023438, 31.948129653931, 224.25459289551) --vector4(x, y, z, heading)
    },
    {
        Visible = true, --Blip visible on map.
        Type = 'air',
        Position = vector3(-978.15393066406, -2995.8627929688, 13.459173202515),
        SpawnPosition = vector4(-978.15393066406, -2995.8627929688, 13.459173202515, 60.605037689209) --vector4(x, y, z, heading)
    },
    {
        Visible = false, --Blip visible on map.
        Type = 'boat',
        Position = vector3(-844.2191, -1366.7213, 1.6052),
        SpawnPosition = vector4(-843.4146, -1372.2310, -0.4749, 114.3669) --vector4(x, y, z, heading)
    },
}
