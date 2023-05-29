-- @vars
local pings = {}
local lastPing = nil
ESX = exports['es_extended']:getSharedObject()

-- @threads
CreateThread(function()
    while true do
        local msec = 1000
        for i,v in pairs(pings) do
            if (v) then
                msec = 0
                DrawMarker(1, v.coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.5, 2.5, 2000000000.0, 255, 128, 0, 100, false, true, 2, nil, nil, false)

                create3D(vec3(v.coords.xy, v.coords.z+10), v.name .. " (" .. math.floor(#(GetEntityCoords(PlayerPedId()) - v.coords)) .. "m)")

                if (GetGameTimer() - v.createTime > 20000) then
                    pings[i] = nil
                end
            end
        end
        Wait(msec)
    end
end)

-- @funcs
function putPing()
    local result, hit, endCoords, surface, material, entity = raycast()
    if (result and (endCoords.x ~= 0 and endCoords.y ~= 0 and endCoords.z ~= 0)) then
        ESX.TriggerServerCallback('guille_gangs:server:getGangsData', function(gang)
            if (gang) then
                lastPing = endCoords
                TriggerServerEvent('bm_pings:putPing', endCoords, gang)
                exports['mythic_notify']:SendAlert("cajaverde", "Colocaste un waypoint!", 2500)
            else
                ESX.ShowNotification("No estás en ninguna banda")
            end
        end)
    end
end

function rotationToDirection(q)
    local s = math.rad(q.z)
    local t = math.rad(q.x)
    local u = math.abs(math.cos(t))
    return vector3(-math.sin(s) * u, math.cos(s) * u, math.sin(t))
end

function raycast()
    local ped = PlayerPedId()
    local weaponIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
    local headPos = (weaponIndex > 0 and GetEntityCoords(weaponIndex) or GetPedBoneCoords(ped, 31086, 0.0, 0.0, 0.0))
    local offsetPos = GetFinalRenderedCamCoord() + rotationToDirection(GetGameplayCamRot(2)) * 3000.0
    local rayHandle = StartShapeTestRay(headPos.x, headPos.y, headPos.z, offsetPos.x, offsetPos.y, offsetPos.z, 4294967295, ped, 0)
    local result, hit, endCoords, surface, material, entity = GetShapeTestResultEx(rayHandle)

    if entity then
        return result, hit, endCoords, surface, material, entity
    end
end

function create3D(coords, text)
    local x, y, z = table.unpack(coords)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = 1.0
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(5)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

-- @events
RegisterNetEvent('bm_pings:syncPings', function(data)
    ESX.TriggerServerCallback('guille_gangs:server:getGangsData', function(gang)
        if (gang and gang == data.gang) then
            local _pingData = {
                coords = data.coords,
                gang = data.gang,
                name = data.name,
                createTime = GetGameTimer()
            }
        
            pings[data.name] = _pingData
        end
    end)
end)

-- @commands
RegisterCommand('setPing', function()
    putPing()
end)
RegisterKeyMapping('setPing', 'Set Ping', 'keyboard', 'J')