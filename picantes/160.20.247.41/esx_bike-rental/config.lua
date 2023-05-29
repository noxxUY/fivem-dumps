Config                            = {}
Config.Locale                     = 'en'

--- #### BASICS
Config.EnablePrice = true -- false = bikes for free
Config.EnableEffects = false
Config.EnableBlips = false


--- #### PRICES
Config.PriceTriBike = 100
Config.PriceScorcher = 75
Config.PriceCruiser = 25
Config.Pricefaggio2 = 50


--- #### MARKER EDITS
Config.TypeMarker = 21
Config.MarkerScale = { x = 1.000, y = 1.000, z = 0.400}
Config.MarkerColor = { r = 48, g = 100, b = 255}

Config.MarkerZones = {

    {x = -244.5758, y = -993.0593, z = 29.27991},
    {x = -6.986,y = -1081.704,z = 26.7},   
    {x = -1085.78,y = -263.01,z = 38.80},
    {x = -1262.36,y = -1438.98,z = 4.45},
    {x = -1034.01, y = -2732.69, z = 20.20},
    {x = -515.75, y = -259.62, z = 36.53},


}


-- Edit blip titles
Config.BlipZones = {

   {title="Alquiler de Bicis", colour=48, id=376, x = -244.5758, y = -993.0593, z = 29.27991},
   {title="Alquiler de Bicis", colour=48, id=376, x = -6.892, y = -1081.734, z = 26.829},
   {title="Alquiler de Bicis", colour=48, id=376, x = -1262.36, y = -1438.98, z = 3.45},
   {title="Alquiler de Bicis", colour=48, id=376, x = -1034.01, y = -2732.69, z = 20.17},

}
