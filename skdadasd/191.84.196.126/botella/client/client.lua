RegisterCommand("botella", function()
  local ped = PlayerPedId()
  local coords = GetEntityCoords(ped)
  local number = math.random(500,3000)
  TriggerServerEvent("um-truthordare:server:rotate", coords.x,coords.y,coords.z,number)
end)

RegisterNetEvent("um-truthordare:client:rotate", function(x,y,z,number)
  local prop = CreateObject(GetHashKey('prop_bottle_macbeth'),x,y,z, false, false, true)
  local rot = vector3(x,y - 25,z)
  local coords = GetEntityCoords(prop)
  FreezeEntityPosition(prop,true)
  SetEntityRotation(prop, rot, false, true)
  PlaceObjectOnGroundProperly(prop)
  SetModelAsNoLongerNeeded(prop)
    for i=1,number do 
        max = i 
        rot3 = vector3(rot.x, rot.y, max)
        Wait(1)
        SetEntityRotation(prop, rot3, false, true)
      end 
end)
