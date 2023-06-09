
--- action functions
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

----markers
AddEventHandler('esx_advanced_duty:hasEnteredMarker', function (zone)
  CurrentActionData, CurrentActionMsg = {}, ''
	CurrentAction     = nil
end)

AddEventHandler('esx_advanced_duty:hasExitedMarker', function (zone)
  CurrentActionData, CurrentActionMsg = {}, ''
  CurrentAction     = nil
end)


-- Enter / Exit marker job events
Citizen.CreateThread(function ()
  while true do
    Wait(0)
			
    while ESX.PlayerData.job == nil do
	Citizen.Wait(500)
    end

    local coords      = GetEntityCoords(PlayerPedId())
    local isInMarker  = false
    local currentZone = nil
    local sleep = true

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.5) then
        local jobName = ESX.PlayerData.job.name

        if string.match(jobName, "off") then jobName = jobName:gsub("%off", "") end

        if v.JobRequired == jobName then
          sleep = false
          isInMarker  = true
          currentZone = k

          CurrentAction     = 'esx_advanced_duty_changejob'
          CurrentActionMsg  = _U('duty')
          CurrentActionData = {}
        end
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_advanced_duty:hasEnteredMarker', currentZone)
      print("2")
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      print("1")
      TriggerEvent('esx_advanced_duty:hasExitedMarker', LastZone)
    end

    if sleep then
      Citizen.Wait(3000)
    end
  end
end)




--keycontrols
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(50)
    
    if CurrentAction ~= nil then
      ESX.ShowHelpNotification(CurrentActionMsg, true)

      if IsControlJustReleased(0, 38) then
        TriggerServerEvent('esx_advanced_duty:changeDutyStatus')
      end

      CurrentActionData, CurrentActionMsg = {}, ''
      CurrentAction     = nil
    end
  end

end)

-- Display markers
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(PlayerPedId())
    local sleep = true

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then

        local jobName = ESX.PlayerData.job.name
        if string.match(jobName, "off") then jobName = jobName:gsub("%off", "") end

        if v.JobRequired == jobName then
          sleep = false
          DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
        end
      end
    end

    if sleep then
      Citizen.Wait(3000)
    end
  end
end)

