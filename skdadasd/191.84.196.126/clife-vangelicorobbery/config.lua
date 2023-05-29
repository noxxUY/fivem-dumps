Config = {}

Config.RequiredCopsCount = 3

Config.MinJewel = 5
Config.MaxJewel = 10


Config.NextRobSeconds = 1800 -- dont change
Config.OneJewelPrice = 1
Config.SellCoords = vector3(765.4065, -984.165, -4.752)

Config.Vangelico = vector3(-625.12, -232.92, 38.04)
Config.HackCoords = { coords = vector3(-623.32, -216.2, 53.56), heading = 113.48 }
Config.Vents = {
    { handle = nil, coords = vector3(-635.85, -213.36, 53.5), heading = 116.68, planted = false, px = -0.53, py = 0.01, bomba = nil },
    { handle = nil, coords = vector3(-639.82, -215.59, 53.77), heading = 116.68, planted = false, px = -0.10, py = 0.25, bomba = nil },
}

Config.AllowedWeapons = {
	["416676503"] = true,-- pistol
	["-957766203"] = true,-- smg
	["970310034"] = true, --assault
}