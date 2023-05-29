ESX = nil
local job1, job2
local job1_grade, job2_grade
local timer = 0
local sleepThread = 1000
local allowCommand = true

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("trabajo", function (src, args, raw)
    if timer == 0 and allowCommand then
        TriggerServerEvent('sqz_switchjob:getSecondJob')
        timer = 60
        allowCommand = false
    else
        ESX.ShowNotification('Debes esperar 1 minuto para cambiar de trabajo: (tiempo en segundos) '..timer) -- Here you can change whatewer you want
    end
end, false)

RegisterNetEvent('sqz_switchjob:returnSecondJob')
AddEventHandler('sqz_switchjob:returnSecondJob', function(secondjob, secondjob_grade)
    job2 = secondjob
    job2_grade = secondjob_grade
    job1 = ESX.PlayerData.job.name
    job1_grade = ESX.PlayerData.job.grade
    TriggerServerEvent('sqz_switchjob:setSecondJob', job1, job1_grade, job2, job2_grade)
    ESX.ShowNotification('Cambiaste de trabajo') -- Here you can change whatewer you want
    Wait(5000)
    ESX.ShowNotification('Tu trabajo actual es: '..ESX.PlayerData.job.label..' y tu rango es: '..ESX.PlayerData.job.grade_label) -- Here you can change whatewer you want
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

-- Add sugestion for /setjob2 command

TriggerEvent('chat:addSuggestion', '/setjob2', 'Establece a las jugadoras un segundo trabajo', {
    { name="playerID", help="El ID de servidor del jugador al que desea cambiar su segundo trabajo" },
    { name="jobname", help="El nombre del trabajo que desea dar al un jugador" },
    { name="jobgrade", help="El grado de trabajo que desea dar al jugador" }
})