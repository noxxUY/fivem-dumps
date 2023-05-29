local name = GetPlayerName(PlayerId())

-- Libreria ESX
ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
    while ESX.GetPlayerData() == nil do
        Citizen.Wait(1000)
    end
    PlayerData = ESX.GetPlayerData()
end)
-- Fin libreria ESX

-- Eventos
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)
-- Fin de eventos

-- Inicio Funciones
local boostfps= false
local tirador= false
local casino = false
local boostMode = 'NO RECONOCIDO'
local tiradorMode = 'NO RECONOCIDO'
local casinoMode = 'NO RECONOCIDO'
openMenu = function()
    local id = GetPlayerServerId(PlayerId())
   -- local xPlayer = ESX.GetPlayerFromId(playerId)
    local elements = {}
  --  local dineromano2 = xPlayer.getMoney()
    local ped = GetPlayerPed(-1)
    local trabajoActual = ESX.GetPlayerData().job.label
    local JobGrade = ESX.GetPlayerData().job.grade_label
    local JobGradeName = ESX.GetPlayerData().job.grade_name
    local name = GetPlayerName(PlayerId())
    --local dineromano = PlayerData.getMoney()
    --local blackmoney = xPlayer.getAccount('black_money').money
   -- local dinerobanco = xPlayer.getAccount('bank').money
    local banco
    local playerDataMony = ESX.GetPlayerData()
    for i=1, #playerDataMony.accounts do
        if playerDataMony.accounts[i].name == "bank" then
            banco = playerDataMony.accounts[i].money
        end 
    end
    Citizen.Wait(5)
    local dineromano
    for i=1, #playerDataMony.accounts do
        if playerDataMony.accounts[i].name == "money" then
            dineromano = playerDataMony.accounts[i].money
        end 
    end
    Citizen.Wait(5)
    local blackmoney
    for i=1, #playerDataMony.accounts do
        if playerDataMony.accounts[i].name == "black_money" then
            blackmoney = playerDataMony.accounts[i].money
        end 
    end
    Citizen.Wait(5)
if casino == false then
    casinoMode = 'DESACTIVADO'
else
    casinoMode = 'ACTIVADO'
end
if boostfps == false then
    boostMode = 'DESACTIVADO'
else
    boostMode = 'ACTIVADO'
end
if tirador == false then
    tiradorMode = 'DESACTIVADO'
else
    tiradorMode = 'ACTIVADO'
end
    table.insert(elements, {label = '📜<span style="color:#FB09E9;">INFORMACIÓN📜'})

    table.insert(elements, {label = 'TRABAJO: '..trabajoActual..'  - '..JobGrade})
    print(json.encode(PlayerData))
    table.insert(elements, {label = 'BANCO: '..banco..' €'})
    table.insert(elements, {label = 'DINERO EN MANO: '..dineromano..' €'})
    table.insert(elements, {label = 'DINERO NEGRO: '..blackmoney..' €'})
    
   -- table.insert(elements, {label = 'DINERO EN MANO: '..dineromano..' €'})
--    table.insert(elements, {label = 'DINERO NEGRO: '..blackmoney..' €'})
  
    table.insert(elements, {label = '🌐<span style="color:#FBA309;">GENERAL🌐'})

    table.insert(elements, {label = '<span>Mostrar Información', value = 'Trabajos_mostrar'})
    table.insert(elements, {label = '<span>Alerta CNP', value = 'alertacnp'})
    table.insert(elements, {label = '<span>Alerta SHERIFF', value = 'alertasheriff'})
table.insert(elements, {label = '<span>BOOST <span style="color:#14FDC1;">FPS ['..boostMode..']', value = 'boostfps2'})
--table.insert(elements, {label = '<span>MODO <span style="color:#14FDC1;">CASINO ['..casinoMode..']', value = 'casino'})

    --table.insert(elements, {label = '<span>Cachear Persona', value = 'interaccion_ciudadana'})

   -- table.insert(elements, {label = 'Habilidades', value = 'Habilidades_mostrar'})

    table.insert(elements, {label = 'Modo Cinemático', value = 'PonerModocine'})
--table.insert(elements, {label = 'Modo tirador (mas alcanze de vision) ['..tiradorMode..']', value = 'tirador'})

    --table.insert(elements, {label = 'Llamar a taxi', value = 'LlamarTaxi'})

    --table.insert(elements, {label = '<span style="color:#FF0000;">-- ID --'})

    table.insert(elements, {label = 'Eres el ID <span style="color:#F7B40E;">['..GetPlayerServerId(PlayerId())..']'})
    --table.insert(elements, {label = 'Ocultar IDS', value = 'hideID'})

    --table.insert(elements, {label = '<span style="color:#FF0000;">-- ARMA --'})

    --table.insert(elements, {label = 'Enseñar/Ocultar Armas', value = 'arma'})
   -- table.insert(elements, {label = 'Ocultar Armas', value = 'arma'})

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_menu', {
        title = 'Menu Personal',
        align = 'bottom-right',
        elements = elements
    }, function(data, menu)

        local val = data.current.value

        if val == 'interaccion_ciudadana' then
            OpenCitizenmenu()
        elseif val == 'PonerModocine' then
            modocine = true
            ExecuteCommand('modocine')
        --[[elseif val == 'Habilidades_mostrar' then
            ExecuteCommand("habilidades")--]]
        elseif val == 'boostfps2' then
            if boostfps == true then
                boostfps = false
                SetTimecycleModifier()
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
                TriggerEvent('esx:showNotification', 'Has desactivado [BOOST FPS]')
                
            else
                boostfps = true
                SetTimecycleModifier('yell_tunnel_nodirect')
                TriggerEvent('esx:showNotification', 'Has activado [BOOST FPS]')
            end
        elseif val == 'boostfps' then
            if boostfps == true then
                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                    TriggerEvent('esx:showNotification', 'No puedes activar [BOOST FPS] si no estas fuera de vehiculos y quieto, sin moverte de un lugar a otro')
                else
                boostfps = false
                TriggerServerEvent('snowiBoostFps', 'inv')
                TriggerEvent('esx:showNotification', 'Has desactivado [BOOST FPS]')
                end
            else
                boostfps = true
                TriggerServerEvent('snowiBoostFps', 'boost')
                TriggerEvent('esx:showNotification', 'Has activado [BOOST FPS]')
            end
        elseif val == 'casino' then
            if casino == true then
                casino = false
                TriggerServerEvent('snowiBoostFps', 'inv')
                TriggerEvent('esx:showNotification', 'Has desactivado [BOOST FPS]')
            else
                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                    TriggerEvent('esx:showNotification', 'No puedes activar [casino FPS] si no estas fuera de vehiculos y quieto, sin moverte de un lugar a otro')
                else

                casino = true
                TriggerServerEvent('snowiBoostFps', 'casino')
                TriggerEvent('esx:showNotification', 'Has activado [casino FPS]')
                end
            end
        elseif val == 'tirador' then
            if tirador == true then
                tirador = false
                TriggerServerEvent('snowiBoostFps', 'inv')
                TriggerEvent('esx:showNotification', 'Has desactivado [MODO TIRADOR]')
            else
                tirador = true
                TriggerEvent('esx:showNotification', 'Has activado [MODO TIRADOR]')
                TriggerServerEvent('snowiBoostFps', 'tiros')
            end
        elseif val == 'ponerHud' then
            hudhidden = true
            ExecuteCommand(Config['HudCommand'])
        elseif val == 'QuitarModocine' then
            modocine = false
            ExecuteCommand('modocine')
        elseif val == 'showID' then
            ExecuteCommand(Config['IdShowCommand'])
        elseif val == 'hideID' then
            ExecuteCommand(Config['IdHideCommand'])
        elseif val == 'arma' then
            ExecuteCommand(Config['WeaponCommand'])
        elseif val == 'arma' then
            ExecuteCommand(Config['NoWeaponCommand'])
        elseif data.current.value == 'Trabajos_mostrar' then
            openMenu_3()
        elseif data.current.value == 'alertacnp' then
            TriggerServerEvent('informarAlertaCnp')
        elseif data.current.value == 'alertasheriff' then
            TriggerServerEvent('informarAlertaSheriff')
        end
    end, function(data, menu) menu.close() end)
end

openMenu_3 = function()
    local elements = {}

    table.insert(elements, {label = 'Mirar tu DNI', value = 'dnimirar'})
    table.insert(elements, {label = 'Enseñar tu DNI', value = 'ensenardni'})

    table.insert(elements, {label = 'Mirar tu carnet de conducir', value = 'carnetmirar'})
    table.insert(elements, {label = 'Enseñar tu carnet de conducir', value = 'ensenarcarnet'})

    
    table.insert(elements, {label = 'Mirar tu licencia de arma', value = 'armamirar'})
    table.insert(elements, {label = 'Enseñar tu licencia de arma', value = 'ensenararma'})

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_menu_2', {
        title = 'Licencias',
        align = 'bottom-right',
        elements = elements
    }, function(data3, menu2)

        if data3.current.value == 'dnimirar' then
            ExecuteCommand('me mira su dni')
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
        elseif data3.current.value == 'ensenardni' then
            local player, distance = ESX.Game.GetClosestPlayer()
            if distance ~= -1 and distance <= 3.0 then
              TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
              ExecuteCommand('me le enseña el dni')
            else
              ESX.ShowNotification('No players nearby')
              
            end
        elseif data3.current.value == 'carnetmirar' then
            ExecuteCommand('me mira su carnet de conducir')
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
        elseif data3.current.value == 'ensenarcarnet' then
            local player, distance = ESX.Game.GetClosestPlayer()
            if distance ~= -1 and distance <= 3.0 then
                ExecuteCommand('me le enseña el carnet de conducir')
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
            else
                ESX.ShowNotification('Ningún jugador cercano')
                
            end
        elseif data3.current.value == 'armamirar' then
            ExecuteCommand('me mira la licencia de arma')
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
        elseif data3.current.value == 'ensenararma' then
            local player, distance = ESX.Game.GetClosestPlayer()
            if distance ~= -1 and distance <= 3.0 then
                ExecuteCommand('me le enseña la licencia de arma')
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
            else
                ESX.ShowNotification('No hay jugadores cerca')
                
            end
        else
            --print("Error en el codigo")
        end
    end, function(data, menu) menu.close() end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if IsControlJustReleased(0, Config['Key']) then
            openMenu()
        end
    end
end)
local function CheckOnScreen( ent )
    if not IsEntityOnScreen( ent ) then
        SetEntityAlpha( ent, 0 );
        SetEntityAsNoLongerNeeded( ent );
    else
        local alpha = GetEntityAlpha( ent );

        if alpha == 0 then
            SetEntityAlpha( ent, 255 );
        elseif alpha ~= 210 then -- why?
            SetEntityAlpha( ent, 210 ); 
        end
    end
end

local function RemoveIfNotOnScreen()
    local peds = GetGamePool( "CPed" );
    for i = 1, #peds do
        local v = peds[i];
        CheckOnScreen( v );
       -- SetPedAoBlobRendering( v, false );

        Citizen.Wait( 1 );
    end

    local objects = GetGamePool( "CObject" );
    for i = 1, #objects do
        local v = objects[i];
        CheckOnScreen( v );
        Citizen.Wait( 1 );
    end
end
RegisterCommand('boostFps', function() 
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


        local ped = PlayerPedId();

        ClearPedBloodDamage( ped );
        ClearPedWetness( ped );
    --    ClearPedEnvDirt( ped );
        ResetPedVisibleDamage( ped );
       -- ClearExtraTimecycleModifier();
        ClearTimecycleModifier();
        ClearOverrideWeather();
        ClearHdArea();
        DisableVehicleDistantlights( false );
  --      DisableScreenblurFade();
       -- SetRainLevel( 0.0 );
        RemoveIfNotOnScreen()

end)
