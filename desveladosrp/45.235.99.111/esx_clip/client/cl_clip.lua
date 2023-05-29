ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
end)

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_clip:useClip', hash, 30)
      ESX.ShowNotification("Utilizaste un cargador")
    else
      ESX.ShowNotification("Debes de tener un arma en la mano para poder recargar")
    end
  else
    ESX.ShowNotification("Debes de sacar el arma a la cual quieres ponerle municion")
  end
end)
