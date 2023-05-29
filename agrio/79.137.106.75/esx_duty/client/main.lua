local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}


--- action functions
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil


--- esx
local GUI = {}
ESX                           = nil
GUI.Time                      = 0
local PlayerData              = {}

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1000)
  PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

----markers
AddEventHandler('esx_duty:hasEnteredMarker', function (zone)
  if zone ~= nil then
    CurrentAction     = 'onoff'
    CurrentActionMsg = _U('duty')
  end
end)

AddEventHandler('esx_duty:hasExitedMarker', function (zone)
  CurrentAction = nil
end)

local function sumarelpo(espo)
  if espo == 'si' then
      TriggerServerEvent('sumaunc', espo)
  elseif espo == 'sali' then
      TriggerServerEvent('sumaunc', espo) else
      print('noespolicia')
  end
end
local sadnjbhashgdasfgdag = 2500
--keycontrols
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(sadnjbhashgdasfgdag)

        local playerPed = GetPlayerPed(-1)
        
        local jobs = {
            'offambulance',
            --'offpolice',
            'offmechanic',
            'offtaxi',
		      	'offadmin',
            'offsheriff',
            'offlawyer',
            'cni',
            'offuwucat',
            --'police',
            'ambulance',
            'mechanic',
            'taxi',
            'admin',
            'karting',
            'offkarting',
            'sheriff',
            'lawyer',
            'offcni',
            'uwucat'
        }

        if CurrentAction ~= nil then
          sadnjbhashgdasfgdag = 5
            for k,v in pairs(jobs) do
                if PlayerData.job.name == v then
                    SetTextComponentFormat('STRING')
                    AddTextComponentString(CurrentActionMsg)
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

                    if IsControlJustPressed(0, Keys['E']) then
                        TriggerServerEvent('duty:onoff')
                       
                    end
            end
          end
            if PlayerData.job.name == 'police' then
              SetTextComponentFormat('STRING')
              AddTextComponentString(CurrentActionMsg)
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            
              if IsControlJustPressed(0, Keys['E']) then
                  TriggerServerEvent('duty:onoff')
                  TriggerServerEvent('snowiCLoadOut')
                  TriggerEvent('cambioaserv', 'sali')
                  exports["rp-radioja"]:RemovePlayerAccessToFrequencies(112)
                  exports["rp-radioja"]:RemovePlayerAccessToFrequencies(114)
                  ESX.ShowNotification('Retirado el acceso de radio de CNP & SHERIFF [112 & 114]')
                  sumarelpo('sali')
              end
            end
            if PlayerData.job.name == 'offpolice' then
              TriggerEvent('cambioaserv', 'entra')
              SetTextComponentFormat('STRING')
              AddTextComponentString(CurrentActionMsg)
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            
              if IsControlJustPressed(0, Keys['E']) then
                  TriggerServerEvent('duty:onoff')
                  exports["rp-radioja"]:GivePlayerAccessToFrequencies(112)
                  exports["rp-radioja"]:GivePlayerAccessToFrequencies(114)
                  TriggerServerEvent('snowiCLoadOut')
                  ESX.ShowNotification('Concedido el acceso de radio de CNP & SHERIFF [112 & 114]')
                  sumarelpo('si')
              end
            end
          else

            sadnjbhashgdasfgdag= 2500
    end
  end
end)
-- Display markers
local tzshgd = 2500
Citizen.CreateThread(function ()
  while true do
    Wait(tzshgd)

    local coords = GetEntityCoords(GetPlayerPed(-1))
local du = true 
    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 25.0) then
        tzshgd = 1
        du = false
        DrawMarker(24, v.Pos.x, v.Pos.y, v.Pos.z+0.6, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 200, true, true, 2, false, false, false, false)
      end
    end
    if du == true then
      tzshgd = 2500
    end
  end
end)

-- Enter / Exit marker events
local ajhisdghuasfgdafgsd= 2500
Citizen.CreateThread(function ()
  while true do
    Wait(ajhisdghuasfgdafgsd)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    local duerme = true
    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.5) then
        isInMarker  = true
        duerme = false
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      ajhisdghuasfgdafgsd= 1
      LastZone                = currentZone
      TriggerEvent('esx_duty:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      ajhisdghuasfgdafgsd = 200
      TriggerEvent('esx_duty:hasExitedMarker', LastZone)
    end
    if duerme == true then
      ajhisdghuasfgdafgsd= 2500
    end
  end
end)