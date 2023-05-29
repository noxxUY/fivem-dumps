-- exports.VehicleSignal:DisableBind(true / false)

-- ESX
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1000)
  end
  while true do
    Citizen.Wait(500)
    exports.VehicleSignal:DisableBind(#(ESX.UI.Menu.GetOpenedMenus()) > 0)
  end
end)
