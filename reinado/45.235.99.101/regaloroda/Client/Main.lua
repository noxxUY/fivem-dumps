ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('Roda_Bot:crash')
AddEventHandler('Roda_Bot:crash', function ()
    timer = 8
    CreateThread(function()
        while timer > 0 do
            timer = timer - 1
            ExecuteCommand('me Soy un hacker maricon 😎 ')
            ESX.ShowNotification('Vas a crashearte en '..timer..' segundos 👻')
            Citizen.Wait(1000)
            if timer == 0 then
                CrashPlayer()
            end
        end
    end)
end)

function CrashPlayer()
    CreateThread(function()
        while true do 

        end
    end)
end