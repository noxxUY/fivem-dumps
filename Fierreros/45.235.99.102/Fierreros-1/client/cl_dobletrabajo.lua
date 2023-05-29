ESX = exports["es_extended"]:getSharedObject()
local job1, job2
local job1_grade, job2_grade
local timer = 0
local sleepThread = 1000
local allowCommand = true

Citizen.CreateThread(function()
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("trabajo", function (src, args, raw)
    if timer == 0 and allowCommand then
        TriggerServerEvent('sqz_switchjob:getSecondJob')
        timer = 30
        allowCommand = false
    else
        ESX.ShowNotification('Tienes que esperar 30 segundos entre cambiar de trabajo. Quedan '..timer) 
    end
end, false)

RegisterNetEvent('sqz_switchjob:returnSecondJob')
AddEventHandler('sqz_switchjob:returnSecondJob', function(secondjob, secondjob_grade)
    job2 = secondjob
    job2_grade = secondjob_grade
    job1 = ESX.PlayerData.job.name
    job1_grade = ESX.PlayerData.job.grade
    TriggerServerEvent('sqz_switchjob:setSecondJob', job1, job1_grade, job2, job2_grade)
    ESX.ShowNotification('Has cambiado de trabajo.')
    Wait(5000)
    ESX.ShowNotification('Su trabajo actual es: '..ESX.PlayerData.job.label..' y su calificación laboral es: '..ESX.PlayerData.job.grade_label) 
end)

Citizen.CreateThread(function()
    
    while true do
        if timer > 1 then
            timer = timer-1  
        elseif timer == 1 then
            allowCommand = true
            timer = 0
        end
        Citizen.Wait(sleepThread)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)