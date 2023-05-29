Config = {}

Config.TopLeftInfoBox = false
Config.ShowBorder = false
Config.BorderHight = 5
Config.MaxVehicleSpeed = false  -- set to false to disable.

Config.pNotify = true
Config.pNotifyEnterMessage = "Has entrado en una zona segura"
Config.pNotifyEnterType = "info"
Config.pNotifyExitMessage = "Has salido de una zona segura"
Config.pNotifyExitType = "info"

Config.Zones ={ 
    { 
        {1818.45, 2611.60, 45.67}, -- Prison
        {1809.37, 2611.65, 45.67},
        {1809.40, 2620.69, 45.67},
        {1817.80, 2642.32, 45.67},
        {1834.40, 2688.87, 45.67},
        {1829.39, 2703.25, 45.67},
        {1776.49, 2746.40, 45.67},
        {1761.95, 2751.73, 45.67},
        {1662.50, 2748.09, 45.67},
        {1648.50, 2740.81, 45.67},
        {1585.35, 2679.40, 45.67},
        {1576.11, 2666.74, 45.67},
        {1548.48, 2591.62, 45.67},
        {1547.82, 2576.09, 45.67},
        {1551.37, 2483.35, 45.67},
        {1559.03, 2469.66, 45.67},
        {1652.85, 2410.46, 45.67},
        {1668.09, 2408.40, 45.67}, 
        {1748.59, 2420.63, 45.67},
        {1762.12, 2427.29, 45.67},
        {1808.14, 2474.48, 45.67},
        {1812.84, 2488.88, 45.67},
        {1805.69, 2535.65, 45.67},
        {1807.59, 2568.37, 45.67},
        {1808.22, 2592.08, 45.67},
        {1818.65, 2592.08, 45.67},
    },
    {
        {-398.64, -826.6, 31.32}, -- Garage central
        {-194.76, -871.24, 29.4},
        {-256.12, -1029.32, 28.0},
        {-373.76, -1034.92, 31.32},
    },
    {
        {420.76, -574.72, 32.6}, -- Hospital
        {380.12, -653.36, 34.52},
        {236.2, -594.04, 46.52},
        {254.84, -551.56, 44.28},
    },
    {
        {309.44, -755.32, 36.24}, -- Plaza cubo
        {199.44, -1060.00, 30.76},
        {110.48, -1030.52, 29.68},
        {228.2, -722.84, 35.36},
    },
    {
        {-399.2, -59.4, 45.48}, -- Meca
        {-292.52, -96.0, 45.88},
        {-317.72, -169.76, 40.04},
        {-362.56, -184.24, 37.92},
        {-419.0, -84.72, 42.08},
    },
    {
        {-746.68, -23.16, 38.96}, -- Iglesia
        {-773.88, 16.52, 44.84},
        {-801.6, 5.76, 42.32},
        {-777.08, -39.32, 37.64},
    },
    {
        {-75.68, -1125.0, 25.72}, -- Conce de autos
        {-56.44, -1064.44, 27.56},
        {1.52, -1080.4, 28.56},
        {15.24, -1123.16, 27.24},
    },
    {
        {-791.44, -256.6, 37.08}, -- Conce de autos usados
        {-762.48, -235.08, 37.04},
        {-788.2, -185.52, 37.04},
        {-820.2, -201.28, 37.28},
    },
    {
        {1105.52, 2657.36, 38.36}, -- ZONA X
        {1107.64, 2664.4, 38.0},
        {1102.08, 2667.56, 38.04},
        {1095.84, 2665.12, 38.0},
        {1095.88, 2657.36, 38.16},
    },
}

-- Version checker for when i update :)
Config.versionCheck = "1.0.6"
