Config = {}

-- Which translation you wish to use ?
Config.Locale = "en"

-- Key settings
Config.keyToOpenTicketMenu = "E"
Config.keyToOpenComputer = "E"

-- Marker for buying ticket
Config.Arcade = {
    {
        NPC = {
            position = vector3(336.1370, -907.5389, 28.25),
            heading = 4.46,
            model = "ig_claypain",
        },
        blip = {
            position = vector3(336.1133, -906.1108, 29.2514),
            blipId = 76,
            scale = 0.7,
            color = 2,
            name = "Virgocueva",
            shortRange = true,
            enable = true,
        },
        marker = {
            markerPosition = vector3(336.1133, -906.1108, 29.2514),
            markerType = 20,
            options = {
                scale = { x = 0.5, y = 0.5, z = 0.5 },
                color = { r = 0, g = 0, b = 0, a = 255 },
            }
        },
    },
}

-- ticket price, and time in arcade.
Config.ticketPrice = {
    [_U("bronz")] = {
        price = 300,
        time = 10, -- in minutes
    },
    [_U("silver")] = {
        price = 600,
        time = 20, -- in minutes
    },
    [_U("gold")] = {
        price = 900,
        time = 30, -- in minutes
    },
}

-- is arcade payed ?
Config.enableGameHouse = true
-- do not change unless you know what you're doing
Config.GPUList = {
    [1] = "ETX2080",
    [2] = "ETX1050",
    [3] = "ETX660",
}

-- do not change unless you know what you're doing
Config.CPUList = {
    [1] = "U9_9900",
    [2] = "U7_8700",
    [3] = "U3_6300",
    [4] = "BENTIUM",
}

Config.MyList = {
    {
        name = "name",
        link = "bleh",
    },
}

-- game list for retro machine
Config.RetroMachine = {
    {
        name = "Pacman",
        link = "http://xogos.robinko.eu/PACMAN/",
    },
    {
        name = "Tetris",
        link = "http://xogos.robinko.eu/TETRIS/",
    },
    {
        name = "Ping Pong",
        link = "http://xogos.robinko.eu/PONG/",
    },
    {
        name = "DOOM",
        link = string.format("nui://rcore_arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/Doom.zip", "./DOOM.EXE"),
    },
    {
        name = "Duke Nukem 3D",
        link = string.format("nui://rcore_arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/duke3d.zip", "./DUKE3D.EXE"),
    },
    {
        name = "Wolfenstein 3D",
        link = string.format("nui://rcore_arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/Wolfenstein3D.zip", "./WOLF3D.EXE"),
    },
}

-- game list for gaming machine
Config.GamingMachine = {
    {
        name = "Slide a Lama",
        link = "http://lama.robinko.eu/fullscreen.html",
    },
    {
        name = "Uno",
        link = "https://duowfriends.eu/",
    },
    {
        name = "Ants",
        link = "http://ants.robinko.eu/fullscreen.html",
    },
    {
        name = "FlappyParrot",
        link = "http://xogos.robinko.eu/FlappyParrot/",
    },
    {
        name = "Zoopaloola",
        link = "http://zoopaloola.robinko.eu/Embed/fullscreen.html"
    }
}

-- game list for super computer
Config.SuperMachine = {}

for i = 1, #Config.RetroMachine do
    table.insert(Config.SuperMachine, Config.RetroMachine[i])
end

for i = 1, #Config.GamingMachine do
    table.insert(Config.SuperMachine, Config.GamingMachine[i])
end

-- computer list in world
Config.computerList = {
    -- Retro machines
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(323.7313, -919.9272, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(323.6957, -916.6096, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(323.6951, -915.6615, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(323.7399, -914.7700, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(324.9418, -912.9519, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(325.8265, -912.9449, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(326.7215, -913.0103, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },

    -- Gaming computers
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(343.9001, -902.8755, 29.2515),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(342.0374, -902.9949, 29.2506),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(340.3714, -903.0342, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(338.6574, -903.1413, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(336.9419, -903.1233, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(331.3601, -904.2811, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(329.6578, -904.3085, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(326.3883, -904.2702, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(324.6985, -904.2825, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        markerType = 20,
        position = vector3(328.0790, -904.3170, 29.2514),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 0, g = 0, b = 0, a = 255 },
            rotate = true,
        },
    },
    -- Super machines
}
