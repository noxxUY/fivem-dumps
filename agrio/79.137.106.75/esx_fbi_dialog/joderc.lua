RegisterNetEvent("snowi:fallout")
AddEventHandler("snowi:fallout", function ()
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle)
            end
            
        end
    end
    for object in EnumerateObjects() do
        object = 0
            for db in EnumerateObjects() do
                object = object + 1
                DeleteObject(db)
                DeleteEntity(db)
            end
        end
end)
test = GetMaxNumNetworkObjects()
testped = GetMaxNumNetworkPeds()
testveh = GetMaxNumNetworkVehicles()
numerodeveh = 20
--[[Citizen.CreateThread(function()
    while true do
    Citizen.Wait(10000)
    print("NUMERO DE VEH MAX "..testveh)
    print("NUMERO DE PEDS MAX "..testped)
    print("NUMERO DE OBJETOS MAX "..test)
    if testveh > numerodeveh then
        print("MAS DE 20")
    else
        print("MENOS DE 20")
    end
end
end
)--]]


local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
  }
  
  local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
  end
  
  function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
  end
  
  function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
  end
  
  function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end
  
  function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
  end