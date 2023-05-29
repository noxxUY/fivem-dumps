Config                            = {}
Config.DrawDistance               = 30.0
Config.Locale                     = 'en'
Config.showMarker = true

Config.HelicopterSpawner = {
    SpawnPoint = { x = 351.386, y = -588.124, z = 74.165 },
    Heading    = 0.0
}


Config.Zones = {

    Entrance1 = {--
        Marker  = { x = 972.937109375, y = 31.17165283203, z = 71.820713043213  },
        Spawn   = { x = 972.937109375, y = 31.17165283203, z = 71.820713043213  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 169.59108,
		canGoTo = {"Azotea1", "Azotea2"}
    },

    Azotea1 = {--
        Marker  = { x = 964.51202392578, y = 58.94174194336, z = 112.520713043213 },
        Spawn   = { x = 964.51202392578, y = 58.94174194336, z = 112.520713043213 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 169.59108,
		canGoTo = {"Entrance1", "Parking"}
    },

    Azotea2 = {--
        Marker  = { x = 982.36, y = 56.18755737305, z = 116.16 },
        Spawn   ={ x = 982.36, y = 56.18755737305, z = 116.16 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 169.59108,
		canGoTo = {"Entrance1", "Parking"}
    },

    Parking = {--
        Marker  = { x = 967.3484375, y = 7.33380859375, z = 81.109778594971},
        Spawn   = { x = 967.3484375, y = 7.33380859375, z = 81.109778594971},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 350.57266,
		canGoTo = {"Azotea1", "Entrance1", "Heli"}
    },

    Heli = {--
        Marker  = { x = 971.0484375, y = 58.73380859375, z = 120.109778594971},
        Spawn  = { x = 971.0484375, y = 58.73380859375, z = 120.109778594971},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 350.57266,
		canGoTo = {"Azotea1", "Entrance1", "Parking"}
    },

    HeliCni = {--
        Marker  = {x=141.32307434082, y=-734.91430664063, z=262.83520507813, h=345.82678222656},
        Spawn  =  {x=141.32307434082, y=-734.91430664063, z=262.83520507813, h=345.82678222656},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 350.57266,
		canGoTo = {"BajaCni", "NormalCni"}
    },

    NormalCni = {--
        Marker  ={x=135.982421875, y=-762.09228515625, z=242.1435546875, h=167.24407958984},
        Spawn  = {x=135.982421875, y=-762.09228515625, z=242.1435546875, h=167.24407958984},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 350.57266,
		canGoTo = {"HeliCni", "BajaCni" }
    },

    BajaCni = {--
        Marker  = {x=138.93626403809, y=-763.13403320313, z=45.7421875, h=161.57479858398},
        Spawn  = {x=138.93626403809, y=-763.13403320313, z=45.7421875, h=161.57479858398},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 20,
        Heading = 350.57266,
		canGoTo = {"HeliCni", "NormalCni" }
    },

    
}

--Made By Sarish => AuroraRP