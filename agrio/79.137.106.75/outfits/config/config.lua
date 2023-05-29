Config = {}
Config.Locale = 'es'

Config.Price = 50

Config.DrawDistance = 100.0
Config.MarkerSize = { x = 1.5, y = 1.5, z = 0.1 }
Config.MarkerColor = { r = 16, g = 143, b = 162 }
Config.MarkerType = 1

Config.Zones = {}

Config.Shops = {

}

for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
	 	Pos = Config.Shops[i],
	 	Size = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type = Config.MarkerType
  }
end