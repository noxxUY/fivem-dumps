ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_clip:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,125)
      ESX.ShowNotification("Usaste un cargador")
    else
      ESX.ShowNotification("No tenes un arma en la mano")
    end
  else
    ESX.ShowNotification("Este tipo de municion no es adecuado")
  end
end)
