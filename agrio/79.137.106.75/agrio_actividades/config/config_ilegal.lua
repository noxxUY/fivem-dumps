Config.Actividades["cañones"] = {
    --CAÑONES
    [1] = {
        title = "Componentes - Suministros de Cañones",
        blip = false,
        text = "Si quieres la entrega vas a tener que subirte a la lancha y hacer un encargo por mi. La ubicación se encuentra en el GPS de la lancha, suerte.",
        coords = vector3(1537.08, 3797.24, 33.44), heading = 32.16, 
        ped = "cs_beverly",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(1520.12, 3829.04, 28.8), coordsHeading =27.08, model = {"dinghy4"}, platePrefix = "ARMAS", -- settings car
    },
    [2] = {
        marker = vector3(-1686.08, 5320.44, 0.16),
        floatingMsg = "Dejar la lancha",
        text = "Deja la lancha y sube al Yate, ahí te espera mi contacto de confianza.",
        typeOfMission = "deletecar", plate = "ARMAS",blip = true,
    },
    [3] = {
        coords = vector3(-2166.0, 5197.48, 15.88), heading = 107.68, 
        ped = "s_m_m_bouncer_01",
        floatingMsg = "Obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "gunbarrel", quantity = 15},
       },
       endActivity = true,
    },
}

    
Config.Actividades["culata"] = {
    --CULATAS
    [1] = {
        title = "Componentes - Suministros de Culatas",
        blip = false,
        text = "Si quieres la entrega vas a tener que subirte a la furgoneta y hacer un encargo por mi. La ubicación se encuentra en el GPS de la furgoneta, suerte.",
        coords = vector3(-567.72, 5253.08, 69.48), heading = 71.96, 
        ped = "u_m_m_bikehire_01",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(-576.32, 5251.56, 69.48), coordsHeading =342.52, model = {"youga"}, platePrefix = "ARMAS", -- settings car
    },
    [2] = {
        marker = vector3(1976.84, 5169.8, 46.64),
        floatingMsg = "dejar de la furgoneta",
        text = "Deja el camión y entra al almacén, ahí te espera mi contacto de confianza.",
        typeOfMission = "deletecar", plate = "ARMAS",blip = true,
    },
    [3] = {
        coords = vector3(1984.8, 5176.64, 46.64), heading = 135.01, 
        ped = "ig_car3guy1",
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "butt", quantity = 10},
       },
       endActivity = true,
    },
}

Config.Actividades["resortes"] = {
    --RESORTES
    [1] = {
        title = "Componentes - Suministro de Resortes",
        blip = false,
        text = "Si quieres la entrega vas a tener que subirte a la furgoneta y hacer un encargo por mi. La ubicación se encuentra en el GPS de la furgoneta, suerte.",
        coords = vector3(153.88, -3184.2, 4.92), heading = 90.16, 
        ped = "u_f_y_comjane",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(146.48, -3183.32, 4.84), coordsHeading =181.88, model = {"youga"}, platePrefix = "ARMAS", -- settings car
    },
    [2] = {
        marker = vector3(178.92, 304.96, 104.36),
        floatingMsg = "dejar la furgoneta",
        text = "Deja la furgoneta  y entra al almacén, ahí te espera mi contacto de confianza.",
        typeOfMission = "deletecar", plate = "ARMAS",blip = true,
    },
    [3] = {
        coords = vector3(187.56, 307.88, 104.4), heading = 173.8, 
        ped = "csb_chin_goon",
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "spring", quantity = 10},
       },
       endActivity = true,  
    },
}

Config.Actividades["recamara"] = {
    --RECAMARA
    [1] = {
        title = "Componentes - Suministro de Recamara",
        blip = false,
        text = "Si quieres la entrega vas a tener que subirte a la camioneta y hacer un encargo por mi. La ubicación se encuentra en el GPS de la camioneta, suerte.",
        coords = vector3(1207.4, -3122.32, 4.56), heading = 355.04, 
        ped = "ig_cletus",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(1204.68, -3116.28, 4.56), coordsHeading =359.44, model = {"bobcatxl"}, platePrefix = "ARMAS", -- settings car
    },
    [2] = {
        marker = vector3(1761.96, -1657.72, 111.72),
    floatingMsg = "dejar la camioneta",
        text = "Deja la camioneta y entra al almacén, ahí te espera mi contacto de confianza.",
        typeOfMission = "deletecar", plate = "ARMAS",blip = true,
    },
    [3] = {
        coords = vector3(1754.0, -1649.24, 111.64), heading = 278.64, 
        ped = "s_m_y_dealer_01",
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
       typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "magazine", quantity = 15},
        },
       endActivity = true,  
    },
}

Config.Actividades["percutor"] = {
--PERCUTOR
    [1] = {
        title = "Componentes - Suministro de Percutor",
        blip = false,
        text = "Si quieres la entrega vas a tener que subirte a la camioneta y hacer un encargo por mi. La ubicación se encuentra en el GPS de la camioneta, suerte.",
        coords = vector3(-435.56, -1665.32, 18.28), heading = 159.01, 
        ped = "ig_devin",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(-423.28, -1679.12, 18.04), coordsHeading =165.2, model = {"burrito3"}, platePrefix = "ARMAS", -- settings car
    },
    [2] = {
        marker = vector3(1129.36, -2044.92, 30.0),
    floatingMsg = "dejar la camioneta",
        text = "Deja la camioneta y entra al almacén, ahí te espera mi contacto de confianza.",
        typeOfMission = "deletecar", plate = "ARMAS",blip = true,
    },
    [3] = {
        coords = vector3(1137.92, -2046.12, 30.0), heading = 82.32, 
        ped = "s_m_y_devinsec_01",
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
       typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "strike", quantity = 15},
        },
       endActivity = true,  
    },
}

Config.Actividades["tiza"] = {
    --TIZA
    [1] = {
        title = "Componentes - Suministro de Tiza",
        blip = false,
        text = "Si quieres la entrega vas a tener que subirte al camión y hacer un encargo por mi. La ubicación se encuentra en el GPS del camión, suerte.",
        coords = vector3(2707.36, 2776.84, 36.88), heading = 36.01, 
        ped = "a_m_y_eastsa_02",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(2691.32, 2759.24, 36.8), coordsHeading =208.16, model = {"tiptruck2"}, platePrefix = "ARMAS", -- settings car
    },
    [2] = {
        marker = vector3(162.04, 2235.52, 89.16),
        floatingMsg = "dejar el camión",
        text = "Deja la camión y entra al almacén, ahí te espera mi contacto de confianza.",
        typeOfMission = "deletecar", plate = "ARMAS",blip = true,
    },
    [3] = {
        coords = vector3(167.08, 2229.24, 89.8), heading = 59.68, 
        ped = "g_m_y_famdnf_01",
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "tiza", quantity = 20},
        },
       endActivity = true,  
    },
}

  Config.Actividades["farmacia"] = {
    --FARMACIA
    [1] = {
        title = "Componentes - Suministro de farmacia",
        blip = false,
        text = "Si quieres la entrega vas a tener que subirte al coche y hacer un encargo por mi. La ubicación se encuentra en el GPS del coche, suerte.",
        coords = vector3(-182.16, 6389.16, 30.68), heading = 46.32, 
        ped = "s_m_m_doctor_01",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(-167.48, 6377.72, 30.32), coordsHeading =138.8, model = {"minivan"}, platePrefix = "ARMAS", -- settings car
    },
    [2] = {
        marker = vector3(1373.44, 3620.64, 33.88),
    floatingMsg = "dejar el coche",
        text = "Deja el coche y entra a la tienda, ahí te espera mi contacto de confianza.",
        typeOfMission = "deletecar", plate = "ARMAS",blip = true,
    },
    [3] = {
        coords = vector3(1399.16, 3602.48, 37.96), heading = 21.28, 
        ped = "s_m_m_linecook",
        floatingMsg = "para hablar",
        text = "Ves a la habitación de al lado y coge la mercancia",
        typeOfMission = "showMenu", blip = true,
         elements = {
            {label = "Eter", value = 4, blackMoney = nil, whiteMoney = nil},
            {label = "Levamisol", value = 5, blackMoney = nil, whiteMoney = nil},
            {label = "Estricnina", value = 6, blackMoney = nil, whiteMoney = nil},
        }, 
    },
    [4] = {
        marker = vector3(1394.48, 3601.72, 37.96), 
        
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "eter", quantity = 20},
        },
       endActivity = true,  
    },
    [5] = {
        marker = vector3(1394.48, 3601.72, 37.96),
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "levamisol", quantity = 20},
        },
       endActivity = true,  
    },
    [6] = {
        marker = vector3(1394.48, 3601.72, 37.96), 
        floatingMsg = "obtener la mercancia",
        text = "Toma aquí tienes tu parte del pastel. ¡¡Nos vemos pronto!!",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
        giveItems = {
            {item = "estricnina", quantity = 20},
        },
       endActivity = true,  
    },
}

--  Config.Actividades["buy_cannabis"] = {
--      --Weed
--      [1] = {
--          title = "Tienda de María",
--          blip = false,
--          text = "Que pasa tronco, ¿Como te va el dia quieres un canutillo?",
--         --coords = vector3(-1171.16, -1570.76, 3.68), heading = 128.24, 
--          ped = "ig_wade",
--          typeOfMission = "buyMenu",
--          removeEntity = false,
--          automaticPassStep = false,
--          menu = {
--              title = "¿Que productos necesitas?",
--              money = "white",
--              elements = {
--                 {label = "Bolsas de plastico - 1$", item = "dopebag", money = 1},
--                 {label = "1L de Agua Tratada - 2$", item = "purifiedwater", money = 2},
--                 {label = "100g de Fertilizante - 2$", item = "highgradefert", money = 2},
--                 {label = "Maceta - 25$", item = "plantpot", money = 25},
--              },
--          }
--      },
--  }