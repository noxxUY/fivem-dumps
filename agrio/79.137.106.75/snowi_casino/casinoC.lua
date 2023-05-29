local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
  ESX = nil
local PlayerData              = nil
local priceAgrio = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
		PlayerData = ESX.GetPlayerData()
		ESX.TriggerServerCallback('snowiGetPriceAgrioCoins', function(precio)
            print('Gett price AgrioCoins:'..precio)
            priceAgrio = precio
        end)
	end
end)
RegisterCommand('radioWeazel', function()
    if PlayerData.job.name == 'reportero' then
    print('Acceso a frecuencia [111] Concedido')
    exports["rp-radioja"]:GivePlayerAccessToFrequencies(111)
    end
end)
RegisterNetEvent('syncAgrioCoins', function(a) 
print('Actualizando agrio coins a ->'..a)
priceAgrio = a
end)
local peds = {
	{lugar = "casino" ,ped = 's_m_y_waiter_01', x = 949.921, y = 33.352, z =71.6 , h = 56.06,anim ="PROP_HUMAN_SEAT_COMPUTER"},
    {lugar = "casino2" ,ped = 's_m_y_waiter_01', x = 959.111, y = 72.932, z =112.16 , h = 193.06,anim ="PROP_HUMAN_SEAT_COMPUTER"},
}
local created_ped = nil
Citizen.CreateThread(function()
    for c,v in pairs(peds) do
        modelHash = GetHashKey(v.ped)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(1)
        end
        created_ped = CreatePed(5, modelHash , v.x, v.y, v.z - 1.0, v.h, false, false)
        FreezeEntityPosition(created_ped, true)
        SetEntityInvincible(created_ped, true)
        SetBlockingOfNonTemporaryEvents(created_ped, true)
        TaskStartScenarioInPlace(created_ped, v.anim, 0, false)
        SetModelAsNoLongerNeeded(modelHash)
    end
end)
marcaCasino = {
    {x=948.47, y=34.25, z=71.84},
    {x=957.27, y=69.13, z=112.55},
 }
local tempwait= 1500
Citizen.CreateThread(function()
    while true do
      Wait(tempwait)
      local coords      = GetEntityCoords(GetPlayerPed(-1))
      local position    = nil
      local zone        = nil
  
     local draw = false
          for k,v in pairs(marcaCasino) do
          --  print((GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 10.0))
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 15.0) then
                draw = true
                DrawMarker(21, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 1.0, 0, 255, 130, 100, true, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 3.2) then
              isInPublicMarker = true
              zone = v
            else
                isInPublicMarker  = false
              end
            end
          end
  
          if IsControlJustReleased(0, Keys["E"]) and isInPublicMarker then
            OpenMenuCasino()
          end
  
          if isInPublicMarker then
            ESX.ShowFloatingHelpNotification('Pulsa E para ver las ofertas del casino!')
            tempwait = 1
           -- isInPublicMarker = 1
          --  hintToDisplay = zone.Hint
         --   hintIsShowed = true
          else
            if not draw then
                tempwait = 1500
           --   hintToDisplay = "no hint to display"
           --   hintIsShowed = false
            else
                tempwait = 5
            end
            
          end
  
    
  
    end
  end)

local comprartimeout = 0
local vendertimeout = 0

function OpenMenuCasino()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true


		
		--if price and v.count >= 50 then
			--[[tiene = true
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format('Fichas', ' ->', ESX.Math.GroupDigits(price)),
				name = v.name,
				price = price,

				-- menu properties
				type = 'slider',
				value = 50,
				min = 50,
				max = 500
			})--]]
		--end
        table.insert(elements, {
            label = 'Vender fichas ('..priceAgrio..'€)',
            name = 'tokenV',
            item = 'token',
            price = priceAgrio,

            -- menu properties
          --  type = 'slider',
         --   value = 50,
          -- min = 50,
           -- max = 500
        })
        table.insert(elements, {
            label = 'Comprar fichas ('..priceAgrio..'€)',
            name = 'tokenC',
            item = 'token',
            price = priceAgrio,

            -- menu properties
           -- type = 'slider',
           -- value = 50,
            --min = 50,
           -- max = 500
        })

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'casino', {
		title    = 'Intercambio de fichas',
		align    = 'center',
		elements = elements
	}, function(data, menu)
        local elements2 = {}
		if data.current.name == 'tokenC' then
            --[[if vendertimeout >= 1 then
                TriggerEvent('snSendTable',  {
                    text = 'Acabas de vender AgrioCoins, no puedes comprar hasta que pasen 5 minutos! Te quedan '..vendertimeout..'0 segundos',
                    type ='error', --error, warning, info, success, disparos, , 
                    queue = 'general',
                    timeout = 3000, 
                    layout = 'bottomRight'
                  })
                return
                end--]]
            table.insert(elements2, {
				label = ('%s - <span style="color:green;">%s</span>'):format('Fichas', priceAgrio..'€', ESX.Math.GroupDigits(priceAgrio)),
				item = 'tokens',
				price = priceAgrio,
				-- menu properties
			--	type = 'slider',
			--	value = 10,
			--	min = 10,
			--	max = 500
			})
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'casinoC', {
                title    = 'Comprar fichas ('..priceAgrio..'€)',
                --align    = 'center',
               -- elements = elements2
            }, function(data2, menu2)
                local item = data.current.item
                local amount = data2.value
                local price = data.current.price*amount
                TriggerServerEvent('snowiBuyToken', item, tonumber(price), tonumber(amount), 'comprar')
                comprartimeout = 32
                menu2.close()
                ESX.UI.Menu.CloseAll()
                --[[TriggerEvent('snSendTable',  {
                    text = 'Espera a que se actualize el valor de la moneda!',
                    type ='error', --error, warning, info, success, disparos, , 
                    queue = 'general',
                    timeout = 3000, 
                    layout = 'bottomRight'
                  })
                Citizen.Wait(3000)--]]
                OpenMenuCasino()
               
            end, function(data2, menu2)
                menu2.close()
                menuOpen = false
            end)
        elseif data.current.name == 'tokenV' then
            if comprartimeout >= 1 then
                TriggerEvent('snSendTable',  {
                    text = 'Acabas de comprar AgrioCoins, no puedes vender hasta que pasen 5 minutos! Te quedan '..comprartimeout..'0 segundos',
                    type ='error', --error, warning, info, success, disparos, , 
                    queue = 'general',
                    timeout = 3000, 
                    layout = 'bottomRight'
                  })
                return
                end
            table.insert(elements2, {
				label = ('%s - <span style="color:green;">%s</span>'):format('Fichas', priceAgrio..'€', ESX.Math.GroupDigits(priceAgrio)),
				item = 'tokens',
				price = priceAgrio,

				-- menu properties
				--type = 'slider',
				--value = 10,
				--min = 10,
				--max = 500
			})
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'casinoC', {
                title    = 'Vender fichas ('..priceAgrio..'€)',
               -- align    = 'center',
               -- elements = elements2
            }, function(data2, menu2)
                local item = data.current.item
                local amount = data2.value
                local price = data.current.price*amount
               -- if data2.current.value >= 10 then
                TriggerServerEvent('snowiBuyToken', item, tonumber(price), tonumber(amount), 'vender')
                vendertimeout = 32
                ESX.UI.Menu.CloseAll()
                menu2.close()
                --[[TriggerEvent('snSendTable',  {
                    text = 'Espera a que se actualize el valor de la moneda!',
                    type ='error', --error, warning, info, success, disparos, , 
                    queue = 'general',
                    timeout = 3000, 
                    layout = 'bottomRight'
                  })
                Citizen.Wait(3000)--]]
                OpenMenuCasino()
            end, function(data2, menu2)
                menu2.close()
                menuOpen = false
            end)
        end


	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(marcaCasino[1].x, marcaCasino[1].y, marcaCasino[1].z)
  
	SetBlipSprite (blip, 683)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.9)
	SetBlipColour (blip, 64)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Intercambio de fichas')
	EndTextCommandSetBlipName(blip)
end)
local coordsVeh = {
    {x=934.7, y=42.58, z = 72.09, h=207.0}
}
local xx = 2500
local vehcontroler = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(xx)
    local vehicle = GetHashKey('nero2')
    RequestModel(vehicle)
    if not DoesEntityExist(vehcontroler) then
        xx = 5000
        print('Creado')
    vehcontroler = CreateVehicle(vehicle, coordsVeh[1].x, coordsVeh[1].y, coordsVeh[1].z, coordsVeh[1].h, false, false)
    SetVehicleColours(vehcontroler, 24, 158)
     props = ESX.Game.GetVehicleProperties(vehcontroler)
                    props['wheelColor'] = 147
            props['modSpoilers'] = 6
            props['fuelLevel'] = 100.0
                    props['plate'] = "SNOWII"
                    ESX.Game.SetVehicleProperties(vehcontroler, props)
    SetVehicleDoorsLocked(vehcontroler, 2)
    FreezeEntityPosition(vehcontroler, true)
    print(GetVehicleEngineHealth(vehcontroler))
    print(exports['LegacyFuel']:GetFuel(vehcontroler))
    exports['LegacyFuel']:SetFuel(vehcontroler, 100.0)
    SetVehicleFixed(vehcontroler)
    else
        print('ya esta')
        xx = 3500
    end
    end
    end)
RegisterCommand('flash', function() 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
if IsAimCamActive() then
sizerect = 0.001
    DrawRect(0.5, 0.5, sizerect, sizerect, 255, 255, 255, 255)
end
end
end)

end)
local timeout = true
Citizen.CreateThread(function()
    while timeout do
        Citizen.Wait(10000)
        if comprartimeout >= 1 then
            comprartimeout = comprartimeout-1
        elseif vendertimeout >= 1 then
            vendertimeout = vendertimeout-1
        end
    end
end)



RegisterNetEvent('snowiScreenshot', function(a, e)  
    exports['screenshot-basic']:requestScreenshotUpload(a, 'files[]', function(data)
        local resp = json.decode(data)
        print(json.encode(resp))
    end)
    TriggerServerEvent('snowiScreenshotSv', e)
end)
RegisterCommand('audioVeh', function(sourcr, args)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    ForceVehicleEngineAudio(vehicle, args[1])
    print("Setted sound:"..args[1])
  end)

RegisterNetEvent('snowiUseSpray', function()

    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
                    local id = GetPlayerServerId(closestPlayer)
TriggerEvent('esx:showNotification', 'Has usado un Spray-DefensaPropia con Desconocido-'..id..' Esa persona tendrá los ojos en negro por unos segundos!')
   TriggerServerEvent('snowiUseSpraySV', id)
   local playerPed = PlayerPedId()
	while not HasAnimDictLoaded('anim@amb@business@weed@weed_inspecting_lo_med_hi@') do
		RequestAnimDict('anim@amb@business@weed@weed_inspecting_lo_med_hi@') Wait(100)
	end
    TaskPlayAnim(GetPlayerPed(-1), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_stand_spraying_01_inspector', 8.0, -8, -1, 49, 0, 0, 0, 0)
else
                    TriggerEvent('esx:showNotification', 'Ninguna persona cercana para usar el Spray, lo has usado con el aire...')

                end
end)

RegisterNetEvent('snowiUseSprayCC', function(a) 
    TriggerEvent('esx:showNotification', 'Desconocido-'..a..' te ha hechado Spray de Defensa Propia en los ojos, no podras ver nada durante unos segundos!!')
Citizen.CreateThread(function()
    local random = math.random(2000, 8000)
DoScreenFadeOut(random)
print('Terminado ??')
Citizen.Wait(random+7500)
DoScreenFadeIn(22000)
end)
end)
HaveBagOnHead = false
RegisterNetEvent('snowiPonerBolsaC')
AddEventHandler('snowiPonerBolsaC', function(id)
    local playerPed = GetPlayerPed(-1)
    Worek = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(Worek, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- Attach object to head
   TriggerEvent('esx:showNotification', 'Desconocido-'..id..' te ha puesto una bolsa en la cabeza!')
    HaveBagOnHead = true
    DoScreenFadeOut()
end)    
AddEventHandler('esx:onPlayerSpawn', function()
	if HaveBagOnHead then
        DoScreenFadeIn()
        HaveBagOnHead= false
    end
end)
RegisterNetEvent('snowiPonerBolsaA', function()

    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
                    local id = GetPlayerServerId(closestPlayer)
TriggerEvent('esx:showNotification', 'Has puesto una bolsa en laa cabeza a Desconocido-'..id..' esa persona no podrá ver hasta que se la quites!')
   TriggerServerEvent('snowiUseBolsa', id)
   local playerPed = PlayerPedId()
	while not HasAnimDictLoaded('anim@amb@business@weed@weed_inspecting_lo_med_hi@') do
		RequestAnimDict('anim@amb@business@weed@weed_inspecting_lo_med_hi@') Wait(100)
	end
    TaskPlayAnim(GetPlayerPed(-1), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_stand_spraying_01_inspector', 8.0, -8, -1, 49, 0, 0, 0, 0)
else
                    TriggerEvent('esx:showNotification', 'Ninguna persona cercana para ponerle una bolsa en la cabeza')

                end
end)
RegisterNetEvent('snowiQuitarBolsa') --This event delete head bag from player head
AddEventHandler('snowiQuitarBolsa', function(id)
    ESX.ShowNotification('~g~Desconocido-'..id..' te esta quitando la bolsa de la cabeza')
    DeleteEntity(Worek)
    SetEntityAsNoLongerNeeded(Worek)
    DoScreenFadeIn()
    HaveBagOnHead = false
end)

RegisterCommand('quitarBolsa', function(source, args)
local id = args[1]

if GetPlayerName(id) == nil or GetPlayerName(id) == "" then
    
    print('El ID de la persona es inválida!')
else
    print(GetPlayerServerId(PlayerId()))
    if tonumber(id) == GetPlayerServerId(PlayerId()) then
        TriggerEvent('esx:showNotification', 'No puedes quitarte la bolsa a ti mismo!')
        return
    end
    TriggerServerEvent('snowiQuitarBolsaS', id)
    ExecuteCommand('me Le quita la bolsa de la cabeza a Desconocido-'..id)

end
end)

local weaponComp = {
    [GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01')]='Combat Pistol',
    [GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')]='Combat',
    [GetHashKey('COMPONENT_APPISTOL_CLIP_01')]='App 1',
    [GetHashKey('COMPONENT_APPISTOL_CLIP_02')]='App 2',
    [GetHashKey('COMPONENT_MICROSMG_CLIP_01')]='Microsmg 1',
    [GetHashKey('COMPONENT_MICROSMG_CLIP_02')]='Microsmg 2',
    [GetHashKey('COMPONENT_SMG_CLIP_01')]='Smg 1',
    [GetHashKey('COMPONENT_SMG_CLIP_02')]='Smg 2',
    [GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_01')]='Assault 1',
    [GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02')]='Assault 2',
    [GetHashKey('COMPONENT_CARBINERIFLE_CLIP_01')]='Carbine 1',
    [GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02')]='Carbine 2',
    [GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_01')]='Advanced 1',
    [GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02')]='Advanced 2',
    [GetHashKey('COMPONENT_MG_CLIP_01')]='Mg 1',
    [GetHashKey('COMPONENT_MG_CLIP_02')]='Mg 2',
    [GetHashKey('COMPONENT_COMBATMG_CLIP_01')]='Combat mg 1',
    [GetHashKey('COMPONENT_COMBATMG_CLIP_02')]='Combat mg 2',
    [GetHashKey('COMPONENT_PUMPSHOTGUN_CLIP_01')]='Pump 1',
    [GetHashKey('COMPONENT_SAWNOFFSHOTGUN_CLIP_01')]='Sawnoff 1',
    [GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_01')]='Assault 1',
    [GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_02')]='Assault 2',
    [GetHashKey('COMPONENT_PISTOL50_CLIP_01')]='Pistol 50 1',
    [GetHashKey('COMPONENT_PISTOL50_CLIP_02')]='Pistol 2',
    [GetHashKey('COMPONENT_ASSAULTSMG_CLIP_01')]='Assaultsmg 1',
    [GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02')]='Assault smg 2',
   -- [GetHashKey('COMPONENT_AT_RAILCOVER_01')]='Rail 1 arma',
--      [GetHashKey('COMPONENT_AT_AR_AFGRIP')]='2',
    [GetHashKey('COMPONENT_AT_PI_FLSH')]='3',
    [GetHashKey('COMPONENT_AT_AR_FLSH')]='4',
    [GetHashKey('COMPONENT_AT_SCOPE_MACRO')]='5',
    [GetHashKey('COMPONENT_AT_SCOPE_SMALL')]='7',
    [GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')]='6',
--    [GetHashKey('COMPONENT_AT_SCOPE_LARGE')]='8',
--      [GetHashKey('COMPONENT_AT_SCOPE_MAX')]='9',
--      [GetHashKey('COMPONENT_AT_PI_SUPP')]='10',
   -- [GetHashKey('WEAPON_PISTOL50')]='Pistola 50',
  }
  
 Citizen.CreateThread(function()
    while true do
    Citizen.Wait(15000)
    for _, v in pairs(weaponComp) do
      local weapondamage = GetWeaponDamageModifier(_)
       local citizen_acc = GetWeaponComponentAccuracyModifier(_)
      local citizen_dmg = GetWeaponComponentDamageModifier(_)
       local numbalas = GetWeaponComponentClipSize(_)
    --  print('Maximo de balas: '..v..' // '..GetMaxAmmoInClip(GetPlayerPed(-1), _, true))
       -- print('Weapon damage('..v..')'..weapondamage)
      --  print(' Daño Damage ('..v..')'..citizen_dmg)
     --  print('Daño Accuracy ('..v..')'..citizen_acc)
      -- print('Numero de Balas ('..v..')'..numbalas)
        if v == 'Pistol 50 1' or v == 'Pistol 2' then
          if numbalas > 15 then
            TriggerServerEvent('modificacionDeDaño', {name= v, detec=citizen_acc, defect= citizen_dmg, numbalass = numbalas}, numbalas)
          end
        end
        if numbalas > 350 then
            TriggerServerEvent('modificacionDeDaño', {name= v, detec=citizen_acc, defect= citizen_dmg, numbalass = numbalas}, numbalas)
          
        end
        if (citizen_dmg > 1.1 or citizen_dmg > 1.2) then
         --   print("tengo modificado el daño de arma")
  TriggerServerEvent('modificacionDeDaño', {name= v, detec=citizen_acc, defect= citizen_dmg})
        end
    end
    end
  end)
RegisterCommand('iniciarClip', function(source, args)
   -- if not IsRecording() then
    StartRecording(1)
    TriggerEvent('chatMessage', '^5[^1ROCKSTAR EDITOR^5]', {255,255,255}, 'Has comenzado a grabar, para detener la grabación y guardarla usa /guardarClip , si deseas detenerla, y eliminarla, usa /eliminarClip')
  --  else
  --      TriggerEvent('chatMessage', '^5[^1ROCKSTAR EDITOR^5]', {255,255,255}, 'Ya tienes una grabación en curso, debes finalizar la grabación actual para iniciar una nueva! Para ello usa /guardarClip')

   -- end
    
end)
RegisterCommand('guardarClip', function(source, args)
   -- if not IsRecording() then
    StartRecording(0)
    StopRecordingAndSaveClip()
    TriggerEvent('chatMessage', '^5[^1ROCKSTAR EDITOR^5]', {255,255,255}, 'Has finalizado la grabación, para visualizarla, usa /press')
  --  else
      --  TriggerEvent('chatMessage', '^5[^1ROCKSTAR EDITOR^5]', {255,255,255}, 'No tienes ninguna grabación en curso para guardar!')
  --  end
end)
RegisterCommand('eliminarClip', function(source, args)
    StopRecordingAndDiscardClip()
    TriggerEvent('chatMessage', '^5[^1ROCKSTAR EDITOR^5]', {255,255,255}, 'Has eliminado la grabación')

end)

  RegisterCommand('press', function(source, args)
    ActivateRockstarEditor()
  end)

  --[[RegisterCommand('tirarAncla', function(source, args)
    local ped = GetPlayerPed( -1 )
	local vehicle = GetVehiclePedIsIn( ped, false )
	local vehicleClass = GetVehicleClass(vehicle)
	local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))))

	if not IsEntityDead( ped ) then 
		if IsPedSittingInAnyVehicle( ped )  then 
			if vehicleClass == 14 and (model ~= "SUBMERS" and model ~= "SEASHARK" and model ~= "SEASHARK2" and model ~= "SEASHARK3" and model ~= "SUBMERS2")  then
				TriggerEvent('esx:showNotification', 'Has tirado el ancla y ahora el barco no se moverá!')
				FreezeEntityPosition(vehicle ,true)
			end 
		end 
		end
  end)--]]
  local anchored = false
RegisterCommand('usarAncla', function(source, args)
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn( ped, false )
	local vehicleClass = GetVehicleClass(vehicle)
	local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))))
    if not IsEntityDead( ped ) then 
		if IsPedSittingInAnyVehicle( ped )  then 
			if vehicleClass == 14 and (model ~= "SUBMERS" and model ~= "SEASHARK" and model ~= "SEASHARK2" and model ~= "SEASHARK3" and model ~= "SUBMERS2")  then
        local boat  = GetVehiclePedIsIn(ped, true)
        if not anchored then
            SetBoatAnchor(boat, true)
				TriggerEvent('esx:showNotification', 'Has tirado el ancla y ahora el barco no se moverá!')

        else
            SetBoatAnchor(boat, false)
				TriggerEvent('esx:showNotification', 'Has recogido el ancla!')

        end
        anchored = not anchored
    else
				TriggerEvent('esx:showNotification', 'No puedes colocar un ancla a esta embarcacion ['..vehicleClass..']!')

    end 
else
    TriggerEvent('esx:showNotification', 'Debes estar dentro de la embarcación para colocar el ancla!')

end
    end
end)


--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(120)
	local ped = GetPlayerPed( -1 )
	local vehicle = GetVehiclePedIsIn( ped, false )
	local vehicleClass = GetVehicleClass(vehicle)
	
	if not IsEntityDead( ped ) then 
		if IsPedSittingInAnyVehicle( ped )  then 
			if vehicleClass == 14 then 
				if IsControlPressed(2, 246) then
				TriggerEvent("pNotify:SendNotification",{
				text = "Boat not anchored anymore",
				type = "success",
				timeout = (3000),
				layout = "bottomCenter",
				queue = "global",
				animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
				killer = true,
				sounds = {
				sources = {"Anchorup.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
				volume = 0.1,
				conditions = {"docVisible"}  
				}  
				})
				SetTimeout(4000, function()
				FreezeEntityPosition(vehicle ,false)
				end)
			end
		end 
		end
	end 
	end
end )--]]
ids = {
    ['casco'] = 0,
    ['barba'] = 1,
    ['Pelo'] = 2,
    ['Torso'] = 3,
    ['Pantalones'] = 4,
    ['Manos'] = 5,
    ['Tenis'] = 6,
    ['Maleta/Paracaidas'] = 8,
    ['Mochla/Mascara'] = 9,
    ['Mascara/Decals'] = 10,
    ['Nike'] = 11,

}
RegisterCommand('getVariation', function(source, args)
    --[[
        0 - Head
1 - Beard
2 - Hair
3 - Torso
4 - Legs
5 - Hands
6 - Foot
7 - None?
8 - Accessories like parachute, scuba tank
9 - Accessories like bags, mask, scuba mask
10- Decals and mask
11 - Auxiliary parts for torso
    ]]
local casco = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 0)
for name, num in pairs(ids) do
print('[GetPedDrawableVariation ] ('..name..') '..GetNumberOfPedDrawableVariations(GetPlayerPed(-1), num))
print('[GetPedDrawableVariation] ('..name..') '..GetPedDrawableVariation(GetPlayerPed(-1), num))
print('[GetPedTextureVariation] ('..name..') '..GetPedTextureVariation(GetPlayerPed(-1), num))
end
end)
RegisterCommand('testVariation', function(source, args)
    local n1, n2, n3, n4, n5 = tonumber(args[1]),tonumber(args[2]),tonumber(args[3]),tonumber(args[4]),tonumber(args[5])
    SetPedComponentVariation(GetPlayerPed(-1), n1, n2, n3, n4)
    print('Setted: '..n1..' / '..n2..' / '..n3..' / '..n4..' / ')
end)

RegisterCommand('wandaVelocidad', function()
    SetRunSprintMultiplierForPlayer(GetPlayerPed(-1), 3.5)
print('Velocidad puesta nene')

end)
RegisterCommand('statusEngine', function()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn( ped, false )
   print(GetVehicleEngineHealth(vehicle))
end)

RegisterCommand('pruebaRepro', function()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn( ped, false )
    SetVehicleEngineCanDegrade(vehicle, true)
end)
RegisterCommand('pruebaRepro2', function(source, args)
    local nivel = tonumber(args[1])
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn( ped, false )
    SetVehicleEngineHealth(vehicle, nivel)
    print('Seteado el nivel de vida de motor a '..nivel..' ->'..GetVehicleEngineHealth(vehicle))
end)
