-- NOTW4018


local appid = '967984357627273256' 
local image1 = 'https://i.imgur.com/864XGzh.png'
local image2 = 'https://cdn-icons-png.flaticon.com/512/5253/5253963.png'
local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = -1

CreateThread(function()
  while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do         
    Wait(500)
    prevframes = GetFrameCount()
    prevtime = GetGameTimer()            
    end

  while true do         
    curtime = GetGameTimer()
      curframes = GetFrameCount()       
        
      if((curtime - prevtime) > 1000) then
          fps = (curframes - prevframes) - 1                
          prevtime = curtime
          prevframes = curframes
      end      
    Wait(350)
  end    
end)

function players()
  local players = {}

  for i = 0, 62 do
      if NetworkIsPlayerActive(i) then
          table.insert(players, i)
      end
  end

  return players
end

function SetRP()
  local name = GetPlayerName(PlayerId())
  local id = GetPlayerServerId(PlayerId())

  SetDiscordAppId(appid)
  SetDiscordRichPresenceAsset(image1)
  SetDiscordRichPresenceAssetSmall(image2)
end

Citizen.CreateThread(function()
  while true do

  Citizen.Wait(1)
    SetRP()
    SetDiscordRichPresenceAssetText('Desvelados RP')
      players = {}
      for i = 0, 64 do
          if NetworkIsPlayerActive( i ) then
              table.insert( players, i )
          end
      end
    SetRichPresence("FPS: " ..fps.. " | " ..GetPlayerName(PlayerId()) .. " | ID: " ..GetPlayerServerId(PlayerId()) .. "")

    SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/nmYtyztVBW")
    SetDiscordRichPresenceAction(1, "FiveM", "https://cfx.re/join/qbbg54")
end
end)