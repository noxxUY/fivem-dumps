-- Config.Actividades["camionero"] = {
--     [1] = {
--         title = "Trabajo - Camionero",
--         jobNeeded = "camionero", 
--         dmvLicense = true,
--         blipSprite = 477, blipScale = 0.6, blipColour = 0,
--         text = "Habla con Samantha para elegir la ruta",
--         --coords = vector3(-3.6, -2538.88, 5.16), heading = 332.96, 
--         ped = "s_f_y_airhostess_01",
--         typeOfMission = "skin",
--         skinMale = '{"bracelets_2":0,"helmet_1":-1,"shoes":10,"nosel":0,"face_2":17,"glasses_2":0,"bracelets_1":-1,"makeup_2":0,"lipstick_4":0,"noseh":0,"beard_4":0,"sun_1":0,"helmet_2":0,"jbbl":0,"chain_1":231,"complexion_1":0,"chbbl":2,"age_2":0,"chw":0,"decals_2":0,"decals_1":0,"hair_color_1":5,"hair_color_2":5,"chbw":0,"face":17,"shoes_1":12,"glasses_1":5,"bproof_1":3,"lipstick_2":0,"skin":5,"blush_2":0,"eyebrows_2":10,"moles_1":0,"noset":0,"beard_3":0,"arms":166,"lipstick_3":0,"age_1":0,"pants_1":1,"bodyb_1":0,"hair_2":4,"tshirt_1":15,"moles_2":0,"bproof_2":4,"watches_2":0,"eyebrows_3":0,"complexion_2":0,"torso_2":0,"bodyb_2":0,"nosebh":0,"tshirt_2":0,"lipstick_1":0,"pants_2":0,"hair_1":13,"eyeop":6,"eyebrows_4":0,"bags_2":0,"ears_1":-1,"chest_1":0,"nosepl":-1,"nosew":-10,"blush_3":0,"lipst":-2,"beard_1":10,"ears_2":0,"watches_1":-1,"chest_3":0,"eye_color":22,"chain_2":1,"sun_2":0,"makeup_4":0,"blemishes_1":0,"torso_1":160,"shoes_2":6,"eyebf":0,"chbble":-8,"mask_1":0,"chest_2":0,"cbh":0,"blemishes_2":0,"glasses":0,"eyebrows_1":0,"jbw":0,"eyebh":0,"sex":0,"makeup_1":0,"chho":0,"cbw":0,"blush_1":0,"neckt":0,"arms_2":0,"bags_1":0,"beard_2":10,"mask_2":0,"makeup_3":0}',
--         skinFemale = '{"bracelets_2":0,"helmet_1":-1,"shoes":10,"nosel":0,"face_2":17,"glasses_2":0,"bracelets_1":-1,"makeup_2":0,"lipstick_4":0,"noseh":0,"beard_4":0,"sun_1":0,"helmet_2":0,"jbbl":0,"chain_1":231,"complexion_1":0,"chbbl":2,"age_2":0,"chw":0,"decals_2":0,"decals_1":0,"hair_color_1":5,"hair_color_2":5,"chbw":0,"face":17,"shoes_1":4,"glasses_1":11,"bproof_1":130,"lipstick_2":0,"skin":5,"blush_2":0,"eyebrows_2":10,"moles_1":0,"noset":0,"beard_3":0,"arms":175,"lipstick_3":0,"age_1":0,"pants_1":1,"bodyb_1":0,"hair_2":4,"tshirt_1":14,"moles_2":0,"bproof_2":4,"watches_2":0,"eyebrows_3":0,"complexion_2":0,"torso_2":0,"bodyb_2":0,"nosebh":0,"tshirt_2":0,"lipstick_1":0,"pants_2":0,"hair_1":13,"eyeop":6,"eyebrows_4":0,"bags_2":0,"ears_1":-1,"chest_1":0,"nosepl":-1,"nosew":-10,"blush_3":0,"lipst":-2,"beard_1":10,"ears_2":0,"watches_1":-1,"chest_3":0,"eye_color":22,"chain_2":1,"sun_2":0,"makeup_4":0,"blemishes_1":0,"torso_1":153,"shoes_2":2,"eyebf":0,"chbble":-8,"mask_1":0,"chest_2":0,"cbh":0,"blemishes_2":0,"glasses":0,"eyebrows_1":0,"jbw":0,"eyebh":0,"sex":1,"makeup_1":0,"chho":0,"cbw":0,"blush_1":0,"neckt":0,"arms_2":0,"bags_1":0,"beard_2":10,"mask_2":0,"makeup_3":0}'
--     },
--     [2] = {
--         coords = vector3(-8.84, -2535.88, 6.4), heading = 264.04, 
--         blip = true,
--         text = "Entrega la mercancía en el punto indicado en el GPS",
--         ped = "s_f_y_airhostess_01",
--         typeOfMission = "menu_custom", menu = "Camionero_ElegirPunto", automaticPassStep = false,
--         menupoints = {
--             {Text = "Entrega de Coches", coords = vector3(205.28, 2787.0, 44.64), trailer = "packer", carga = "tr4", finalmoney = 387},
--             {Text = "Entrega de Petroleo", coords = vector3(-3175.24, 1108.48, 19.84), trailer = "packer", carga = "tanker", finalmoney = 430},
--             {Text = "Entrega de Leña", coords = vector3(-599.08, 5301.0, 69.2), trailer = "packer", carga = "trailerlogs", finalmoney = 430},
--             {Text = "Entrega de Minería", coords = vector3(2730.8, 2778.24, 35.04), trailer = "packer", carga = "armytrailer2", finalmoney = 473},
--             {Text = "Entrega de TV", coords = vector3(-1141.37, -525.18, 30.79), trailer = "HAULER", carga = "tvtrailer", finalmoney = 258}
--         }
--     },
--     [3] = {
--         marker = nil,
--         floatingMsg = "Dejar la carga",
--         text = "Devuelve el camión en el puerto",
--         typeOfMission = "menu_custom", menu = "Camionero_EntregarCarga"
--     },
--     [4] = {
--         marker = vector3(52.04, -2468.8, 5.0),
--         floatingMsg = "Dejar el vehículo",
--         text = "Ves a por tu ropa y a por la paga",
--         typeOfMission = "deletecar", plate = "ECA",blip = true
--     },
--     [5] = {
--         marker = vector3(-0.64, -2540.56, 5.16),
--         floatingMsg = "Vestirse de civil y cobrar",
--         hide = true,
--         typeOfMission = "menu_custom", menu = "Camionero_FinalMoney",blip = true, finalmoney = nil
--     },
-- }

-- Config.Actividades["camioneronorte"] = {
--     [1] = {
--         title = "Trabajo - Camionero",
--         blipSprite = 477, blipScale = 0.6, blipColour = 0,
--         jobNeeded = "camionero",
--         text = "Habla con Samantha para elegir la ruta",
--         --coords = vector3(-247.67, 6067.4, 31.34), heading = 133.79, 
--         ped = "s_f_y_airhostess_01",
--         typeOfMission = "skin",
--         skinMale = '{"hair_color_1":15,"decals_1":0,"eye_color":2,"eyebrows_4":0,"glasses_2":0,"watches_1":-1,"glasses":0,"noset":0,"bodyb_1":0,"lipstick_3":0,"shoes_2":6,"torso_2":0,"bracelets_1":-1,"moles_1":5,"chain_2":1,"mask_2":0,"eyeop":6,"nosel":0,"chbbl":2,"makeup_3":0,"skin":44,"beard_4":0,"blush_1":2,"pants_1":0,"eyebrows_2":10,"tshirt_1":15,"decals_2":0,"glasses_1":5,"eyebf":0,"bags_1":0,"age_1":0,"nosew":-10,"makeup_2":0,"beard_3":15,"chest_1":0,"hair_2":0,"chest_3":0,"torso_1":160,"bags_2":0,"age_2":0,"complexion_2":0,"sun_1":0,"mask_1":0,"chbw":0,"hair_1":42,"makeup_1":0,"lipstick_4":0,"cbh":0,"shoes_1":12,"neckt":0,"chbble":-8,"eyebrows_1":23,"beard_2":10,"bproof_1":3,"sex":0,"blush_3":0,"hair_color_2":0,"eyebh":0,"sun_2":0,"lipstick_1":0,"face_2":44,"face":0,"chw":0,"bproof_2":4,"chain_1":232,"chho":0,"arms":166,"jbw":0,"lipstick_2":0,"complexion_1":0,"pants_2":0,"blemishes_2":0,"shoes":10,"blemishes_1":0,"nosebh":0,"nosepl":-1,"blush_2":2,"ears_1":-1,"helmet_1":-1,"helmet_2":0,"makeup_4":0,"jbbl":0,"arms_2":0,"noseh":0,"bracelets_2":0,"moles_2":10,"lipst":-2,"bodyb_2":0,"eyebrows_3":15,"chest_2":0,"ears_2":0,"beard_1":9,"cbw":0,"tshirt_2":0,"watches_2":0}',
--         skinFemale = '{"tshirt_2":0,"decals_1":0,"ears_2":0,"bodyb_1":5,"eye_color":3,"mask_1":0,"bracelets_1":-1,"lipstick_3":0,"chbbl":2,"eyebrows_1":12,"torso_1":153,"eyeop":6,"chest_1":0,"bracelets_2":0,"chbble":-8,"pants_2":0,"shoes_1":4,"eyebrows_4":0,"chest_3":0,"lipstick_1":0,"eyebrows_3":1,"tshirt_1":14,"arms":175,"sex":1,"glasses_2":0,"makeup_1":0,"hair_1":3,"lipstick_2":0,"neckt":0,"blush_2":0,"bproof_2":4,"nosew":-10,"moles_1":3,"mask_2":0,"watches_2":0,"complexion_1":0,"bags_2":0,"beard_3":2,"makeup_3":0,"shoes_2":2,"face_2":2,"noseh":0,"beard_2":10,"hair_color_2":0,"age_2":0,"ears_1":-1,"moles_2":9,"cbw":0,"hair_2":0,"beard_1":16,"helmet_2":0,"complexion_2":0,"eyebf":0,"eyebh":0,"lipstick_4":0,"bags_1":0,"skin":8,"sun_1":0,"blemishes_2":0,"makeup_2":0,"glasses":0,"chbw":0,"beard_4":0,"blush_3":0,"nosepl":-1,"decals_2":0,"shoes":10,"watches_1":-1,"lipst":-2,"arms_2":0,"blemishes_1":0,"nosel":0,"hair_color_1":7,"helmet_1":-1,"glasses_1":11,"chain_1":232,"chest_2":0,"bodyb_2":8,"jbbl":0,"cbh":0,"blush_1":0,"torso_2":0,"noset":0,"makeup_4":0,"chain_2":1,"chho":0,"eyebrows_2":7,"pants_1":0,"jbw":0,"sun_2":0,"nosebh":0,"chw":0,"bproof_1":131,"face":2,"age_1":0}'
--     },
--     [2] = {
--         coords = vector3(-249.6, 6056.84, 31.0), heading = 199.04, 
--         blip = true,
--         text = "Entrega la mercancía en el punto indicado en el GPS",
--         ped = "s_f_y_airhostess_01",
--         typeOfMission = "menu_custom", menu = "CamioneroNorte_ElegirPunto", automaticPassStep = false,
--         menupoints = {
--             {Text = "Entrega de Coches", coords = vector3(205.28, 2787.0, 44.64), trailer = "packer", carga = "tr4", finalmoney = 387},
--             {Text = "Entrega de Petroleo", coords = vector3(-3175.24, 1108.48, 19.84), trailer = "packer", carga = "tanker", finalmoney = 301},
--             {Text = "Entrega de Leña", coords = vector3(-599.08, 5301.0, 69.2), trailer = "packer", carga = "trailerlogs", finalmoney = 86},
--             {Text = "Entrega de Minería", coords = vector3(2730.8, 2778.24, 35.04), trailer = "packer", carga = "armytrailer2", finalmoney = 387},
--             {Text = "Entrega de TV", coords = vector3(-1141.37, -525.18, 30.79), trailer = "HAULER", carga = "tvtrailer", finalmoney = 473}
--         }
--     },
--     [3] = {
--         marker = nil,
--         floatingMsg = "Dejar la carga",
--         text = "Devuelve el camión en el puerto",
--         typeOfMission = "menu_custom", menu = "Camionero_EntregarCarga"
--     },
--     [4] = {
--         marker = vector3(-280.76, 6034.68, 30.52),
--         floatingMsg = "Dejar el vehículo",
--         text = "Ves a por tu ropa y a por la paga",
--         typeOfMission = "deletecar", plate = "ECA",blip = true
--     },
--     [5] = {
--         marker = vector3(-246.76, 6068.6, 31.36),
--         floatingMsg = "Vestirse de civil y cobrar",
--         hide = true,
--         typeOfMission = "menu_custom", menu = "Camionero_FinalMoney",blip = true, finalmoney = nil
--     },
-- }