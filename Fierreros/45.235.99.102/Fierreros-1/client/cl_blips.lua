local blips = {
    -- {title="", colour=, id=, x=, y=, z=},

    {title="Camionero", colour=5, id=477, x = 1208.2781, y = -3114.6919, z = 5.5403},
    {title="ZCarDeluxe", colour=5, id=523, x = -600.901, y = -1122.03, z = 22.329},
    {title="PlatinumCars", colour=5, id=523, x = -794.265, y = -1009.67, z = 13.850},
    {title="WoodyGuns", colour=72, id=150, x = 56.17844, y = -1059.06, z = 29.345},
    {title="ADN Motors", colour=72, id=150, x = 286.4898, y = -1145.29, z = 29.292},


 }

 --[[Info- To disable a blip add "--" before the blip line
 To add a blip just copy and paste a line and change the info and location if needed

 DO NO REPOST, DESTROY OR CLAIM MY SCRIPTS
 
 Made By TheYoungDevelopper]]
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)