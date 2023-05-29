Citizen.CreateThread(function()
  while true do
    local Sleep = 1000
    local playerPed = GetPlayerPed(-1)
    local weaponsConfig = Config.Weapons[GetSelectedPedWeapon(playerPed)]

    if weaponsConfig and weaponsConfig.model ~= Config.Weapons[`WEAPON_UNARMED`].model then
      Sleep = 100
      
      if Config.IsDriverDisableWeapon then
        if GetPedInVehicleSeat(GetVehiclePedIsIn(playerPed), -1) == playerPed then
          DisableAimCamThisUpdate()
          RemoveAllPedWeapons(playerPed)
        end
      end

      if weaponsConfig.disableCritical then
        SetPedSuffersCriticalHits(playerPed, false)
      end
      N_0x4757f00bc6323cfe(weaponsConfig.model, weaponsConfig.damage)
    end
    Citizen.Wait(Sleep)
  end
end)
