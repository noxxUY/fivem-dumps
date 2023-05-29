RegisterCommand('fps',function(source,args)
    if not active then
    active = true
--    SetTimecycleModifier('yell_tunnel_nodirect')
     RopeDrawShadowEnabled(false)
 SetTimecycleModifier("cinema")
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
            exports['mythic_notify']:DoCustomHudText('success', 'Optimizacion de FPS Activada', 5000)
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
--    ResetExtraTimecycleModifierStrength()
       exports['mythic_notify']:DoCustomHudText('error', 'Desabilitaste la Optimizacion en FPS', 5000)    end
end)

RegisterCommand('x',function(source,args,rawCommand)
    SetTimecycleModifier(args[1])
end)