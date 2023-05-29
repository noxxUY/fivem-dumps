Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 0.5, y = 0.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.ColorOwner 	 = { r = 0, g = 0, b = 255 }
Config.Type          = 29

Config.Locale        = 'es'

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 50000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			{
				--1
				blip = vector3(-662.1, -935.3, 21.8),
				owner = 'steam:1100001424f5d41',
				menu = vector3(-666.679,-933.689,21.829)
			},
			{
				--2
				blip = vector3(810.2, -2157.3, 29.6),
				owner = nil,
				menu = vector3(816.1185,-2149.96,29.619)
			},
			{
				--sandy 3
				blip = vector3(1693.4, 3759.5, 34.7),
				owner = nil,
				menu = vector3(1689.342,3757.687,34.705)
			},
			{
				--paleto 4
				blip = vector3(-330.2, 6083.8, 31.4),
				owner = nil,
				menu = vector3(-334.587,6081.838,31.454)
			},
			{
				--motelpink 5
				blip = vector3(252.3, -50.0, 69.9),
				owner = 'steam:11000014051509a',
				menu = vector3(255.2199,-46.3624,69.941)
			},
			{	
				--pillbox 6
				blip = vector3(22.0, -1107.2, 29.8),
				owner = 'steam:110000136de2667',
				menu = vector3(13.94995,-1112.00,29.797)
			},
			--ammu7
			{
				blip = vector3(2567.6, 294.3, 108.7),
				owner = 'steam:11000011d1ecb41',
				menu = vector3(2572.251,292.8899,108.73)
			},
			--ammu8
			{
				--esta ruta 68 llegando pesquero
				blip = vector3(-1117.5, 2698.6, 18.5),
				owner = nil,
				menu = vector3(-1122.17,2696.783,18.554)
			},			
			{
				--ammu9
				blip = vector3(842.4, -1033.4, 28.1),
				owner = 'steam:110000143831526',
				menu = vector3(846.7278,-1035.13,28.335)
			},
		}
	}
	--[[
	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-1306.2, -394.0, 35.6)
		}
	}
	]]--
}
