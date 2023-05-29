Config = {}

-- We also recommend vms_charcreator, it fits perfectly with the style!

-- |  Client trigger to open the clothes store is:
-- |  From Client Side | TriggerEvent("vms_clothestore:open", 1)
-- |  From Server Side | TriggerClientEvent("vms_clothestore:open", source, 1)

Config.Core = "ESX" -- "ESX" / "QB-Core"
Config.CoreExport = function()
    return exports['es_extended']:getSharedObject() -- ESX
    -- return exports['qb-core']:GetCoreObject() -- QB-CORE
end

Config.Notification = function(message, time, type)
    if type == "success" then
     --   exports["vms_notify"]:Notification("CLOTHES STORE", message, time, "#27FF09", "fa-solid fa-shirt")
        TriggerEvent('esx:showNotification', message)
        -- TriggerEvent('QBCore:Notify', message, 'success', time)
    elseif type == "error" then
       -- exports["vms_notify"]:Notification("CLOTHES STORE", message, time, "#FF0909", "fa-solid fa-shirt")
        TriggerEvent('esx:showNotification', message)
        -- TriggerEvent('QBCore:Notify', message, 'error', time)
    end
end

Config.Hud = {
    Enable = function()
        -- exports['hud']:DisplayHud(true)
    end,
    Disable = function()
        -- exports['hud']:DisplayHud(false)
    end
}

-- @ Config.KeyOpen - https://docs.fivem.net/docs/game-references/controls/
Config.KeyOpen = 38 -- [E]

-- @ Config.SkinManager - ESX: esx_skin / fivem-appearance
-- @ Config.SkinManager - QB-Core: qb-clothing / fivem-appearance
Config.SkinManager = "esx_skin"

-- @ Config.ChangeClothes - Menu for choosing whether to buy new clothes or change into your clothes
Config.ChangeClothes = true

-- @ Config.SaveClothesMenu - Clothes saving
Config.SaveClothesMenu = true

-- @ Config.Menu ESX: "esx_context" <-- Required esx_context
-- @ Config.Menu ESX: "esx_menu_default" <-- Required esx_menu_default & esx_menu_dialog
-- @ Config.Menu QB-Core: "qb-menu" <-- Required qb-menu & qb-input
Config.Menu = "esx_menu_default"
Config.ESXMenuDefault_Align = 'left' -- works only for esx_menu_default
Config.ESXContext_Align = 'left' -- works only for esx_context


Config.SoundsEffects = true -- if you want to sound effects by clicks set true
Config.BlurBehindPlayer = true -- to see it you need to have PostFX upper Very High or Ultra


Config.ClothingPedAnimation = {"anim@heists@heist_corona@team_idles@male_a", "idle"} -- animation of the player during character creation
Config.DefaultCamDistance = 0.95 -- camera distance from player location (during character creation)
Config.CameraHeight = {
    ['masks'] = {z_height = 0.65, fov = 30.0},
    ['hats'] = {z_height = 0.65, fov = 30.0},
    ['torsos'] = {z_height = 0.15, fov = 75.0},
    ['bproofs'] = {z_height = 0.15, fov = 75.0},
    ['pants'] = {z_height = -0.425, fov = 75.0},
    ['shoes'] = {z_height = -0.6, fov = 75.0},
    ['chains'] = {z_height = 0.25, fov = 75.0},
    ['glasses'] = {z_height = 0.65, fov = 30.0},
    ['watches'] = {z_height = -0.025, fov = 75.0},
    ['ears'] = {z_height = 0.65, fov = 30.0},
    ['bags'] = {z_height = 0.15, fov = 75.0},
}

Config.Translate = {
    ['blip.clothesstore'] = 'Tienda Ropa',
    ['blip.maskstore'] = 'Tienda de Mascara',
    
    ['you_paid'] = 'Pagaste %s$ por tu ropa',
    ['saved_clothes'] = 'Guardaste la ropa con nombre %s',
    ['enought_money'] = 'No tienes suficiente dinero',
    
    ['select_option'] = {name = 'Seleccionar opción', icon = 'fas fa-check-double'},
    ['manage_header'] = {name = 'Administrar ropa', icon = 'fas fa-tshirt'}, 
    ['wardrobe_header'] = {name = 'Ropero', icon = 'fas fa-tshirt'}, 

    ['open_wardrobe'] = {name = 'Armario', icon = 'fas fa-shirt'},
    ['open_manage'] = {name = 'Administrar ropa', icon = 'fas fa-shirt'},
    ['open_store'] = {name = 'Abrir Tienda', icon = 'fas fa-bag-shopping'},
    
    ['menu:header'] = {name = '¿Quieres guardar este conjunto?', icon = 'fas fa-check-double'},
    ['menu:yes'] = {name = 'Si', icon = 'fas fa-check-circle'},
    ['menu:no'] = {name = 'No', icon = 'fas fa-window-close'},
    
    ['title_remove'] = {name = 'Quieres eliminar %s?', icon = 'fas fa-shirt'},
    ['remove_yes'] = {name = 'Si', icon = 'fas fa-check'},
    ['remove_no'] = {name = 'No', icon = 'fas fa-xmark'},

    ['esx_menu_default:header'] = 'Nombre de Outfit',
    ['esx_context:title'] = {name = 'Ingresa Nombre de outfit', icon = 'fas fa-shirt'},
    ['esx_context:placeholder_title'] = 'Nombre de Outfit',
    ['esx_context:placeholder'] = 'Nombre de Outfit en armario..',
    ['esx_context:confirm'] = {name = 'Confirmar', icon = 'fas fa-check-circle'},

    ['qb-input:header'] = 'Name your outfit',
    ['qb-input:submitText'] = 'Save Outfit',
    ['qb-input:text'] = 'Outfit Name',
}


Config.Stores = {
    
    [1] = {
        coords = vector3(-1337.84, -1277.81, 4.0),
        price = 500,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.maskstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = false,
            ['torsos'] = false,
            ['bproofs'] = false,
            ['pants'] = false,
            ['shoes'] = false,
            ['chains'] = false,
            ['glasses'] = false,
            ['watches'] = false,
            ['ears'] = false,
            ['bags'] = false,
        }
    },
    [2] = {
        coords = vector3(-163.19, -310.78, 38.83),
        price = 7500,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = false,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [3] = {
        coords = vector3(76.27, -1399.03, 28.39),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [4] = {
        coords = vector3(429.6429, -801.6109, 28.5),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [5] = {
        coords = vector3(123.23, -228.47, 53.56),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [6] = {
        coords = vector3(-716.01, -147.9, 36.42),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [7] = {
        coords = vector3(-1188.53, -765.75, 16.32),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [8] = {
        coords = vector3(-3173.47, 1039.36, 19.86),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [9] = {
        coords = vector3(614.76, 2767.83, 41.09),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [10] = {
        coords = vector3(-1105.39, 2705.81, 18.12),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [11] = {
        coords = vector3(1190.51, 2709.38, 37.23),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [12] = {
        coords = vector3(1692.06, 4828.69, 41.07),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
    [13] = {
        coords = vector3(8.61, 6517.44, 30.89),
        price = 2000,
        blip = {
            sprite = 366,
            display = 4,
            scale = 0.4,
            color = 47,
            name = Config.Translate['blip.clothesstore'],
        },
        marker = {
            size = vec(1.85, 1.85, 0.95),
            color = {255, 205, 0, 125},
            rotate = false,
            bobUpAndDown = false
        },
        categories = {
            ['masks'] = true,
            ['hats'] = true,
            ['torsos'] = true,
            ['bproofs'] = true,
            ['pants'] = true,
            ['shoes'] = true,
            ['chains'] = true,
            ['glasses'] = true,
            ['watches'] = true,
            ['ears'] = true,
            ['bags'] = true,
        }
    },
}