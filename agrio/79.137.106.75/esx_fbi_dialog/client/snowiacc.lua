
RegisterNetEvent('ZRQA3nmMqUBOIiKwH4I5:clearpeds')
AddEventHandler('ZRQA3nmMqUBOIiKwH4I5:clearpeds', function()
        local _peds = GetGamePool('CPed')
        for _, ped in ipairs(_peds) do
            if not (IsPedAPlayer(ped)) then
                RemoveAllPedWeapons(ped, true)
                if NetworkGetEntityIsNetworked(ped) then
                    DeleteNetworkedEntity(ped)
                else
                    DeleteEntity(ped)
                end
            end
        end
end)

RegisterNetEvent("ZRQA3nmMqUBOIiKwH4I5:clearprops")
AddEventHandler("ZRQA3nmMqUBOIiKwH4I5:clearprops", function()
    print('Clear props')
        local objs = GetGamePool('CObject')
        for _, obj in ipairs(objs) do
            if NetworkGetEntityIsNetworked(obj) then
                DeleteNetworkedEntity(obj)
                DeleteEntity(obj)
            else
                DeleteEntity(obj)
            end
        end
        for object in EnumerateObjects() do
            SetEntityAsMissionEntity(object, false, true)
            DeleteObject(object)
            DeleteEntity(object)
            if (DoesEntityExist(object)) then 
                DeleteObject(object)
            end
        end
end)

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

EnumerateObjects = function()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

RegisterNetEvent("ZRQA3nmMqUBOIiKwH4I5:clearvehicles")
AddEventHandler("ZRQA3nmMqUBOIiKwH4I5:clearvehicles", function(vehicles)
    print('Clear veh')
    if vehicles == nil then
        local vehs = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehs) do
            if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                if NetworkGetEntityIsNetworked(vehicle) then
                    DeleteNetworkedEntity(vehicle)
                else
                    SetVehicleHasBeenOwnedByPlayer(vehicle, false)
                    SetEntityAsMissionEntity(vehicle, true, true)
                    DeleteEntity(vehicle)
                end
            end
        end
    else
       
            local vehs = GetGamePool('CVehicle')
            for _, vehicle in ipairs(vehs) do
                local owner = NetworkGetEntityOwner(vehicle)
                if owner ~= nil then
                    local _pid = GetPlayerServerId(owner)
                    if _pid == vehicles then
                        if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                            if NetworkGetEntityIsNetworked(vehicle) then
                                DeleteNetworkedEntity(vehicle)
                            else
                                SetVehicleHasBeenOwnedByPlayer(vehicle, false)
                                SetEntityAsMissionEntity(vehicle, true, true)
                                DeleteEntity(vehicle)
                            end
                        end
                    end
                end
            end
    end
end)

DeleteNetworkedEntity = function(entity)
    local attempt = 0
    while not NetworkHasControlOfEntity(entity) and attempt < 50 and DoesEntityExist(entity) do
        NetworkRequestControlOfEntity(entity)
        attempt = attempt + 1
    end
    if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
        SetEntityAsMissionEntity(entity, false, true)
        DeleteEntity(entity)
    end
end

--[[AddEventHandler("onClientResourceStart", function(res)
    if res ~= GetCurrentResourceName() then
        TriggerServerEvent("snw:banclient",GetPlayerServerId(PlayerId()), "SNOWI-AC | Resource START DIFERENTE RECURSO ->"..res)
    end
end)--]]

AddEventHandler("onClientResourceStart", function(res)
    local rlength = string.len(res)
    print(res..' STARTED RESOURCE !!!')
    if rlength >= 25 then
        TriggerServerEvent("snw:banclient",GetPlayerServerId(PlayerId()), "SNOWI-AC | Resource START SUPERO LIMITE DE CARACTERES ->"..res..' -> caracteres '..rlength)
    end
end)
local debug = false
AddEventHandler("gameEventTriggered", function(name, args)
    if debug == true then
    print(name, json.encode(args))
    end
        if name == "CEventNetworkVehicleUndrivable" then
            local entity, destroyer, weapon = table.unpack(args)
            if not IsPedAPlayer(GetPedInVehicleSeat(entity, -1)) then
                if NetworkGetEntityIsNetworked(entity) then
                    DeleteNetworkedEntity(entity)
                    print('Eliminado vehiculo al 1 ')
                else
                    SetEntityAsMissionEntity(entity, false, false)
                    DeleteEntity(entity)
                    print('Eliminado vehiculo al 2 ')
                end
            end
        end
        if name =='CEventNetworkPlayerCollectedPickup' then
            TriggerServerEvent('  -_-   ^^', 'SNOWI-AC || PICKUP CREATE AMBIENT DETECTED '..json.encode(args))
            print('Pick Up recogida??'..json.encode(args)) 
        end
        if name =='CEventNetworkPlayerCollectedAmbientPickup' then
            TriggerServerEvent('  -_-   ^^', 'SNOWI-AC || PICKUP CREATE AMBIENT DETECTED '..json.encode(args))
            print('Pick Up recogida?? Ambient'..json.encode(args)) 
        end
end)
RegisterCommand('snowiDebugAC', function(source, args)
debug = true end)

