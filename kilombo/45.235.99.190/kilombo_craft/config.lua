Config = {}

Config.NotificationType = { --['mythic_notify_default', 'mythic_notify_old', 'ox_lib', 't-notify', 'col_notify', 'col_notify_new', 'Roda_Notifications' 'esx_notify', 'default-esx']--
	client = 'okokNotify',
    server = 'okokNotify'
}

Config.Webhook = ""

Config.Crafting = {
    [1] = {
        CraftData = {
            CraftLabel = '[~r~E~w~] Crafteo',
            craft_table = false, -- [If you want to disable this feature, set this to false.]-
            craft_table_coords = vec4(-215.89910888672, -1318.5484619141, 30.890493392944, 82.382057189941),
            TextUI = 'esx_textui', --[ps-ui, ox_lib, esx_textui]--
            CraftName = 'Crafteo de Herramientas',
            CraftID = 'mechanic_crafting', --[Please change this if you used ox_lib.]--
            ContextMenu = 'ox_lib', --[esx_context, ox_lib]--
            Job = 'mechanic', -- [If you want to disable this feature, set this to false.] --
            Craft = {
                [1] = {
                    blueprint_data = { -- [If you want to disable this feature, set this to false.] --
                        enable = false,
                        item = 'blueprint_carbinerifle',
                        qyt = 1
                    },
                    craft_time = 5000, -- [Change this if you use 'ox-circle' or 'ox-progress'.]
                    craft_type = 'ox-skillbar', -- [ox-skillbar, ox-circle, ox-progress]--
                    craft_type_data = {'easy', 'easy', {areaSize = 70, speedMultiplier = 0.5}, 'hard'}, -- [If you use 'ox-skillbar,' change this. / https://overextended.github.io/docs/ox_lib/Interface/Client/skillcheck]
                    craft_anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped',
                        flag = 49,
                        heading = 82.382057189941
                    }, 
                    craft_object = {
                        output_object = 'v_ind_cs_toolbox4', -- [https://forge.plebmasters.de/objects]--
                        attach_object = `prop_tool_hammer`,
                        attach_pos = vec3(0.14, 0.0, -0.01),
                        attach_rot = vec3(60.0, -147.0, 30.0),
                        attach_bone = 57005
                    },
                    output_item = 'fixkit', 
                    output_qyt = 1,
                    output_image = 'https://media.discordapp.net/attachments/792157916311322647/1098374691850301490/fixkit.png',
                    output_label = 'Kit de reparación',
                    input_items = {
                        {item = 'fixtool', value = 1, label = 'Herramientas de reparación'},
                        {item = 'wrench', value = 1, label = 'Llave Inglesa Stilson'},
                        {item = 'hammer', value = 1, label = 'Martillo'},
                    },
                }
            }
        }
    },
    [2] = {
        CraftData = {
            CraftLabel = '[~r~E~w~] Crafteo',
            craft_table = false, -- [If you want to disable this feature, set this to false.]-
            craft_table_coords = vec4(-323.14672851563, -145.92686462402, 39.015804290771, 248.72793579102),
            TextUI = 'esx_textui', --[ps-ui, ox_lib, esx_textui]--
            CraftName = 'Crafteo de Herramientas',
            CraftID = 'mechanic2_crafting', --[Please change this if you used ox_lib.]--
            ContextMenu = 'ox_lib', --[esx_context, ox_lib]--
            Job = 'mechanic2', -- [If you want to disable this feature, set this to false.] --
            Craft = {
                [1] = {
                    blueprint_data = { -- [If you want to disable this feature, set this to false.] --
                        enable = false,
                        item = 'blueprint_carbinerifle',
                        qyt = 1
                    },
                    craft_time = 5000, -- [Change this if you use 'ox-circle' or 'ox-progress'.]
                    craft_type = 'ox-skillbar', -- [ox-skillbar, ox-circle, ox-progress]--
                    craft_type_data = {'easy', 'easy', {areaSize = 70, speedMultiplier = 0.5}, 'hard'}, -- [If you use 'ox-skillbar,' change this. / https://overextended.github.io/docs/ox_lib/Interface/Client/skillcheck]
                    craft_anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped',
                        flag = 49,
                        heading = 82.382057189941
                    }, 
                    craft_object = {
                        output_object = 'v_ind_cs_toolbox4', -- [https://forge.plebmasters.de/objects]--
                        attach_object = `prop_tool_hammer`,
                        attach_pos = vec3(0.14, 0.0, -0.01),
                        attach_rot = vec3(60.0, -147.0, 30.0),
                        attach_bone = 57005
                    },
                    output_item = 'fixkit', 
                    output_qyt = 1,
                    output_image = 'https://media.discordapp.net/attachments/792157916311322647/1098374691850301490/fixkit.png',
                    output_label = 'Kit de reparación',
                    input_items = {
                        {item = 'fixtool', value = 1, label = 'Herramientas de reparación'},
                        {item = 'wrench', value = 1, label = 'Llave Inglesa Stilson'},
                        {item = 'hammer', value = 1, label = 'Martillo'},
                    },
                }
            }
        }
    },
    [3] = {
        CraftData = {
            CraftLabel = '[~r~E~w~] Crafteo',
            craft_table = false, -- [If you want to disable this feature, set this to false.]-
            craft_table_coords = vec4(293.91326904297, -186.55072021484, 54.057197570801, 339.087890625),
            TextUI = 'esx_textui', --[ps-ui, ox_lib, esx_textui]--
            CraftName = 'Crafteo de Herramientas',
            CraftID = 'mechanic3_crafting', --[Please change this if you used ox_lib.]--
            ContextMenu = 'ox_lib', --[esx_context, ox_lib]--
            Job = 'mechanic3', -- [If you want to disable this feature, set this to false.] --
            Craft = {
                [1] = {
                    blueprint_data = { -- [If you want to disable this feature, set this to false.] --
                        enable = false,
                        item = 'blueprint_carbinerifle',
                        qyt = 1
                    },
                    craft_time = 5000, -- [Change this if you use 'ox-circle' or 'ox-progress'.]
                    craft_type = 'ox-skillbar', -- [ox-skillbar, ox-circle, ox-progress]--
                    craft_type_data = {'easy', 'easy', {areaSize = 70, speedMultiplier = 0.5}, 'hard'}, -- [If you use 'ox-skillbar,' change this. / https://overextended.github.io/docs/ox_lib/Interface/Client/skillcheck]
                    craft_anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped',
                        flag = 49,
                        heading = 82.382057189941
                    }, 
                    craft_object = {
                        output_object = 'v_ind_cs_toolbox4', -- [https://forge.plebmasters.de/objects]--
                        attach_object = `prop_tool_hammer`,
                        attach_pos = vec3(0.14, 0.0, -0.01),
                        attach_rot = vec3(60.0, -147.0, 30.0),
                        attach_bone = 57005
                    },
                    output_item = 'fixkit', 
                    output_qyt = 1,
                    output_image = 'https://media.discordapp.net/attachments/792157916311322647/1098374691850301490/fixkit.png',
                    output_label = 'Kit de reparación',
                    input_items = {
                        {item = 'fixtool', value = 1, label = 'Herramientas de reparación'},
                        {item = 'wrench', value = 1, label = 'Llave Inglesa Stilson'},
                        {item = 'hammer', value = 1, label = 'Martillo'},
                    },
                }
            }
        }
    }
}