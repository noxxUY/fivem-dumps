print('^2HUD INICIADO')

local isDriving = false;
local isUnderwater = false;
local hasCinematic = false;
local ver = true;
local isPaused = false;
local mapa = false;

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
        Wait(100)
end)



--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlPressed(0, 38) or ((IsPedInAnyVehicle(PlayerPedId(), false) and IsEntityVisible(PlayerPedId())))then
            mapa = true
            DisplayRadar(mapa)
        else
            mapa = false
            DisplayRadar(mapa)
        end

    end
end)]]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            if GetEntityMaxHealth(GetPlayerPed(-1)) ~= 200 then
            SetEntityMaxHealth(GetPlayerPed(-1), 200)
            SetEntityHealth(GetPlayerPed(-1), 200)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if IsPedSwimmingUnderWater(PlayerPedId()) then
            isUnderwater = true
            SendNUIMessage({showOxygen = true})
        elseif not IsPedSwimmingUnderWater(PlayerPedId()) then
            isUnderwater = false
            SendNUIMessage({showOxygen = false})
        end
        TriggerEvent('esx_status:getStatus', 'hunger',
                     function(status) hunger = status.val / 10000 end)
        TriggerEvent('esx_status:getStatus', 'thirst',
                     function(status) thirst = status.val / 10000 end)
        if Config.ShowStress == true then
            TriggerEvent('esx_status:getStatus', 'stress',
                         function(status) stress = status.val / 10000 end)
        end

       
        
        if Config.UseRadio then
            local radioStatus = exports["rp-radio"]:IsRadioOn()
            SendNUIMessage({radio = radioStatus})
        end
        
     

        if (Config.nomapa) then
            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
        else
            DisplayRadar(true)
        end
        Wait(200)


        SendNUIMessage({
            action = "update_hud",
            hp = GetEntityHealth(PlayerPedId()) - 100,
            armor = GetPedArmour(PlayerPedId()),
            hunger = hunger,
            encoche = IsPedSittingInAnyVehicle(PlayerPedId()),
            thirst = thirst,
            stress = stress,
            oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10,
            slidecoche = Config.slidecoche,
        })
        
        if IsPauseMenuActive() then
            SendNUIMessage({showUi = false})
        elseif not IsPauseMenuActive() then
            SendNUIMessage({showUi = true})
        end
    end
end)






RegisterCommand("togglehud",
                function()  SendNUIMessage({action = "toggle_hud"}) end, false)
