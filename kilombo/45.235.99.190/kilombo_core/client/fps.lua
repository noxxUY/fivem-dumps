local activo = false

---@param distance number
---@param tweak number
local function setLights(distance, tweak)
    SetFlashLightFadeDistance(distance)
    SetLightsCutoffDistanceTweak(tweak)
end

---@param shadow boolean
---@param air boolean
local function setShadowAndAir(shadow, air)
    RopeDrawShadowEnabled(shadow)
    CascadeShadowsClearShadowSampleType()
    CascadeShadowsSetAircraftMode(air)
end

---@param entity boolean
---@param dynamic boolean
---@param tracker number
---@param depth number
---@param bounds number
local function setEntityTracker(entity, dynamic, tracker, depth, bounds)
    CascadeShadowsEnableEntityTracker(entity)
    CascadeShadowsSetDynamicDepthMode(dynamic)
    CascadeShadowsSetEntityTrackerScale(tracker)
    CascadeShadowsSetDynamicDepthValue(depth)
    CascadeShadowsSetCascadeBoundsScale(bounds)
end

RegisterCommand("fps", function()

    if not activo then
        activo = true
        setLights(0.0, 0.0)
        setShadowAndAir(false, false)
        setEntityTracker(true, false, 0.0, 0.0, 0.0)
        SetTimecycleModifier('yell_tunnel_nodirect')
        ESX.ShowNotification("Activaste la optimización de FPS", "success")
    else
        activo = false
        setLights(10.0, 10.0)
        setShadowAndAir(true, true)
        setEntityTracker(true, true, 5.0, 5.0, 5.0)
        SetTimecycleModifier()
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()
        ESX.ShowNotification("Desactivaste la optimización de FPS", "warning")
    end
end)

function OptimizeFPS()
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
    ClearPedBloodDamage(PlayerPedId())
    ClearPedWetness(PlayerPedId())
    ClearPedEnvDirt(PlayerPedId())
    ResetPedVisibleDamage(PlayerPedId())
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        OptimizeFPS()
    end
end) 