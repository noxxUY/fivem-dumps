local Config = {};
Config.UsesEsx = false

local Levels = {};
Levels.ULTRA_LOW    = "ultra";
Levels.LOW          = "bajo";
Levels.MEDIUM       = "medio";
Levels.RESET        = "off";

local currentLevel = nil;

local function Print( message )
    TriggerEvent( "chat:addMessage", {
        args = { "ZONA SUR FPS BOOSTER", message }
    } );
end

local function OnChangeLevel( shadows, flashlight, rope, sirens, tracker )
    RopeDrawShadowEnabled( rope or false );

    CascadeShadowsClearShadowSampleType();
    CascadeShadowsSetAircraftMode( false );
    CascadeShadowsEnableEntityTracker( true );
    CascadeShadowsSetDynamicDepthMode( false );
    CascadeShadowsSetEntityTrackerScale( tracker or shadows );
    CascadeShadowsSetDynamicDepthValue( shadows );
    CascadeShadowsSetCascadeBoundsScale( shadows );

    SetFlashLightFadeDistance( flashlight );
    SetLightsCutoffDistanceTweak( flashlight );
    DistantCopCarSirens( sirens or false );
end

local function CheckOnScreen( ent )
    if not IsEntityOnScreen( ent ) then
        SetEntityAlpha( ent, 0 );
        SetEntityAsNoLongerNeeded( ent );
    else
        local alpha = GetEntityAlpha( ent );

        if alpha == 0 then
            SetEntityAlpha( ent, 255 );
        elseif alpha ~= 210 then -- ???
            SetEntityAlpha( ent, 210 ); 
        end
    end
end

local function RemoveIfNotOnScreen()
    local peds = GetGamePool( "CPed" );
    for i = 1, #peds do
        local v = peds[i];
        CheckOnScreen( v );
        SetPedAoBlodRendering( v, false );

        Citizen.Wait( 1 );
    end

    local objects = GetGamePool( "CObject" );
    for i = 1, #objects do
        local v = objects[i];
        CheckOnScreen( v );
        Citizen.Wait( 1 );
    end
end

local function Tick( lodScale, extra, occlusion )
    RemoveIfNotOnScreen();

    if extra then
        SetDisableDecalRenderingThisFrame();
        RemoveParticleFxInRange( GetEntityCoords( PlayerPedId() ), 10.0 );
        SetArtificialLightsState( true );
    end

    if occlusion then
        DisableOcclusionThisFrame();
    end
    
    OverrideLodscaleThisFrame( lodScale );
    Citizen.Wait( 0 );
end

local function Interval( extra )
    ClearAllBrokenGlass();
    ClearAllHelpMessages();
    LeaderboardsReadClearAll();
    ClearBrief();
    ClearGpsFlags();
    ClearPrints();
    ClearSmallPrints();
    ClearReplayStats();
    LeaderboardsClearCacheData();
    ClearFocus();
    ClearHdArea();
    SetWindSpeed( 0.0 );

    if extra then
        local ped = PlayerPedId();

        ClearPedBloodDamage( ped );
        ClearPedWetness( ped );
        ClearPedEnvDirt( ped );
        ResetPedVisibleDamage( ped );
        ClearExtraTimecycleModifier();
        ClearTimecycleModifier();
        ClearOverrideWeather();
        ClearHdArea();
        DisableVehicleDistantlights( false );
        DisableScreenblurFade();
        SetRainLevel( 0.0 );
    end

    Citizen.Wait( extra and 100 or 1000 );
end

local function SimpleThread( level, action )
    Citizen.CreateThread( function() 
        while currentLevel == level do
            action();
        end
    end );
end

local function CreateThreads( level )
    local lodScale = 0.8;

    if level == Levels.ULTRA_LOW then
        lodScale = 0.4;
    elseif level == Levels.LOW then
        lodScale = 0.6;
    end

    local extra = level ~= Levels.MEDIUM;
    local occlusion = level == Levels.ULTRA_LOW;

    SimpleThread( level, function() 
        Tick( lodScale, extra, occlusion );
    end );

    SimpleThread( level, function() 
        Interval( extra );
    end );
end

local function SetLevel( level )
    if level == Levels.RESET then
		SetTimecycleModifier()
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()
        OnChangeLevel( 5.0, 10.0, true, true );
    elseif level == Levels.ULTRA_LOW then
		SetTimecycleModifier('yell_tunnel_nodirect')
        OnChangeLevel( 0.0, 0.0, false, false );
    elseif level == Levels.LOW then
        OnChangeLevel( 0.0, 5.0, false, false );
    elseif level == Levels.MEDIUM then
		SetTimecycleModifier("cinema")
        OnChangeLevel( 3.0, 3.0, true, false, 5.0 );
    else
        Print( "Te confundiste de opción. Opciones válidas: 'ultra', 'bajo', 'medio', 'off'." );
        return;
    end

    CreateThreads();
    currentLevel = level;
end

if Config.UsesEsx then
    local ESX = nil;
    
    local function LoadEsx()
        while ESX == nil do 
            TriggerEvent( "esx:getSharedObject", function( obj ) 
                ESX = obj;
            end );

            Citizen.Wait( 10 ) 
        end
    end
    
    LoadEsx();

    local elements = {
        { label = "ultra",  value = Levels.ULTRA_LOW },
        { label = "bajo",        value = Levels.LOW },
        { label = "medio",     value = Levels.MEDIUM },
        { label = "off",      value = Levels.RESET }
    }

    local function CloseMenu( _, menu )
        menu.close();
    end

    local function CreateEsxMenu()
        LoadEsx();

        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open( "default", GetCurrentResourceName(), "fps", {
            title       = "Zona SUR FPS Booster",
            align       = "top-left",
            elements    = elements
        }, SetLevel, CloseMenu );
    end

    RegisterCommand( "fps", function( _, args )
        if not args[1] then
            CreateEsxMenu();
            return;
        end

        local level = tostring( args[1] ):lower();
        SetLevel( level );
    end );
    
    TriggerEvent( "chat:addSuggestion", "/fps", "Opciones para mejorar los FPS." );
else
    RegisterCommand( "fps", function( _, args )
        local level = tostring( args[1] or "" ):lower();
        SetLevel( level );
    end );
    
    TriggerEvent( "chat:addSuggestion", "/fps", "Opciones para mejorar los FPS.", {
        { name="level", help="Opciones: ultra, bajo, medio, off" }
    } );
end
