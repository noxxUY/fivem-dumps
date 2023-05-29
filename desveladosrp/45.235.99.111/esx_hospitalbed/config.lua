Config = {
    Price = 5000,
    ReviveTime = 30, -- seconds until you are revived
    Hospitals = {
        {
            Bed = {coords = vector3(314.52, -584.12, 44.2), heading = 330.59, occupied = false},
            Peds = {
                pedHash = -730659924,
                reception = {coords = vector3(308.52, -595.28, 42.28), heading = 60.9}, ---no tocar
                doctor = {coords = vector3(315.8, -584.4, 42.28), heading = 60.59},
            },
        },
        {
            Bed = {coords = vector3(1821.84, 3680.28, 35.0), heading = 115.81, occupied = false},
            Peds = {
                pedHash = -730659924,
                reception = {coords = vector3(1826.56, 3686.2, 33.32), heading = 215.92},
                doctor = {coords = vector3(1822.56, 3679.2, 33.32), heading = 30},
            },
        },
    },
}

Strings = {
    ['get_help'] = [[Presiona %s para peddir ayuda porr ~g~$%s]],
    ['not_enough'] = [[No tenes suficiente dinero para pagar el tratamiento!]],
    ['getting_help'] = [[Estas siendo tratado, quedan %s segundos!]],
    ['occupied'] = [[Operación en curso! Espera]]
}