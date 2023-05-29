Config.Actividades["carreras"] = {
    [1] = {
        title = "Actividad - Carreras Motocross",
        coords = vector3(823.28, 2367.84, 51.32), heading = 85.44, 
        ped = "u_m_y_sbike",
        text = "Habla con Lebron para coger la moto",
        typeOfMission = "skin",
        --skinMale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":181,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":101,"sex":0,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":236,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":109,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":151,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":15}',
        --skinFemale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":182,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":102,"sex":1,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":233,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":111,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":153,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":14}'
    },
    [2] = {
        coords = vector3(827.2, 2370.0, 51.52), heading = 7.76, 
        ped = "s_f_y_baywatch_01",
        typeOfMission = "showMenu",
        menuTitle = "Elige tu moto",
        elements = {
            {label = "Sanchez", value = "sanchez"},
            {label = "Sanchez 2", value = "sanchez2"},
            {label = "BF400", value = "bf400"},
            {label = "Manchez", value = "manchez"}
        },
        afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(824.76, 2373.12, 52.44,273.16),
    },
    [3] = {
        marker = vector3(824.76, 2373.12, 51.44),
        floatingMsg = "Dejar el vehículo",
        text = "Devuelve las llaves y finaliza la actividad",
        typeOfMission = "deletecar", plate = "MOT", blip = true
    },
    [4] = {
        marker = vector3(823.08, 2365.52, 51.44),
        hide = true,
        floatingMsg = "Devolver las llaves y finalizar la actividad",
        typeOfMission = "menu_custom", menu = "Carreras_EndActivity", blip = true
    },
}

Config.Actividades["circuito"] = {
[1] = {
    title = "Actividad - Circuito Karting",
    coords = vector3(-162.609, -2131.40, 15.705), heading = 190.44, 
    ped = "u_m_y_sbike",
    text = "Habla con Frank, el que esta ahi al lado para coger el kart",
    typeOfMission = "skin",
   -- skinMale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":181,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0, "torso_1":147, "arms":96,"sex":0,"decals_2":0,"arms_2":0,"helmet_1":18,"bproof_1":0,"beard_2":0,"mask_2":0,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":1,"chest_1":147,"bags_1":0,"skin":10,"glasses_1":109,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":125,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":0,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":147,"jbbl":147,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":0,"pants_2":1,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":15}',
    --skinFemale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":182,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":102,"sex":1,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":233,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":111,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":153,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":14}'
},
[2] = {
    coords = vector3(-158.196, -2129.18, 15.705), heading = 190.76, 
    ped = "u_m_y_smugmech_01",
    typeOfMission = "showMenu",
    menuTitle = "Elige tu kart",
    elements = {
        {label = "Kart", value = "veto2"},
    },
    afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(-149.567, -2151.69, 16.704, 273.16),
},
[3] = {
    marker = vector3(-156.452, -2132.86, 15.705),
    floatingMsg = "Deja el vehículo",
    text = "Devuelve el kart cuando quieras y finaliza la actividad",
    typeOfMission = "deletecar", plate = "CAR", blip = true
},
[4] = {
    marker = vector3(-153.789, -2127.30, 15.705),
    hide = true,
    floatingMsg = "Devuelve las llaves en el puesto de al lado de perritos calientes",
    typeOfMission = "menu_custom", menu = "Carreras_EndActivity", blip = true
},
}


Config.Actividades["descensochilliad"] = {
    [1] = {
        title = "Actividad - Descenso del Chilliad",
        coords = vector3(501.31, 5601.35, 795.66), heading = 179.13, 
        ped = "a_m_y_motox_01",
        text = "Habla con Juan para coger tu vehículo",
        typeOfMission = "skin",
        --skinMale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":181,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":101,"sex":0,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":236,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":109,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":151,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":15}',
        --skinFemale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":182,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":102,"sex":1,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":233,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":111,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":153,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":14}'
    },
    [2] = {
        coords = vector3(495.7, 5596.2, 794.13), heading = 195.75, 
        ped = "a_m_y_motox_02",
        typeOfMission = "showMenu",
        menuTitle = "Elige tu vehículo",
        elements = {
            {label = "Sanchez", value = "sanchez"},
            {label = "Sanchez 2", value = "sanchez2"},
            {label = "BF400", value = "bf400"},
            {label = "Manchez", value = "manchez"},
        },
        afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(489.74, 5590.17, 793.15, 187.2),
        text = "¡Intenta llegar el primero!"
    },
    [3] = {
        marker = vector3(-1493.67, 4980.69, 62.17),
        floatingMsg = "Dejar el vehículo",
        text = "Devuelve las llaves y finaliza la actividad",
        typeOfMission = "deletecar", plate = "CAR", blip = true
    },
    [4] = {
        coords = vector3(-1490.86, 4981.43, 62.33), heading = 80.39, 
        ped = "a_m_y_motox_01",
        marker = vector3(-1490.86, 4981.43, 62.33),
        hide = true,
        floatingMsg = "Devolver las llaves y finalizar la actividad",
        typeOfMission = "menu_custom", menu = "Carreras_EndActivity", blip = true
    },
}

Config.Actividades["carrerasagua"] = {
    [1] = {
        title = "Actividad - Carrera de motos de agua",
        coords = vector3(673.54, -1510.89, 8.71), heading = 292.17, 
        ped = "ig_stretch",
        text = "Habla con Tayler para coger la moto de agua",
        typeOfMission = "skin",
        --skinMale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":181,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":101,"sex":0,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":236,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":109,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":151,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":15}',
        --skinFemale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":182,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":102,"sex":1,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":233,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":111,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":153,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":14}'
    },
    [2] = {
        coords = vector3(660.31, -1508.39, 9.68), heading = 16.77, 
        ped = "ig_g",
        typeOfMission = "showMenu",
        menuTitle = "Elige la moto",
        elements = {
            {label = "Moto de agua 1", value = "seashark"},
            {label = "Moto de agua 2", value = "seashark2"},
        },
        afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(656.75, -1513.7, 8.95, 190.85),
        text = "¡Intenta llegar el primero!"
    },
    [3] = {
        marker = vector3(-999.51, -1398.98, -0.09),
        floatingMsg = "Dejar el vehículo",
        text = "Devuelve las llaves y finaliza la actividad",
        typeOfMission = "deletecar", plate = "CAR", blip = true
    },
    [4] = {
        coords = vector3(-996.2, -1394.69, 0.6), heading = 196.37, 
        ped = "ig_g",
        marker = vector3(-996.2, -1394.69, 0.6),
        hide = true,
        floatingMsg = "Devolver las llaves y finalizar la actividad",
        typeOfMission = "menu_custom", menu = "Carreras_EndActivity", blip = true
    },
    
}

Config.Actividades["triatlón"] = {
    [1] = {
        title = "Actividad - Triatlón",
        coords = vector3(2415.32, 4609.16, 31.36), heading = 45.58, 
        ped = "ig_stretch",
        text = "¡Mueve el culo rechoncho!",
        typeOfMission = "skin",
        --skinMale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":181,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":101,"sex":0,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":236,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":109,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":151,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":15}',
        --skinFemale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":182,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":102,"sex":1,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":233,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":111,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":153,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":14}'
    },
    [2] = {
        coords = vector3(2408.49, 4606.36, 30.57), heading = 31.95, 
        ped = "ig_devin",
        typeOfMission = "showMenu",
        menuTitle = "Elige la moto",
        elements = {
            {label = "Moto de agua 1", value = "seashark"},
        },
        afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(2412.37, 4603.81, 30.12, 125.81),
    },
    [3] = {
        marker = vector3(-2085.23,2607.69, -0.09),
        floatingMsg = "Dejar el vehículo",
        typeOfMission = "deletecar", plate = "CAR", blip = true
    },
    [4] = {
        coords = vector3(-2081.59, 2610.84, 2.08), heading = 31.95, 
        ped = "ig_maryann",
        hide = true,
        floatingMsg = "¡Elige tu bicicleta y ve hasta mi compañero!",
        typeOfMission = "showMenu",
        menuTitle = "Elige la bicicleta",
        elements = {
            {label = "Bicicleta de montaña", value = "scorcher"},
            {label = "Bicileta de carretera", value = "seashark3"},
        },
        afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(-2095.13, 2636.24, 1.93, 25.86),

    },
    [5] = {
        marker = vector3(710.44, 4175.99, 39.71),
        floatingMsg = "Dejar el vehículo",
        typeOfMission = "deletecar", plate = "CAR", blip = true
    },
    [6] = {
        coords = vector3(710.44, 4175.99, 39.71), heading = 275.28, 
        ped = "ig_tylerdix",
        typeOfMission = "skin"
    },
    [7] = {
        coords = vector3(1979.67, 3780.78, 31.18), heading = 211.08, 
        ped = "ig_dom",
        marker = vector3(1979.67, 3780.78, 31.18),
        hide = true,
        floatingMsg = "Devolver las llaves y finalizar la actividad",
        typeOfMission = "menu_custom", menu = "Carreras_EndActivity", blip = true
    },
}

Config.Actividades["carrerabuggies"] = {
    [1] = {
        title = "Actividad - Carrera de Buggies",
        coords = vector3(-1574.68, 5171.95, 18.59), heading = 156.04, 
        ped = "s_m_y_ammucity_01",
        text = "Habla con Hawk para elegir tu buggie",
        typeOfMission = "skin",
        --skinMale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":181,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":101,"sex":0,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":236,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":109,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":151,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":15}',
        --skinFemale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":182,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":102,"sex":1,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":233,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":111,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":153,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":14}'
    },
    [2] = {
        coords = vector3(-1587.77, 5159.4, 18.57), heading = 277.99, 
        ped = "cs_old_man2",
        typeOfMission = "showMenu",
        menuTitle = "Elige el buggie",
        elements = {
            {label = "Buggie oxidado", value = "dune"},
            {label = "Bifta", value = "bifta"},
            {label = "Outlaw", value = "outlaw"},
            {label = "Vagrant", value = "vagrant"},
        },
        afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(-1578.26, 5161.23, 18.78, 189.29),
        text = "¡Intenta llegar el primero!"
    },
    [3] = {
        marker = vector3(1660.65, 4799.77, 41.03),
        floatingMsg = "Dejar el vehículo",
        text = "Devuelve las llaves y finaliza la actividad",
        typeOfMission = "deletecar", plate = "CAR", blip = true
    },
    [4] = {
        coords = vector3(1660.01, 4788.16, 40.97), heading = 4.82, 
        ped = "u_f_o_prolhost_01",
        marker = vector3(-996.2, -1394.69, 0.6),
        hide = true,
        floatingMsg = "Devolver las llaves y finalizar la actividad",
        typeOfMission = "menu_custom", menu = "Carreras_EndActivity", blip = true
    },
}

Config.Actividades["submarino"] = {
    [1] = {
        title = "Actividad - Expedición submarina",
        coords = vector3(-277.89, 6637.15, 6.51), heading = 220.05, 
        ped = "s_m_y_baywatch_01",
        text = "Habla con Marina para elegir tu vehículo",
        typeOfMission = "skin",
        --skinMale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":181,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":101,"sex":0,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":236,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":109,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":151,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":15}',
        --skinFemale = '{"blemishes_1":0,"age_2":0,"lipstick_1":0,"bodyb_2":0,"shoes_1":182,"noset":0,"hair_color_2":0,"neckt":0,"watches_1":-1,"complexion_2":0,"nosebh":0,"lipstick_3":0,"lipstick_2":0,"chain_2":0,"eyebh":0,"arms":102,"sex":1,"decals_2":0,"arms_2":0,"helmet_1":16,"bproof_1":0,"beard_2":0,"mask_2":0,"torso_1":233,"beard_4":0,"lipstick_4":0,"hair_color_1":0,"hair_1":1,"decals_1":0,"nosel":0,"bracelets_1":-1,"eyebf":0,"eyebrows_2":0,"age_1":0,"eyebrows_1":0,"complexion_1":0,"torso_2":13,"chest_1":0,"bags_1":0,"skin":10,"glasses_1":111,"cbh":0,"chest_2":0,"moles_2":0,"pants_1":153,"eyebrows_4":0,"mask_1":0,"blush_3":0,"chbbl":0,"watches_2":0,"blemishes_2":0,"noseh":0,"shoes_2":5,"cbw":0,"chho":0,"glasses_2":2,"bodyb_1":0,"jbbl":0,"makeup_1":0,"makeup_4":0,"nosepl":0,"chbble":0,"beard_3":0,"tshirt_2":0,"ears_1":-1,"ears_2":0,"glasses":0,"sun_2":0,"chbw":0,"eyeop":0,"chest_3":0,"shoes":35,"moles_1":0,"makeup_2":0,"bracelets_2":0,"face":0,"helmet_2":6,"pants_2":5,"bags_2":0,"lipst":0,"sun_1":0,"makeup_3":0,"nosew":0,"hair_2":0,"eye_color":0,"eyebrows_3":0,"chw":0,"beard_1":0,"blush_2":0,"bproof_2":0,"blush_1":0,"chain_1":0,"face_2":-1,"jbw":0,"tshirt_1":14}'
    },
    [2] = {
        coords = vector3(-283.63, 6625.77, 6.19), heading = 321.66, 
        ped = "s_f_y_baywatch_01",
        typeOfMission = "showMenu",
        menuTitle = "Elige el buggie",
        elements = {
            {label = "Submarino de 4 plazas", value = "avisa"},
            {label = "Submarino de 1 plaza", value = "submersible2"},
        },
        afterMenu = "spawnVehicle", spawnCoordsVeh = vector4(-307.82, 6661.32, 1, 47.05),
        text = "¡Explora el fondo del mar!"
    },
    [3] = {
        marker = vector3(-307.82, 6661.32, 0),
        floatingMsg = "Dejar el vehículo",
        text = "Devuelve las llaves y finaliza la actividad",
        typeOfMission = "deletecar", plate = "CAR", blip = true
    },
    [4] = {
        coords = vector3(-266.1, 6642.78, 6.46), heading = 138.21, 
        ped = "s_f_y_baywatch_01",
        marker = vector3(-266.1, 6642.78, 6.46),
        hide = true,
        floatingMsg = "Devuelve las llaves y finalizar la actividad",
        typeOfMission = "menu_custom", menu = "Carreras_EndActivity", blip = true
    },
}