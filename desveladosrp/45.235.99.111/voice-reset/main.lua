ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
  end)

  RegisterCommand('resetvoice', function() --  chat command, You can change it to your liking.
  NetworkClearVoiceChannel()
  NetworkSessionVoiceLeave()
  Wait(50)
  NetworkSetVoiceActive(false)
  MumbleClearVoiceTarget(2)
  Wait(1000)
  MumbleSetVoiceTarget(2)
  NetworkSetVoiceActive(true)
  ESX.ShowNotification('Voice chat has been restored.')
  
end)

-- To change the Notification change line 19. ;)
