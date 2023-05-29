ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(100)
      end
  end)

  RegisterCommand('recuerdas', function() --  chat command, You can change it to your liking.
  NetworkClearVoiceChannel()
  NetworkSessionVoiceLeave()
  Wait(50)
  NetworkSetVoiceActive(false)
  MumbleClearVoiceTarget(2)
  Wait(1000)
  MumbleSetVoiceTarget(2)
  NetworkSetVoiceActive(true)
  ESX.ShowNotification('Sus cuerdas vocales se reiniciaron.')
  
end)

-- To change the Notification change line 19. ;)
