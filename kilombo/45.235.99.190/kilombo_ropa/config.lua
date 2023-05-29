Config = {}
Config.Locale = 'es'

Config.Price = 5000

Config.DrawDistance = 20.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 27

Config.Zones = {}

Config.Shops = {
  {x=72.254,    y=-1399.102, z=29.376 - 0.9},
  {x=-703.776,  y=-152.258,  z=37.415 - 0.9},
  {x=-167.863,  y=-298.969,  z=39.733 - 0.9},
  {x=428.694,   y=-800.106,  z=29.491 - 0.9},
  {x=11.632,    y=6514.224,  z=31.877 - 0.9},
  {x=123.646,   y=-219.440,  z=54.557 - 0.9},
  {x=1190.550,  y=2713.441,  z=38.222 - 0.9},
  {x=-1193.429, y=-772.262,  z=17.324 - 0.9},
  {x=-3172.496, y=1048.133,  z=20.863 - 0.9},
} 

for i=1, #Config.Shops, 1 do

	Config.Zones['Shop_' .. i] = {
	 	Pos   = Config.Shops[i],
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end
