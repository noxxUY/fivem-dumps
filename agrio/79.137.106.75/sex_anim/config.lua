Config = {}
Config['Debug'] = false -- if this is enabled, synced animations will just spawn an npc that will do the animation with you

Config['pNotify'] = true -- use pNotify for notifications?

Config['SelectableButtons'] = { -- find controls here https://docs.fivem.net/docs/game-references/controls/
    {'~INPUT_MULTIPLAYER_INFO~', 20},
    {'~INPUT_VEH_NEXT_RADIO~', 81},
    {'~INPUT_VEH_PREV_RADIO~', 82},
    {'~INPUT_VEH_NEXT_RADIO_TRACK~', 83}, 
    {'~INPUT_VEH_PREV_RADIO_TRACK~', 84}
}

Config['OpenMenu'] = 57 -- button to open menu, set to false to disable hardcoded button opening (e.g if you want to add it to your own menu) 
Config['CancelAnimation'] = 105
-- TriggerEvent('loffe_animations:openMenu') < event to open the menu

Config['PoleDance'] = { -- allows you to pole dance at the strip club, you can of course add more locations if you want.
    ['Enabled'] = true,
    ['Locations'] = {
        {['Position'] = vector3(112.60, -1286.76, 28.56), ['Number'] = '3'},
        {['Position'] = vector3(104.18, -1293.94, 29.26), ['Number'] = '1'},
        {['Position'] = vector3(102.24, -1290.54, 29.26), ['Number'] = '2'}
    }
}

Strings = {
    ['Choose_Favorite'] = 'Qué músculo quieres usar para %s?',
    --['Select_Favorite'] = 'Añadir una Keybind para una animación',
    --['Manage_Favorites'] = 'Controlar tus keybinds',
    ['Close'] = 'Cancelar',
    ['Updated_Favorites'] = 'Actualizar Keybinds.',
    ['Remove?'] = 'Eliminar keybind "%s" ',
    ['Yes'] = 'Yes',
    ['No'] = 'No',
    ['Animations'] = 'Animaciones EXTRA',
    ['Synced'] = 'Animaciones compartidas',
    ['Sync_Request'] = 'Quieres aceptar la animacion compartida %s %s?',
    ['Pole_Dance'] = '[~r~E~w~] ',
    ['Noone_Close'] = 'Nadie cercano.',
    ['Not_In_Car'] = 'No estás dentro de un vehiculo!!'
}

Config['Synced'] = {
    {
        ['Label'] = 'Hug',
        ['RequesterLabel'] = 'hug',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.05,
                ['yP'] = 1.15,
                ['zP'] = -0.05,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Besar',
        ['RequesterLabel'] = 'Besarte con ',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'hs3_ext-20', ['Anim'] = 'cs_lestercrest_3_dual-20', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'hs3_ext-20', ['Anim'] = 'csb_georginacheng_dual-20', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 0,
                ['xP'] = 0.0,
                ['yP'] = 0.53,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Choca las cinco!!',
        ['RequesterLabel'] = 'Chocar las cinco con ',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'highfive_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'highfive_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.5,
                ['yP'] = 1.25,
                ['zP'] = 0.0,

                ['xR'] = 0.9,
                ['yR'] = 0.3,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Saludo de compas✧',
        ['RequesterLabel'] = 'Saludo de compas✧',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationpaired@f_f_fist_bump', ['Anim'] = 'fist_bump_left', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationpaired@f_f_fist_bump', ['Anim'] = 'fist_bump_right', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.6,
                ['yP'] = 0.9,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 270.0,
            }
        }
    },
    {
        ['Label'] = 'Dar la mano ( como amigos )',
        ['RequesterLabel'] = 'Alzar la mano con',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.0,
                ['yP'] = 1.2,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Dar la mano ( tema de trabajos )',
        ['RequesterLabel'] = 'Alzar la mano con',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.075,
                ['yP'] = 1.0,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
        -- NSFW animations vvvvvvvv
        {
            ['Label'] = 'Hacer una mamada [Andando]',
            ['RequesterLabel'] = 'Recibir una mamada de ',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'pimpsex_hooker', ['Flags'] = 1, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.0,
                    ['yP'] = 0.65,
                    ['zP'] = 0.0,
    
                    ['xR'] = 120.0,
                    ['yR'] = 0.0,
                    ['zR'] = 180.0,
                }
            },
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'pimpsex_punter', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = 'Tener sexo ( la persona a ti ) [Andando]',
            ['RequesterLabel'] = 'fuck',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'shagloop_hooker', ['Flags'] = 1, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.05,
                    ['yP'] = 0.4,
                    ['zP'] = 0.0,
    
                    ['xR'] = 120.0,
                    ['yR'] = 0.0,
                    ['zR'] = 180.0,
                }
            },
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'shagloop_pimp', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = 'Anal [Andando]', 
            ['RequesterLabel'] = 'Recibir un anal por ',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_a', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_poppy', ['Flags'] = 1, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.015,
                    ['yP'] = 0.35,
                    ['zP'] = 0.0,
    
                    ['xR'] = 0.9,
                    ['yR'] = 0.3,
                    ['zR'] = 0.0,
                },
            },
        },
        {
            ['Label'] = "Tener sexo ( tu a la persona ) [Dentro de un vehículo]", 
            ['RequesterLabel'] = 'Tener sexo con ',
            ['Car'] = true,
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@vice@sex', ['Anim'] = 'frontseat_carsex_loop_m', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@vice@sex', ['Anim'] = 'frontseat_carsex_loop_f', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = "Tener sexo ( la persona a ti ) [Dentro de un vehículo]", 
            ['RequesterLabel'] = 'Sexo con ',
            ['Car'] = true,
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'random@drunk_driver_2', ['Anim'] = 'cardrunksex_loop_f', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'random@drunk_driver_2', ['Anim'] = 'cardrunksex_loop_m', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = "Recibir mamada [Dentro de un vehículo]", 
            ['RequesterLabel'] = 'Hacer una mamada a ',
            ['Car'] = true,
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'm_blow_job_loop', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'f_blow_job_loop', ['Flags'] = 1,
            },
        },
        -- NSFW animations ^^^^^^^
}

Config['Animations'] = {
    {
    
        ['Label'] = 'Animaciones para fiestas🎉',
        ['Data'] = {
            {['Label'] = "Fumar", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_SMOKING'},
            {['Label'] = "Tomboriletes", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_MUSICIAN'},
            {['Label'] = "Dj", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationmale@dj', ['Anim'] = 'dj', ['Flags'] = 0},
            {['Label'] = "Cafe", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_DRINKING'},
            {['Label'] = "Servesitaa🍺", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_PARTYING'},
            {['Label'] = "Guitarra ( imaginaria )", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationmale@air_guitar', ['Anim'] = 'air_guitar', ['Flags'] = 0},
            {['Label'] = "Ou yeah", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationfemale@air_shagging', ['Anim'] = 'air_shagging', ['Flags'] = 0},
            {['Label'] = "Rock And Roll", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_upperrock', ['Anim'] = 'mp_player_int_rock', ['Flags'] = 0},
            {['Label'] = "Hacerte el drogado/borracho", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_bum_standing@drunk@idle_a', ['Anim'] = 'idle_a', ['Flags'] = 0},
            {['Label'] = "Vomitar [ En coche ]", ['Type'] = 'animation', ['Dict'] = 'oddjobs@taxi@tie', ['Anim'] = 'vomit_outside', ['Flags'] = 0},
    
        }    
    },
    {
        
        ['Label'] = 'Saludos!👋🏻',
        ['Data'] = {
            {['Label'] = "Buenas", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_hello', ['Flags'] = 0},
            {['Label'] = "Alzar la mano para dar algo", ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_a', ['Flags'] = 0},
            {['Label'] = "What´s up bro", ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_a', ['Flags'] = 0},
            --{['Label'] = "Hugging", ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_a', ['Flags'] = 0},
           -- {['Label'] = "Salute", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_uppersalute', ['Anim'] = 'mp_player_int_salute', ['Flags'] = 0},
    
        }    
    },
    {
        
        ['Label'] = 'Trabajos',
        ['Data'] = {
            {['Label'] = "Rehén : Surrender", ['Type'] = 'animation', ['Dict'] = 'random@arrests@busted', ['Anim'] = 'idle_c', ['Flags'] = 0},
            {['Label'] = "Pescadero", ['Type'] = 'scenario', ['Anim'] = 'world_human_stand_fishing'},
            {['Label'] = "Policia : Investigar", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_police_investigate@idle_b', ['Anim'] = 'idle_f', ['Flags'] = 0},
            {['Label'] = "Policia : Usar radio", ['Type'] = 'animation', ['Dict'] = 'random@arrests', ['Anim'] = 'generic_radio_chatter', ['Flags'] = 0},
            {['Label'] = "Policia : Tráfico", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_CAR_PARK_ATTENDANT'},
            {['Label'] = "Policia : Prismáticos", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_BINOCULARS'},
            {['Label'] = "Agricultor : Plantar", ['Type'] = 'scenario', ['Anim'] = 'world_human_gardener_plant'},
            {['Label'] = "Mechanic : Arreglar motorr", ['Type'] = 'animation', ['Dict'] = 'mini@repair', ['Anim'] = 'fixing_a_ped', ['Flags'] = 0},
            {['Label'] = "Medic : Investigar situación", ['Type'] = 'scenario', ['Anim'] = 'CODE_HUMAN_MEDIC_KNEEL'},
            {['Label'] = "Taxi : Hablar con el cliente [ En coche ]", ['Type'] = 'animation', ['Dict'] = 'oddjobs@taxi@driver', ['Anim'] = 'leanover_idle', ['Flags'] = 0},
            {['Label'] = "Taxi : Dar factura [ En coche ]", ['Type'] = 'animation', ['Dict'] = 'oddjobs@taxi@cyi', ['Anim'] = 'std_hand_off_ps_passenger', ['Flags'] = 0},
            {['Label'] = "Paquetero : Dar maleta/cargamento con peso", ['Type'] = 'animation', ['Dict'] = 'mp_am_hold_up', ['Anim'] = 'purchase_beerbox_shopkeeper', ['Flags'] = 0},
            {['Label'] = "Camarero de bar/discoteca : Servir un shoot", ['Type'] = 'animation', ['Dict'] = 'mini@drinking', ['Anim'] = 'shots_barman_b', ['Flags'] = 0},
            {['Label'] = "Jornalista : Hacer fotos ", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_PAPARAZZI'},
            {['Label'] = "Clipboard", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_CLIPBOARD'},
            --{['Label'] = "All Jobs : Hammering", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_HAMMERING'},
            --{['Label'] = "Bum : Holding Sign", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_BUM_FREEWAY'},
            --{['Label'] = "Bum : Human Statue", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_HUMAN_STATUE'},
    
        }    
    },
    {
        
        ['Label'] = 'Otras ( útiles )',
        ['Data'] = {
            {['Label'] = "Aplaudir", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_CHEERING'},
            {['Label'] = "Let´s gooo bro", ['Type'] = 'animation', ['Dict'] = 'mp_action', ['Anim'] = 'thanks_male_06', ['Flags'] = 0},
            {['Label'] = "Señalar a alguien", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_point', ['Flags'] = 0},
            {['Label'] = "Vamonos bro!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_come_here_soft', ['Flags'] = 0},
            {['Label'] = "Que te pasa tio!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_bring_it_on', ['Flags'] = 0},
            {['Label'] = "Yo?", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_me', ['Flags'] = 0},
            {['Label'] = "Coger algo y guardarlo rápido", ['Type'] = 'animation', ['Dict'] = 'anim@am_hold_up@male', ['Anim'] = 'shoplift_high', ['Flags'] = 0},
           -- {['Label'] = "Exhausted", ['Type'] = 'scenario', ['Anim'] = 'idle_d'},
          --  {['Label'] = "I'm the shit", ['Type'] = 'scenario', ['Anim'] = 'idle_a'},
           -- {['Label'] = "Facepalm", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationmale@face_palm', ['Anim'] = 'face_palm', ['Flags'] = 0},
            {['Label'] = "Tranqui !", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_easy_now', ['Flags'] = 0},
            {['Label'] = "Que es eso bro?", ['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@multi@', ['Anim'] = 'react_big_variations_a', ['Flags'] = 0},
            {['Label'] = "Aterrorizado", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_cower_stand@male@react_cowering', ['Anim'] = 'base_right', ['Flags'] = 0},
            {['Label'] = "Quieres pelea ?", ['Type'] = 'animation', ['Dict'] = 'anim@deathmatch_intros@unarmed', ['Anim'] = 'intro_male_unarmed_e', ['Flags'] = 0},
            {['Label'] = "Me cachis en la mar!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_damn', ['Flags'] = 0},
           -- {['Label'] = "Embrace", ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_a', ['Flags'] = 0},
            {['Label'] = "Que te jodan!", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_upperfinger', ['Anim'] = 'mp_player_int_finger_01_enter', ['Flags'] = 0},
            {['Label'] = "Chúpamela!", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_upperwank', ['Anim'] = 'mp_player_int_wank_01', ['Flags'] = 0},
            {['Label'] = "Tiro en la cabeza", ['Type'] = 'animation', ['Dict'] = 'mp_suicide', ['Anim'] = 'pistol', ['Flags'] = 0},
    
        }    
    },
    {
        
        ['Label'] = 'Deporte',
        ['Data'] = {
            {['Label'] = "Posar [ Enseñar músculos ]", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_muscle_flex@arms_at_side@base', ['Anim'] = 'base', ['Flags'] = 0},
           -- {['Label'] = "Lift weights", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_muscle_free_weights@male@barbell@base', ['Anim'] = 'base', ['Flags'] = 0},
            --{['Label'] = "Do push ups", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_push_ups@male@base', ['Anim'] = 'base', ['Flags'] = 0},
            --{['Label'] = "Do sit ups", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_sit_ups@male@base', ['Anim'] = 'base', ['Flags'] = 0},
            {['Label'] = "Yoga", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_yoga@male@base', ['Anim'] = 'base_a', ['Flags'] = 0},
    
        }    
    },
    {
        
        ['Label'] = 'Civíles',
        ['Data'] = {
            {['Label'] = "beber un cafe", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_aa_coffee@idle_a', ['Anim'] = 'idle_a', ['Flags'] = 0},
            {['Label'] = "Sentarse", ['Type'] = 'animation', ['Dict'] = 'anim@heists@prison_heistunfinished_biztarget_idle', ['Anim'] = 'target_idle', ['Flags'] = 0},
            {['Label'] = "Jugar con el móvil", ['Type'] = 'scenario', ['Anim'] = 'world_human_leaning'},
            {['Label'] = "Tomar el sol", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_SUNBATHE_BACK'},
            {['Label'] = "Tomar el sol boca abajo", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_SUNBATHE'},
            {['Label'] = "Limpiar", ['Type'] = 'scenario', ['Anim'] = 'world_human_maid_clean'},
           -- {['Label'] = "BBQ", ['Type'] = 'scenario', ['Anim'] = 'PROP_HUMAN_BBQ'},
            {['Label'] = "T", ['Type'] = 'animation', ['Dict'] = 'mini@prostitutes@sexlow_veh', ['Anim'] = 'low_car_bj_to_prop_female', ['Flags'] = 0},
            {['Label'] = "Hacerse un selfie", ['Type'] = 'scenario', ['Anim'] = 'world_human_tourist_mobile'},
            {['Label'] = "Arrimarse ala puerta para escuchar", ['Type'] = 'animation', ['Dict'] = 'mini@safe_cracking', ['Anim'] = 'idle_base', ['Flags'] = 0},
    
        }    
    },
    {
        
        ['Label'] = 'Formas de andar',
        ['Data'] = {
            {['Label'] = "Normal Chico", ['Type'] = 'walking_style', ['Style'] = 'move_m@confident'},
            {['Label'] = "Normal Chica", ['Type'] = 'walking_style', ['Style'] = 'move_f@heels@c'},
            {['Label'] = "Chico depresivo", ['Type'] = 'walking_style', ['Style'] = 'move_m@depressed@a'},
            {['Label'] = "Chica depresiva", ['Type'] = 'walking_style', ['Style'] = 'move_f@depressed@a'},
            {['Label'] = "De compras", ['Type'] = 'walking_style', ['Style'] = 'move_m@business@a'},
            {['Label'] = "Determinado", ['Type'] = 'walking_style', ['Style'] = 'move_m@brave@a'},
            {['Label'] = "Casual", ['Type'] = 'walking_style', ['Style'] = 'move_m@casual@a'},
            {['Label'] = "Brazo abiertos", ['Type'] = 'walking_style', ['Style'] = 'move_m@fat@a'},
            {['Label'] = "Hipster", ['Type'] = 'walking_style', ['Style'] = 'move_m@hipster@a'},
            {['Label'] = "Injured", ['Type'] = 'walking_style', ['Style'] = 'move_m@injured'},
            {['Label'] = "Ir con prisa", ['Type'] = 'walking_style', ['Style'] = 'move_m@hurry@a'},
            {['Label'] = "Ir debastecido", ['Type'] = 'walking_style', ['Style'] = 'move_m@hobo@a'},
            {['Label'] = "sad", ['Type'] = 'walking_style', ['Style'] = 'move_m@sad@a'},
            {['Label'] = "Musculoso", ['Type'] = 'walking_style', ['Style'] = 'move_m@muscle@a'},
            --{['Label'] = "Shocked", ['Type'] = 'walking_style', ['Style'] = 'move_m@shocked@a'},
            {['Label'] = "Cabeza arriba", ['Type'] = 'walking_style', ['Style'] = 'move_m@shadyped@a'},
            {['Label'] = "Desconcertado", ['Type'] = 'walking_style', ['Style'] = 'move_m@buzzed'},
            {['Label'] = "Enfadado con prisa", ['Type'] = 'walking_style', ['Style'] = 'move_m@hurry_butch@a'},
            {['Label'] = "Flow bacano", ['Type'] = 'walking_style', ['Style'] = 'move_m@money'},
            {['Label'] = "Trotar", ['Type'] = 'walking_style', ['Style'] = 'move_m@quick'},
            {['Label'] = "Andar con pluma", ['Type'] = 'walking_style', ['Style'] = 'move_f@maneater'},
            {['Label'] = "Moviendo culo", ['Type'] = 'walking_style', ['Style'] = 'move_f@sassy'},
            {['Label'] = "Moviendo culo 2", ['Type'] = 'walking_style', ['Style'] = 'move_f@arrogant@a'},
    
        }    
    },
    {
        
        ['Label'] = 'Sexuales!',
        ['Data'] = {
            {['Label'] = "Man receiving in car", ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'm_blow_job_loop', ['Flags'] = 0},
            {['Label'] = "Woman giving in car", ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'f_blow_job_loop', ['Flags'] = 0},
            {['Label'] = "Man on bottom in car", ['Type'] = 'animation', ['Dict'] = 'mini@prostitutes@sexlow_veh', ['Anim'] = 'low_car_sex_loop_player', ['Flags'] = 0},
            {['Label'] = "Woman on top in car", ['Type'] = 'animation', ['Dict'] = 'mini@prostitutes@sexlow_veh', ['Anim'] = 'low_car_sex_loop_female', ['Flags'] = 0},
            {['Label'] = "Tocarse los huevos", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_uppergrab_crotch', ['Anim'] = 'mp_player_int_grab_crotch', ['Flags'] = 0},
            {['Label'] = "Prostituta 1", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@idles@stripper', ['Anim'] = 'stripper_idle_02', ['Flags'] = 0},
            {['Label'] = "Prostituta 2", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'},
            {['Label'] = "Prostituta 3", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@backroom@', ['Anim'] = 'stripper_b_backroom_idle_b', ['Flags'] = 0},
            {['Label'] = "Strip 1", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@lap_dance@ld_girl_a_song_a_p1', ['Anim'] = 'ld_girl_a_song_a_p1_f', ['Flags'] = 0},
            {['Label'] = "Strip 2", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@private_dance@part2', ['Anim'] = 'priv_dance_p2', ['Flags'] = 0},
            --{['Label'] = "Stip Tease On Knees", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@private_dance@part3', ['Anim'] = 'priv_dance_p3', ['Flags'] = 0},
    
        }    
    },
    
}
