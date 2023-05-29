local vehiculoCargado = false
local NearestVehicle = nil
RegisterCommand('cargarvehiculo', function()
    if vehiculoCargado then 
        DetachEntity(NearestVehicle)
        ClearPedTasks(PlayerPedId())
        vehiculoCargado = false
    else
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        NearestVehicle = GetClosestVehicle(PlayerPos.x, PlayerPos.y, PlayerPos.z, 5.0, 0, 71)
        Wait(1000)
        AttachEntityToEntity(NearestVehicle, PlayerPed, 31086, 0, 0, 1.5, 0, 0, 0, true, true,
            true, true, 1, true)
        ExecuteCommand('handsup')
        vehiculoCargado = true
    end
end)

local open = false
RegisterNetEvent('Roda_RankGang:OpenMenu')
AddEventHandler('Roda_RankGang:OpenMenu', function (Top)
    if open then return end
    open = true
    SetNuiFocus(true,true)
    for k,v in pairs(Top) do 
        if k == 1 then 
            k = '🥇'
        elseif k == 2 then
            k = '🥈'
        elseif k == 3 then
            k = '🥉'
        else
            k = k
        end
        SendNUIMessage({
            action = 'openRank',
            datos = {
                name = v.name,
                kills = v.kills,
                job = v.job,
                avatar = v.foto,
                top = k
            }
        })
    end
end)


RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
  open = false
end)