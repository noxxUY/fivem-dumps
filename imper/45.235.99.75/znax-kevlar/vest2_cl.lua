ESX          = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('vest:vest')
AddEventHandler('vest:vest', function()

  if GetPedArmour(GetPlayerPed(-1)) == 100 then
    ESX.ShowNotification("~r~Ya tenes uno puesto~c~deja de esforzar")
  else
    SetPedArmour(GetPlayerPed(-1), 0)
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)

    TriggerServerEvent('vest:vestremove')
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 1,  ['bproof_2'] = 1})
        SetPedArmour(GetPlayerPed(-1), 100)
      else
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 1,  ['bproof_2'] = 1})
        SetPedArmour(GetPlayerPed(-1), 100)
      end

    end)
    ESX.ShowNotification("Te has puesto un chaleco")
  end

end)
