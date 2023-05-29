Config = {}
-- NOOB KING
--Important Configs
Config.ESXOLD = false --If you are using the esx version that does not have xPlayer.canCarryItem or if u want limits instead!
Config.MaxHold4R = 30 --Only edit if above is true
Config.MaxHold4M = 30 --Only edit if above is true
Config.MaxHold4H = 30 --Only edit if above is true
Config.AdminCancel = true --If the /cancelHumane command is allowed
Config.PoliceJob = "gendarme" --Job for police

Config.NeededCops = 8 --Amount of cops needed to start the robbery!

--Starting Configs
Config.StartLoc = vector3(3638.723, 3745.907, 29) --Starting Location

Config.Blip = {x=3638.723, y=3745.907, z=29}

--Security Panel Configs
Config.BlipColor = 1 --Security Panel Blips
Config.BlipSprite = 485--Security Blip Color
Config.BlipSize = 0.9 --Size of the security blip
Config.DisablePanelTime = 6 --How long it takes to disable one panel! (In Seconds)
Config.RerouteTime = 10 --How long it takes to reroute the wires

--Discord Configs
Config.Discord = true --IF you want to use a discord webhook for logs! ADD WEBHOOK IN server.lua IF TRUE
Config.Pickups = true --If you want pickups to be logged
Config.RobberyStart = true --If you want the robbery starting to be logged
Config.RobAttempt = true --If you want the robbery attempt to be logged
Config.RobEnd = true --If you want the robbery ending to be robbed
Config.DoorChange = true --If you want door changed to be logged
Config.DisableEarly = true --If you want the early police disable to be logged

--Picking Configs
Config.MaxDist = 10 --Max Distance for it to load nearby locations
Config.PickupDist = 2 --How close you have to be pickup the chemicals and show 3d text

Config.PickColor = { --Colors for chemical pickup blips
    [1] = 46, --Regular color
    [2] = 47, --Medium Color
    [3] = 1  --High Color
}

Config.PickSprite = { --Blip Sprites for chemical pickup blips
    [1] = 434, --Regular Blip
    [2] = 434, --Medium Blip
    [3] = 434  --High Blip
}

--Teleport Configs
Config.MarkerLoc = vector3(3540.6901855469, 3676.0280761719, 28.121143341064)
Config.MarkerHead = 168.10
Config.MarkerLoc2 = vector3(3540.705078125, 3675.7614746094, 20.991775512695)
Config.MarkerHead2 = 168.10

--Robbery Configs
Config.RobberyTimer = 7 --In minutes (How long robbery can go for or how long the players have to pickup chemicals)
Config.RobWarning = 1 --In minutes(When the robbery should send a time warning) 
Config.RobCoolDown = 60 --In minutes (How long before they can rob again)


Config.PolRobBlips = 161 --Robbery Blip Sprite for Police
Config.PolRobColor = 2 --Color of blip for police

--General Configs
Config.HumaneLoc = vector3(3513.6650390625, 3757.7116699219, 29.977401733398) --General Humane Labs location(I wouldn't change)
Config.CloseCancel = 600 --How far you can get while doing security panels before it cancels robbery
Config.CloseDoorCheck = 20 --How close you have to be to load in door's data for big 2 doors
Config.CloseDoorCheck2 = 5 --How close you have to be to load in door's data for small door
Config.MaxDoorDist = 10 --How far you have to be before it loads doors data
Config.MaxSDist = 3 --How close you have to be to load security 3d text and interaction 
Config.PanelTime = 10 --How long it takes to look for security panels

Config.Cancelar = vector3(3636.444, 3750.630, 28.515)

--Item Configs
Config.BreakPliers = true --If pliers have a chance of breaking while using them
Config.Probabilty4Pliers = {1,4} --Probablity of breaking(Only matters if true above!)

Config.BreakMask = false --Si la mascarilla se puede romper durante el uso
Config.Probability4Mask = {1,8} --Probablity of breaking(Only matters if true above!)

--Mask Configs
Config.DoDamageFor1 = {Damage = false, Amount = 10} --If damage is dealt when player isn't wearing mask for regular quality
Config.DoDamageFor2 = {Damage = false, Amount = 20} --If damage is dealt when player isn't wearing mask for medium quality
Config.DoDamageFor3 = {Damage = false, Amount = 30} --If damage is dealt when player isn't wearing mask for high quality
Config.Maskapplied = {Apply = false, Male = 46, Female = 46} --If it adds an actual mask to the player and the number of the mask to add to player's skin

--Trip Configs
Config.AllowTrip = true --If you can trip a wire to call police early to robbery
Config.TripProbability = {1,5} --Probablity of tripping a wire(Only Matters if true above)

Config.AllowTripFix = true --If the robber can fix the trip before it can be tripped
Config.AllowTripFixLoc = { --Trip Fix Settings
    Loc = vector3(3453.2221679688, 3661.029296875, 52.215023040771), --Location 
    AnimLoc = vector3(3453.3103027344, 3660.6745605469, 51.215023040771), --Animation location
    Heading = 14.03 -- Heading 
}
Config.TripFixTime = 10 --How long it takes to fix the trip alarm(in seconds)

--Lockpicking Configs
Config.lockpickHeading = 1 --Heading for lockpicking small door
Config.LockpickTime = 15 --How long it takes to lockpick the door(in seconds)

--Blip Configs
Config.allBlips = { --DON'T ADD OR REMOVE ANY OR IT WILL BREAK
    {
        blipCoords = vector3(3493.891, 3661.634, 33.89408), --Blip coords
        blipheading = 172.11, --Heading for animation
        blipUsed = false, -- Leave false
        blipCheck = nil --Leave nil
    },

    {
        blipCoords = vector3(3582.989, 3648.217, 33.89408),
        blipheading = 260.74,
        blipUsed = false,
        blipCheck = nil
    },

    {
        blipCoords = vector3(3585.562, 3619.951, 43.53566),
        blipheading = 169.99,
        blipUsed = false,
        blipCheck = nil
    },

    {
        blipCoords = vector3(3620.2626953125, 3723.72265625, 35.794597625732),
        blipheading = 324.77,
        blipUsed = false,
        blipCheck = nil
    },

    {
        blipCoords =vector3(3438.031, 3750.531, 30.50288),
        blipheading = 40.93,
        blipUsed = false,
        blipCheck = nil
    },

    {
        blipCoords = vector3(3527.77, 3651.915, 41.33591),
        blipheading = 167.57,
        blipUsed = false,
        blipCheck = nil
    }
}

--Door Configs
Config.doors = { --Door configs! (DONT CHANGE THESE)

    {
        objName = 'v_ilev_bl_shutter2', 
        objCoords  = {x = 3627.713, y = 3746.716, z = 27.69009},
        textCoords = {x = 3627.713, y = 3746.716, z = 27.69009},
        authorizedJobs = { 'police' },
        heading = 324.99993896484
    },

    {
        objName = 'v_ilev_bl_shutter2',
        objCoords  = {x = 3620.843, y = 3751.527, z = 27.69009},
        textCoords = {x = 3620.843, y = 3751.527, z = 27.69009},
        authorizedJobs = { 'police' },
        heading = 324.99993896484
    },

    {
        objName = 'v_ilev_bl_doorpool',
        objCoords = {x = 3526.02, y = 3702.243, z = 21.34196},
        textCoords = {x = 3526.02, y = 3702.243, z = 21.34196},
        authorizedJobs = { 'police' },
        heading = 170
    }
}

Config.Locations = { --ALL PICKUP LOCATIONS (IF YOU WANT TO ADD OR REMOVE MAKE SURE TO ADD OR REMOVE THOSE FROM CLIENT AND SERVER SIDE)
    [1] = {
        Loc = vector3(3559.05, 3673.19, 28.12), --Location
        AnimLoc = vector3(3558.89, 3672.37, 27.12), --Animation location
        AnimHeading = 352.71, --Animation Heading
        Quality = 'medium', --Quality of pickup
        AnimType = 3, --Which animation to preform
        DataStore = nil --Leave NIL
    },
    [2] = {
        Loc = vector3(3562.11, 3676.68, 28.12),
        AnimLoc = vector3(3562.02, 3675.94, 27.12),
        AnimHeading = 353.02,
        Quality = 'high',
        AnimType = 2,
        DataStore = nil
    },
    [3] = {
        Loc = vector3(3559.81, 3673.82, 28.12),
        AnimLoc = vector3(3559.84, 3674.48, 27.12),
        AnimHeading = 171.24,
        Quality = 'medium',
        AnimType = 3,
        DataStore = nil
    },
    [4] = {
        Loc = vector3(3563.61, 3673.32, 28.12),
        AnimLoc = vector3(3563.27, 3673.4, 27.12),
        AnimHeading = 256.29,
        AnimType = 1,
        Quality = 'regular',
        DataStore = nil
    },
    [5] = {
        Loc = vector3(3563.09, 3665.65, 28.12),
        AnimLoc = vector3(3562.79, 3665.66, 27.12),
        AnimHeading = 266.33,
        AnimType = 1,
        Quality = 'medium',
        DataStore = nil
    },
    [6] = {
        Loc = vector3(3559.22, 3662.5, 28.12),
        AnimLoc = vector3(2558.39, 3662.85, 27.12),
        AnimHeading = 247.27,
        AnimType = 3,
        Quality = 'regular',
        DataStore = nil
    },
    [7] = {
        Loc = vector3(3554.470703125, 3656.408203125, 28.12188911438),
        AnimLoc = vector3(3553.4213867188, 3656.3979492188, 28.12188911438),
        AnimHeading = 258.6,
        AnimType = 1,
        Quality = 'high',
        DataStore = nil
    },
    [8] = {
        Loc = vector3(3549.4130859375, 3642.03125, 28.121883392334),
        AnimLoc = vector3(3548.9609375, 3642.0268554688, 28.121883392334),
        AnimHeading = 260.58,
        AnimType = 1,
        Quality = 'regular',
        DataStore = nil
    },
    [9] = {
        Loc = vector3(3537.06640625, 3669.1442871094, 28.121873855591),
        AnimLoc = vector3(3536.9658203125, 3668.5515136719, 28.121873855591),
        AnimHeading = 350.33,
        AnimType = 3,
        Quality = 'regular',
        DataStore = nil
    },
    [10] = {
        Loc = vector3(3540.3916015625, 3668.8161621094, 28.121873855591),
        AnimLoc = vector3(3540.2231445313, 3668.0849609375, 28.121873855591),
        AnimHeading = 337.01,
        AnimType = 3,
        Quality = 'regular',
        DataStore = nil
    },
    [11] = {
        Loc = vector3(3538.5778808594, 3662.7270507813, 28.121885299683),
        AnimLoc = vector3(3538.6364746094, 3663.4775390625, 28.121885299683),
        AnimHeading = 175.53,
        AnimType = 3,
        Quality = 'medium',
        DataStore = nil
    },
    [12] = {
        Loc = vector3(3535.3874511719, 3662.1896972656, 28.121885299683),
        AnimLoc = vector3(3535.3837890625, 3662.9389648438, 28.121885299683),
        AnimHeading = 180.26,
        AnimType = 3,
        Quality = 'medium',
        DataStore = nil
    },
    [13] = {
        Loc = vector3(3535.1958007813, 3661.2314453125, 28.121885299683),
        AnimLoc = vector3(3535.1079101563, 3660.6376953125, 28.121885299683),
        AnimHeading = 351.55,
        AnimType = 3,
        Quality = 'high',
        DataStore = nil
    },
    [14] = {
        Loc = vector3(3532.9790039063, 3659.0646972656, 28.121885299683),
        AnimLoc = vector3(3533.080078125, 3659.9528808594, 28.121885299683),
        AnimHeading = 188.51,
        AnimType = 3,
        Quality = 'regular',
        DataStore = nil
    },
    [15] = {
        Loc = vector3(3536.0620117188, 3658.720703125, 28.121894836426),
        AnimLoc = vector3(3536.1450195313, 3659.314453125, 28.121894836426),
        AnimHeading = 172.02,
        AnimType = 3,
        Quality = 'high',
        DataStore = nil
    },
    [16] = {
        Loc = vector3(3538.2316894531, 3660.6450195313, 28.121883392334),
        AnimLoc = vector3(3538.1447753906, 3660.0512695313, 28.121883392334),
        AnimHeading = 351.68,
        AnimType = 3,
        Quality = 'regular',
        DataStore = nil
    },
    [17] = {
        Loc = vector3(3564.9282226563, 3679.0458984375, 28.121877670288),
        AnimLoc = vector3(3564.1799316406, 3679.0947265625, 28.121877670288),
        AnimHeading = 266.24,
        AnimType = 3,
        Quality = 'regular',
        DataStore = nil
    },
    [18] = {
        Loc = vector3(3604.2875976563, 3741.3327636719, 28.690093994141),
        AnimLoc = vector3(3605.0610351563, 3740.8742675781, 28.690093994141),
        AnimHeading = 59.33,
        AnimType = 2,
        Quality = 'regular',
        DataStore = nil
    },
    [19] = {
        Loc = vector3(3623.7021484375, 3723.6267089844, 28.690095901489),
        AnimLoc = vector3(3623.1953125, 3723.9479980469, 28.690095901489),
        AnimHeading = 234.91,
        AnimType = 2,
        Quality = 'regular',
        DataStore = nil
    },
    [20] = {
        Loc = vector3(3592.3151855469, 3725.8403320313, 29.689407348633),
        AnimLoc = vector3(3593.1062011719, 3725.4111328125, 29.689407348633),
        AnimHeading = 61.48,
        AnimType = 1,
        Quality = 'medium',
        DataStore = nil
    }
}

Config.Sayings = { --These are all the lines used for sending notifications to 3d text. Did this so its easy to change for other languages!
    [1] = "Presione [~r~ E ~w~] para abrir ~y~ panel de control ~w~ y busque ~r~ paneles de seguridad ~w~!", 
    [2] = "Comprobación de paneles de seguridad",
    [3] = "¡Vaya y ~r~ deshabilite ~w~ todos los ~y~ paneles de seguridad ~w~!",

    [4] = "El robo no se puede iniciar por otro ~r~", --These two go together
    [5] = "~w~ segundos",

    [6] = "Presione [~r~ E ~w~] para cortar los cables del sistema!",
    [7] = "Redireccionamiento de cables",

    [8] = "Quimicos", --These are all the blips for pickups
    [9] = "Productos químicos radiactivos",
    [10] = "Sustancias químicas altamente radiactivas",

    [11] = "[E] ~r~Cerrar",
    [12] = "[E] ~g~Abrir",
    [13] = "~r~Cerrada",
    [14] = "~g~Abierta",

    [15] = "Panel de Seguridad",
    [16] = "Presione [~r~E~w~] para recoger productos químicos!",
    [17] = "¡Ponte la mascara! ¡Los químicos te están haciendo daño!",
    [18] = "¡Tu máscara se rompió!",
    [19] = "Recoger productos químicos",
    [20] = "No se puede recoger",
    [21] = "Presione [~r~ E ~w~] para cortar un cable del sistema de seguridad",
    [22] = "Desactivación del panel de seguridad",
    [23] = "¡Todos los paneles de seguridad están ~p~ deshabilitados ~w~! ¡Vuelve al ~g~ Panel de Control ~w~ y ~r~ redirige los cables!",

    [24] = "Existen ~r~", -- These go together, For how many security panels are left notification
    [25] = " ~y~Paneles de seguridad ~w~ sin deshabilitar!",

    [26] = "¡Cortaste un ~y~ cable ~w~ equivocado! ¡Se ha disparado la ~b~ alarma policial ~w~! ¡Date prisa y ~r~ corta ~w~ el resto!",
    [27] = 'No tienes ~r~ alicates ~w~ para cortar cables',
    [28] = '~g~ ¡Comenzó el robo ~w~! ¡Vaya y ~p~ recopile todos los datos ~w~ antes de que los datos se vuelvan inútiles! Tiempo restante: ~r~',
    [29] = '¡Te has puesto una ~y~ Máscara de riesgo biológico ~w~!',
    [30] = '~r~ Robo ~w~ completo!',
    [31] = '~r~ Robo ~w~ completo! ¡Vaya y venda los ~y~ químicos ~w~ por dinero!',

    [32] = '¡Cancelaste el robo en curso en Humane Labs!', --All admin cancel responses
    [33] = '¡No hay ningún robo activo de Humane Labs en este momento!',
    [34] = '¡No eres un ~r~ admin ~w~! ¡No se puede cancelar un robo!',
    [35] = '¡Este comando no está habilitado!',

    [36] = "Rey Noob: el robo de Humane Lab",
    [37] = 'Alguien está ~r~ robando ~w~ el ~g~ Humane Labs ~w~',
    [38] = "Presione [~r~ E ~w~] para forzar la puerta.",
    [39] = "Puerta con ganzúa",
    [40] = 'Robo ~r~ Cancelado!',
    [41] = '¡Tus pinzas se rompieron!',
    [42] = "Presione [~y~ E ~w~] para desactivar la alarma de viaje de seguridad.",
    [43] = "Desactivación de la alarma de viaje de seguridad",
    [44] = "Presione [~g~ E ~w~] para ir al piso inferior",
    [45] = "Presione [~g~ E ~w~] para ir al piso superior",
    [46] = "¡Necesitas una ~g~ Ganzúa HL ~w~ para poder abrir esto!",

    [47] = "¡No hay suficientes ~y~ policías disponibles ~w~! Necesitas ~r~",
    [48] = "~w~ disponibles para comenzar esto!"
}