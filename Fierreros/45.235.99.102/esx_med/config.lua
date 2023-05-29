Config = {}
Config.Locale = 'en'

Config.Price = 5000

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.0, y = 1.0, z = 1.0}
Config.MarkerColor  = {r = 255, g = 0, b = 0}
Config.MarkerType   = 27

Config.Zones = {}

Config.Hosp = {
	{x = 322.2, y = -590.68, z = 42.3},
	{x = -802.15, y = -1237.67, z = 6.70},
}

for i=1, #Config.Hosp, 1 do
	Config.Zones['Private Doc_' .. i] = {
		Pos   = Config.Hosp[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
