Config = {}

Config.ESXVersion = 'legacy' -- legacy/old

Config.Locale = 'es' -- Language you want to use (defined in locales folder) [cs/en/es]

Config.MaxPlantedWeedPlants = -1 -- Maximal number of weed plants that a user can plant, set to -1 to give him unlimited plants

-- Save Plants Command
Config.SavePlantsCommand = "guardarplantas" -- Name of command that will save plantedEntities
Config.SaveCommandAllowedGroups = {
    ["superadmin"] = true,
    ["admin"] = true
    -- You can add more groups that will be able to save plants using command to save plants
}
Config.PedBlacklist = {
    [`a_f_m_bevhills_01`] = true,
    [`g_m_y_armgoon_02`] = true,
    [`s_m_y_ammucity_01`] = true
}
Config.MinStatusToHarvest = 10 -- Min status the plant must have so players are able to harvest it

Config.MenuAlign = "right" -- ESX.Menu item align

Config.Materials = {
    PlantOnEveryMaterial = false, -- If true, player will be able to plant everywhere (even on roads, etc. ...)
    Allowed = { -- Player will be only allowed to plant on those materials if the option above is false
        [1333033863] = true, -- Grass
        [-1286696947] = true, -- Grass short
        [-461750719] = true, -- Grass long
        [-1833527165] = true, -- Hay
        [1109728704] = true, -- Field
    }
}

Config.customEvents = { -- Change events bellow to fit your event names
    ["esx:playerLoaded"] = "esx:playerLoaded",
    ["esx:playerDropped"] = "esx:playerDropped",
    ["esx:setJob"] = "esx:setJob",
    ['esx:getSharedObject'] = 'esx:getSharedObject' -- keep it like this if you have Config.ESXVersion = 'legacy'
}

Config.PoliceJobs = { -- Define which jobs are counted as police jobs, to count active cops
    ["police"] = true,
   -- ["sheriff"] = true
    -- Bellow you can add as much as you want to
}


Config.TimeToDeleteOldPlants = 604800 -- Time in seconds to delete the plant if is old
Config.Plantables = {
    CycleTime = 0.06 * 60 * 60 * 1000,  -- The time that the loop which checks the status of the plants run (now it is 1.2 hour - so every 1.2 it cheks and updates the status of the plant) (The plant should grow UP in 24 hours)

    [1] = {

        PlantLocation = {
            Position = vector3(2852.8599,4631.1924,48.9308),
            Radius = 150.0,
            CanPlantAnyWhereInArea = true, -- If true, player can plant the defined item anyhwere in the area (especially for fields). If false, player can not plant anywhere, he must stay near ant of prop defined in the table bellow (and he will plant into that prop)
            AllowedPropsToPlantIn = {
                [GetHashKey("prop_table_03b")] = 0.4 -- List of props that you need to stay in front of them to plant in them, the number after "=" is x offset that the entity will be planted with (to prevent bugging in prop)
                -- Here you can add other
                -- And other
                -- And way more others
            },
        },
        
        CopsNumbers = {
            Plant = 0,
            Harvest = 0
        },

        Animations = {
            Plant = {
                AnimDict = "amb@world_human_gardener_plant@male@base", -- The animation dictionary that is used/shown when planting plant
                AnimName = "base", -- The animation name that is used when planting a plant
                Duration = 4000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Plantando Coca"
            },
            Pickup = {
                AnimDict = "mini@repair",
                AnimName = "fixing_a_ped",
                Duration = 4000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Recolectando Coca"
            },
            Fertilize = {
                AnimDict = "amb@world_human_gardener_plant@male@base", -- The animation dictionary that is used/shown when planting plant
                AnimName = "base", -- The animation name that is used when planting a plant
                Duration = 4000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Fertilizando", -- The label of the progressbar
                UseProp = false, -- Do you want to use a prop ?
                Prop = "prop_cs_fertilizer", -- Prop name
                PropBone = 57005, -- Prop bone
                PropPlacement = {0.27, 0.0, -0.23, -75.0, 41.0, 36.0}, -- Prop placement
                ExecuteCommand = false -- false/command
            },
            Watering = {
                AnimDict = "amb@world_human_gardener_plant@male@base", -- The animation dictionary that is used/shown when planting plant
                AnimName = "base", -- The animation name that is used when planting a plant
                Duration = 4000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Regando", -- The label of the progressbar
                UseProp = false, -- Do you want to use a prop ?
                Prop = "prop_wateringcan", -- Prop name
                PropBone = 57005, -- Prop bone
                PropPlacement = {0.27, 0.0, -0.23, -75.0, 41.0, 36.0}, -- Prop placement
                ExecuteCommand = false -- false/command
            }
        },

        StatusAddNumber = 50, -- A number that is added to the plant Status on every cycle
        WaterRemoveOnCycle = 1, -- The number of water is remove on every cycle (if the plant has lower number of WaterStatus, then the value is decreased by IfNotMoreThenWaterRemoveOnCycle)
        IfNotMoreThenWaterRemoveOnCycle = 5, -- The number of water is removed when the plant WaterStatus is lower then "WaterRemoveOnCycle" (line above). 
        -- Also it is a value that the plant must have to pass the loop to fertilizer (if the plantWater is lower then the value above, the plant won't get any quality aldo it has a fertilizer)
        Statuses = {
            [1] = {
                MinimalFertilizerStatus = 40, -- The plant fertilizer value that a plant must have to be affected by this value
                SetFertilizerStatusTo = 70, -- The value that the fertilizer status is set to.
                QualityPointsAdd = 30, -- The quality points that are added to the Plant Status
            },
            [2] = {
                MinimalFertilizerStatus = 35, -- The plant fertilizer value that a plant must have to be affected by this value
                SetFertilizerStatusTo = 50, -- The value that the fertilizer status is set to.
                QualityPointsAdd = 30, -- The quality points that are added to the Plant Status
            },
            [3] = {
                MinimalFertilizerStatus = 5, -- The plant fertilizer value that a plant must have to be affected by this value
                SetFertilizerStatusTo = 40, -- The value that the fertilizer status is set to.
                QualityPointsAdd = 30, -- The quality points that are added to the Plant Status
            },
            [4] = {
                MinimalFertilizerStatus = 5, -- The plant fertilizer value that a plant must have to be affected by this value
                SetFertilizerStatusTo = 40, -- The value that the fertilizer status is set to.
                QualityPointsAdd = 30, -- The quality points that are added to the Plant Status
            }
        },

        Items = {

            PlantItemName = "cocaseed", -- Item need to plant a weed in current zone
            PlantWaterItem = "water_bucket", -- Item need to water a weed in current zone
            PlantFertilizeItem = "fertilizer", -- Item needed to fertilize a weed in current zone
            RewardItemName = "cocaplant", -- The name of a item you will get after harvesting a weed plant
            RewardItemCount = 30, -- The Number of item a player will get after harvesting a plant with 100% status and 100% Quality
            RequiredItemsPlant = { -- Bellow will be listed items a player will need for planting this drug
             --   {itemName = "water_bucket", count = 1, removeItem = false} -- itemName is the name from database, removeItem will remove the item from player inventory while planting
            },
            RequiredItemsHarvest = { -- Bellow will be listed items a player will need for harvesting this drug
             --   {itemName = "water_bucket", count = 1, removeItem = false} -- itemName is the name from database, removeItem will remove the item from player inventory while harvesting
            },
        },

        Props = {
            SmallProp = "prop_sapling_break_02", -- The obejct name of the plant that will be crated after a plant is planted
            BigProp = "prop_sapling_break_01", -- The object name of the plant that the first (SmalProp) will be replaced for after it reaches the ChangePropsAfterStatus
            ChangePropsAfterStatus = 100 -- The amount of status points from 100% that if a plant reaches then the plant prop (SmallProp) will be replaced to BigProp (Set it to -1 to never replace a prop for this location)
        },

        FertilizerAddAmount = 40.0, -- The number of fertilizer points that will be added on every cycle
        WaterAddAmount = 40.0 -- The number of water points that will be added on every cycle
    }
    -- Bellow you can add more location, the index must be pervious index + 1
}


Config.DrawMarkerDistance = 5.0 -- The distance, from which you will see the markers (for performance reasons it is good to keep it bigger then 3DTextDistance)
Config.Draw3DTextDistance = 2.0
Config.Drugs = {}
Config.HelpStringForPickup = "~INPUT_PICKUP~ Recolectar"
Config.HelpStringForProcess = "~INPUT_PICKUP~ Procesar"
Config.Drugs.cocaine = { -- Make sure that the drug name is in lower, otherwise it will not work
    Zones = {
        SemillaCoca = { -- cocaseed
            Location = vector3(1712.6307, 4790.3257, 41.9924), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Recolectando Semillas", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "SemillaCoca", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
        ArrancarHojas = {
            Location = vector3(1978.8204, 5172.0479, 47.6391), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Arrancar Hojas", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "ArrancarHojas", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
        ProcesarHojas = {
            Location = vector3(176.6271, 3080.8889, 43.1158), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Procesar Hojas", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "ProcesarHojas", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
    },

    Actions = {
        SemillaCoca = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
              --  {itemName = "water_bucket", count = 1, removeItem = false} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "cocaseed", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 3000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Robando Semillas" -- The label which will be shown in the mythic progres bar
            }
        },
        ArrancarHojas = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
                {itemName = "cocaplant", count = 1, removeItem = true} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "hojacoca", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 3000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Recolectando Hojas" -- The label which will be shown in the mythic progres bar
            }
        },
        ProcesarHojas = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
                {itemName = "hojacoca", count = 1, removeItem = true} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "cocawithout", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 3000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Procesando Hojas" -- The label which will be shown in the mythic progres bar
            }
        }, 
    },
    Effects = { -- Effects that current "drugs" should give
        GiveHP = 1, -- Set to 0.0 to give no additinal HP
        GiveArmour = 10, -- Set to 0.0 to not give armour
        SetInfiniteStamina = true, -- If a player should get unlimited stamina when using current drug
        SpeedMultiplier = 13, -- The speed multiplier that should be given to player when using this drug
        OnUseScenario = "WORLD_HUMAN_SMOKING_POT", -- The screnario played after using a item (the scenarios can be found there: https://pastebin.com/6mrYTdQv)
        MoveClipset = "MOVE_M@DRUNK@VERYDRUNK", -- The MoveClipset that will be aplied to player after using a item https://docs.fivem.net/natives/?_0xAF8A94EDE7712BEF
        MotionBlur = false, -- If a player should get a MotionBlur
        SetPedDrunk = true, -- If a player should be set as a drunk
        ClearTimeCycleModifier = true, -- IF the TimeCycleModifier should be reseted after the ResetAfter timeout is after
        TimeCycleModifier = "BeastLaunch01", -- The TimeCycleModifier that will be used https://pastebin.com/kVPwMemE
        ResetAfter = 55 -- Time in SECONDS when the stats should be reset
    },

    RemoveAfterUse = true -- Should be the drug removed on its use?
}


Config.Drugs.porro = { -- Make sure that the drug name is in lower, otherwise it will not work
    Zones = {
        ProcesoMarihuana = {
            Location = vector3(64.8475, 3685.0476, 39.8343), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Procesar Marihuana", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "ProcesoMarihuana", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
		
    },
    Actions = {
        ProcesoMarihuana = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
                {itemName = "marihuana", count = 1, removeItem = true} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "porro", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 3000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Procesando Marihuana" -- The label which will be shown in the mythic progres bar
            }
        },

    },
    Effects = { -- Effects that current "drugs" should give
        GiveHP = 1, -- Set to 0.0 to give no additinal HP
        GiveArmour = 10, -- Set to 0.0 to not give armour
        SetInfiniteStamina = true, -- If a player should get unlimited stamina when using current drug
        SpeedMultiplier = 1.5, -- The speed multiplier that should be given to player when using this drug
        OnUseScenario = "WORLD_HUMAN_SMOKING_POT", -- The screnario played after using a item (the scenarios can be found there: https://pastebin.com/6mrYTdQv)
        MoveClipset = "MOVE_M@DRUNK@VERYDRUNK", -- The MoveClipset that will be aplied to player after using a item https://docs.fivem.net/natives/?_0xAF8A94EDE7712BEF
        MotionBlur = false, -- If a player should get a MotionBlur
        SetPedDrunk = false, -- If a player should be set as a drunk
        ClearTimeCycleModifier = true, -- IF the TimeCycleModifier should be reseted after the ResetAfter timeout is after
        TimeCycleModifier = "spectator5", -- The TimeCycleModifier that will be used https://pastebin.com/kVPwMemE
        ResetAfter = 55 -- Time in SECONDS when the stats should be reset
    },
    RemoveAfterUse = true -- Should be the drug removed on its use?
}



Config.Drugs.meth_pooch = { -- Make sure that the drug name is in lower, otherwise it will not work
    Zones = {
        FarmeoMeth = {
            Location = vector3(-454.7760, 6197.2461, 29.5529), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Farmear Meta", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "FarmeoMeth", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
        ProcesoMeth = {
            Location = vector3(18.9099, 3687.5195, 39.7083), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Procesar Meta", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "ProcesoMeth", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
		
    },
    Actions = {
        FarmeoMeth = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
             --   {itemName = "marihuana", count = 1, removeItem = true} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "meth", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 3000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Recolectando Meta" -- The label which will be shown in the mythic progres bar
            }
        },
        ProcesoMeth = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
                {itemName = "meth", count = 2, removeItem = true} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "meth_pooch", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 4000, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Procesando Meta" -- The label which will be shown in the mythic progres bar
            }
        },

    },
    Effects = { -- Effects that current "drugs" should give
        GiveHP = 1, -- Set to 0.0 to give no additinal HP
        GiveArmour = 10, -- Set to 0.0 to not give armour
        SetInfiniteStamina = true, -- If a player should get unlimited stamina when using current drug
        SpeedMultiplier = 1.5, -- The speed multiplier that should be given to player when using this drug
        OnUseScenario = "WORLD_HUMAN_SMOKING_POT", -- The screnario played after using a item (the scenarios can be found there: https://pastebin.com/6mrYTdQv)
        MoveClipset = "MOVE_M@DRUNK@VERYDRUNK", -- The MoveClipset that will be aplied to player after using a item https://docs.fivem.net/natives/?_0xAF8A94EDE7712BEF
        MotionBlur = false, -- If a player should get a MotionBlur
        SetPedDrunk = false, -- If a player should be set as a drunk
        ClearTimeCycleModifier = true, -- IF the TimeCycleModifier should be reseted after the ResetAfter timeout is after
        TimeCycleModifier = "spectator5", -- The TimeCycleModifier that will be used https://pastebin.com/kVPwMemE
        ResetAfter = 55 -- Time in SECONDS when the stats should be reset
    },
    RemoveAfterUse = true -- Should be the drug removed on its use?
}

Config.Drugs.opium_pooch = { -- Make sure that the drug name is in lower, otherwise it will not work
    Zones = {
        FarmeoOpium = {
            Location = vector3(1546.8799, 6333.0981, 24.0805), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Farmear Opio", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "FarmeoOpium", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
        ProcesoOpium = {
            Location = vector3(66.6981, 3755.8572, 39.7375), -- The location of pickup point
            Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
            Color = {r = 255, g = 255, b = 0}, -- Color of the marker
            MotionText = "[E] Procesar Opio", -- Text that will be show when coming near in the DrawText3D section (if Draw3DText Enabled)
            Action = "ProcesoOpium", -- Just for collecting leave it
            Marker = 22, -- Marker Id
            UseInovativeMarkers = false, -- If the help text should look "different", image in the forum
            DrawInovativeMarkersRadius = 5.0 -- The distance a player can see the marker from
        },
		
    },
    Actions = {
        FarmeoOpium = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
             --   {itemName = "marihuana", count = 1, removeItem = true} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "opium", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 2500, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Recolectando Opio" -- The label which will be shown in the mythic progres bar
            }
        },
        ProcesoOpium = {
            MinCops = 0, -- The minimal count of cops that must be online to player can be able to collect a item
            RequiredItems = { -- Bellow will be listed items a player will need for Collecting
                {itemName = "opium", count = 2, removeItem = true} -- itemName is the name from database, removeItem will remove the item from player inventory after fininished collecting
            },
            GiveItem = "opium_pooch", -- The item a player should get when he is done
            GiveItemCount = 1, -- The count of a item a player should get when he is done
            Animations = { -- Animation properties are listed bellow
                AnimDict = "mini@repair", -- The animation dictionary for Collecting animation
                AnimName = "fixing_a_ped", -- The animation name for Collectiong anitamtion
                Duration = 2500, -- Set to 0 to disable animations
                AnimFlag = 1,
                ProgressBarLabel = "Procesando Opio" -- The label which will be shown in the mythic progres bar
            }
        },

    },
    Effects = { -- Effects that current "drugs" should give
        GiveHP = 1, -- Set to 0.0 to give no additinal HP
        GiveArmour = 10, -- Set to 0.0 to not give armour
        SetInfiniteStamina = true, -- If a player should get unlimited stamina when using current drug
        SpeedMultiplier = 1.5, -- The speed multiplier that should be given to player when using this drug
        OnUseScenario = "WORLD_HUMAN_SMOKING_POT", -- The screnario played after using a item (the scenarios can be found there: https://pastebin.com/6mrYTdQv)
        MoveClipset = "MOVE_M@DRUNK@VERYDRUNK", -- The MoveClipset that will be aplied to player after using a item https://docs.fivem.net/natives/?_0xAF8A94EDE7712BEF
        MotionBlur = false, -- If a player should get a MotionBlur
        SetPedDrunk = false, -- If a player should be set as a drunk
        ClearTimeCycleModifier = true, -- IF the TimeCycleModifier should be reseted after the ResetAfter timeout is after
        TimeCycleModifier = "spectator5", -- The TimeCycleModifier that will be used https://pastebin.com/kVPwMemE
        ResetAfter = 55 -- Time in SECONDS when the stats should be reset
    },
    RemoveAfterUse = true -- Should be the drug removed on its use?
}


Config.SellDrugsCommand = {
    name = "venderfafa", -- The name of command that is used for selling items (drugs)
    helpString = "Este comando le permite vender una cantidad definida de medicamentos", -- The help prompt that is showed in the chat
}

Config.SellDrugs = {
    joint = {
        MinCops = 1, -- Minimal number of cops to start selling
        GiveBlack = true, -- If true, player will get "black_money" account
        MinimalGiveMoney = 12000, -- The minimal amount of money a player will receive after selling drugs
        MaximalGiveMoney = 16000, -- The maximal amount of money a player will receive after selling drugs
        SellFromPoint = vector3(62.8466,-638.6946,44.2151), -- The center sell points where the distance will be counted from
        Radius = 500.0, -- THe radiuse from a SellFromPoint player can sell items
        RejectChance = 5, -- The chance that the ped will reject offer (100/RejectChance is the chance) (now it is 20%)
        MaxItemSell = 4, -- The maximal item count that a player can get removed, if player has less, the less amount will be taken
        ShouldCallPoliceAfterRejecting = true, -- If true then a police jobs will be called after rejecting
        CallPoliceAfterRejectingChange = 3, -- The chance that a police jobs will be alterted after rejecting offer (100/CallPoliceAfterRejectingChange) (now it is 33%)
        ShouldKillInTheseAreasAfterRejecting = true, -- If true than if a player is in these areas (areas where are ussualy no people) will be killed if he does not have a friend to sell with 
        -- (the ped will take out a gun and Stealth Kill the player (If the palyer is not stronger :D))
        -- To not be killed in these areas there must an other player at maximal distance of 3 gta units away
        KillAreas = {
            [1] = { -- First area
                Location = vector3(-45.442,-720.8846,44.2506), -- Location
                Radius = 5.0 -- Radius
            },
            [2] = {
                Location = vector3(2.0, 2.0, 2.0),
                Radius = 4.0
            }
            -- Below you can add as much as you want but make sure it is a sequenced table otherwise it will broke
        },
        CanSellToAllPeds = true, -- If true then a player can sell items to all types of peds
        PedPlayerCanSellTo = { -- If config above then a player can sell only to these types of peds
            [GetHashKey("a_f_m_fatbla_01")] = true,
            [GetHashKey("a_f_m_fatwhite_01")] = true,
            -- Below you can add as much ped types as you want, but make sure it is a hash
        },
        SellAnimation = {
            AnimDict = "mp_common", -- Animation directory for current animation
            AnimName = "givetake1_a", -- The animatino name
            Duration = 3000, -- Set to 0 to disable animations
            AnimFlag = 1,
            ProgressBarLabel = "Vendiendo Droga" -- The label which will be show in the progress bar
        }
    }
}

Config.PoliceDispatch = {

    itemSell = {
        Notification = "Tiene una nueva llamada, alguien está vendiendo un artículo ilegal.", -- The notification the police jobs will receive
        BlipId = 108, -- The sprite of the blip
        BlipColor = 59, -- Color of the blip
        DisplayType = 4, -- Blip Display Type
        Scale = 1.0, -- The scale of the blip
        BlipName = "Personas con bolsitas!", -- Name of the blip
        HideAfterSecs = 5, -- Time in seconds that the blip will be removed after
    }

}

Config.PhoneCabbins = {
    {
        -- Other
        MinCops = 0, -- Minimal needed cops for starting the "mini-heist"
        GiveBlack = true, -- If player should get dirty money, otherwise he will receive cash
        AddBlipForFriend = true, -- IF a blip should be added for the NPC when it is spawned
        CabinCoords = vector3(1223.2802, -2991.6018, -55.8656), -- The position of the phone
        SpawnPedCoords = vector3(1233.5763, -3003.1313, -59.3193), -- The coords when the ped souhld be spawned and deleted
        PedModel = "a_m_m_eastsa_01", -- The model of a ped which will be spawned
        Spawnheading = 83.4211, -- The spawn heading of the ped
        Items = {'cocaine', 'porro', 'cocawithout', 'meth_pooch', 'opium_pooch'}, -- The items allowed to be sold here
        MaxSellCount = {40, 40, 40, 40}, -- Max item sold count for each item (first item must be first count here)
        MinSellPrices = {8000, 5400, 6200, 2200, 3300}, -- Min price for currectly sold item (first item must be first number here)
        MaxSellPrices  = {12000, 6200, 8500, 2600, 3700}, -- Max price for each item (first item must be first number here)
        -- Markers
        Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
        Color = {r = 255, g = 255, b = 0}, -- Color of the marker
        MotionText = "[E] Llamar", -- The label which will be shown on the Draw3DText
        Marker = 22, -- The marker ID
        UseInovativeMarkers = true, -- If the help text should look "different", image in the forum
        DrawInovativeMarkersRadius = 5.0, -- The distance a player can see the marker from
        --Animations
        SellAnimation = {
            AnimDict = "mp_common", -- Animation directory for current animation
            AnimName = "givetake1_a", -- The animatino name
            Duration = 3000, -- Set to 0 to disable animations
            AnimFlag = 1,
            ProgressBarLabel = "Vendiendo Droga" -- The label which will be show in the progress bar
        }
    }
}

Config.PublicPhoneString = "~INPUT_PICKUP~ Llamar" -- The input string which will be shown when near a public phone
-- Config.AddBlipForPhoneCabins = {
--     AddBlip = false, -- If for the PhoneCabins should be added blips on the map
--     BlipLabel = "Telefono Publico", -- Name of the blips on the map
--     BlipColour = 57, -- Colour of the blips on the map
--     BlipSprite = 480, -- Sprite of the blip on the map
--     BlipDisplay = 4, -- Blip display on the map
--     BlipScale = 1.0 -- Blip size on the map
-- }


-- Config.StartDeliveryPrompt = "~INPUT_PICKUP~ Start Delivery"
-- Config.Deliveries = {
--     {    
--         Locations = {
--             {
--                 Pos = vector3(1293.5991,1384.7307,101.4545), -- First delivery location
--                 used = false, -- Do not touch this, you do not need to :)
--                 Min = 10, -- The minimal amount in math.random a player will deliver
--                 Max = 20 -- The maximal amount in math.random a player will deliver
--             },
--             {
--                 Pos = vector3(1201.006,1862.9187,77.0745), -- Second delivery location
--                 used = false, -- Do not touch this, you do not need to :)
--                 Min = 10, -- The minimal amount in math.random a player will deliver
--                 Max = 20 -- The maximal amount in math.random a player will deliver
--             },
--             {
--                 Pos = vector3(1110.6906,2098.6851,53.1546), -- Third delivery location
--                 used = false, -- Do not touch this, you do not need to :)
--                 Min = 10, -- The minimal amount in math.random a player will deliver
--                 Max = 20 -- The maximal amount in math.random a player will deliver
--             }
--         },
--         Items = {'joint', 'water_bucket'}, -- The items allowed to be sold here
--         MaxSellCount = {50, 15}, -- Max item sold count for each item (first item must be first count here)
--         MinSellPrices = {10, 20}, -- Min price for currectly sold item (first item must be first number here)
--         MaxSellPrices  = {15, 20}, -- Max price for each item (first item must be first number here)
--         CarSpawnLoc = vector3(1367.5193,1138.7201,113.759), -- The spawn and return location of the vehicle
--         CarSpawnHeading = 69.0, -- The heading of the spawned car
--         CarProps = { -- Bellow you can set the vehicle properties which will be aplied to the vehicle
--             plate = 'BURRITO', 
--             color1 = 27
--         },
--         CarModel = "burrito", -- Model name of the car
--         PayForTruck = 100, -- The money a player will need to pay on the start (maybye for the car)
--         ReturnTruck = 100, -- The money a player will receive when he returns the vehicle
--         GiveBlack = true, -- If a player should get black money on delivery
--         -- Start location
--         MinCops = 1, -- Needed cops for start of the mission
--         StartLocation = vector3(1390.1125,1132.0562,114.3345), -- The location you will see the marker
--         -- Markers
--         Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
--         Color = {r = 255, g = 255, b = 0}, -- Color of the marker
--         MotionText = "[E] Call", -- The label which will be shown on the Draw3DText
--         Marker = 22, -- The marker ID
--         UseInovativeMarkers = true, -- If the help text should look "different", image in the forum
--         DrawInovativeMarkersRadius = 5.0, -- The distance a player can see the marker from        
--     }
-- }

Config.BlackShops = {
    {
        Location = vector3(2899.9180, 4398.4517, 50.2375),
        -- Markers
        Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
        Color = {r = 255, g = 255, b = 0}, -- Color of the marker
        MotionText = "[E] llamar", -- The label which will be shown on the Draw3DText
        Draw3DText = false, -- If should draw 3d Text
        Marker = 22, -- The marker ID
        UseInovativeMarkers = true, -- If the help text should look "different", image in the forum
        DrawInovativeMarkersRadius = 5.0, -- The distance a player can see the marker from     
        -- Items
        ShopItems = {
            {item = 'water_bucket', price = 50, label = 'Agua de Lluvia', weapon = false},
            {item = 'fertilizer', price = 50, label = 'Fertilizante', weapon = false},
            {item = 'nb-armourmedium', price = 100000, label = 'Chaleco Liviano', weapon = false},
            {item = 'nb-armourhigh', price = 130000, label = 'Chaleco Pesado', weapon = false},
        },
        Ammo = 50, -- The number of ammo that the player will get when buying a weapon
        PayInBlack = true, -- If enabled, the player will be able to pay only in black, otherwise he will pay using a cash or a bank (automatic, if does not have cash, bank will be used)
        Blip = {
            Use = true, -- If the shop should have a blip on the map
            BlipLabel = "Shop Ilegal", -- Name of the blips on the map
            BlipColour = 40, -- Colour of the blips on the map
            BlipSprite = 51, -- Sprite of the blip on the map
            BlipDisplay = 4, -- Blip display on the map
            BlipScale = 1.0 -- Blip size on the map
        }
    },
    {
        Location = vector3(1532.2212, 3796.0212, 33.5191),
        -- Markers
        Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
        Color = {r = 255, g = 255, b = 0}, -- Color of the marker
        MotionText = "[E] llamar", -- The label which will be shown on the Draw3DText
        Draw3DText = false, -- If should draw 3d Text
        Marker = 22, -- The marker ID
        UseInovativeMarkers = true, -- If the help text should look "different", image in the forum
        DrawInovativeMarkersRadius = 5.0, -- The distance a player can see the marker from     
        -- Items
        ShopItems = {
            {item = 'WEAPON_DOUBLEACTION', price = 100000, label = 'Revolver', weapon = true},
            {item = 'WEAPON_PISTOL', price = 130000, label = 'Pistola', weapon = true},
            {item = 'WEAPON_PISTOL50', price = 200000, label = 'Pistola 50', weapon = true},
            {item = 'WEAPON_MICROSMG', price = 300000, label = 'Micro SMG', weapon = true},
            {item = 'WEAPON_SMG', price = 250000, label = 'SMG Negra', weapon = true},
            {item = 'WEAPON_GUSENBERG', price = 3500000, label = 'Subfusil de Tambor', weapon = true},
        },
        Ammo = 200, -- The number of ammo that the player will get when buying a weapon
        PayInBlack = true, -- If enabled, the player will be able to pay only in black, otherwise he will pay using a cash or a bank (automatic, if does not have cash, bank will be used)
        Blip = {
            Use = false, -- If the shop should have a blip on the map
            BlipLabel = "Shop Ilegal", -- Name of the blips on the map
            BlipColour = 40, -- Colour of the blips on the map
            BlipSprite = 51, -- Sprite of the blip on the map
            BlipDisplay = 4, -- Blip display on the map
            BlipScale = 0.7 -- Blip size on the map
        }
    }
}
Config.JobShopString = "~INPUT_PICKUP~ Tienda Ilegal"

Config.SimpleSellPoints = {
    {
        Location = vector3(455.6102, 5572.0054, 781.1837),
        -- Markers
        Size = {x = 1.0, y = 1.0, z = 1.0}, -- Size of the marker
        Color = {r = 255, g = 255, b = 0}, -- Color of the marker
        MotionText = "[E] Vender", -- The label which will be shown on the Draw3DText
        Draw3DText = true, -- If should draw 3d Text
        Marker = 22, -- The marker ID
        UseInovativeMarkers = true, -- If the help text should look "different", image in the forum
        DrawInovativeMarkersRadius = 5.0, -- The distance a player can see the marker from     
        -- Items
        SellItems = {
            {item = 'cocaine', price = {min = 8000, max = 12000}, weapon = false},
            {item = 'cocawithout', price = {min = 6200, max = 8500}, weapon = false},
            {item = 'porro', price = {min = 5400, max = 6200}, weapon = false},
            {item = 'meth_pooch', price = {min = 2200, max = 3600}, weapon = false},
            {item = 'opium_pooch', price = {min = 2300, max = 3700}, weapon = false},
        },
        PayInBlack = true, -- If enabled, the player will receive money in black money
        ProgressBarLabel = "Vendiendo Articulos Ilegales", -- The label which will be show in the progress bar
        Blip = {
            Use = true, -- If the shop should have a blip on the map
            BlipLabel = "El Patron", -- Name of the blips on the map
            BlipColour = 56, -- Colour of the blips on the map
            BlipSprite = 521, -- Sprite of the blip on the map
            BlipDisplay = 4, -- Blip display on the map
            BlipScale = 1.0 -- Blip size on the map
        }
    }
}
Config.SellPointsString = "~INPUT_PICKUP~ Venta Ilegal"
