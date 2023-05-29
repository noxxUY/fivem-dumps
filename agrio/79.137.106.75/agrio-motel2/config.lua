Config = {}

Config.AlignMenu = "bottom-right"

Config.MotelPrice = 200
Config.HoraDeCobro = true -- {["h"] = 20, ["m"]=0}

Config.Weapons = false 
Config.DirtyMoney = true 

Config.Debug = false

Config.MotelInterior = {
    ["exit"] = vector3(151.34562683105, -1007.6842041016, -98.999992370605),
    ["drawer"] = vector3(151.2417755127, -1003.018737793, -98.999992370605),
    ["wardrobe"] = vector3(151.71522521973, -1001.3452758789, -98.999977111816),
    ["invite"] = vector3(152.84375, -1007.8104248047, -99.0)
}

Config.ActionLabel = {
    ["exit"] = "Salir",
    ["drawer"] = "Cajón",
    ["wardrobe"] = "Armario",
    ["invite"] = "Invitar"
}

Config.ReconnectSpawn = {
    ["position"] = vector3(320.54, -231.74, 54.03)
}

Config.LandLord = {
   
    ["Great Ocean"] = {
        Key = "GreatOcean",
        Position =  vector3(-96.7408, 6324.114, 31.576),
        MotelsEntrances = {
            [1] = vector3(-103.274, 6330.782, 31.576),
            [2] = vector3(-106.432, 6334.169, 31.576),
            [3] = vector3(-107.395, 6339.592, 31.575),
            [4] = vector3(-102.050, 6345.081, 31.575),
            [5] = vector3(-98.7921, 6348.363, 31.575),
            [6] = vector3(-93.3496, 6353.699, 31.575),
            [7] = vector3(-89.9417, 6356.902, 31.575),
            [8] = vector3(-84.6049, 6362.303, 31.575),
        }
    },
}

Config.HelpTextMessage = "-1 ~INPUT_CELLPHONE_LEFT~ & ~INPUT_CELLPHONE_RIGHT~ +1 ~n~"
Config.HelpTextMessage = Config.HelpTextMessage .. "~INPUT_FRONTEND_RDOWN~ Confirmar y comprar habitación por ($" .. Config.MotelPrice .. ") ~n~"
Config.HelpTextMessage = Config.HelpTextMessage .. "~INPUT_FRONTEND_CANCEL~ Cancelar ~n~"

Config.GenerateUniqueId = function()
    math.randomseed(GetGameTimer() + math.random())
    return math.random(1000000, 9999999)
end