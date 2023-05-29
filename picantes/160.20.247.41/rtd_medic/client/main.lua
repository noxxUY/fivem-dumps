CT(function()
    modelodepd= "s_m_m_paramedic_01"
    modelodehash = GetHashKey(modelodepd)
    RequestModel(modelodehash)
    while not HasModelLoaded(modelodehash) do
        Wait(1)
    end
    crearnpc()  
end)

function crearnpc()
    local coordenadas = RTD.Coords

    for k,v in ipairs(coordenadas) do

        crear_ped = CreatePed(5, GetHashKey("s_m_m_paramedic_01") , v.x, v.y, v.z-1, v.h, false, true)
        FreezeEntityPosition(crear_ped, true)
        SetEntityInvincible(crear_ped, true)
        TaskStartScenarioInPlace(crear_ped, "WORLD_HUMAN_DRINKING", 0, true)
    end
end


CT(function()
    while true do
        W(0)

        local playerCoords = GetEntityCoords(PlayerPedId())
        local coordenadas = RTD.Coords
        for k,v in ipairs(coordenadas) do

        local coords = GetEntityCoords(PlayerPedId())    
        local distance = GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true)

        if distance < 1 then
            
            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                if distance < 2 then
                    SHN('Pulsa ~INPUT_PICKUP~ para que te vea un medico')

                    if IsControlJustReleased(0, 38) then
                        DisableControlAction(0, 38, true)
                        if GetEntityHealth(PlayerPedId()) < 200 then
                            exports['mythic_progbar']:Progress({
                                name = "grandmas_house",
                                duration = 10500,
                                label = "Reviviendo",
                                useWhileDead = true,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "missheistdockssetup1clipboard@base",
                                    anim = "base",
                                    flags = 49,
                                },
                                prop = {
                                    model = "p_amb_clipboard_01",
                                    bone = 18905,
                                    coords = { x = 0.10, y = 0.02, z = 0.08 },
                                    rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                },
                                propTwo = {
                                    model = "prop_pencil_01",
                                    bone = 58866,
                                    coords = { x = 0.12, y = 0.0, z = 0.001 },
                                    rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                },
                            }, function(status)
                                if not status then
                                    W(3000)
                                    TE('esx_ambulancejob:revive')
                                    TSE('rtd_medic:pagar')
                                    EnableControlAction(0, 47, true)
                                    local price = RTD.Price
                                    SN('Pagaste ' ..price.. '$ de asistencia medica')
                                end
                            end)   
                        else
                            SN('No necesitas atención medica')
                        end
                    end
                end
            end
        end
    end
    end
end)
