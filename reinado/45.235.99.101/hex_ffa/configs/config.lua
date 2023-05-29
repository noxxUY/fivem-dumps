Config = {}

Config.Framework = 'ESX'
Config.Locale = 'de'
Config.CommandName = 'salir'

--[[
Export to check it the Player is in FFA:
exports['hex_ffa']:isInZone()
CLIENT SIDE ONLY

Example in esx_ambulancejob:

AddEventHandler('esx:onPlayerDeath', function()
	status, fError = pcall(function()
		if not exports["hex_ffa"]:isInZone() then
			OnPlayerDeath()
		end
	end)

	if not status then
		OnPlayerDeath()
	end
end)
]]


Config.Positions = {
    [1] = {
        coords = vector3(243.2071, -1073.2917, 29.2851),
        job = {
            enabled = false,
            name = 'police',
            grade = 1
        },

        marker = {
            enabled = true,
            type = 31,
            drawDistance = 50.0,
            scale = vector3(1.0, 1.0, 1.0),
            color = {
                red = 255,
                green = 46,
                blue = 58,
                alpha = 100
            },
    
            moveUpAndDown = false,
            rotate = true
        },

        blip = {
            enabled = true,
            sprite = 84,
            scale = 0.8,
            color = 37,
            display = 4,
            shortRange = true,
            text = 'FFA - Paintball'
        },

        gamemodes = {
            ['ffa'] = {
                {
                    name = 'Cementerio de Aviones',
                    label = 'SMG',
                    maxPlayers = 20,
                    center = vector3(2386.367, 3082.089, 48.19027),
                    size = 100.0,
                    sphere = {
                        enabled = false,
                        red = 255,
                        green = 46,
                        blue = 58,
                        alpha = 0.5
                    },
                    dimension = 510,
                    imgUrl = "https://cdn.discordapp.com/attachments/951826753129697301/964181327584825395/flughafen.png",
                    stats = true,
                    xpForKill = 2,
    
                    ownWeapons = false,
                    weapons = {
                        {
                            name = joaat('WEAPON_SMG'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP'),
                                joaat('COMPONENT_AT_AR_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_SMG_MK2'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP'),
                                joaat('COMPONENT_AT_AR_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_COMBATPDW'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_AR_FLSH'),
                                joaat('COMPONENT_AT_AR_AFGRIP'),
                            }
                        },
                    },


                    spawns = {
                        vector4(2360.073, 3129.041, 48.20869, 0.0),
                        vector4(2428.039, 3124.009, 48.14234, 0.0),
                        vector4(2435.5923, 3087.9827, 48.1533, 0.0),
                        vector4(2409.702, 3033.869, 48.16072, 0.0),
                        vector4(2355.944, 3038.585, 48.16628, 0.0),
                        vector4(2382.8660, 3027.2449, 48.1576, 0.0),
                        vector4(2400.7046, 3028.7883, 48.1526, 0.0),
                        vector4(2431.8601, 3046.2708, 48.1524, 0.0),
                        vector4(2378.8662, 3160.5381, 48.2112, 0.0),
                        vector4(2338.9009, 3110.5952, 48.2089, 0.0)
                    }

                },

                {
                        name = 'Cementerio de Aviones',
                        label = 'Pistolas',
                        maxPlayers = 20,
                        center = vector3(2386.367, 3082.089, 48.19027),
                        size = 100.0,
                        sphere = {
                            enabled = false,
                            red = 255,
                            green = 46,
                            blue = 58,
                            alpha = 0.5
                        },
                        dimension = 515,
                        imgUrl = "https://cdn.discordapp.com/attachments/951826753129697301/964181327584825395/flughafen.png",
                        stats = true,
                        xpForKill = 2,
                        ownWeapons = false,
                        weapons = {

                            {
                                name = joaat('WEAPON_PISTOL'),
                                tintIndex = 0,
                                components = {
                                    joaat('COMPONENT_AT_PI_SUPP_02'),
                                    joaat('COMPONENT_AT_PI_FLSH'),
                                }
                            },
                            {
                                name = joaat('WEAPON_PISTOL50'),
                                tintIndex = 0,
                                components = {
                                    joaat('COMPONENT_AT_AR_SUPP_02'),
                                    joaat('COMPONENT_AT_PI_FLSH'),
                                }
                            },
                            {
                                name = joaat('WEAPON_REVOLVER'),
                                tintIndex = 0,
                                components = {
                                    joaat('COMPONENT_AT_PI_SUPP_02'),
                                }
                            },
                            {
                                name = joaat('WEAPON_HEAVYPISTOL'),
                                tintIndex = 0,
                                components = {
                                    joaat('COMPONENT_AT_PI_SUPP'),
                                    joaat('COMPONENT_AT_PI_FLSH'),
                                }
                            },
                            {
                                name = joaat('WEAPON_COMBATPISTOL'),
                                tintIndex = 0,
                                components = {
                                    joaat('COMPONENT_AT_PI_SUPP'),
                                    joaat('COMPONENT_AT_PI_FLSH'),
                                }
                            },
                        },




                spawns = {
                    vector4(2360.073, 3129.041, 48.20869, 0.0),
                    vector4(2428.039, 3124.009, 48.14234, 0.0),
                    vector4(2435.5923, 3087.9827, 48.1533, 0.0),
                    vector4(2409.702, 3033.869, 48.16072, 0.0),
                    vector4(2355.944, 3038.585, 48.16628, 0.0),
                    vector4(2382.8660, 3027.2449, 48.1576, 0.0),
                    vector4(2400.7046, 3028.7883, 48.1526, 0.0),
                    vector4(2431.8601, 3046.2708, 48.1524, 0.0),
                    vector4(2378.8662, 3160.5381, 48.2112, 0.0),
                    vector4(2338.9009, 3110.5952, 48.2089, 0.0)
                }
            },


            {
                name = 'Construcciones',
                label = 'Pistols',
                maxPlayers = 20,
                center = vector3(-160.0956, -983.2939, 256.2072),
                size = 100.0,
                sphere = {
                    enabled = false,
                    red = 255,
                    green = 46,
                    blue = 58,
                    alpha = 0.5
                },
                dimension = 520,
                imgUrl = "https://cdn.discordapp.com/attachments/951826753129697301/964181327333179524/baustelle.png",
                stats = true,
                xpForKill = 2,

                ownWeapons = false,
                weapons = {
                    {
                        name = joaat('WEAPON_PISTOL'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_PI_SUPP_02'),
                            joaat('COMPONENT_AT_PI_FLSH'),
                        }
                    },
                    {
                        name = joaat('WEAPON_PISTOL50'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_AR_SUPP_02'),
                            joaat('COMPONENT_AT_PI_FLSH'),
                        }
                    },
                    {
                        name = joaat('WEAPON_REVOLVER'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_PI_SUPP_02'),
                        }
                    },
                    {
                        name = joaat('WEAPON_HEAVYPISTOL'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_PI_SUPP'),
                            joaat('COMPONENT_AT_PI_FLSH'),
                        }
                    },
                    {
                        name = joaat('WEAPON_COMBATPISTOL'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_PI_SUPP'),
                            joaat('COMPONENT_AT_PI_FLSH'),
                        }
                    },
                },

                spawns = {
                    vector4(-140.1919, -953.3641, 254.1314, 0.0),
                    vector4(-156.8964, -949.6334, 254.1314, 0.0),
                    vector4(-156.7630, -1021.6153, 254.1315, 0.0),
                    vector4(-145.6263, -948.2170, 269.1350, 0.0),
                    vector4(-189.7213, -1010.8111, 254.3521, 0.0),
                    vector4(-166.5982, -974.7396, 259.2296, 0.0),
                    vector4(-133.9850, -958.3747, 264.1339, 0.0),
                    vector4(-136.1249, -946.9573, 259.1328, 0.0),
                    vector4(-164.1968, -974.4492, 259.2292, 0.0),
                    vector4(-162.1042, -953.7418, 269.2273, 0.0),
                    vector4(-146.5233, -950.3701, 259.1329, 0.0)
                }
            },

            {
                name = 'Construccion',
                label = 'SMG',
                maxPlayers = 20,
                center = vector3(-160.0956, -983.2939, 256.2072),
                size = 100.0,
                sphere = {
                    enabled = false,
                    red = 255,
                    green = 46,
                    blue = 58,
                    alpha = 0.5
                },
                dimension = 530,
                imgUrl = "https://cdn.discordapp.com/attachments/951826753129697301/964181327333179524/baustelle.png",
                stats = true,
                xpForKill = 2,

                ownWeapons = false,
                weapons = {
                    {
                        name = joaat('WEAPON_SMG'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_PI_SUPP'),
                            joaat('COMPONENT_AT_AR_FLSH'),
                        }
                    },
                    {
                        name = joaat('WEAPON_SMG_MK2'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_PI_SUPP'),
                            joaat('COMPONENT_AT_AR_FLSH'),
                        }
                    },
                    {
                        name = joaat('WEAPON_COMBATPDW'),
                        tintIndex = 0,
                        components = {
                            joaat('COMPONENT_AT_AR_FLSH'),
                            joaat('COMPONENT_AT_AR_AFGRIP'),
                        }
                    },
                },

                spawns = {
                    vector4(-140.1919, -953.3641, 254.1314, 0.0),
                    vector4(-156.8964, -949.6334, 254.1314, 0.0),
                    vector4(-156.7630, -1021.6153, 254.1315, 0.0),
                    vector4(-145.6263, -948.2170, 269.1350, 0.0),
                    vector4(-189.7213, -1010.8111, 254.3521, 0.0),
                    vector4(-166.5982, -974.7396, 259.2296, 0.0),
                    vector4(-133.9850, -958.3747, 264.1339, 0.0),
                    vector4(-136.1249, -946.9573, 259.1328, 0.0),
                    vector4(-164.1968, -974.4492, 259.2292, 0.0),
                    vector4(-162.1042, -953.7418, 269.2273, 0.0),
                    vector4(-146.5233, -950.3701, 259.1329, 0.0)
                }
            },
        },

            ['private'] = {
                
                {
                    name = 'Observatorio',
                    label = 'Pistol',
                    center = vector3(-419.6210, 1153.2267, 326.8732),
                    size = 100.0,
                    sphere = {
                        enabled = false,
                        red = 255,
                        green = 46,
                        blue = 58,
                        alpha = 0.5
                    },
                    imgUrl = "https://cdn.discordapp.com/attachments/951826753129697301/963815577909080094/obis.png",
                    stats = false,
                    xpForKill = 0,

                    ownWeapons = false,
                    weapons = {
                        {
                            name = joaat('WEAPON_PISTOL'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP_02'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_PISTOL50'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_AR_SUPP_02'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_REVOLVER'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP_02')
                            }
                        },
                        {
                            name = joaat('WEAPON_HEAVYPISTOL'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_COMBATPISTOL'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                    },
    
                    spawns = {
                        vector4(-395.1815, 1104.2329, 325.8436, 0.0),
                        vector4(-386.5791, 1186.0540, 325.6815, 0.0),
                        vector4(-415.6097, 1202.6626, 325.6418, 0.0),
                        vector4(-431.6885, 1207.7985, 325.7583, 0.0),
                        vector4(-473.1340, 1128.6034, 325.8687, 0.0),
                        vector4(-413.7414, 1097.9293, 332.5338, 0.0),
                        vector4(-450.2201, 1108.0962, 332.5313, 0.0)
                    }
                },

                {
                    name = 'Puerto',
                    label = 'Pistol',
                    center = vector3(1140.9429, -3008.4753, 5.8998),
                    size = 65.0,
                    sphere = {
                        enabled = false,
                        red = 255,
                        green = 46,
                        blue = 58,
                        alpha = 0.5
                    },
                    imgUrl = "https://cdn.discordapp.com/attachments/951826753129697301/963815382353870848/HAFEN.png",
                    stats = false,
                    xpForKill = 0,

                    ownWeapons = false,
                    weapons = {
                        {
                            name = joaat('WEAPON_PISTOL'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP_02'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_PISTOL50'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_AR_SUPP_02'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_REVOLVER'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP_02'),
                            }
                        },
                        {
                            name = joaat('WEAPON_HEAVYPISTOL'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                        {
                            name = joaat('WEAPON_COMBATPISTOL'),
                            tintIndex = 0,
                            components = {
                                joaat('COMPONENT_AT_PI_SUPP'),
                                joaat('COMPONENT_AT_PI_FLSH'),
                            }
                        },
                    },
    
                    spawns = {
                        vector4(1149.2280, -3026.5112, 5.9010, 0.0),
                        vector4(1164.8007, -3007.2209, 5.9012, 0.0),
                        vector4(1178.2251, -2981.6621, 5.9007, 0.0),
                        vector4(1135.2928, -2983.0776, 5.8982, 0.0),
                        vector4(1097.0931, -2999.2546, 5.7576, 0.0),
                        vector4(1103.3077, -3034.2813, 5.8842, 0.0)
                    }
                }
            }
        }
    },
}

Config.Locales = {
    ['de'] = {
        ['press_e'] = 'Presiona E para unirte a una zona FFA!',
        ['quit_zone'] = 'Saliste de %s FFA!'
    },

    ['en'] = {
        ['press_e'] = 'Pres E to join an FFA zone!',
        ['quit_zone'] = 'You have left the FFA zone %s!'
    }
}

function DrawHelpNotify(message)
    SetTextComponentFormat('STRING')
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function Notify(title, message, type, timeout)
    print(message)
    TriggerEvent('hex_hud:notify', title, message, type, timeout)
end