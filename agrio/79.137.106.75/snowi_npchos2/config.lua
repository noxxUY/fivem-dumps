Config = {}
Config.Locale = 'en'

Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 2.0, y = 2.0, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}


Config.toPay = 50 -- Edit this to your liking.

Config.EnableUnemployedOnly = true -- If true it will only show Blips to Unemployed Players | false shows it to Everyone.

Config.EnablePeds = true -- If true then it will add Peds on Markers | false does the Opposite.
Config.Locations = {
    { x = 319.3187, y =-588.7516, z = 42.2821, heading = 155.90550231934, free='no' },
    { x = 1824.97, y = 3689.64, z = 33.2, heading = 36.29, free='si' },
}
Config.Zones = {}

for i=1, #Config.Locations, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Locations[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType,
		free = Config.Locations[i].free,
	}
end

Config.Locations2 = {
	{ x = -442.07, y = -319.94, z = 34.0, heading = 196.0, free='no' },
	{ x = 1814.3, y = 3677.74, z = 33.30, heading = 25.29, free='si' }, -- hospital nuevo
}

Config.Zones2 = {}

for u=1, #Config.Locations2, 1 do
	Config.Zones2['Shop_' .. u] = {
		Pos   = Config.Locations2[u],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
Config.Zones4 = {
    {  x = 319.3187, y =-588.7516, z = 42.2821, heading = 155.90550231934, free='no' },
    { x = 1824.97, y = 3689.64, z = 33.2, heading = 36.29, free='si' },
}
Config.Zones3 = {
    { x = -442.07, y = -319.94, z = 34.76,free='no' },
	{ x = 1814.3, y = 3677.74, z = 33.30,free='si' }
}