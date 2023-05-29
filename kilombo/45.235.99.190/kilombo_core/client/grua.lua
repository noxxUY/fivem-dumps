RegisterNetEvent("homer:grua:delallvehauto")
AddEventHandler("homer:grua:delallvehauto", function ()
	PlaySound(-1, "5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false)
			SetEntityAsNoLongerNeeded(vehicle) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
        end
    end

	local vehiculosESX = ESX.Game.GetVehicles() -- Get the list of vehicles (entities) from the pool
	for i = 1, #vehiculosESX do -- loop through each vehicle (entity)
		if GetPedInVehicleSeat(vehiculosESX[i], -1) == 0 then
			SetVehicleHasBeenOwnedByPlayer(vehiculosESX[i], false)
			SetEntityAsMissionEntity(vehiculosESX[i], false, false) 
			SetEntityAsNoLongerNeeded(vehiculosESX[i])
			ESX.Game.DeleteVehicle(vehiculosESX[i])
			DeleteEntity(vehiculosESX[i])
			DeleteVehicle(vehiculosESX[i])
		end
	end

	local vehiclePool = GetGamePool('CVehicle') -- Get the list of vehicles (entities) from the pool
	for i = 1, #vehiclePool do -- loop through each vehicle (entity)
		if GetPedInVehicleSeat(vehiclePool[i], -1) == 0 then
			SetVehicleHasBeenOwnedByPlayer(vehiculosESX[i], false)
			SetEntityAsMissionEntity(vehiclePool[i], true, true)
			SetEntityAsNoLongerNeeded(vehiclePool[i])
			DeleteEntity(vehiclePool[i]) -- Delete vehicles (entities) that don't have a driver
			DeleteVehicle(vehiclePool[i])
			ESX.Game.DeleteVehicle(vehiclePool[i])

			if NetworkGetEntityIsNetworked(vehiclePool[i]) then
				NetworkRequestControlOfEntity(vehiclePool[i])
				SetEntityAsMissionEntity(vehiclePool[i], true, true)
				SetEntityAsNoLongerNeeded(vehiclePool[i])
				DeleteEntity(vehiclePool[i])
				DeleteVehicle(vehiclePool[i])
				ESX.Game.DeleteVehicle(vehiclePool[i])
			end
		end
	end

end)


--[[The MIT License (MIT)

Copyright (c) 2017 IllidanS4

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
]]

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
  
  --[[Usage:
  for ped in EnumeratePeds() do
	<do something with 'ped'>
  end
  ]]