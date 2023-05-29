-- Creating the ped
Citizen.CreateThread(function()

    createNpc()
end)

-- Creating the ped function
function createNpc()

    RequestModel(GetHashKey(Config.RequestModel))
    while (not HasModelLoaded(GetHashKey(Config.RequestModel))) do
        Citizen.Wait(1)
    end

    -- Check for locations
    for k,v in pairs(Config.PedLocations) do
        local npc = CreatePed(5, Config.PedModel, v.x, v.y, v.z-0.95, v.h, false, true)

        -- Prevent to NPC to be agressive or move by a player
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
    end

end

-- CREATE 3D TEXT
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    local color = Config.Text.Color
    SetTextScale(Config.Text.Scale, Config.Text.Scale)
    SetTextFont(Config.Text.Font)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 300
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

Citizen.CreateThread(function()
    while true do
        local letSleep = true
        local wait = 1
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k,v in pairs(Config.PedLocations) do
            local dist = #(playerCoords - vector3(v.x, v.y, v.z))
            if dist <= Config.Text.Distance then
                letSleep = false
                DrawText3D(v.x, v.y, v.z, Locales[Config.Language]['press_to_heal'])
                if IsControlJustReleased(0, 38) then
                    ESX.TriggerServerCallback('patino_hospital:checkEMS', function(emsRequired)
                        if not emsRequired then
                        
                            if IsPedDeadOrDying(playerPed) then
                            
                                ESX.TriggerServerCallback('patino_hospital:canPay', function(canPay)
                                    if canPay then
                                        if Config.UseRprogress then

                                            if lib.progressCircle({
                                                duration = 10000,
                                                label = "Aplicando primeros auxilios",
                                                position = 'middle',
                                                useWhileDead = true,
                                                canCancel = false,
                                                disable = {
                                                    move = true
                                                },
                                            }) then 
                                                TriggerEvent('esx_ambulancejob:revive', source)
                                                exports['okokNotify']:Alert("SERVIDOR", 'Fuiste reanimado de urgencia por un <span style="color: green;">SAME</span>.', 4500, 'info')
                                            end
                                        else
                                            --TriggerEvent('esx_ambulancejob:revive')
                                            --TriggerServerEvent('esx_test:testt', source)
                                            TriggerEvent('esx_ambulancejob:revive', source)
                                            --ESX.ShowNotification(Locales[Config.Language]['successfully_paid'])
                                            exports['okokNotify']:Alert("SERVIDOR", 'Fuiste reanimado de urgencia por un <span style="color: green;">SAME</span>.', 4500, 'info')
                                        end
                                    else
                                        --ESX.ShowNotification(Locales[Config.Language]['not_enough_money'])
                                        exports['okokNotify']:Alert("SERVIDOR", 'No tenés suficiente dinero en el banco para poder ser reanimado.', 4500, 'warning')
                                    end

                                end, price)

                            else
                                 if Config.HealPlayer then
                                     ESX.TriggerServerCallback('patino_hospital:canPay', function(canPay)
                                         if canPay then
                                             if Config.UseRprogress then
                                                 if lib.progressCircle({
                                                    duration = 3000,
                                                    label = "Curando heridas superficiales",
                                                    position = 'middle',
                                                    useWhileDead = false,
                                                    canCancel = false,
                                                    anim = {
                                                        dict = 'missheistdockssetup1clipboard@idle_a',
                                                        clip = 'idle_a'
                                                    },
                                                    prop = {
                                                        model = `prop_paper_bag_small`,
                                                        pos = vec3(-0.05, -0.04, -0.07),
                                                        rot = vec3(0.0, 0.0, -1.0)
                                                    },
                                                    disable = {
                                                        move = true,
                                                        combat = true,
                                                        car = true,
                                                    },
                                                }) then 
                                                    SetEntityHealth(playerPed, 200)
                                                    exports['okokNotify']:Alert("SERVIDOR", 'Fuiste tratado y curado por un <span style="color: green;">SAME</span>, tené mas cuidado.', 4500, 'info')
                                                end
                                             else
                                                 SetEntityHealth(playerPed, 200)
                                                 --ESX.ShowNotification(Locales[Config.Language]['successfully_paid'])
                                                 exports['okokNotify']:Alert("SERVIDOR", 'Fuiste tratado y curado por un <span style="color: green;">SAME</span>, tené mas cuidado.', 4500, 'info')
                                             end
                                         else
                                             --ESX.ShowNotification(Locales[Config.Language]['not_enough_money'])
                                             exports['okokNotify']:Alert("SERVIDOR", 'No tenés suficiente dinero en el banco para poder ser reanimado.', 4500, 'warning')
                                         end
    
                                     end, price)
                                 else
                                    exports['okokNotify']:Alert("SERVIDOR", Locales[Config.Language]['player_is_not_dead'], 4500, 'warning')
                                     --ESX.ShowNotification(Locales[Config.Language]['player_is_not_dead'])
                                end
                            end
                        else
                            exports['okokNotify']:Alert("SERVIDOR", Locales[Config.Language]['player_is_not_dead'], 4500, 'info')
                            --ESX.ShowNotification(Locales[Config.Language]['enough_ems'])
                        end
                    end, ems)
                end
            end
        end

        if letSleep then
            Citizen.Wait(1000)
        end

        Citizen.Wait(wait)
    end
end)
