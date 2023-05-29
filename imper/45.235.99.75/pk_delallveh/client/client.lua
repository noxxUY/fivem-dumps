
local ESX = nil;

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent("esx:getShILovePizzaaredObjILovePizzaect", function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

RegisterNetEvent("wld:delallveh")
AddEventHandler("wld:delallveh", function ()

   --- TriggerEvent('chatMessage', 'SISTEMA', {255, 0, 0}, "TODOS LOS VEHÍCULOS DESOCUPADOS SERÁN ELIMINADOS EN 2 MINUTOS")
    --exports.pNotify:SendNotification({text = "PASA GRUA EN 2 MINUTOS 🔔", type = "info", timeout = 10000, layout = "centerRight", queue = "right"})
        exports['413x-notify']:Alert("warning", "Pasa Grua en 2 Minutos", "", 6000)	
    Citizen.Wait(60000)

   --- TriggerEvent('chatMessage', 'SISTEMA', {255, 0, 0}, "TODOS LOS VEHÍCULOS DESOCUPADOS SERÁN ELIMINADOS EN 1 MINUTO")
        exports['413x-notify']:Alert("warning", "Pasa Grua en 1 Minuto", "", 6000)	


    Citizen.Wait(50000)

	---TriggerEvent('chatMessage', 'SISTEMA', {255, 0, 0}, "TODOS LOS VEHÍCULOS DESOCUPADOS SERÁN ELIMINADOS EN 10 SEGUNDOS")
        exports['413x-notify']:Alert("warning", "Pasa Grua en 10 Segundos", "", 6000)	

    
    Citizen.Wait(10000)

	--TriggerEvent('chatMessage', 'SISTEMA', {255, 0, 0}, "TODOS LOS VEHÍCULOS DESOCUPADOS HAN SIDO ELIMINADOS")
        exports['413x-notify']:Alert("warning", "Paso grua y se llevo los Vehiculos Abandonados", "", 6000)	


    Citizen.Wait(1)

    vehicles = ESX.Game.GetVehicles()

    for i=1, #vehicles, 1 do
        local vehicle = vehicles[i]
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            ESX.Game.DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                ESX.Game.DeleteVehicle(vehicle)
            end
        end
    end
    
end)