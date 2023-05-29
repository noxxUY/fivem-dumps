local blips = {

--- PARA CREAR MAS BLIPS COPIAS Y PEGAS LA LINEA DE ABAJO (UN ABAJO DE LA OTRA)

   {title="Life Invader", colour=0, id=77, x = -1082.1, y = -249.7, z = 37.8},
   {title="Rancho", colour=0, id=685, x = 2452.7, y = 4972.9, z = 46.9},
   {title="Humane", colour=0, id=80, x = 3598.21, y = 3728.97, z = 29.69},
   {title="Carcel", colour=0, id=189, x = 1685.84, y = 2558.28, z = 31.72},
   {title="Casa Michael", colour=0, id=78, x = -801.48, y = 178.64, z = 8.65},
   {title="Maze Bank", colour=0, id=78, x = -1301.1, y = -823.1, z = 17.2},
   {title="Chicken", colour=0, id=89, x = -65.6, y = 6240.4, z = 31.1},
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)