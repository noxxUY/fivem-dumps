--[[ RegisterCommand('fpsboost',function(source,args)
    if not active then
    active = true
      Citizen.CreateThread(function()
          while true do
              SetTimecycleModifier('yell_tunnel_nodirect')
              RopeDrawShadowEnabled(false)
              SetTimecycleModifier("cinema")
              local ped = PlayerPedId()
              SetTimecycleModifier('yell_tunnel_nodirect')
              ClearAllBrokenGlass()
              ClearAllHelpMessages()
              LeaderboardsReadClearAll()
              ClearBrief()
              ClearGpsFlags()
              ClearPrints()
              ClearSmallPrints()
              ClearReplayStats()
              LeaderboardsClearCacheData()
              ClearFocus()
              ClearHdArea()
              ClearPedBloodDamage(ped)
              ClearPedWetness(ped)
              ClearPedEnvDirt(ped)
              ResetPedVisibleDamage(ped)
              ClearOverrideWeather()
              DisableScreenblurFade()
              SetRainLevel(0.0)
              SetWindSpeed(0.0)
              CascadeShadowsClearShadowSampleType()
              CascadeShadowsSetAircraftMode(false)
              CascadeShadowsEnableEntityTracker(true)
              CascadeShadowsSetDynamicDepthMode(false)
              CascadeShadowsSetEntityTrackerScale(0.0)
              CascadeShadowsSetDynamicDepthValue(0.0)
              CascadeShadowsSetCascadeBoundsScale(0.0)

              SetFlashLightFadeDistance(0.0)
              SetLightsCutoffDistanceTweak(0.0)
              DistantCopCarSirens(false)
              
            print("Opciones de rendimiento configuradas para aumentar los FPS.")
           --   TriggerEvent("chatMessage", "[^5Reinado:RP^0] Has ^2Habilitado ^0la Optimizacion de FPS")
              
              Citizen.Wait(10000) -- Espera 10 segundos
          end
        end)

    else
    active = false
    RopeDrawShadowEnabled(true)
 SetTimecycleModifier("default")
            CascadeShadowsSetAircraftMode(true)
            CascadeShadowsEnableEntityTracker(false)
            CascadeShadowsSetDynamicDepthMode(true)
            CascadeShadowsSetEntityTrackerScale(5.0)
            CascadeShadowsSetDynamicDepthValue(5.0)
            CascadeShadowsSetCascadeBoundsScale(5.0)
            
            SetFlashLightFadeDistance(10.0)
            SetLightsCutoffDistanceTweak(10.0)
            DistantCopCarSirens(true)
            SetArtificialLightsState(false)
   ResetExtraTimecycleModifierStrength()
     TriggerEvent("chatMessage", "[^5Reinado:RP^0] Has ^1Desabilitado ^0la Optimizacion de FPS")  
	 end
end)

 RegisterKeyMapping('fpsboost', 'Poner Turbo al Hamster', 'keyboard', 'F11') ]]


 local activo = true
-- register comando para abrir el menu
RegisterCommand("fpson", function(source, args, rawCommand)
    
    activo = true
Citizen.CreateThread(function()
    while activo do
            
            SetTimecycleModifier()
            ClearTimecycleModifier()
            ClearExtraTimecycleModifier()
            local ped = PlayerPedId()
            SetTimecycleModifier('yell_tunnel_nodirect')
            ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ClearPedBloodDamage(ped)
            ClearPedWetness(ped)
            ClearPedEnvDirt(ped)
            ResetPedVisibleDamage(ped)
            ClearOverrideWeather()
            DisableScreenblurFade()
            SetRainLevel(0.0)
            SetWindSpeed(0.0)
            CascadeShadowsClearShadowSampleType()
            CascadeShadowsSetAircraftMode(false)
            CascadeShadowsEnableEntityTracker(true)
            CascadeShadowsSetDynamicDepthMode(false)
            CascadeShadowsSetEntityTrackerScale(0.0)
            CascadeShadowsSetDynamicDepthValue(0.0)
            CascadeShadowsSetCascadeBoundsScale(0.0)

            SetFlashLightFadeDistance(0.0)
            SetLightsCutoffDistanceTweak(0.0)
            DistantCopCarSirens(false)
            print("Opciones de rendimiento configuradas para aumentar los FPS.")

            Citizen.Wait(30000) -- Espera 10 segundos
        end
    end)
end, false)


RegisterCommand("fpsoff", function(source, args, rawCommand)
    
    activo = false
    RopeDrawShadowEnabled(true)
    CascadeShadowsSetAircraftMode(true)
    CascadeShadowsEnableEntityTracker(false)
    CascadeShadowsSetDynamicDepthMode(true)
    CascadeShadowsSetEntityTrackerScale(5.0)
    CascadeShadowsSetDynamicDepthValue(5.0)
    CascadeShadowsSetCascadeBoundsScale(5.0)
    
    SetFlashLightFadeDistance(10.0)
    SetLightsCutoffDistanceTweak(10.0)
    DistantCopCarSirens(true)
    SetArtificialLightsState(false)
   ResetExtraTimecycleModifierStrength()
   
    SetTimecycleModifier()
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    SetTimecycleModifier("default")
    ESX.ShowNotification("Configuración de FPS restaurada a sus valores predeterminados.")
   




end, false)


