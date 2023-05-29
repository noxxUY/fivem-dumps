Config = {}

Config.AlignMenu = "bottom-right"

Config.MotelPrice = 5000
Config.HoraDeCobro = {["h"] = 7, ["m"]=10}

Config.Weapons = false 
Config.DirtyMoney = true 

Config.Debug = false

Config.MotelInterior = {
    ["exit"] = vector3(384.8093, 2554.052, 7.9721),
    ["drawer"] = vector3(384.5668, 2558.856, 7.9721), --inventario
    ["wardrobe"] = vector3(385.0481, 2560.735, 7.9721), --ropa
    ["invite"] = vector3(385.9586, 2554.120, 7.9721)
}

Config.Garage = {
	["Motel"] = {
		Marker = vector3(316.96,2622.79,44.49),
		Spawner = vector3(323.63,2625.02,43.73),
		Deleter = vector3(323.63,2625.02,44.49),
		Heading = 10.18
	}	
}

Config.ActionLabel = {
    ["exit"] = "Salir",
    ["drawer"] = "Cajón",
    ["wardrobe"] = "Armario",
    ["invite"] = "Invitar"
}

Config.ReconnectSpawn = {
    ["position"] = vector3(313.7572, 2623.898, 44.457)
}

Config.LandLord = {
	["Hotel Sandy"] = {
        Key = "HotelSandy",
        Position = vector3(313.7572, 2623.898, 44.457),
        MotelsEntrances = {
            [1] = vector3(341.64, 2615.03, 44.67),
            [2] = vector3(347.12, 2618.2, 44.67),
            [3] = vector3(354.5, 2619.86, 44.67),
            [4] = vector3(359.8, 2623.0, 44.67),
            [5] = vector3(367.14, 2624.64, 44.67),
            [6] = vector3(372.47, 2627.78, 44.67),
            [7] = vector3(379.91, 2629.36, 44.67),
            [8] = vector3(385.28, 2632.54, 44.67),
            [9] = vector3(392.54, 2634.2, 44.67),
            [10] = vector3(397.9, 2637.5, 44.67),
        }
    }
}

Config.HelpTextMessage = "-1 ~INPUT_CELLPHONE_LEFT~ & ~INPUT_CELLPHONE_RIGHT~ +1 ~n~"
Config.HelpTextMessage = Config.HelpTextMessage .. "~INPUT_FRONTEND_RDOWN~ Confirmar y comprar habitación por ($" .. Config.MotelPrice .. ") ~n~"
Config.HelpTextMessage = Config.HelpTextMessage .. "~INPUT_FRONTEND_CANCEL~ Cancelar ~n~"



Config.GenerateUniqueId = function()
    math.randomseed(GetGameTimer() + math.random())

    return math.random(1000000, 9999999)
end