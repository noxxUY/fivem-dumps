--[[
function listautos()
    local carlist = {}

    carlist = {
        'pv_jeep',
        'pv_rover',
        'pv_lgss',
        'pv_sianr',
        'pv_gtr',
        'pv_dawn',
        'PV_bugatti',
        'PV_bugvr',
        'pv_urus',
        'PV_bmwe36',
    }

    elements = {}
   -- print(json.encode(carlist))
    for i = 1, #carlist, 1 do
        elements[i] = {
            label = carlist[i],
            value = carlist[i]
        }
    end
end




------------------ Open Menu  CAR -------------------
function vipcarmenu()
    ESX.UI.Menu.CloseAll()
    listautos(elements)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vipcarmenu', {
        title = 'Evento Drift',
        align = 'right',
        elements = elements
    }, function(data,menu)
    
        for i = 1, #elements, 1 do
            if data.current.value == elements[i].value then createveh(data.current.value)end
        end
        menu.close() 
    end,function(data, menu)menu.close()end)
end

function createveh(car)
    ped = PlayerPedId()
    local veh = car
    if veh == nil then veh = "adder" end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    currentveh = CreateVehicle(vehiclehash, -279.5940, -900.0352, 31.0806, 47.4961, 1, 0)
    SetVehicleNumberPlateText(currentveh, "REIDRIFT")
    SetPedIntoVehicle(PlayerPedId(),currentveh, -1)
    
end
--------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
		local ubicacion = vector3(-279.5940, -900.0352, 31.0806)
    
        local dist = #(pedC - ubicacion)
        if dist < 10 then
            wait = 0
            DrawMarker(2, -279.5940, -900.0352, 31.0806 + 0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
            if dist < 3 then
                ESX.ShowFloatingHelpNotification('Autos Mini', vector3(-279.5940, -900.0352, 31.0806 + 0.50))
                if dist < 2 then
                    if IsControlJustPressed(0, 38) then
                        
                        Citizen.Wait(500)
                        vipcarmenu()
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)
]]