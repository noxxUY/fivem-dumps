ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx_armour:armor')
AddEventHandler('esx_armour:armor', function()

  if GetPedArmour(GetPlayerPed(-1)) == 100 then
    ESX.ShowNotification("Ya tienes la armadura completa")
  else
    SetPedArmour(GetPlayerPed(-1), 0)
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)

    TriggerServerEvent('esx_armour:armorremove')
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 11,  ['bproof_2'] = 1})
        SetPedArmour(GetPlayerPed(-1), 100)
      else
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 13,  ['bproof_2'] = 1})
        SetPedArmour(GetPlayerPed(-1), 100)
      end

    end)
    ESX.ShowNotification("Te pusiste armadura")
  end

end)
