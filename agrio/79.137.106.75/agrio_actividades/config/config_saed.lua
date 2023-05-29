Config.Actividades["medicamentos"] = {
    [1] = {
        title = "SAED - Suministros Medicos",
        blip = false,
        text = "Me acaban de avisar que el pedido de pastillas del laboratorio humane ya esta listo acércate a recogerlo.",
        coords = vector3(349.96, -590.68, 27.8), heading = 245.96, 
        ped = "s_m_m_paramedic_01",
        jobNeeded = "ambulance",
        typeOfMission = "spawncar",
        coordsToSpawn = vector3(364.76, -590.84, 28.68), coordsHeading =160.12, model = {"boxville3"}, platePrefix = "HUMANE", -- settings car
    },
    [2] = {
        marker = vector3(3559.8, 3674.52, 27.12),
        floatingMsg = "coger el material",
        text = "Firma el albarán mientras que mis trabajadores cargan la furgoneta, una vez termines vuelve al hospital.",
        typeOfMission = "loot", blip = true,
        animation = "e parkingmeter", animationDuration = 6000,
    },
    [3] = {
        marker = vector3(320.04, -569.88, 27.8),
        floatingMsg = "para dejar el vehículo",
        text = "Ves al laboratorio que hay encima de la planta de la morgue para dejar el pedido.",
        typeOfMission = "deletecar", plate = "HUMANE",blip = true,
    },
    [4] = {
        marker = vector3(230.44, -1366.4, 38.52),
        floatingMsg = "dejar el material",
        text = "Todo listo parece que ya tenemos material para abrir la farmacia, bien hecho.",
        typeOfMission = "loot", blip = true,
        animation = "e mechanic4", animationDuration = 6000,
        giveItems = {
                 {item = "ibuprofeno", quantity = 5},
                 {item = "enantyum", quantity = 5},
                 {item = "oxicodona", quantity = 5},
                 {item = "cafeina", quantity = 5},
                 {item = "pastillaanticonceptiva", quantity = 5},
                 {item = "pastilladeldiadespues", quantity = 5},
                 {item = "viagra", quantity = 5},
            },
        endActivity = true    
    },
}
