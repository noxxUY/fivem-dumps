ESX = exports['es_extended']:getSharedObject()



--- If you get ESX nil error delete above code and run below code --

--ESX = nil
--TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Races = {}
Config = {}
Config.NonBlockFullPhasing = false  -- (If you set this to true, full phasing won't be disrupted in any way when any player comes near you) 
Config.APPName = "Carreras"
Config.VehiclePed = "Debes estar en el vehículo para crear una carrera."
Config.disqualified = "Has sido descalificado de la carrera."
Config.racealert = "Alerta :"
Config.laps = "Vueltas"
Config.Finish = "Carrera Terminada"
Config.Cancel = "Carrera Cancelada"
Config.Quit = "Salir de la carrera"
Config.RaceMap = "Ya hay una carrera en este lugar"
Config.RaceMessage = "Mensaje: "
Config.MapSettings = "[K] Guardar | [U] Cancelar  | [E] Agregar | [Shift+E] Eliminar | ⬆ Radio ⬇ | ⬅ Rotacion ➡ "