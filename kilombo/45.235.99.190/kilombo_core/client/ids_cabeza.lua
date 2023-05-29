local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
  
  local letsleep = true
  
  local disPlayerNames = 5
  local playerDistances = {}
  
  local function DrawText3D(position, text, r,g,b) 
      local onScreen,_x,_y=World3dToScreen2d(position.x,position.y,position.z+1)
      local dist = #(GetGameplayCamCoords()-position)
   
      local scale = (1/dist)*2
      local fov = (1/GetGameplayCamFov())*100
      local scale = scale*fov
     
      if onScreen then
          if not useCustomScale then
              SetTextScale(0.0*scale, 0.45*scale)
          else 
              SetTextScale(0.0*scale, customScale)
          end
          SetTextFont(0)
          SetTextProportional(1)
          SetTextColour(r, g, b, 255)
          SetTextDropshadow(0, 0, 0, 0, 255)
          SetTextEdge(2, 0, 0, 0, 150)
          SetTextDropShadow()
          SetTextOutline()
          SetTextEntry("STRING")
          SetTextCentre(1)
          AddTextComponentString(text)
          DrawText(_x,_y)
      end
  end
  
Citizen.CreateThread(function()
      while true do
          sleep = 1000
          for _, id in ipairs(GetActivePlayers()) do
              local targetPed = GetPlayerPed(id)
              if targetPed ~= PlayerPedId() then
                  if playerDistances[id] then
                      if playerDistances[id] < disPlayerNames then
                          sleep = 1
                          local targetPedCords = GetEntityCoords(targetPed)

                        --   headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, targetPed, "[#"..GetPlayerServerId(id).."]", false, false, "", false )
                          if NetworkIsPlayerTalking(id) then
                            DrawText3D(targetPedCords, GetPlayerServerId(id), 247,124,24)
                            --   Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, true) -- Add speaking sprite
                              --DrawMarker(27, targetPedCords.x, targetPedCords.y, targetPedCords.z-0.97, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 173, 216, 230, 100, 0, 0, 0, 0)
                          elseif IsControlPressed(0, Keys["LEFTALT"]) then
                              if IsEntityVisible(GetPlayerPed(id)) then
                                -- Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false) -- Remove speaking sprite
                                DrawText3D(targetPedCords, GetPlayerServerId(id), 255,255,255)
                              end
                          end
                      end
                  end
              end
          end
          Citizen.Wait(sleep)
      end
  end)
  
Citizen.CreateThread(function()
      while true do
          local playerPed = ESX.PlayerData.ped
          local playerCoords = GetEntityCoords(playerPed)
          local players = ESX.Game.GetPlayersInArea(playerCoords, 50) -- Obtener jugadores en un radio de 50.0
        
          for _, id in ipairs(players) do
              local targetPed = GetPlayerPed(id)
              if targetPed ~= playerPed then
                  local distance = #(playerCoords-GetEntityCoords(targetPed))
                  playerDistances[id] = distance
              end
          end
          Citizen.Wait(1000)
      end
  end)