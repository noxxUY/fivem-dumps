ESX = nil

Citizen.CreateThread(function()
    while not ESX do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

        Citizen.Wait(5000)
    end
end)


AddEventHandler('pwasher:onPumpBreak', function()
    ShowNotification("~r~Rompiste la Hidrolavadora, se te cobro una tarifa de ~g~$" .. Config.PumpBreakFee .. "~r~ Han sido deducidos!")
    TriggerServerEvent('pwasher:pay', Config.PumpBreakFee) 
end)


AddEventHandler('pwasher:requestEquipPump', function()
    local playerData = ESX.GetPlayerData()
    for i = 1, #playerData.accounts, 1 do
        if playerData.accounts[i].name == "money" then
            currentCash = playerData.accounts[i].money
            if currentCash >= Config.PumpUsePrice then
                TriggerEvent("pwasher:equipPump")
                TriggerServerEvent("pwasher:pay", Config.PumpUsePrice)
                ShowNotification("~g~Pagaste ~r~"..Config.PumpUsePrice.."$ ~g~para usar la Hidrolavadora!")
            else
                ShowNotification("~r~No tenes suficiente dinero para usar la Hidrolavadora!")
            end
            break
        end
    end
end)

AddEventHandler('pwasher:playSplashParticle', function(pname, posx, posy, posz, heading)
	Citizen.CreateThread(function()
        UseParticleFxAssetNextCall("core")
        local pfx = StartParticleFxLoopedAtCoord(pname, posx, posy, posz, 0.0, 0.0, heading, 1.0, false, false, false, false)
        Citizen.Wait(100)
        StopParticleFxLooped(pfx, 0)
    end)
end)

AddEventHandler('pwasher:playWaterParticle', function(pname, entity, density)
    print("Play Particle")
	Citizen.CreateThread(function()
        for i = 0, density, 1 do
            UseParticleFxAssetNextCall("core")
            StartParticleFxNonLoopedOnEntity(pname, objID, 0.5, 0.0, 0.0, 90.0, 0.0, -90.0, 1.0, true, true, true)
        end
    end)
end)

Citizen.CreateThread(function()
    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
         Citizen.Wait(1)
    end
end)

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end