Config                            = {}
Config.Locale                     = 'en'

--- #### BASICS
Config.EnablePrice = true -- false = bikes for free
Config.EnableEffects = true
Config.EnableBlips = true


--- #### PRICES	
Config.PriceTriBike = 89
Config.PriceScorcher = 99
Config.PriceCruiser = 129
Config.PriceBmx = 109


--- #### MARKER EDITS
Config.TypeMarker = 27
Config.MarkerScale = {{x = 0.500, y = 0.500, z = 0.200}}
Config.MarkerColor = {{r = 0,g = 255,b = 255}}
	
Config.MarkerZones = { 

    {x = -1001.94, y = -2748.81, z = 12.76},
    {x = 223.13, y = -867.83, z = 29.55},

}


-- Edit blip titles
Config.BlipZones = { 

   {title="Alquiler de bicis", colour=2, id=494, x = -1001.94, y = -2748.81, z = 12.76},
   {title="Alquiler de bicis", colour=2, id=494, x = 223.13, y = -867.83, z = 29.55},
}
