-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

-- Create blip on the map for the cops.
RegisterNetEvent("ND_ATMRobbery:Report", function(coords, street, report)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipSprite(blip, 161)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, true)
    
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("ATM Alarma: " .. street)
    EndTextCommandSetBlipName(blip)

    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        args = {"ATM Alarma", report}
    })

    Wait(30000)
    RemoveBlip(blip)
end)

if config.ox_inventory then
    exports("drill", function(data, slot)
        local used = useDrill()
        if used then
            exports.ox_inventory:useItem(data)
        end
    end)

    exports("rope", function(data, slot)
        local used = useRope()
        if used then
            exports.ox_inventory:useItem(data)
        end
    end)
else
    RegisterNetEvent("ND_ATMRobbery:useDrill", function(itemName)
        local used = useDrill()
        if used then
            TriggerServerEvent("ND_ATMRobbery:useItem", itemName, "perforadora")
        end
    end)
    
    RegisterNetEvent("ND_ATMRobbery:useRope", function(itemName)
        local used = useRope()
        if used then
            TriggerServerEvent("ND_ATMRobbery:useItem", itemName, "gancho")
        end
    end)
end