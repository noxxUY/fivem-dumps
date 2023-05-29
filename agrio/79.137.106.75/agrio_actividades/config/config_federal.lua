Config.Actividades["cocinero"] = {
    [1] = {
        title = "Federal - Cocinero",
        coords = vector3(1777.12, 2598.84, 44.8), heading = 181.24, 
        ped = "s_m_m_linecook",
        floatingMsg = "Hablar",
        text = "Recluso si quieres algo de comer cocinatelo tu, no trabajo para escoria como tu.",
        typeOfMission = "showMenu", blip = false,
        menuTitle = "¿Qué quieres comer?",
            elements = {
                {label = "Taco", value = 3, blackMoney = nil, whiteMoney = nil},
                {label = "Agua", value = 5, blackMoney = nil, whiteMoney = nil},
                {label = "Tarta", value = 7, blackMoney = nil, whiteMoney = nil},
            }, 

    },
    [2] = {
    endActivity = false,
    },

    [3] = {
        marker = vector3(1780.28, 2598.08, 44.8),
        floatingMsg = "Coger ingredientes",
        text = "Coge los ingredientes para preparar un Taco",
        typeOfMission = "loot", blip = true,
        animation = "e mechanic3", animationDuration = 6000,
    },

    [4] = {
        marker = vector3(1777.88, 2597.72, 44.8),
        floatingMsg = "Cocinar",
        text = "Prepara los fogones y elabora tu plato, despues coge un plato y vete a comer fuera de mi cocina.",
        typeOfMission = "loot", blip = true,
        animation = "e bbq", animationDuration = 6000,
        giveItems = {
            {item = "taco", quantity = 1},
       },
       endActivity = true,  
    },

    [5] = {
        marker = vector3(1780.28, 2598.08, 44.8),
        floatingMsg = "Coger vaso",
        text = "Coge el vaso y bebe agua del grifo no voy a gastar en agua para la escoria.",
        typeOfMission = "loot", blip = true,
        animation = "e mechanic3", animationDuration = 6000,
    },

    [6] = {
        marker = vector3(1776.32, 2598.04, 44.8),
        floatingMsg = "Beber",
        text = "Sirvete el agua y fuera de mi cocina.",
        typeOfMission = "loot", blip = true,
        animation = "e drink", animationDuration = 6000,
        giveItems = {
            {item = "agua", quantity = 1},
       },
       endActivity = true,  
    },

    [7] = {
        marker = vector3(1780.28, 2598.08, 44.8),
        floatingMsg = "Coger tarta",
        text = "Coge la tarta de la dispensa y ves a por un plato",
        typeOfMission = "loot", blip = true,
        animation = "e mechanic3", animationDuration = 6000,
    },

    [8] = {
        marker = vector3(1780.56, 2592.08, 44.8),
        floatingMsg = "Coger Plato",
        text = "Corta un trozo de tarta y vete de mi cocina",
        typeOfMission = "loot", blip = true,
        animation = "e type", animationDuration = 3000,
        giveItems = {
            {item = "cake", quantity = 1},
       },
       endActivity = true,  
    },

}
