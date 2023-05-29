Citizen.CreateThread( function()


    while true do
      
      Citizen.Wait(5)
      local ped = PlayerPedId()
      if not GetPedConfigFlag(ped,78,1) then
      
        SetPedUsingActionMode(PlayerPedId(), false, -1, 0)

      end

    end


end)