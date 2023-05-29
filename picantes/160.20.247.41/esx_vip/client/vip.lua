local isDead = false

local ESX = exports["es_extended"]:getSharedObject()

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj)
ESX = obj
end)

Citizen.CreateThread(function ()
	while true do
	Citizen.Wait(Config.salario * 60000) -- Altere esse valor para a frequência do salário (600000 = 10 minutos)
		TriggerServerEvent('esx_vip:salarioVip')
	end
end)
