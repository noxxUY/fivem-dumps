local spawn = vector4(-918.4550, -441.3221, 119.2232, 75.5914)

 CreateThread(function()
     while true do
         Wait(0)

         while ESX.IsPlayerLoaded == false or ESX.PlayerLoaded == false do
            Citizen.Wait(10)
        end

         if ESX.PlayerLoaded then
            exports.spawnmanager:setAutoSpawn(false)
            -- CreoCam()
            TriggerServerEvent('kilombo_interfaz:setupScreen')
            break
         end
     end
 end)

-- AddEventHandler('esx:onPlayerSpawn', function()
--     exports.spawnmanager:setAutoSpawn(false)
--     CreoCam()
--     TriggerServerEvent('kilombo_interfaz:setupScreen')
-- end)

-- function Cam()
--     cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     local ped = PlayerPedId()
--    -- SetEntityCoords(ped, spawn.x, spawn.y, spawn.z, true, false, false, false)
-- 	--SetEntityHeading(ped, spawn.w)
--     local offset = GetOffsetFromEntityInWorldCoords(ped, 0, 1.7, 0.4)
--     ShutdownLoadingScreen()
-- 	ShutdownLoadingScreenNui()
--     SetCamActive(cam, true)
--     RenderScriptCams(true, false, 1, true, true)
-- 	SetCamCoord(cam, offset.x, offset.y, offset.z)
-- 	PointCamAtCoord(cam, spawn.x, spawn.y, spawn.z + 1.3)
-- end

RegisterNetEvent('kilombo_interfaz:SetupUI', function(char, data, svdata)
    if char then 
        local thisdata = json.decode(data)
        --local sex = thisdata.skin.sex 
        -- if sex == 0 then model = GetHashKey('mp_m_freemode_01') else model = GetHashKey('mp_f_freemode_01') end 
        -- RequestModel(model) 
        -- while not HasModelLoaded(model) do
        --     RequestModel(model) 
        --     Wait(0) 
        -- end
        --SetPlayerModel(PlayerPedId(), model)
        DisplayRadar(false)
        SetModelAsNoLongerNeeded(model)
        SetNuiFocus(true, true)
        --TriggerEvent('skinchanger:loadSkin', thisdata.skin)
        local playerPed = PlayerPedId()
		FreezeEntityPosition(PlayerPedId(), true)
		SetPedAoBlobRendering(playerPed, true)
		SetEntityAlpha(playerPed, 255)
        SendNUIMessage({
            action = 'openwithChar',
            data = thisdata,
            svdata = svdata
        })
    else
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openwithoutChar',
            svdata = svdata
        })
        --TriggerEvent('skinchanger:loadDefaultModel', skin.sex == math.random(0, 1))
    end
end)

RegisterNUICallback('play', function()
    TriggerServerEvent('kilombo_test:didQuestion')
--[[    TriggerServerEvent('esx:onPlayerJoined')
    SetNuiFocus(false, false)
    DeleteCam()
    FreezeEntityPosition(PlayerPedId(), false)
    DoScreenFadeOut(1000)
    TriggerServerEvent('kilombo_interfaz:leaveInstance')
    Wait(2000)
    DoScreenFadeIn(1000)
	cam = nil]]
end)

RegisterNetEvent('kilombo_interfaz:Stop1', function(char, data, svdata)
    SetNuiFocus(false, false)
    DisplayRadar(true)
    TriggerServerEvent('kilombo_interfaz:leaveInstance')
end)

RegisterNetEvent('kilombo_interfaz:Stop', function(char, data, svdata)
    TriggerServerEvent('esx:onPlayerJoined')
    SetNuiFocus(false, false)
    DisplayRadar(true)
    -- DeleteCam()
    FreezeEntityPosition(PlayerPedId(), false)
    DoScreenFadeOut(1)
    TriggerServerEvent('kilombo_interfaz:leaveInstance')
    Wait(1500)
    DoScreenFadeIn(5000)
	cam = nil
    Wait(1000)
    TriggerServerEvent('esx_communityservice:checkIfSentenced')
end)

RegisterNUICallback('identity', function()
    SetNuiFocus(false, false)
    TriggerServerEvent('kilombo_interfaz:leaveInstance')
    TriggerServerEvent('esx:onPlayerJoined')
end)

function CreoCam()

	cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
  
	SetCamActive(cam, true)
	RenderScriptCams(true, false, 500, true, true)
  
	  
	SetCamRot(cam, -10.0, 0.0, -40.0, true)
	SetCamCoord(cam,114.46,-1015.78,74.87)
  
end
  
function DeleteCam()
  
	SetCamActive(cam, false)
	SetCamActive(cam, false)
	RenderScriptCams(false, false, 500, true, true)
	cam = nil
  
	
end