local ESX = exports['es_extended']:getSharedObject()


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
            for k,v in pairs(Config.Zones) do
                for i = 1, #v.coords, 1 do
                    local dist = #(pedC - v.coords[i])
                    if dist < 10 then
                        wait = 0
                        DrawMarker(2, v.coords[i].x, v.coords[i].y, v.coords[i].z + 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                        if dist < 3 then
                            ShowFloatingHelpNotification('Presiona ~r~E~w~ para comprar.', vector3(v.coords[i].x, v.coords[i].y, v.coords[i].z + 1.2))
                            if dist < 2 then
                                if IsControlJustPressed(0, 38) then


                                          OpenShop(k, v.Weapons, v.categories, v.license)
    
                                end
                            end
                        end
                    end
                end
            end
        Wait(wait)
    end
end)

ShowFloatingHelpNotification = function(msg, coords) 
    AddTextEntry('qbcoreFloatingHelpNotification', msg) 
    SetFloatingHelpTextWorldPosition(1, coords) 
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0) 
    BeginTextCommandDisplayHelp('qbcoreFloatingHelpNotification') 
    EndTextCommandDisplayHelp(2, false, false, -1) 
end

local open = false
local armasP = {}
local cats = {}	

function OpenShop(sid,armas, categorias, license)
    local shopid = sid

    if license ~= nil then
        jobMatch = false
        local jobList = { 'mafia02', 'mafia03', 'mafia04', 'mafia05', 'mafia06', 'mafia07', 'mafia08', 'mafia09', 'mafia10', 'mafia11', 'mafia12', 'mafia13', 'mafia14', 'mafia15', 'mafia16', 'mafia17', 'mafia18', 'mafia19', 'mafia20', 'mafia21', 'mafia22', 'mafia23', 'mafia24', 'mafia25', 'mafia26', 'mafia27', 'mafia28', 'mafia29', 'mafia30', 'mafia31', 'mafia32', 'mafia33', 'mafia34', 'mafia35', 'mafia36', 'mafia37', 'mafia38', 'mafia39', 'mafia40', 'mafia41', 'mafia42', 'mafia43', 'mafia44', 'mafia45', 'mafia46', 'mafia47', 'mafia48', 'mafia49', 'mafia50'}
        local playerJob = ESX.PlayerData.job.name
    
          for i=1, #jobList, 1 do
              if playerJob == jobList[i] then
                jobMatch = true
                  break
              end
          end
        if jobMatch then
            if not open then 
                SetTimecycleModifier('hud_def_blur') -- blur
                SetNuiFocus(true, true)
                for k,v in pairs(categorias) do 
                    SendNUIMessage({
                        action = 'openShop',
                        label = v.label,
                        name = v.name,
                        shop = shopid,
                        blackmoney = true,
                    })
                end
                open = true
                armasP = armas
                cats = categorias
            end
        else

            ESX.ShowNotification("Tienda solo para mafias!")
        end
    else
        if not open then 
            SetTimecycleModifier('hud_def_blur') -- blur
            SetNuiFocus(true, true)
            for k,v in pairs(categorias) do 
                SendNUIMessage({
                    action = 'openShop',
                    label = v.label,
                    name = v.name,
                    blackmoney = false,
		    shop = shopid
                })
            end
            open = true
            armasP = armas
            cats = categorias
        end
    end
end

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
  open = false
  SetTimecycleModifier('default')
end)

RegisterNUICallback('RequestWeapons', function(data, cb)
    for k,v in pairs(armasP) do 
        if v.category == data.cat then
            SendNUIMessage({
                action = 'AppendWeapons',
                name = v.name,
                label = ESX.GetWeaponLabel(v.name),
                price = v.price,
                numero = k
            })
        end
    end
end)


RegisterNUICallback('RequestStats', function(data, cb)
	local _,hudDamage,hudSpeed,hudCapacity,hudAccuracy,hudRange = GetWeaponStats(GetHashKey(data.arma))
    SendNUIMessage({
        action = 'ShowStats',
        damage = hudDamage,
        speed = hudSpeed,
        accuracy = hudAccuracy,
        range = hudRange
    })
end)

RegisterNUICallback('BuyWeapon', function(data, cb)
    local arma = ESX.GetWeaponLabel(data.arma)
    ESX.TriggerServerCallback('Roda_WeaponShop:BuyWeapon', function(valid)
        if valid == 'good' then
            ShowNoti('Buy Weapon', 'Compraste '..arma..'', 'success')
        elseif valid == 'ya' then
            ShowNoti('Already Weapon', 'Ya tienes '..arma..'', 'error')
        elseif valid == 'stock' then 
            ShowNoti('No Stock', 'No hay stock de '..arma..'', 'error')
        else
            ShowNoti('No Money', 'No tiene el dinero suficiente.', 'error')
        end
    end, data.shop, data.tipo, string.upper(data.arma))
end)

CreateThread(function()
    for k,v in pairs(Config.Zones) do 
        for i = 1, #v.coords, 1 do
            local blip = AddBlipForCoord(v.coords[i])
    
            SetBlipSprite (blip, 110)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 0.6)
            SetBlipColour (blip, 4)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName('Tienda de Armas')
            EndTextCommandSetBlipName(blip)
        end
    end
end)

