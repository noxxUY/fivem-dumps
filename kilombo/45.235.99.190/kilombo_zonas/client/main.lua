RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    TriggerEvent('nui:off')
    TriggerEvent('nui:off2')
end)

local zones = {}

Citizen.CreateThread(function()
    local blip_radius = {}
    local blip_marker = {}

    for k,v in pairs(Zones) do
        -- create zones depend of type

        if v['zone']['type'] == 'box' then
            zones[k] = lib.zones.box({
                coords = v['zone']['coords'][1],
                size = v['zone']['size'],
                rotation = v['zone']['rotation'],
                debug = v['zone']['debug'],
                inside = v['zone']['action'].inside,
                onEnter = v['zone']['action'].onEnter,
                onExit = v['zone']['action'].onExit
            })
        elseif v['zone']['type'] == 'sphere' then
            zones[k] = lib.zones.sphere({
                coords = v['zone']['coords'][1],
                radius = v['zone']['radius'],
                debug = v['zone']['debug'],
                inside = v['zone']['action'].inside,
                onEnter = v['zone']['action'].onEnter,
                onExit = v['zone']['action'].onExit
            })
        end

        -- create radius blip if enabled
        if v['blip']['blip_radius']['enabled'] then
            blip_radius[k] = AddBlipForRadius(v['blip']['blip_radius']['coords']['X'], v['blip']['blip_radius']['coords']['Y'], v['blip']['blip_radius']['coords']['Z'], v['blip']['blip_radius']['radius'])
            SetBlipHighDetail(blip_radius[k], true)
            SetBlipColour(blip_radius[k], v['blip']['blip_radius']['color'])
            SetBlipAlpha(blip_radius[k], v['blip']['blip_radius']['alpha'])
            SetBlipAsShortRange(blip_radius[k], true)
        end
        -- create blip if enabled
        if v['blip']['blip_marker']['enabled'] then
            blip_marker[k] = AddBlipForCoord(v['blip']['blip_marker']['coords']['X'], v['blip']['blip_marker']['coords']['Y'], v['blip']['blip_marker']['coords']['Z'])
            SetBlipSprite(blip_marker[k], v['blip']['blip_marker']['sprite'])
            SetBlipDisplay(blip_marker[k], v['blip']['blip_marker']['display'])
            SetBlipScale(blip_marker[k], v['blip']['blip_marker']['scale'])
            SetBlipColour(blip_marker[k], v['blip']['blip_marker']['color'])
            SetBlipAsShortRange(blip_marker[k], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v['blip']['blip_marker']['text'])
            EndTextCommandSetBlipName(blip_marker[k])
        end
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    Citizen.Wait(20)
	TriggerEvent('nui:off2')
	TriggerEvent('nui:off')
	print("restart")
  end)

RegisterNetEvent('nui:on')
AddEventHandler('nui:on', function()
  SendNUIMessage({
    type = "ui",
    display = true
  })
end)

RegisterNetEvent('nui:off')
AddEventHandler('nui:off', function()
  SendNUIMessage({
    type = "ui",
    display = false
  })
end)


RegisterNetEvent('nui:on2')
AddEventHandler('nui:on2', function()
  SendNUIMessage({
    type = "ui2",
    display = true
  })
end)

RegisterNetEvent('nui:off2')
AddEventHandler('nui:off2', function()
  SendNUIMessage({
    type = "ui2",
    display = false
  })
end)

local MaxSpeedEnabled=false

function limitoVelocidad()
    if IsPedInAnyVehicle(cache.ped,true) then
        if not MaxSpeedEnabled then
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona limitada a <span style="color: red;font-weight:bold;">100km/h</span>', 3500, 'info')
        end
        local MaxSpeed=55.1
        local Vehicle=GetVehiclePedIsIn(cache.ped,false)
        SetEntityMaxSpeed(Vehicle,(MaxSpeed/2))
        MaxSpeedEnabled=true
    end
end

function deslimitoVelocidad()
    if IsPedInAnyVehicle(cache.ped,true) then
        local Vehicle=GetVehiclePedIsIn(cache.ped,false)
        SetEntityMaxSpeed(Vehicle,GetVehicleHandlingFloat(Vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
        MaxSpeedEnabled=false
    end
end

function entroZonaRoja(self)
    TriggerEvent('nui:on2')
end

function salgoZonaRoja(self)
    TriggerEvent('nui:off2')
end

function InsideSafeZone(self)
    --ESX.ShowHelpNotification('~BLIP_INFO_ICON~ Estás en ~g~zona segura~g~.', true)

    TriggerEvent('nui:on')
    TriggerEvent('nui:off2')

    -- disable player firing
    if IsPedArmed(cache.ped, 4) then
        SetCurrentPedWeapon(cache.ped, GetHashKey("WEAPON_UNARMED"), true)
        DisablePlayerFiring(cache.ped, true)
        SetWeaponDamageModifierThisFrame(GetSelectedPedWeapon(cache.ped), -1000)
    end

    -- disable player keys
    DisableControlAction(0, 45, true) -- R
    DisableControlAction(2, 37, true)
    DisableControlAction(0, 106, true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 69, true)
    DisableControlAction(0, 70, true)
    DisableControlAction(0, 92, true)
    DisableControlAction(0, 114, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 331, true)
    DisableControlAction(0, 68, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 263, true)
    DisableControlAction(0, 264, true)

    -- if player is in any vehicle then
    if IsPedInAnyVehicle(cache.ped, false) then
        local veh = GetVehiclePedIsUsing(cache.ped)
        SetEntityCanBeDamaged(veh, false)

        local coches = ESX.Game.GetVehicles()

        for k,v in pairs(coches) do
            SetEntityNoCollisionEntity(veh, v, true)
            SetEntityNoCollisionEntity(v, veh, true)
        end

    end

    -- set player invincible this frame
    SetPedCanRagdoll(cache.ped, false)
    ClearPedBloodDamage(cache.ped)
    ResetPedVisibleDamage(cache.ped)
    ClearPedLastWeaponDamage(cache.ped)
    SetCanAttackFriendly(cache.ped, false, false)
    NetworkSetFriendlyFireOption(false)

    -- set player cannot collade with other players cars
    for _, players in pairs(GetActivePlayers()) do
        local target = GetPlayerPed(players)

        if IsPedInAnyVehicle(target, true) then
            target_veh = GetVehiclePedIsUsing(target)
            SetEntityNoCollisionEntity(PlayerPedId(), target_veh, true)
            SetEntityNoCollisionEntity(target_veh, PlayerPedId(), true)
        end

        if IsPedInAnyVehicle(cache.ped, true) then
            player_veh = GetVehiclePedIsUsing(cache.ped)
            SetEntityNoCollisionEntity(target, player_veh, true)
            SetEntityNoCollisionEntity(player_veh, target, true)
        end

        if IsPedInAnyVehicle(cache.ped, true) and IsPedInAnyVehicle(target, true) then
            SetEntityNoCollisionEntity(GetVehiclePedIsUsing(cache.ped), GetVehiclePedIsUsing(target), true)
            SetEntityNoCollisionEntity(GetVehiclePedIsUsing(target), GetVehiclePedIsUsing(cache.ped), true)
        end

        -- Local Player vs Other Player
        SetEntityNoCollisionEntity(PlayerPedId(), target, true)

        -- Other Player vs Local Player
        SetEntityNoCollisionEntity(target, PlayerPedId(), true)
    end
end

function ExitSafezone(self)

    TriggerEvent('nui:off')
    TriggerEvent('nui:off2')

    SetPedCanRagdoll(cache.ped, true)
    NetworkSetFriendlyFireOption(true)
    SetCanAttackFriendly(cache.ped, true, false)

    if IsPedInAnyVehicle(cache.ped, false) then
        veh = GetVehiclePedIsUsing(cache.ped)
        SetEntityCanBeDamaged(veh, true)
    end

    -- change ped speed
    SetPedMoveRateOverride(PlayerId(), 0.0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.00)
end

function SwitchDimension(dimensionId)
    local passengers = {}

    if IsPedInAnyVehicle(PlayerPedId(), false) then
        local veh = GetVehiclePedIsUsing(PlayerPedId())
        local maxpeds = GetVehicleMaxNumberOfPassengers(veh)
        for i = -1, maxpeds do
            if not IsVehicleSeatFree(veh, i) then
                local ped = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(veh, i)))
                table.insert(passengers , {
                    serverId  = ped,
                })
            end
        end
    end
    local switch_bucket = lib.callback.await('ba_zones-sv:switchBucket', false, dimensionId, IsPedInAnyVehicle(PlayerPedId(), false), passengers)
    if switch_bucket then print("[DEBUG]: Switching bucket to "..dimensionId) end
end