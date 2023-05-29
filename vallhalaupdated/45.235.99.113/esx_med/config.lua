Config = {}
Config.Locale = 'en'

Config.Price = 5000

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.5}
Config.MarkerColor  = {r = 230, g = 22, b = 22}
Config.MarkerType   = 27

Config.Zones = {}

Config.Hosp = {
	{x = 306.42, y = -583.78, z = 42.48},
	{x = 1840.1, y = 3672.3, z = 33.3},
	{x = -248.3, y = 6331.3, z = 31.5},
}

for i=1, #Config.Hosp, 1 do
	Config.Zones['Private Doc_' .. i] = {
		Pos   = Config.Hosp[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
