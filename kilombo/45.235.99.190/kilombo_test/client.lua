-- ***************** NUI Variables
local questionOpen = false

-- ***************** Spawning
-- AddEventHandler('playerSpawned', function(spawn)
-- 	TriggerServerEvent('kilombo_test:didQuestion')
-- end)

RegisterNetEvent('kilombo_test:notMade')
AddEventHandler('kilombo_test:notMade', function()
	openGui()
	questionOpen = true
end)

-- ***************** Open Gui and Focus NUI
function openGui()
  DisplayRadar(false)
  SetNuiFocus(true, true)
  SendNUIMessage({openQuestion = true})
end

-- ***************** Close Gui and disable NUI
function closeGui()
  DisplayRadar(true)
  questionOpen = false
  SetNuiFocus(false, false)
  SendNUIMessage({openQuestion = false})
end

-- ***************** Disable controls while GUI open
Citizen.CreateThread(function()
  while true do
    sleep = 1000
    if questionOpen then
      sleep = 1
      local ply = PlayerPedId()
      local active = true
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
        SendNUIMessage({type = "click"})
      end
    end
    Citizen.Wait(sleep)
  end
end)

-- ***************** NUI Callback Methods
-- Callbacks pages opening

RegisterNUICallback('question', function(data, cb)
  SendNUIMessage({openSection = "question"})
  cb('ok')
end)

-- Callback actions triggering server events
RegisterNUICallback('close', function(data, cb)
  -- if question success
  closeGui()
  TriggerServerEvent('kilombo_test:success')
  cb('ok')
end)

RegisterNUICallback('kick', function(data, cb)
  closeGui()
  TriggerServerEvent('kilombo_test:kick')
  cb('ok')
end)




