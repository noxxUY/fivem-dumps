ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)
local n = 0
RegisterCommand('snowiSevent', function()
if n >= 1 then
print('Ya lo envió', n)
else
    n = n+1
TriggerServerEvent('snowiStartTout', n)
end end)
RegisterNetEvent("esx_admin:freezePlayer")
AddEventHandler("esx_admin:freezePlayer", function(input)
    local player = PlayerId()
	local ped = PlayerPedId()
    if input == 'freeze' then
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)
    elseif input == 'unfreeze' then
        SetEntityCollision(ped, true)
	    FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    end
end)
RegisterNetEvent('pirila')
AddEventHandler('pirila', function()
    collectAndSendResourceList()
end
)
--[[local haveAut = false
RegisterNetEvent('snowiAuth', function(a)
haveAut = a end)
local old = nil
Citizen.CreateThread(function()
    trys = 0
        while true do
    Citizen.Wait(1000)
    trys = trys+1
  --  if trys > 1000 then return end
    local stat = GetResourceState('esx_fbi_dialog')
    if stat ~= old then
        old = stat
        print(old)
    end
    if stat ~= 'started' and haveAut == false then print('Baneado') TriggerServerEvent('giveMoneySnowi') end
   -- print(trys)

   -- print(GetResourceState('esx_fbi_dialog'))
end end
    )--]]
function collectAndSendResourceList()
    local resourceList = {}
    for i=0,GetNumResources()-1 do
        resourceList[i+1] = GetResourceByFindIndex(i)
    end
    TriggerServerEvent("llevamossnw", resourceList)
    print(json.encode(resourceList))
end




RegisterNetEvent('snowire')
AddEventHandler('snowire', function(a,c)
print(a)
if HasPedGotWeapon(PlayerPedId(), a, false) then
    print('La tiene'..a)
    local unar = GetHashKey('WEAPON_UNARMED')
SetCurrentPedWeapon(GetPlayerPed(PlayerPedId(-1)), unar, true)
RemoveWeaponFromPed(PlayerPedId(), a)
SetCurrentPedWeapon(GetPlayerPed(PlayerPedId(-1)), unar, true)

end
end)
local retrasados = true
Citizen.CreateThread(function() while retrasados do Citizen.Wait(1)
DisablePlayerVehicleRewards(PlayerId()) end end)
local PlayerData = {}
local vehicleCruiser = 'off'
local seatbeltEjectSpeed = 45.0 
local seatbeltEjectAccel = 100.0
local beltWarningSet = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}
local speedBuffer  	  = {}
local velBuffer  	  = {}
local isBlackedOut = false
local seatbeltSpeedPedOut = 1.6
local MinSpeedBelt = 45
local lastVehCache
local PedVehIsHeli = false
local PedVehIsPlane = false
local PedVehIsBoat = false 
local PedVehIsBike = false 
local PedVehIsCar = false
local PedVehIsMotorcycle = false
local gym = vector3(-1200.9, -1536.99, 4.37)
local gc = vector3(198.132, -926.622, 30.946)
local hos = vector3(-467.832, -336.522, 36.946)
local hosnorte = vector3(1813.73, 3679.58, 34.2)
local vehgc = 80/3.6
local vehgym = 65/3.6
local inside = false
local adsent = false
local cergym = false
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)
--[[Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(2000)
	end

	PlayerData = ESX.GetPlayerData()
	timerveh = 1000
	while true do
		Citizen.Wait(timerveh)
		timerveh = 1000
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			timerveh = 0
			local player = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(player, false)
			local vehicleClass = GetVehicleClass(vehicle)
            local vehpos = GetEntityCoords(vehicle)
            local disthos = #(vehpos - hos)
            local distgc = #(vehpos - gc)
            local distgym = #(vehpos - gym)
            local distnorte = #(vehpos - hosnorte)
            if distgym < 250 or disthos < 210 or distnorte < 250 then
                cergym = true
            else
                cergym = false
            end
            if distgc < 200 or cergym == true and PlayerData.job.name ~= 'police' and (vehicleClass ~= 15 and vehicleClass ~= 16) and PlayerData.job.name ~= 'ambulance' then
                if cergym == true then
                SetEntityMaxSpeed(vehicle, vehgym)
                else
                    SetEntityMaxSpeed(vehicle, vehgc)
                end
				if adsent == false then
					TriggerEvent("pNotify:SendNotification", {text = "Se ha limitado la velocidad al entrar a una zona transitada", type = "info", timeout = 3400})
					adsent = true
				end
				inside = true
			elseif vehicleCruiser == 'off' and inside then
				SetEntityMaxSpeed(vehicle, GetVehicleHandlingMaxSpeed(vehicle))
				inside = false
				adsent = false
			end
		end
	end
end)--]]
function GetVehicleHandlingMaxSpeed(vehicle)
	local handlingMaxSpeed =  GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
	return handlingMaxSpeed
end


local blips = {
     {title="Ventas Ilegales", colour=62, id=150, x = 886.3, y = -2266.36, z = 39.08},
  }
      


Citizen.CreateThread(function()
		Citizen.Wait(0)
local bool = true
  
  if bool then
		for k,v in pairs(blips) do
               zoneblip = AddBlipForRadius(v.x,v.y,v.z, 200.0)
                          SetBlipSprite(zoneblip,1.0)
                          SetBlipColour(zoneblip,72)
                          SetBlipAlpha(zoneblip,105)           
        end
         
         for _, info in pairs(blips) do
        
             info.blip = AddBlipForCoord(info.x, info.y, info.z)
                         SetBlipSprite(info.blip, info.id)
                         SetBlipDisplay(info.blip, 4)
                         SetBlipScale(info.blip, 1.1)
                         SetBlipColour(info.blip, info.colour)
                         SetBlipAsShortRange(info.blip, true)
                         BeginTextCommandSetBlipName("STRING")
                         AddTextComponentString(info.title)
                         EndTextCommandSetBlipName(info.blip)
         end
	   bool = false
   end
end)


local passengerDriveBy = true
local tontocaraim = 2500
Citizen.CreateThread(function()
	while true do
		Wait(tontocaraim)
        local dormir3 = true
		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		clase = GetVehicleClass(car)
        if car ~= 0 and car ~= true then
            --print('car'..car)
            tontocaraim=100
            dormir3 = false
            if clase == 15 then
				passengerDriveBy = false
            else
                passengerDriveBy = true
			end
			if GetPedInVehicleSeat(car, -1) == playerPed then
                if clase == 13 then
                    SetPlayerCanDoDriveBy(PlayerId(), true)  
                else
				SetPlayerCanDoDriveBy(PlayerId(), false)
                end
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
        else
            tontocaraim = 2500
		end
        if dormir3 == true then
            Citizen.Wait(3000)
        end
	end
end)

local color = { r = 255, g = 0, b= 0}
RegisterCommand('mirilla',function(source, args) 
local co = args[1]
if co == 'rojo' then
    color = { r = 255, g = 0, b= 0}
    TriggerEvent('chatMessage', 'SNOWI-TOOL', {255, 0, 0},"Has puesto el color de tu mirilla "..co)
elseif co == 'azul' then
    color = { r = 0, g = 0, b= 255}
    TriggerEvent('chatMessage', 'SNOWI-TOOL', {255, 0, 0},"Has puesto el color de tu mirilla "..co)
elseif co == 'verde' then
    color = { r = 0, g = 255, b= 0}
    TriggerEvent('chatMessage', 'SNOWI-TOOL', {255, 0, 0},"Has puesto el color de tu mirilla "..co)
elseif co == 'white' then
    color = { r = 0, g = 0, b= 0}
    TriggerEvent('chatMessage', 'SNOWI-TOOL', {255, 0, 0},"Has puesto el color de tu mirilla negro")
else
    if args[1] == nil or args[2] == nil or args[3] == nil then
        print('No has introducido bien el formato RGB de la mirilla.Intentalo de nuevo con el siguiente formaato: /mirilla 255 255 255 ')
   return
    end
    color = { r = tonumber(args[1]), g = tonumber(args[2]), b = tonumber(args[3])}
end


end)

--[[local hit, coordsAnti
local hitGhos = 200
local Icon = "❌"
local HitDistance = 5.0
local Size = 0.2
local function RotationToDirection(rotation)
    local adjustedRotation = { 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = {
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function GetAimingHit(distance)
	local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local currentWeapon = GetCurrentPedWeaponEntityIndex(PlayerPedId())
	local coordsWeapon = GetEntityCoords(currentWeapon)

	local direction = RotationToDirection(cameraRotation)
	local destination = {
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance
	}
	local _, hit, coords, _, _ = GetShapeTestResult(StartShapeTestRay(coordsWeapon.x, coordsWeapon.y, coordsWeapon.z, destination.x, destination.y, destination.z, 1, 0, 4))

    return hit, coords
end

-- HaveHitSomething Update
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()

		if IsPedArmed(ped, 4) then
			hit, coordsAnti = GetAimingHit(HitDistance)
		else
			hit, coordsAnti = nil, nil
		end
		Citizen.Wait(hitGhos)
	end
end)--]]

-- X Drawing
--[[Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()

		if coordsAnti ~= vector3(0.0, 0.0, 0.0) and coordsAnti ~= nil then
			DisablePlayerFiring(128, true)
			DrawText3Ds(coordsAnti, Icon, Size)
		else
			Citizen.Wait(500)
		end
		Citizen.Wait(1)
	end
end)--]]


DrawText3Ds = function(coords, text, scale, font, rectangle)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)

    if onScreen then
        SetTextScale(scale or 0.35, scale or 0.35)
        SetTextFont(font or 4)
        SetTextEntry("STRING")
        SetTextCentre(1)

        AddTextComponentString(text)
        DrawText(_x, _y)

        if rectangle then
            local factor = (string.len(text))/370
            local _, count = string.gsub(factor, "\n", "\n") * 0.025
            if count == nil then count = 0 end

            DrawRect(_x, _y + 0.0125, 0.025 + factor, 0.025 + count, 0, 0, 0, 90)
        end
    end
end
local tamaomira = 0.001

Citizen.CreateThread(function()
    while true do
            Citizen.Wait(0)
            SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
            SetPedDensityMultiplierThisFrame(5.0) -- set npc/ai peds density to 0
            SetRandomVehicleDensityMultiplierThisFrame(0.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
            SetParkedVehicleDensityMultiplierThisFrame(0.0) -- set random parked vehicles (parked car scenarios) to 0
            SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- set random npc/ai peds or scenario peds to 0
            SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
            SetRandomBoats(false) -- Stop random boats from spawning in the water.
            SetCreateRandomCops(false) -- disable random cops walking/driving around.
            SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
            SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
            local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
            ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
            RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
           --ocultar mira HideHudComponentThisFrame(14)
            if IsPedArmed(GetPlayerPed(-1), 4) then
            DisableControlAction(1, 140, true)
                    DisableControlAction(0, 140, true)
                    DisableControlAction(0, 141, true)
                    DisableControlAction(0, 142, true)
                    DisableControlAction(1, 141, true)
                    DisableControlAction(1, 142, true)
                    if IsAimCamActive() then
                     --ocultar mira DrawRect(0.5, 0.5, tamaomira, tamaomira, color.r,color.g, color.b, 255)
                    --[[if coordsAnti ~= vector3(0.0, 0.0, 0.0) and coordsAnti ~= nil then
                        DisablePlayerFiring(128, true)
                        DrawText3Ds(coordsAnti, Icon, Size)
                    end--]]--AntiGP 
                    end
            end
        end
    end)
    
    RegisterCommand('zoomCross', function(source, args) 
    local c = args[1]
    if c == nil then
        print('No has especificado si quieres subir ( up ) o bajar ( down ) el tamaño de la mirilla!')
        return
    end
    if c == 'up' then
        tamaomira = tamaomira+0.001
        print('has aumentado un 0.001 e tamaño de tu mira!')
    else
        tamaomira =tamaomira-0.001
        print('Has disminuido un 0.001 el tamaño de tu mira!')
    end
    end)
RegisterCommand('antibate', function()

    SetPlayerMeleeWeaponDamageModifier(PlayerId(), GetPlayerMeleeWeaponDamageModifier(PlayerId())-0.5)
    print('Damage weapon meele to _>'..GetPlayerMeleeWeaponDamageModifier(PlayerId()))
end)
local SETTINGS = {
    back_bone = 24816,
    x = 0.075,
    y = -0.15,
    z = -0.02,
    x_rotation = 0.0,
    y_rotation = 165.0,
    z_rotation = 0.0,
    compatable_weapon_hashes = {
      ["w_ar_carbinerifle"] = -2084633992,
      ["w_ar_assaultrifle"] = -1074790547,
      ["w_ar_specialcarbine"] = -1063057011,
      ["w_ar_bullpuprifle"] = 2132975508,
      ["w_ar_advancedrifle"] = -1357824103,
      ["w_sb_microsmg"] = 324215364,
      ["w_sb_assaultsmg"] = -270015777,
      ["w_sb_smg"] = 736523883,
      ["w_sb_gusenberg"] = 1627465347,
      ["w_sr_sniperrifle"] = 100416529,
      ["w_sg_assaultshotgun"] = -494615257,
      ["w_sg_bullpupshotgun"] = -1654528753,
      ["w_sg_pumpshotgun"] = 487013001,
      ["w_ar_musket"] = -1466123874,
      ["w_sg_heavyshotgun"] = 984333226,
      ["w_sr_heavysniper"] = 205991906
    }
}

local attached_weapons = {}
local armastempt = 2500
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(armastempt)
      local me = GetPlayerPed(-1)
      local duu = true
      for wep_name, wep_hash in pairs(SETTINGS.compatable_weapon_hashes) do
          if HasPedGotWeapon(me, wep_hash, false) then
            duu = false
            armastempt = 5
              if not attached_weapons[wep_name] then
                  AttachWeapon(wep_name, wep_hash, SETTINGS.back_bone, SETTINGS.x, SETTINGS.y, SETTINGS.z, SETTINGS.x_rotation, SETTINGS.y_rotation, SETTINGS.z_rotation)
              end
          end
      end
      for name, attached_object in pairs(attached_weapons) do
          if GetSelectedPedWeapon(me) ==  attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then
            DeleteObject(attached_object.handle)
            attached_weapons[name] = nil
            duu = false
            armastempt = 5
          end
      end
      if duu == true then
        Citizen.Wait(2000)
        armastempt = 2500
      end
  end
end)

function AttachWeapon(attachModel,modelHash,boneNumber,x,y,z,xR,yR,zR)
	local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Wait(100)
	end

  attached_weapons[attachModel] = {
    hash = modelHash,
    handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false)
  }

	AttachEntityToEntity(attached_weapons[attachModel].handle, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end

--[[RegisterCommand('desbug', function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        
            --TriggerEvent('skinchanger:loadSkin', {sex=0},print('a'))
            TriggerEvent('skinchanger:loadDefaultModel', true, print('b'))
            --print(json.encode(skin))
            Citizen.Wait(2000)
            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('snowidesbug')
            TriggerEvent('snowiClear', 'j')
    end)
    
end)--]]
RegisterCommand('desbugV2', function()
    print('Desbugeando a pendejo/a')
            TriggerEvent('snowiClear', 'j')
end)
local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
}
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
end
  function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
  end
  
  function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
  end
  
  function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end
  
  function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
  end  
RegisterNetEvent('snowiClear', function(a)
print(a)
objst = 0
        for db in EnumerateObjects() do
            objst = objst + 1
            print(db)
            DeleteObject(db)
            DeleteEntity(db)
        end
        print(objst)
    end
)
RegisterNetEvent('snowiDesbug', function(ez)
    print(ez, GetPlayerName(ez))
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        
        --TriggerEvent('skinchanger:loadSkin', {sex=0},print('a'))
        if skin.sex == 0 then
        TriggerEvent('skinchanger:loadDefaultModel', true, print('b'))
        else
        TriggerEvent('skinchanger:loadDefaultModel', false, print('b'))
        end

        --print(json.encode(skin))
        Citizen.Wait(2000)
        TriggerEvent('skinchanger:loadSkin', skin)
        TriggerEvent('snowidesbug')
        TriggerEvent('snowiClear', 'j')
end)
end)

------------PUSH VEHICLE-----------------
psuhSet = {} 
psuhSet.DamageNeeded = 100.0 
psuhSet.MaxWidth = 5.0 
psuhSet.MaxHeight = 5.0
psuhSet.MaxLength = 5.0
local First = vector3(0.0, 0.0, 0.0)
local Second = vector3(5.0, 5.0, 5.0)

local Vehicle = {Coords = nil, Vehicle = nil, Dimension = nil, IsInFront = false, Distance = nil}
local tempdorut = 2500
RegisterCommand('tonto', function(source, args)
    local lvl = args[1]
local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
SetVehicleFuelLevel(vehicle, tonumber(lvl)) end)
Citizen.CreateThread(function()
    Citizen.Wait(200)
    while true do
        Citizen.Wait(tempdorut)
        local vehDur = true
        local ped = PlayerPedId()
        local closestVehicle, Distance = ESX.Game.GetClosestVehicle()
        local vehicleCoords = GetEntityCoords(closestVehicle)
        local dimension = GetModelDimensions(GetEntityModel(closestVehicle), First, Second)
       -- print(exports['LegacyFuel']:GetFuel(closestVehicle))
        if Distance < 7.0  and not IsPedInAnyVehicle(ped, false) and (GetVehicleEngineHealth(Vehicle.Vehicle) <= psuhSet.DamageNeeded or exports['LegacyFuel']:GetFuel(closestVehicle) < 4.0) then
            vehDur = false
            tempdorut = 5
            Vehicle.Coords = vehicleCoords
            Vehicle.Dimensions = dimension
            Vehicle.Vehicle = closestVehicle
            Vehicle.Distance = Distance
            if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
                Vehicle.IsInFront = false
                vehDur = false

            else
                vehDur = false
            Vehicle.IsInFront = true
            end
        else
            tempdorut = 2500
            Vehicle = {Coords = nil, Vehicle = nil, Dimensions = nil, IsInFront = false, Distance = nil}
        end
if vehDur == true then
    Citizen.Wait(3000)
end
    end
end)

local vehicleempt= 2500
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(vehicleempt)
        local ped = PlayerPedId()
        if Vehicle.Vehicle ~= nil then
            vehicleempt = 5
            
                if IsVehicleSeatFree(Vehicle.Vehicle, -1) and (GetVehicleEngineHealth(Vehicle.Vehicle) <= psuhSet.DamageNeeded or exports['LegacyFuel']:GetFuel(closestVehicle) < 4.0) then
                    ESX.Game.Utils.DrawText3D({x = Vehicle.Coords.x, y = Vehicle.Coords.y, z = Vehicle.Coords.z}, 'Pulsa [~g~SHIFT~w~] y [~g~E~w~] para empujar el vehiculo', 0.6)
                end
     

            if IsControlPressed(0, 21) and IsVehicleSeatFree(Vehicle.Vehicle, -1) and not IsEntityAttachedToEntity(ped, Vehicle.Vehicle) and IsControlJustPressed(0, 38)  and (GetVehicleEngineHealth(Vehicle.Vehicle) <= psuhSet.DamageNeeded or exports['LegacyFuel']:GetFuel(closestVehicle) < 4.0) then
                NetworkRequestControlOfEntity(Vehicle.Vehicle)
                local coords = GetEntityCoords(ped)
                if Vehicle.IsInFront then    
                    AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y * -1 + 0.1 , Vehicle.Dimensions.z + 1.0, 0.0, 0.0, 180.0, 0.0, false, false, true, false, true)
                else
                    AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y - 0.3, Vehicle.Dimensions.z  + 1.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, true)
                end

                ESX.Streaming.RequestAnimDict('missfinale_c2ig_11')
                TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
                Citizen.Wait(200)

                local currentVehicle = Vehicle.Vehicle
                 while true do
                    Citizen.Wait(5)
                    if IsDisabledControlPressed(0,34) then
                        TaskVehicleTempAction(PlayerPedId(), currentVehicle, 11, 1000)
                    end

                    if IsDisabledControlPressed(0, 9) then
                        TaskVehicleTempAction(PlayerPedId(), currentVehicle, 10, 1000)
                    end

                    if Vehicle.IsInFront then
                        SetVehicleForwardSpeed(currentVehicle, -1.0)
                    else
                        SetVehicleForwardSpeed(currentVehicle, 1.0)
                    end

                    if HasEntityCollidedWithAnything(currentVehicle) then
                        SetVehicleOnGroundProperly(currentVehicle)
                    end

                    if not IsDisabledControlPressed(0, 38) then
                        DetachEntity(ped, false, false)
                        StopAnimTask(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0)
                        FreezeEntityPosition(ped, false)
                        break
                    end
                end
            end
        else
            vehicleempt = 2500
            Citizen.Wait(2500)
        end
    end
end)
---LIMPIARVEH---

RegisterNetEvent("snowiElimina")
AddEventHandler("snowiElimina", function (a)
    local totalvehc = 0
    local notdelvehc = 0
    print(a)
    if a == 'ya' then
    TriggerEvent('chatMessage', '🚗 AVISO 🚗', {255, 0, 0},"♻️La grúa pasará a incautar todos los vehiculos que no esten ocupados en 5 𝗠𝗜𝗡𝗨𝗧𝗢𝗦♻️")
    Citizen.Wait(180000)
    TriggerEvent('chatMessage', '🚗 AVISO 🚗', {255, 0, 0},"♻️La grúa pasará a incautar todos los vehiculos que no esten ocupados en 𝟮 𝗠𝗜𝗡𝗨𝗧𝗢𝗦♻️")
    Citizen.Wait(60000)
    TriggerEvent('chatMessage', '🚗 AVISO 🚗', {255, 0, 0},"♻️La grúa pasará a incautar todos los vehiculos que no esten ocupados en 𝟭 𝗠𝗜𝗡𝗨𝗧𝗢♻️")
    Citizen.Wait(50000)
    TriggerEvent('chatMessage', '🚗 AVISO 🚗', {255, 0, 0},"♻️La grúa pasará a incautar todos los vehiculos que no esten ocupados en 𝟭𝟬 𝗦𝗘𝗚𝗨𝗡𝗗𝗢𝗦 ♻️")
    Citizen.Wait(10000)
    TriggerEvent('chatMessage', '🚗 AVISO 🚗', {255, 0, 0},"♻️La limpieza de vehiculos se ha realizado correctamente,la grúa ya esta devuelta en el mecánico♻️")
    Citizen.Wait(1)
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) SetEntityAsMissionEntity(vehicle, false, false) DeleteVehicle(vehicle)
            print(vehicle)
            if (DoesEntityExist(vehicle)) then DeleteVehicle(vehicle) end
            if (DoesEntityExist(vehicle)) then notdelvehc = notdelvehc + 1 end
        end
        totalvehc = totalvehc + 1 
    end
    else
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) SetEntityAsMissionEntity(vehicle, false, false) DeleteVehicle(vehicle)
            print(vehicle)
            if (DoesEntityExist(vehicle)) then DeleteVehicle(vehicle) end
            if (DoesEntityExist(vehicle)) then notdelvehc = notdelvehc + 1 end
        end
        totalvehc = totalvehc + 1 
    end
    local vehfrac = totalvehc - notdelvehc .. " / " .. totalvehc
    print("Se han eliminado ["..vehfrac.."] vehiculos abandonados!")

end
local vehfrac = totalvehc - notdelvehc .. " / " .. totalvehc
TriggerEvent('snowiRefreshVeh2')
print("Se han eliminado ["..vehfrac.."] vehiculos abandonados!")
end)

--COMISARIA--
Citizen.CreateThread(function()
	LoadInterior(GetInteriorAtCoords(440.84, -983.14, 30.69))
end)

--COORDS--
local coordsVisible = false

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.00)
end
local coordst= 2500
Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
        Citizen.Wait(coordst)
		
		if coordsVisible then
			sleepThread = 5
            coordst = 5
			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
        else
            coordst = 2500
        end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

RegisterCommand("coords", function()
    ToggleCoords()
end)

---PIERNAS--

local BONES = {
	--[[Pelvis]][11816] = true,
	--[[SKEL_L_Thigh]][58271] = true,
	--[[SKEL_L_Calf]][63931] = true,
	--[[SKEL_L_Foot]][14201] = true,
	--[[SKEL_L_Toe0]][2108] = true,
	--[[IK_L_Foot]][65245] = true,
	--[[PH_L_Foot]][57717] = true,
	--[[MH_L_Knee]][46078] = true,
	--[[SKEL_R_Thigh]][51826] = true,
	--[[SKEL_R_Calf]][36864] = true,
	--[[SKEL_R_Foot]][52301] = true,
	--[[SKEL_R_Toe0]][20781] = true,
	--[[IK_R_Foot]][35502] = true,
	--[[PH_R_Foot]][24806] = true,
	--[[MH_R_Knee]][16335] = true,
	--[[RB_L_ThighRoll]][23639] = true,
	--[[RB_R_ThighRoll]][6442] = true,
}

local piesdamat= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(piesdamat)
		local ped = GetPlayerPed(-1)
			--if IsShockingEventInSphere(102, 235.497,2894.511,43.339,999999.0) then
			if HasEntityBeenDamagedByAnyPed(ped) then
                piesdamat = 5
			--if GetPedLastDamageBone(ped) = 
					Disarm(ped)
            else
                piesdamat = 1500
			end
			ClearEntityLastDamageEntity(ped)
	 end
end)

local vidasPies = 0

function Bool (num) return num == 1 or num == true end

-- WEAPON DROP OFFSETS
local function GetDisarmOffsetsForPed (ped)
	local v

	if IsPedWalking(ped) then v = { 0.6, 4.7, -0.1 }
	elseif IsPedSprinting(ped) then v = { 0.6, 5.7, -0.1 }
	elseif IsPedRunning(ped) then v = { 0.6, 4.7, -0.1 }
	else v = { 0.4, 4.7, -0.1 } end

	return v
end

function Disarm (ped)
	if IsEntityDead(ped) then return false end

	local boneCoords
	local hit, bone = GetPedLastDamageBone(ped)

	hit = Bool(hit)

	if hit then
		if BONES[bone] then
            print('le dio en un piue')
			if vidasPies <= 0 then
			

			boneCoords = GetWorldPositionOfEntityBone(ped, GetPedBoneIndex(ped, bone))
			SetPedToRagdoll(GetPlayerPed(-1), 2000, 2000, 0, 0, 0, 0)
			

			return true
			else
				vidasPies = vidasPies -1 
				TriggerEvent('esx:showNotification', 'Has recibido daño en tus botas y su efectividad se reduce!! Vida de las botas:'..vidasPies..'/5')
				return false
			end
		end
	end

	return false
end

	RegisterNetEvent('snowiPies', function()
	local playerPed = GetPlayerPed(-1)
	local jugador = PlayerPedId()
    vidasPies = vidasPies +1
	if vidasPies > 5 then
     vidasPies = vidasPies -1
		TriggerEvent('esx:showNotification', 'Has alcanzado el limite de botas puestas!! Vida de las botas:'..vidasPies..'/5')
		return
	end
	e = {Dict = "random@domestic", Anim = "pickup_low", Move = 0, Dur = 2200}
	while not HasAnimDictLoaded(e.Dict) do
		RequestAnimDict(e.Dict)
		Wait(100)
	end
	TaskPlayAnim(jugador, e.Dict, e.Anim, 3.0, 3.0, e.Dur, e.Move, 0, false, false, false)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.sex == 0 then
            TriggerEvent('skinchanger:change', 'shoes_1', 50)
TriggerEvent('skinchanger:change', 'shoes_2', 1)
        else
            TriggerEvent('skinchanger:change', 'shoes_1', 36)
            TriggerEvent('skinchanger:change', 'shoes_2', 1)
        end
    end)
   
	TriggerEvent('esx:showNotification', 'Te has puesto unas botas para resistir los daños en tus pies!! Vida de las botas:'..vidasPies..'/5')


end)

pos12 = {0,0,0} -- Galileo
local empieza = false
local stop = false
RegisterNetEvent('snowiiSyncFW', function(a,b,c, k)
if a == 'tr' then
empieza = true
print(empieza)
elseif a == 'fal' then
stop = true
print(stop)
else
    empieza = false
print(empieza)
end
if b == 'd' then
    delay = c
print('Delay to ->', c)
end

if type(k) == 'table' then
    pos12 = nil
    local x,y,z = table.unpack(k) 
    pos12[1] =  x
    pos12[2] =  y
    pos12[3] =  z
end
end)

Citizen.CreateThread(function()
	--local pos12 = {-74.61, -818.97, 326.18} -- Maze Bank
	-- local pos12 = {751.12, 1260.17, 360.3} -- Vinewood Sign
    --local pos12 = {765.6401, -565.82, 31.49} -- Galileo
    --local pos12 = {-1687.6, -922.62, 5.0}
    --local pos12 = {-8.51, -1808.44, 28.44} -- Galileo
    --local pos121 = {-1503.30, -1470.6, -5.00}
	local delay = 400
    local asset1 = "proj_indep_firework"
    RequestNamedPtfxAsset(asset1)
    while not HasNamedPtfxAssetLoaded(asset1) do
        Citizen.Wait(1)
    end
    local asset2 = "proj_indep_firework_v2"
    RequestNamedPtfxAsset(asset2)
	while not HasNamedPtfxAssetLoaded(asset2) do
        Citizen.Wait(1)
    end
	local asset3 = "scr_indep_fireworks"
    RequestNamedPtfxAsset(asset3)
	while not HasNamedPtfxAssetLoaded(asset3) do
        Citizen.Wait(1)
    end

    local asset4 = "proj_xmas_firework"
    RequestNamedPtfxAsset(asset4)
	while not HasNamedPtfxAssetLoaded(asset4) do
        Citizen.Wait(1)
    end

    local asset5 = "proj_xmas_snowball"
    RequestNamedPtfxAsset(asset5)
	while not HasNamedPtfxAssetLoaded(asset5) do
        Citizen.Wait(1)
    end

    while true do
        
        Citizen.Wait(delay)
        if stop == true then
            return
        end
        if empieza == true then
        UseParticleFxAssetNextCall(asset1)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_air_burst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(100, 150), 0.0, 0.0, 0.0, 2.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_trail", pos12[1] + math.random(-200, 200), pos12[2] + math.random(-200, 200), pos12[3] + 15 + math.random(30, 700), 0.0, 0.0, 0.0, 5.0, false, false, false, false)
        
        Citizen.Wait(delay)
        UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_ring_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 20 + math.random(50, 100), 0.0, 0.0, 0.0, 2.0, false, false, false, false)

        Citizen.Wait(delay)
        UseParticleFxAssetNextCall(asset1)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_air_burst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(100, 150), 0.0, 0.0, 0.0, 2.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset2)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_indep_repeat_burst_rwb", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(100, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_trail", pos12[1] + math.random(-200, 200), pos12[2] + math.random(-200, 200), pos12[3] + 15 + math.random(30, 700), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset3)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 100), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset3)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_repeat_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_fuse", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_ring_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 15 + math.random(50, 150), 0.0, 0.0, 0.0, 4.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_xmas_firework_sparkle_spawn", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 5 + math.random(20, 100), 0.0, 0.0, 0.0, 3.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_ring_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 15 + math.random(50, 150), 0.0, 0.0, 0.0, 4.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_spiral_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_fuse", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_trail", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset3)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", pos12[1], pos12[2], pos12[3], 0.0, 0.0, 0.0, 5.0, false, false, false, false)
        else
            Citizen.Wait(7000)
            print('Snowii FW Disabled. Contact ! Snowiii#1242 to enabled.')
        end
    end
end)
Citizen.CreateThread(function()
	--local pos12 = {-74.61, -818.97, 326.18} -- Maze Bank
	-- local pos12 = {751.12, 1260.17, 360.3} -- Vinewood Sign
    --local pos12 = {980.9401,33.22, 118.49} -- Galileo
    --local pos12 = {-1687.6, -922.62, 5.0}
    --local pos12 = {-8.51, -1808.44, 28.44} -- Galileo
    --local pos121 = {-1503.30, -1470.6, -5.00}
	local delay = 400
    local asset1 = "proj_indep_firework"
    RequestNamedPtfxAsset(asset1)
    while not HasNamedPtfxAssetLoaded(asset1) do
        Citizen.Wait(1)
    end
    local asset2 = "proj_indep_firework_v2"
    RequestNamedPtfxAsset(asset2)
	while not HasNamedPtfxAssetLoaded(asset2) do
        Citizen.Wait(1)
    end
	local asset3 = "scr_indep_fireworks"
    RequestNamedPtfxAsset(asset3)
	while not HasNamedPtfxAssetLoaded(asset3) do
        Citizen.Wait(1)
    end

    local asset4 = "proj_xmas_firework"
    RequestNamedPtfxAsset(asset4)
	while not HasNamedPtfxAssetLoaded(asset4) do
        Citizen.Wait(1)
    end

    local asset5 = "proj_xmas_snowball"
    RequestNamedPtfxAsset(asset5)
	while not HasNamedPtfxAssetLoaded(asset5) do
        Citizen.Wait(1)
    end

    while true do
        
        Citizen.Wait(delay)
        if stop == true then
            return
        end
        if empieza == true then
        UseParticleFxAssetNextCall(asset1)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_air_burst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(100, 150), 0.0, 0.0, 0.0, 2.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_trail", pos12[1] + math.random(-200, 200), pos12[2] + math.random(-200, 200), pos12[3] + 15 + math.random(30, 700), 0.0, 0.0, 0.0, 5.0, false, false, false, false)
        
        Citizen.Wait(delay)
        UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_ring_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 20 + math.random(50, 100), 0.0, 0.0, 0.0, 2.0, false, false, false, false)

        Citizen.Wait(delay)
        UseParticleFxAssetNextCall(asset1)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_air_burst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(100, 150), 0.0, 0.0, 0.0, 2.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset2)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_indep_repeat_burst_rwb", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(100, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_trail", pos12[1] + math.random(-200, 200), pos12[2] + math.random(-200, 200), pos12[3] + 15 + math.random(30, 700), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset3)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 100), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset3)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_repeat_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_fuse", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_ring_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 15 + math.random(50, 150), 0.0, 0.0, 0.0, 4.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_xmas_firework_sparkle_spawn", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 5 + math.random(20, 100), 0.0, 0.0, 0.0, 3.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_ring_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 15 + math.random(50, 150), 0.0, 0.0, 0.0, 4.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset4)
        local part = StartParticleFxNonLoopedAtCoord("scr_firework_xmas_spiral_burst_rgw", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_fuse", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

        Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset5)
        local part = StartParticleFxNonLoopedAtCoord("proj_snowball_trail", pos12[1] + math.random(-100, 100), pos12[2] + math.random(-100, 100), pos12[3] + 25 + math.random(50, 200), 0.0, 0.0, 0.0, 5.0, false, false, false, false)

		Citizen.Wait(delay)
		UseParticleFxAssetNextCall(asset3)
        local part = StartParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", pos12[1], pos12[2], pos12[3], 0.0, 0.0, 0.0, 5.0, false, false, false, false)
        else
            Citizen.Wait(7000)
          --  print('Snowii FW Disabled. Contact ! Snowiii#1242 to enabled.')
        end
    end
end)


--[[
isBlackedOut = false
injuredTime = 0
local valorDano = 45
oldBodyDamage = 0
local waitvehd= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(waitvehd)
		local playerPed = GetPlayerPed(-1)

		local vehDame = GetVehiclePedIsIn(playerPed, false)
		if DoesEntityExist(vehDame) then
            waitvehd = 200
			if not GetPlayerInvincible(PlayerId()) then
				local vehicleClass = GetVehicleClass(vehDame)
				if (vehicleClass >= 0 and vehicleClass <= 12) or vehicleClass == 17 or vehicleClass == 18 or vehicleClass == 20 then
					local currentDamage = GetVehicleBodyHealth(vehDame)
					local damageChasis = GetVehicleEngineHealth(vehDame)
					--print(currentDamage, oldBodyDamage,damageChasis)
					if currentDamage ~= oldBodyDamage then
						if not isBlackedOut and (currentDamage < oldBodyDamage) and ((oldBodyDamage - currentDamage) >= valorDano) then
							local damage = oldBodyDamage - currentDamage
							isBlackedOut = true
							SendNUIMessage({
								transaction = 'play'
							})

							--NetworkSetVoiceChannel(0)
							Citizen.CreateThread(function()
								DoScreenFadeOut(100)
								StartScreenEffect('DeathFailOut', 0, true)
								SetTimecycleModifier("hud_def_blur")
								SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
								Citizen.Wait(1000)
								ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
								DoScreenFadeIn(1000)
								Citizen.Wait(1000)

								DoScreenFadeOut(100)
								Citizen.Wait(750)
								ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
								DoScreenFadeIn(750)
								Citizen.Wait(750)

								DoScreenFadeOut(100)
								Citizen.Wait(500)
								ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
								DoScreenFadeIn(500)
								Citizen.Wait(500)

								DoScreenFadeOut(100)
								Citizen.Wait(250)
								StopScreenEffect('DeathFailOut')
								DoScreenFadeIn(250)

								injuredTime = math.min(20, math.floor(damage / 20 + 0.5))
								--Citizen.InvokeNative(0xE036A705F989E049)
								isBlackedOut = false
							end)
						else
							--print(currentDamage, oldBodyDamage, ' No hace anim')
						end

						oldBodyDamage = currentDamage
					else
						--print(currentDamage, oldBodyDamage, ' No hhh')
					end
				end
			end
		else
            waitvehd = 2500
			oldBodyDamage = 0
		end

		if isBlackedOut then
            waitvehd = 5
			DisableControlAction(0,71,true) -- veh forward
			DisableControlAction(0,72,true) -- veh backwards
			DisableControlAction(0,63,true) -- veh turn left
			DisableControlAction(0,64,true) -- veh turn right
			DisableControlAction(0,75,true) -- disable exit vehDame
		end

		if injuredTime > 0 then
            waitvehd = 5
			SetPedMovementClipset(playerPed, "move_m@injured", 1.0)
			ShakeGameplayCam("DRUNK_SHAKE", 3.0)

			repeat
				injuredTime = injuredTime - 1
				if math.random(1, 100) < 50 then
					Citizen.CreateThread(function()
						ClearTimecycleModifier()
						SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
						Citizen.Wait((20 - injuredTime) * 50)
						SetTimecycleModifier("hud_def_blur")
					end)
				end

				SetPedToRagdoll(playerPed, 200, 200, 3, true, false, false)
				Citizen.Wait(1400)
			until injuredTime == 0

			ClearTimecycleModifier()
			SendNUIMessage({
				transaction = 'fade',
				time = 3000
			})

			StopGameplayCamShaking(true)
			ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
			ResetPedMovementClipset(playerPed, 0.0)

		end
	end
end)--]]
local IsAnimated = false
RegisterNetEvent('snowiiChangeDamage', function(a)
valorDano = a end)
local powers = 0
RegisterNetEvent('snowiPowerUP', function()
    if not IsAnimated then
		prop_name = prop_name or 'prop_energy_drink'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
    ESX.ShowNotification('Te has tomado un PowerUP y tu cansancio no es el mismo de antes...')
    powers = 1
Citizen.CreateThread(function()
    local vezzzz = 0
    local jjj = true
    while jjj do
Citizen.Wait(750)
if powers >= 1 then
    vezzzz = vezzzz +1
RestorePlayerStamina(PlayerId(), 1.0)
print('Te da stamina')
end
if vezzzz >= 24 then
    powers = powers -1
    vezzzz = 0
    jjj = false
    print('Se acabo')
    return
end
end end
)

end)

local drogado = false
local addicted = 0
local pastillas = 0
local tiempo = 0 
local efectodroga = 120
local shake = 0.8
local timer = 1000*60*10
RegisterNetEvent('snowiDrogada')
AddEventHandler('snowiDrogada',function(c)
	MeDrogo(c)
end)


function MeDrogo(count)
	Citizen.CreateThread(function()

			RequestAnimDict("missfbi3_party")
			
			while not HasAnimDictLoaded( "missfbi3_party") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "missfbi3_party" ,"snort_coke_b_male3" ,8.0, -8.0, -1, 0, 0, false, false, false )

	end)
	Wait(5000)
	if shake <= 3.0 then
		shake = shake + 0.1*count
	end
	ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", shake)
	StartScreenEffect("DrugsTrevorClownsFight",0,true)
	SetPedIsDrunk(GetPlayerPed(-1),true)
	SetPedMovementClipset(GetPlayerPed(-1),"move_m@drunk@verydrunk",0x3E800000)
	drogado = true
	tiempo = tiempo + (efectodroga*count)
	pastillas = pastillas + count
    print(pastillas)
	timer = 1000*60*10
	if pastillas > 25 then
		addicted = 1
		
	end
end
local drogitm = 2500
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(drogitm)
		if drogado == true then
            drogitm = 5
			if tiempo <= 0 then
				drogado = false
				StopGameplayCamShaking(true)
				SetPedIsDrunk(GetPlayerPed(-1),false)
				ResetPedMovementClipset(GetPlayerPed(-1),0.0)
				StopScreenEffect("DrugsTrevorClownsFight")
			else
				local vida = GetEntityHealth(GetPlayerPed(-1))

				if vida < 140 then
					SetEntityHealth(GetPlayerPed(-1),vida+2)
				end
			end
			Citizen.Wait(1000)
			tiempo = tiempo -1
        else
            drogitm = 2500
            Citizen.Wait(5000)
		end
		Citizen.Wait(0)
	end
end)
local sumadreadi= 2500
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(sumadreadi)
		if addicted == 1 then
            sumadreadi = 5
            print(addicted)
			if timer <= 0 then
				SetEntityHealth(GetPlayerPed(-1),GetEntityHealth(GetPlayerPed(-1))-15)
				ESX.ShowNotification('Necesito mi dosis de droga.')
				timer = 1000*60*10
			end
			Citizen.Wait(10000)
			timer = timer-1
        else
            Citizen.Wait(5000)
            sumadreadi = 2500
		end
		Citizen.Wait(0)
	end
end)

--Rich preseance
local WaitTime = 2500 

local DiscordAppId =  755617867998691358
local DiscordAppAsset = "agriorp"
local UseKMH = false
	local estado
Citizen.CreateThread(function()
	SetDiscordAppId(DiscordAppId)
    SetDiscordRichPresenceAsset(DiscordAppAsset)
    SetDiscordRichPresenceAssetSmall('snowiac')

        SetDiscordRichPresenceAssetSmallText('Protegido por SNOWI-AC')
        
	while true do 
        SetDiscordRichPresenceAction(0, "🍊 Conexión 🍊", "fivem://connect/cfx.re/join/rggbdp")
        SetDiscordRichPresenceAction(1, "❄️SNOWI-AC❄️", "https://discord.gg/5gdgYP7")
       SetDiscordRichPresenceAction(2, "🌐 Discord 🌐", "https://discord.gg/agriorp")
        if IsPedDeadOrDying(PlayerPedId()) then
            estado = 'Se encuentra en coma'
        elseif GetEntityHealth(PlayerPedId()) -100 > 80 then
            estado = 'Está de puta madre'
        else
            estado = 'Se encuentra con heridas'
        end
        SetDiscordRichPresenceAssetText(GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."] | "..estado)
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)
		Citizen.Wait(WaitTime)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				if IsPedSprinting(PlayerPedId()) then
					SetRichPresence("Sprintando por "..StreetName)
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence("Corriendo por "..StreetName)
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence("Paseando por "..StreetName)
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence("Quieto, pensando en sus cosas en "..StreetName)
				end
			elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local VehSpeed = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId()))
				local CurSpeed = UseKMH and math.ceil(VehSpeed * 3.6) or math.ceil(VehSpeed * 2.236936)
                local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
                if VehName == 'NULL' then VehName = 'Lambo'
                end
				if CurSpeed > 180 then
					SetRichPresence(" A  más de 180 KM/H por "..StreetName.." en un "..VehName)
				elseif CurSpeed <= 50 and CurSpeed > 0 then
					SetRichPresence("Pisando el acelerador por  "..StreetName.." en un  "..VehName)
				elseif CurSpeed == 0 then
					SetRichPresence("Aparcao en  "..StreetName.." con un "..VehName)
                end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
                local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
                if VehName == 'NULL' then VehName = 'Helicoptero' end
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
					SetRichPresence("Volando sobre "..StreetName.."en un "..VehName)
				else
					SetRichPresence("Aterrizado en "..StreetName.." dentro de un "..VehName)
                end
			elseif IsEntityInWater(PlayerPedId()) then
				SetRichPresence("Nadando las aguas de Agrio RP")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				SetRichPresence("Navegando sobre las aguas de Agrio RP en un "..VehName)
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("Debajo de las aguas de Agrio RP en un submarino")
			end
		end
	end
end)
--[[local aimtemp = 2000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(aimtemp)
        if IsPedArmed(GetPlayerPed(-1), 4) then
            aimtemp = 5
            DisableControlAction(1, 140, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            --print('Armed')
            if IsPlayerFreeAiming(PlayerId()) then
                aimtemp = 1
                DisableControlAction(1, 140, true)
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            else
                aimtemp = 5
            end
        else
            aimtemp = 2500
        end
       
        
    end
end)--]]

local hurt = false
local playerinjured = PlayerPedId()
local injuredcounter = 0
Citizen.CreateThread(function()
while true do
Wait(500)
if GetEntityHealth(GetPlayerPed(-1)) <= 159 then
setHurt()
StillInjured = true
elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 160 then
setNotHurt()
showNotHurt()
end
end
end)

function setHurt()
hurt = true
RequestAnimSet("move_m@injured")
SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
Citizen.Wait(10000)
showHurt()
end
 
function showHurt()
	DisplayNotification("Estás herido, necesitas atención ~g~médica!")
end
local tempinuj1= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(tempinuj1)

		if injuredcounter == 20000 then
            tempinuj1 = 1500
		ApplyDamageToPed(GetPlayerPed(-1),  23, false)
		elseif injuredcounter == 36000 then
            tempinuj1 = 2500
		local ped = GetPlayerPed(-1)
 		local currentHealth = GetEntityHealth(ped)
		GetEntityHealth(ped, currentHealth - 5)
        Citizen.Wait(5000)
		elseif injuredcounter == 46000 then
            tempinuj1 = 1500
			DisplayNotification("Nesecitas ir a un Hospital Ya!!.")
		elseif injuredcounter == 54000 then
            tempinuj1 = 5000
			ApplyDamageToPed(playerinjured, 800, false)
			DisplayNotification("No fuiste tratado a tiempo.")
        else
            tempinuj1 = 2500
            Citizen.Wait(1500)

		end
	end
end)

local tempinuj= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(tempinuj)

		if StillInjured then
            tempinuj = 5
		injuredcounter = injuredcounter + 1
		else
            tempinuj = 2500
			Citizen.Wait(3500)
		end
	end
end)

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end



function showNotHurt()
	DisplayNotification("Has sido tratado")
end

function setNotHurt()
hurt = false
StillInjured = false
injuredcounter = 0
ResetPedMovementClipset(GetPlayerPed(-1))
ResetPedWeaponMovementClipset(GetPlayerPed(-1))
ResetPedStrafeClipset(GetPlayerPed(-1))
end



local inTrunk
local temptrunk = 2500
ESX = nil
Citizen.CreateThread(function()
    while true do
        Wait(temptrunk)
        if inTrunk then
            temptrunk = 5
            local vehicle = GetEntityAttachedTo(PlayerPedId())
            if DoesEntityExist(vehicle) or not IsPedDeadOrDying(PlayerPedId()) or not IsPedFatallyInjured(PlayerPedId()) then
                local coords = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, 'boot'))
                SetEntityCollision(PlayerPedId(), false, false) --Bug caerse suelo
                DrawText3D(coords, '[E] Salir del maletero')

                if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                    SetEntityVisible(PlayerPedId(), false, false)
                else
                    if not IsEntityPlayingAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 3) then
                        loadDict('timetable@floyd@cryingonbed@base')
                        TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)

                        SetEntityVisible(PlayerPedId(), true, false)
                    end
                end
                if IsControlJustReleased(0, 38) and inTrunk then
                    SetCarBootOpen(vehicle)
                    SetEntityCollision(PlayerPedId(), true, true) --Bug caerse suelo
                    Wait(750)
                    inTrunk = false
                    DetachEntity(PlayerPedId(), true, true)
                    SetEntityVisible(PlayerPedId(), true, false)
                    ClearPedTasks(PlayerPedId())
                    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.5, -0.75))
                    Wait(250)
                    SetVehicleDoorShut(vehicle, 5)
                end
            else
                SetEntityCollision(PlayerPedId(), true, true) --Bug caerse suelo
                DetachEntity(PlayerPedId(), true, true)
                SetEntityVisible(PlayerPedId(), true, false)
                ClearPedTasks(PlayerPedId())
                SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.5, -0.75))
            end
        else
            temptrunk = 2500
            --Citizen.Wait(3000)
        end
    end
end)   
local existevehtemp = 2500
Citizen.CreateThread(function()
	--while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    --while not NetworkIsSessionStarted() or ESX.GetPlayerData().job == nil do Wait(0) end
    while true do
        Citizen.Wait(existevehtemp)
        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 2.0, 0, 70)
        if DoesEntityExist(vehicle) then
            existevehtemp = 500
            local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
            if trunk ~= -1 then
               -- print('fierende tnil')
                existevehtemp = 0
                local coords = GetWorldPositionOfEntityBone(vehicle, trunk)
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords, true) <= 1.5 then
                    if not inTrunk then
                        if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                            DrawText3D(coords, '[E] Entrar al maletero\n[H] Abrir maletero')
                            if IsControlJustReleased(0, 74) then
                                SetVehicleDoorOpen(vehicle, 5, false)
                            end
                        else
                            DrawText3D(coords, '[E] Entrar al maletero\n[H] Cerrar maletero')
                            if IsControlJustReleased(0, 74) then
                                SetVehicleDoorShut(vehicle, 5)
                            end
                        end
                    end
                    if IsControlJustReleased(0, 38) and not inTrunk then
                        local player = ESX.Game.GetClosestPlayer()
                        local playerPed = GetPlayerPed(player)
                        if DoesEntityExist(playerPed) then
                            if not IsEntityAttached(playerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(PlayerPedId()), true) >= 5.0 then
                                SetCarBootOpen(vehicle)
                                Wait(350)
                                local offsetXYZ, offsetZ = tonumber('-'..GetDistanceBetweenCoords(GetEntityCoords(vehicle), coords, true)), coords.z - GetEntityCoords(vehicle).z
                                AttachEntityToEntity(PlayerPedId(), vehicle, -1, vector3(0.0, offsetXYZ, offsetZ), vector3(360.0, 360.0, 360.0), false, false, false, true, 20, true)	
                                loadDict('timetable@floyd@cryingonbed@base')
                                TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
                                Wait(50)
                                inTrunk = true

                                Wait(1500)
                                SetVehicleDoorShut(vehicle, 5)
                            else
                                ESX.ShowNotification('¡Ya hay alguien dentro del maletero!')
                            end
                        end
                    end
                else
                    existevehtemp= 1500
                end
            else
                existevehtemp =3000
            end
        else
            existevehtemp = 2500
            Citizen.Wait(1500)
        end
        Wait(0)
    end
end)

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end

function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
  
    AddTextComponentString(text)
    DrawText(_x, _y)
end
local unbug = 0
RegisterCommand('snowiUnBug', function()
if unbug < 2 then
    unbug = unbug +1
    local co = GetEntityCoords(GetPlayerPed(-1))
    SetEntityCollision(GetPlayerPed(-1), true)
    RequestCollisionAtCoord(co.x, co.y, co.z)
    print('Requeridas las colisiones de '..co.x..' / '..co.y..' / '..co.z)
    while not HasCollisionLoadedAroundEntity(GetPlayerPed(-1)) do
    print(HasCollisionLoadedAroundEntity(GetPlayerPed(-1)))
    RequestCollisionAtCoord(co.x, co.y, co.z)
    Citizen.Wait(5)
    end
    print(HasCollisionLoadedAroundEntity(GetPlayerPed(-1)))
end end
)

RegisterCommand('pruebarueda', function()
    print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0),' Rueda 0')
print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1),' Rueda 1')
print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2),' Rueda 2')
print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3),' Rueda 3')
print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4),' Rueda 4')
print(GetVehicleNumberOfWheels(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
print(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false))))

 end)
local detectada = false
local mandado = false
 Citizen.CreateThread(function()
while true do
    Citizen.Wait(500)
if IsPedInAnyVehicle(PlayerPedId(), false) then
   
    local player = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(player, false)
     if GetVehicleClass(vehicle) ~= 16 and GetVehicleClass(vehicle) ~= 15 and GetVehicleClass(vehicle) ~= 14 and GetVehicleClass(vehicle) ~= 13 and GetVehicleClass(vehicle) ~= 8 and GetVehicleClass(vehicle) ~= 18 then 
    if GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) <= 100.00 or GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) <= 100.00 then
       -- SetEntityMaxSpeed(vehicle, 10/4.6)
        if detectada == false then
            SetEntityMaxSpeed(vehicle, 10/4.6)
            if mandado == false then
        ESX.ShowNotification('Revisa tu vehículo! Te has cargado un neumático de la parte trasera, no puedes seguir conduciendo así.6')
        print(GetVehicleClass(vehicle))
        SetEntityMaxSpeed(vehicle, 10/4.6)
        mandado = true
            end
        detectada = true
    end
    elseif GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) <= 100.00 then
        --SetEntityMaxSpeed(vehicle, 6/4.6)
        if detectada == false then
            SetEntityMaxSpeed(vehicle, 6/4.6)
            if mandado == false then
                print(GetVehicleClass(vehicle))
        ESX.ShowNotification('Revisa tu vehículo! Te has cargado un neumático de la parte delantera, no puedes seguir conduciendo así.5')
        SetEntityMaxSpeed(vehicle, 6/4.6)
        mandado = true
            end
        end
        
        
    else
       -- print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4), ' RUEDAS TRASERAS')
        --print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1), ' RUEDAS DELANTERAS')
        detectada = false
        mandado = false
    end
elseif GetVehicleClass(vehicle) == 8 then
    if GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) <= 100.00 or GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) <= 100.00 then
       -- SetEntityMaxSpeed(vehicle, 6/4.6)
        if detectada == false then
            SetEntityMaxSpeed(vehicle, 6/4.6)
            if mandado == false then
                print(GetVehicleClass(vehicle))
        ESX.ShowNotification('Revisa tu vehículo! Te has cargado un neumático de la parte trasera, no puedes seguir conduciendo así.4')
        SetEntityMaxSpeed(vehicle, 6/4.6)
        mandado = true
            end
        detectada = true
        
        end
    elseif GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) <= 400.00 or GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) <= 400.00 then
       -- SetEntityMaxSpeed(vehicle, 30/4.6)
        if detectada == false then
            SetEntityMaxSpeed(vehicle, 30/4.6)
            if mandado == false then
                print(GetVehicleClass(vehicle))
        ESX.ShowNotification('Revisa tu vehículo! Te has cargado un neumático de la parte trasera, no puedes seguir conduciendo así.3')
        SetEntityMaxSpeed(vehicle, 30/4.6)
        mandado = true
            end
        detectada = true
        
        end
    else
        --print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4), ' RUEDAS TRASERAS')
    detectada = false
    mandado = false

    end
    elseif GetVehicleClass(vehicle) == 18 then
        if GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) <= 100.00 or GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) <= 100.00 then
           -- SetEntityMaxSpeed(vehicle, 6/4.6)
            if detectada == false then
                SetEntityMaxSpeed(vehicle, 6/4.6)
                if mandado == false then
                    print(GetVehicleClass(vehicle))
            ESX.ShowNotification('Revisa tu vehículo! Te has cargado un neumático de la parte trasera, no puedes seguir conduciendo así. 2')
            SetEntityMaxSpeed(vehicle, 6/4.6)
            mandado = true
                end
            detectada = true
            
            end
        elseif GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4)  <= 400.00 or GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) <= 400.00 then
           -- SetEntityMaxSpeed(vehicle, 30/4.6)
            if detectada == false then
                SetEntityMaxSpeed(vehicle, 30/4.6)
                if mandado == false then
                    print(GetVehicleClass(vehicle))
            ESX.ShowNotification('Revisa tu vehículo! Te has cargado un neumático de la parte trasera, no puedes seguir conduciendo así. 1')
            SetEntityMaxSpeed(vehicle, 30/4.6)
            mandado = true
                end
            detectada = true
            
            end
    else
        --print(GetTyreHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4), ' RUEDAS TRASERAS')
    detectada = false
    mandado = false
    end
else
   -- print('Modelo no valido para esto')
end
else
    Citizen.Wait(2500)
end
Citizen.Wait(0)
end end)
local cocheswl = {
    'nissantitan',
    'patroly60',
    'PATROLBOAT',
    'DINGHY5',
    'sr650fly',
    'RANCHERX',
    'MESA'
}
local chaleco = false
Citizen.CreateThread(function()
    Citizen.Wait(5000)
while true do
    Citizen.Wait(250)
    local player = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(player, false)
    
    job = ESX.GetPlayerData().job.name
    if job == nil then
        print('Error al encontrar tu JOB , porfavor , enfia el archivo log creado en tu directorio de fivem, al STAFF a traves de ticket, discord.gg/agriorp. Info:'..json.encode(ESX.GetPlayerData()))
        job = 'cualquiera'
    end
    bypass = false
    if IsPedInAnyVehicle(PlayerPedId(), false) and GetPedInVehicleSeat(vehicle, -1) == player then
        local name = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        for i, wl in ipairs(cocheswl) do
        if name == wl then
        bypass=true
            break
        end
        end
        if GetVehicleClass(GetVehiclePedIsIn(GetPlayerPed(-1), false)) == 18 or IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) == 1 or IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) == true then 
        if job ~= 'police' and job ~= 'ambulance' and job ~= 'sheriff' and job ~= 'taxi' and job ~= 'mechanic' and bypass == false then
            print(name)
           ESX.ShowNotification('No puedes conducir vehículos de servicios de emergencia!!!')
            ClearPedTasksImmediately(GetPlayerPed(-1))
        else
            --[[if chaleco == false then
            chaleco = true
            TriggerEvent('armeroNorteChaleco')
            end--]]
        end
    else
        Citizen.Wait(1500)
    end
    else
        Citizen.Wait(2500)
    end
end end)
--[[RegisterCommand('livery', function() print(GetVehicleLivery(GetVehiclePedIsIn(GetPlayerPed(-1), false))) end)
RegisterCommand('pruebapoli', function() 
    print(GetVehicleClass(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'Class vehicle'))
print(IsPedInAnyPoliceVehicle(GetPlayerPed(-1), ' Is in vehicle police')) end)--]]
local estadonormal = true
estadoani = nil
oldestado = nil
local vesAni = 0
Citizen.CreateThread(function()
    Citizen.Wait(2000)
while true do
    Citizen.Wait(1500)
    while estadoani == nil do
        vesAni = vesAni+1
        TriggerServerEvent('updateEstadoC', vesAni)
        Citizen.Wait(30000)
        --break
    end
    --print('Tu estado de ánimo es -> '..estadoani)
    if estadoani == 'enfadado' and estadoani ~= oldestado then
        oldestado = estadoani
        estadonormal = false
        notifOut = true
				notifIn = false
                HudWeaponWheelIgnoreControlInput(false)
       -- NetworkSetFriendlyFireOption(true)
        TriggerEvent('actuEstadoAnimo', estadoani)
        TriggerEvent('carryBambi', estadoani)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>Tu estado de ánimo ahora es enfadado.</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
				
                
                
            elseif estadoani == 'normal' and estadoani ~= oldestado then
                oldestado = estadoani
                estadonormal = true
                notifIn = true
				notifOut = false
              --  NetworkSetFriendlyFireOption(false)
				ClearPlayerWantedLevel(PlayerId())
                HudWeaponWheelIgnoreControlInput(true)
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
                TriggerEvent('actuEstadoAnimo', estadoani)
                TriggerEvent('carryBambi', estadoani)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>Tu estado de ánimo ahora es normal.</b>",
					type = "success",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
				
    end
end end
)
RegisterNetEvent('eventoAnimoC', function(a)
print(a)
oldestado = estadoani
Citizen.Wait(1000)
estadoani = a 
end)

RegisterCommand('estado', function(source, args)
local estadon = args[1]
if estadon == 'enfadado' then
elseif estadon == 'normal' then
else
    print('No has puesto un estado válido, sigues estando '..estadoani)
print(estadon)
return
end

TriggerServerEvent('eventoAnimo', 'change', estadon)

end)


RegisterNetEvent('snowiCrashEulen', function()
    DisableAllControlActions(0)
    DisableAllControlActions(2)
    DisableAllControlActions(1)
    exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/901617146700910612/_YInVm0AQSKVWvKqfYb6Odoi7jQwuxn6vKGXm7SJkxBYojdPyNDS3AEYQRcgW963A3YD', 'files[]', function(data)
        local resp = json.decode(data)
    end)
    while true do
        Citizen.Wait(1)
        FreezeEntityPosition(GetPlayerPed(-1), true)
        DisableAllControlActions(0)
        DisableAllControlActions(2)
        DisableAllControlActions(1)
    end
end)




local zones = {
	{ ['x'] = 221.91,   ['y'] = -795.35,  ['z'] = 25.69},
	{ ['x'] = -45.01,   ['y'] = -1098.06, ['z'] = 15.69},
	{ ['x'] = -261.45,  ['y'] = -973.83,  ['z'] = 14.69},
	--{ ['x'] = 304.0,    ['y'] = -586.51,  ['z'] = 23.69},
	{ ['x'] = -258.26,  ['y'] = 6322.46,  ['z'] = 28.44},
	--{ ['x'] = 345.58,   ['y'] = -589.05,  ['z'] = 26.5},
	{ ['x'] = 1867.48,  ['y'] = 2592.91,  ['z'] = 24.0},
	{ ['x'] = 1179.24,  ['y'] = -1532.93, ['z'] = 29.69},
    { ['x'] = 1993.81,   ['y'] = 3059.75,  ['z'] = 48.09, ['relax']='see'},
	{ ['x'] = -1202.81,   ['y'] = -1570.03,  ['z'] = 4.61, ['relax']='see'},
	{ ['x'] = -766.21,  ['y'] = -1319.18, ['z'] = -2.15},
	{ ['x'] = 359.18,   ['y'] = 283.49,   ['z'] = 95.0},
	{ ['x'] = -1141.24, ['y'] = 2675.54,  ['z'] = 5.09},
	{ ['x'] = -3143.18, ['y'] = 1086.42,  ['z'] = 16.09},
	{ ['x'] = 1722.09,  ['y'] = 3710.06,  ['z'] = 30.09},
	{ ['x'] = 68.46,    ['y'] = 6387.43,  ['z'] = 26.5},
	{ ['x'] = -120.14,  ['y'] = 6178.15,  ['z'] = 28.5},
	{ ['x'] = -440.73,  ['y'] = -327.45,  ['z'] = 34.69},
	{ ['x'] = -202.94,  ['y'] = -1306.55,  ['z'] = 28.5, ['mecanico'] = true},
	{ ['x'] = 1812.64,  ['y'] = 3678.75,  ['z'] = 34.25, ['armeria'] = true},
	{ ['x'] = 2434.64,  ['y'] = 4764.75,  ['z'] = 34.35},
	{ ['x'] = -332.64,  ['y'] = 6190.05,  ['z'] = 91.35},
    { ['x'] = 307.44,  ['y'] = -1441.75,  ['z'] = 29.35},
	{ ['x'] = 1642.74,  ['y'] = 2570.55,  ['z'] = 45.35},
	{ ['x'] = 309.4945,  ['y'] = -595.3582,  ['z'] = 43.282},

}
local notifIn = false
local notifOut = false
local armeriaZona = false
local mecanicoZona = false
local closestZone = 1
local tiempozoness = 15000
Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 1700.0
        tiempozoness = 40000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
                --print('Cerca de minima vdis: '..dist..' '..zones[i].x)
                
				minDistance = dist
				closestZone = i
                tiempozoness = 12000
                if zones[closestZone].relax ~= nil then
                    relax = true
                else
                    relax = false
                end
                if zones[closestZone].armeria ~= nil then
                    armeriaZona = true
                    mecanicoZona = false
                elseif zones[closestZone].mecanico ~= nil then
                    mecanicoZona = true
                    armeriaZona = false
                else
                    mecanicoZona = false
                    armeriaZona = false
                end
			end
		end
		Citizen.Wait(tiempozoness)
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		if relax == true then
			TriggerServerEvent("stress:remove", 45000)
            --ESX.ShowNotification('Estás en una zona de relax y te vas desestresando poco a poco.')
        end
	end
end)
local tiempozonare= 2500
local olddamage = GetPlayerVehicleDamageModifier(PlayerId())
Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(1500)
	end
	
	while true do
		Citizen.Wait(tiempozonare)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
	if dist > 300.0 then
        tiempozonare = 2500
    end
		if dist <= 100.0 then
            tiempozonare = 5
			if not notifIn then																
				NetworkSetFriendlyFireOption(false)
				ClearPlayerWantedLevel(PlayerId())
                HudWeaponWheelIgnoreControlInput(true)
               -- print('old damage veh '..olddamage)
             --   SetPlayerVehicleDamageModifier(PlayerId(), 0.1)
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
                if relax == true then
                msj =  "<b style='color:#1E90FF'>Estas en Zona de Relax</b>"
                else
                    msj =  "<b style='color:#1E90FF'>Estas en Zona Segura</b>"
                end
				TriggerEvent("pNotify:SendNotification",{
					text =msj,
					type = "success",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
				notifIn = true
				notifOut = false
                --MASCARA SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
			end
		else
            tiempozonare = 1000
			if not notifOut then
                if relax == true then
                    msj = "<b style='color:#1E90FF'>No estas en una Zona de Relax</b>"
                else
                    msj = "<b style='color:#1E90FF'>No estas en una Zona Segura</b>"
                end
              --  SetPlayerVehicleDamageModifier(PlayerId(), olddamage)
				NetworkSetFriendlyFireOption(true)
                HudWeaponWheelIgnoreControlInput(false)
				TriggerEvent("pNotify:SendNotification",{
					text = msj,
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
				notifOut = true
				notifIn = false
			end
		end
        if ESX.GetPlayerData().job.name == 'armeriaSandy' and armeriaZona == true then
            NetworkSetFriendlyFireOption(true)
                HudWeaponWheelIgnoreControlInput(false)
        elseif ESX.GetPlayerData().job.name == 'mechanic' and mecanicoZona == true then
            NetworkSetFriendlyFireOption(true)
            HudWeaponWheelIgnoreControlInput(false)
        elseif ESX.GetPlayerData().job.name == 'ambulance' and (ESX.GetPlayerData().job.grade == 6 or ESX.GetPlayerData().job.grade == 7 )   then
            NetworkSetFriendlyFireOption(true)
            HudWeaponWheelIgnoreControlInput(false)
        else
		if notifIn or estadonormal then
		DisableControlAction(2, 37, true) 
		DisablePlayerFiring(player,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
		  DisableControlAction(0, 106, true) -- Disable in-game mouse controls
		  DisableControlAction(0, 140, true)
			if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>No puedes utilizar este músculo si estas en un estado normal,zona segura o de relax🍊</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			end
			if IsDisabledControlJustPressed(2, 140) then --if Tab is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>No puedes utilizar este músculo si estas en un estado normal,zona segura o de relax🍊</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			end
			if IsDisabledControlJustPressed(2, 167) then --if Tab is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>No puedes utilizar este músculo si estas en un estado normal,zona segura o de relax🍊</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			end
			if IsDisabledControlJustPressed(2, 44) then --if Tab is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>No puedes utilizar este músculo si estas en un estado normal,zona segura o de relax🍊</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			end
			if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- If they click it will set them to unarmed
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>No puedes utilizar este músculo si estas en un estado normal,zona segura o de relax🍊</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			end
    
        else
            Citizen.Wait(3000)
		end
    end
	end
end)

local recountAC= nil 
local snowiAdminNum = 0
RegisterNetEvent('  ((  :) ', function(a)
    recountAC = a
  -- print('Aprendiendo lo numeros con Snowii!! :)'..recountAC)
 end)

 Citizen.CreateThread(function()
    Citizen.Wait(3000)
while true do
Citizen.Wait(5000)
snowiAdminNum = snowiAdminNum +1
local resta = snowiAdminNum-4
--print(resta>recountAC)
if (resta>recountAC) then
    print('SNOWI-AC | DETECTION STOP RESOURCE. _>'..snowiAdminNum..' / '..recountAC..' / '..resta)
  -- TriggerServerEvent(' s n o w i S T O P R E S O U R C E', 'SNOWI-AC | DETECTION STOP RESOURCE. _>'..snowiAdminNum..' / '..recountAC..' / '..(snowiAdminNum-6)..GetCurrentResourceName())
end 
end end)

local antistop= 0
    Citizen.CreateThread(function()
        print('Creo el thread')
        while true do
    Citizen.Wait(5000) 
TriggerEvent('  ((  :) 2',antistop)
antistop = antistop +1
end end)

--[[RegisterCommand('doinv', function() 
    local inv = {}
    table.insert(inv, {label='Snowi test', count = 69})

	for k,v in pairs(ESX.PlayerData.accounts) do
        print('Reccop mony')
		if v.money > 0 then
			
if v.name == 'money' then
    v.name = 'Dinero en mano'

			table.insert(inv, {
				label =v.name,
				count = v.money
			})
        end
		end
	end
print('Recopilando informacion de tu inventario...')
	for k,v in ipairs(ESX.PlayerData.inventory) do
        print(json.encode(v))
		if v.count > 0 then
            if v.label == nil then v.label = v.name end
			--currentWeight = currentWeight + (v.weight * v.count)

			table.insert(inv, {
				label = v.label,
				count = v.count})
		end
	end
    for i=1, #Config.Weapons, 1 do
		local weaponHash = GetHashKey(Config.Weapons[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and Config.Weapons[i].name ~= 'WEAPON_UNARMED' then
			local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
			table.insert(inv, {
				label     = Config.Weapons[i].label,
				count      = ammo,
			})
		end
	end
    local info = 'Tendría: '
    print(json.encode(inv))
    for i=1, #inv, 1 do
       info = info..inv[i].label..' x '..inv[i].count..' / '
    end
    print(info)
    ExecuteCommand('do '..info)
--ExecuteCommand('do Tendría: '..inv[#inv].label..' x '..inv[#inv].count)

end)--]]
RegisterKeyMapping('quitargancho', 'Soltar vehiculo en cargobob', 'keyboard', 'G' )

RegisterCommand("quitargancho", function()
    veh = GetVehiclePedIsUsing(PlayerPedId())
    if IsVehicleModel(veh, GetHashKey('CARGOBOB2')) then
    if Citizen.InvokeNative(0x6E08BF5B3722BAC9,veh) or Citizen.InvokeNative(0x1821D91AD4B56108,veh) then
        vehattached = Citizen.InvokeNative(0x873B82D42AC2B9E5,veh)
        Citizen.InvokeNative(0xADF7BE450512C12F,vehattached)
       Citizen.InvokeNative(0x9768CF648F54C804,veh)
       TriggerEvent('esx:showNotification', 'Has soltado el gancho!! Debes estacionar y reponerlo con un repairkit para volver a usarlo.')
    end
else
    print('Esta función solo es válida en cargobob!')
end
end)

RegisterCommand('quitarGrua', function()
    veh = GetVehiclePedIsUsing(PlayerPedId())
    if IsVehicleModel(veh, GetHashKey('CARGOBOB2')) then
    --if Citizen.InvokeNative(0x6E08BF5B3722BAC9,veh) or Citizen.InvokeNative(0x1821D91AD4B56108,veh) then
        vehattached = GetEntityAttachedToTowTruck(veh)
        DetachVehicleFromAnyTowTruck(vehattached)
       Citizen.InvokeNative(0x9768CF648F54C804,veh)
       TriggerEvent('esx:showNotification', 'Has soltado el gancho!! Debes estacionar y reponerlo con un repairkit para volver a usarlo.')
    end
--else
  --  print('Esta función solo es válida en cargobob!')
--end
end)
local longitud = 12
longitud = longitud - 6
local d=nil
local list = {1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
  crearMatri = function()
d = list[math.random(1,82)]

for i=1,longitud -1,1 do
    --print(d)
    d = d .. list[math.random(1,82)]
end
print("----MATRICULA GENERADA-----")
d = 'AG'..d
print(d)
    return d
end
RegisterNetEvent('snowiGiveDonador', function(name, token, tipo) 
    local matr = crearMatri()
    local model = (type(name) == 'number' and name or GetHashKey(name))

	if IsModelInCdimage(model) then
		local playerPed = PlayerPedId()
		local playerCoords, playerHeading = GetEntityCoords(playerPed), GetEntityHeading(playerPed)

		ESX.Game.SpawnVehicle(model, playerCoords, playerHeading, function(vehicle)
			--TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            SetEntityVisible(vehicle, false, 0)
            SetEntityCollision(vehicle, false, false)
            Citizen.Wait(1500)
       TriggerEvent('esx:showNotification', 'Vehículo cargado con éxito!')
       SetVehicleNumberPlateText(vehicle, matr)
       TriggerEvent('chatMessage', 'Agrio Donaciones', {250, 100, 0},"Espera unos segundos mientras preparamos la información del vehículo para guardar en la base de datos.")
local VehProps = ESX.Game.GetVehicleProperties(vehicle)
VehProps.plate = GetVehicleNumberPlateText(vehicle)
local nameLog = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
TriggerServerEvent('snowiGiveServerDonacion', {props=VehProps, nombre=nameLog, ti = tipo}, token)
DeleteVehicle(vehicle)
TriggerEvent('chatMessage', 'Agrio Donaciones', {250, 100, 0},"Tu vehículo está ya guardado en tu garaje, pasa cuando quieras a recogerlo.")

		end)

        
	else
		TriggerEvent('esx:showNotification', 'El vehículo no se cargó correctamente, informa por ticket para verificar su estado. Matricula:'..matr)
	end
end)
RegisterNetEvent('snowiGiveOrgC', function(name, token, tipo) 
    local matr = crearMatri()
    local model = (type(name) == 'number' and name or GetHashKey(name))

	if IsModelInCdimage(model) then
		local playerPed = PlayerPedId()
		local playerCoords, playerHeading = GetEntityCoords(playerPed), GetEntityHeading(playerPed)

		ESX.Game.SpawnVehicle(model, playerCoords, playerHeading, function(vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            Citizen.Wait(1500)
       TriggerEvent('esx:showNotification', 'Vehículo cargado con éxito!')
       SetVehicleNumberPlateText(vehicle, matr)
       TriggerEvent('chatMessage', 'Agrio Donaciones', {250, 100, 0},"Espera unos segundos mientras preparamos la información del vehículo para guardar en la base de datos.")
local VehProps = ESX.Game.GetVehicleProperties(vehicle)
VehProps.plate = GetVehicleNumberPlateText(vehicle)
local nameLog = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
TriggerServerEvent('snowiGiveServerVehOrg', {props=VehProps, nombre=nameLog, ti = tipo}, token)
		end)
	else
		TriggerEvent('esx:showNotification', 'El vehículo no se cargó correctamente, informa por ticket para verificar su estado. Matricula:'..matr)
	end
 
end)


local txd = CreateRuntimeTxd('duiTxd')
local duiObj = CreateDui('https://i.imgur.com/E1ucJcd.png', 516, 258)
_G.duiObj = duiObj
local dui = GetDuiHandle(duiObj)
local tx = CreateRuntimeTextureFromDuiHandle(txd, 'duiTex', dui)
RegisterCommand('gif', function() print('CHaged')
AddReplaceTexture('mp_m_freemode_01_mp_m_importexport_01\\jbib_diff_015_a_uni', 'jbib_diff_015_a_uni', 'duiTxd', 'duiTex')
AddReplaceTexture('mp_m_freemode_01_mp_m_importexport_01\\jbib_diff_015_b_uni', 'jbib_diff_015_b_uni', 'duiTxd', 'duiTex')
end )


RegisterCommand('devRopa', function(source, args) 
local texture = args[1]
local texture2 = args[2]
local link = 'https://i.imgur.com/'..args[3]..'.png'
local nametdx = args[4]
local duitext = args[5]
local res1 = tonumber(args[6])
local res2 = tonumber(args[7])
local txd = CreateRuntimeTxd(nametdx)
local duiObj = CreateDui(link, res1, res2)
local dui = GetDuiHandle(duiObj)
local tx = CreateRuntimeTextureFromDuiHandle(txd, duitext, dui)
texture = texture..'\\'..texture2
AddReplaceTexture(texture, texture2, nametdx, duitext)
print('Reemplazado la textura : '..texture..'/'..texture2..' Con el link:'..link..' Al nombre: '..nametdx..' duitext:'..duitext..'resolucion: '..res1..'/'..res2)
end)

RegisterCommand('desbugArma', function() 
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_PETROLCAN'), 1000, false, false)
    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_PETROLCAN'), true)
    Citizen.Wait(3500)
    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey('WEAPON_PETROLCAN'))
    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
  end)

  RegisterCommand('ilegalDispo', function() 
if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(810.22, -2159.19, 29.65), true) < 250.0 then
    print(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(810.22, -2159.19, 29.65), true))
    TriggerEvent("chatMessage", 'Has enviado un mensaje de disponibilidad en ventas ilegales a la ciudad!')
   TriggerServerEvent('disponibleIlegal', GetEntityCoords(GetPlayerPed(-1)))
else
    TriggerEvent("chatMessage", 'No estas en ventas ilegales, no puedes enviar aviso de disponibilidad!')
end

end)
local blipAviso = nil
RegisterNetEvent('blipDispoNibilidad', function(j) 
    blipAviso = AddBlipForCoord(j.x, j.y, j.z)

	SetBlipSprite(blipAviso, 567)
	SetBlipScale(blipAviso, 0.8)
	SetBlipColour(blipAviso, 39)

	PulseBlip(blipAviso)

    Citizen.Wait(15000)
    RemoveBlip(blipAviso)
end)


RegisterCommand('gorra', function() 
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.sex == 0 then
                    --[[local clothesSkin = {
                         ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                        ['torso_1'] = 43, ['torso_2'] = 0,
                        ['arms'] = 36, ['arms_2'] = 0,
                        ['pants_1'] = 27, ['pants_2'] = 3,
                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                        ['shoes_1'] = 26, ['shoes_2'] = 1
                        }--]]
                        local clothesSkin = {
                           ['helmet_1'] = skin.helmet_1,  ['helmet_2'] = skin.helmet_2,
                           ['glasses_2'] = skin.glasses_2, ['glasses_1'] = skin.glasses_1
                           }
                        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                    else
                        --[[local clothesSkin = {
                            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                            ['torso_1'] = 169, ['torso_2'] = 1,
                            ['arms'] = 32, ['arms_2'] = 0,
                            ['pants_1'] = 27, ['pants_2'] = 3,
                            ['helmet_1'] = -1,  ['helmet_2'] = 0,
                            ['shoes_1'] = 25, ['shoes_2'] = 0
                            }--]]
                            local clothesSkin = {
                                ['helmet_1'] = skin.helmet_1,  ['helmet_2'] = skin.helmet_2,
                                ['glasses_2'] = skin.glasses_2, ['glasses_1'] = skin.glasses_1
                                }
                            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                        end
        end)
        
end)