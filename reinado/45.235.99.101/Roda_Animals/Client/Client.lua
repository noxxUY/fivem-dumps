ESX = exports["es_extended"]:getSharedObject()
local ped, model, object, animation = {}, {}, {}, {}
local nombreperro = 'pene'
local isAttached, getball, inanimation, balle = false ,false, false, false
local following, attacking = true, false

AddEventHandler('onResourceStop', function(res)
    ESX.UI.Menu.CloseAll()
end)

RegisterNUICallback('RequestAnimals', function(data, cb)
    for k,v in pairs(Config.Animals) do
       SendNUIMessage({
           action = 'loadAnimals',
           label = v.label,
           model = v.model,
           price = v.price
       })
    end

    for k,v in pairs(Config.VipAnimals) do
        SendNUIMessage({
            action = 'loadVipAnimals',
            label = v.label,
            model = v.model,
            price = v.price
        })
    end
end)

function OpenBuyMenu()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openNormal',
    })
end

function OpenBuyVipMenu()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openVip',
    })
end


CreateThread(function()
    while true do
        local wait = 500
        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)

        for k,v in pairs(Config.Locations) do
            local dist = #(pedC - v.coords)
            if dist < 1.5 then
                wait = 0
                ESX.ShowFloatingHelpNotification('Pulsa ~r~E~w~ para abrir la tienda', vector3(v.coords.x, v.coords.y, v.coords.z + 0.50))
                if IsControlJustPressed(0, 38) then
                    OpenBuyPet()
                end
            elseif dist < 5.0 then
                wait = 0
                DrawMarker(2, v.coords.x, v.coords.y, v.coords.z + 0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
            end
        end
        Wait(wait)
    end
end)


function OpenBuyPet()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'buy_pet', {
        title = 'Tienda de animales',
        align = 'right',
        elements = {
            {label = 'Mascotas', value = 'money'},
            {label = 'Mascotas Vip (Coins)', value = 'vip'},
        }
    }, function(data, menu)
        if data.current.value == 'money' then
            OpenBuyMenu()
            ESX.UI.Menu.CloseAll()
        elseif data.current.value == 'vip' then
            OpenBuyVipMenu()
            ESX.UI.Menu.CloseAll()
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
end)

RegisterNUICallback('buyAnimal', function(data, cb)
    local precio = tonumber(data.price)
    if precio > 0 then 
        ESX.TriggerServerCallback('Roda_Animals:BuyAnimal', function(canbuy)
            if canbuy then
                SetNuiFocus(false, false)
                SendNUIMessage({
                    action = 'close'
                })
                TriggerServerEvent('Roda_Animals:SaveAnimal', data.model, data.nombre)
            else
                ESX.ShowNotification('No tienes dinero suficiente')
            end
        end, precio)
    else
        TriggerServerEvent('Roda_Animals:KickHacker')
    end
end)

RegisterNUICallback('buyAnimalMoney', function(data, cb)
    local precio = tonumber(data.price)
    if precio > 0 then 
        ESX.TriggerServerCallback('Roda_Animals:BuyAnimalMoney', function(canbuy)
            if canbuy then
                SetNuiFocus(false, false)
                SendNUIMessage({
                    action = 'close'
                })
                TriggerServerEvent('Roda_Animals:SaveAnimal', data.model, data.nombre)
            else
                ESX.ShowNotification('No tienes dinero suficiente')
            end
        end, precio)
    else
        TriggerServerEvent('Roda_Animals:KickHacker')
    end
end)

RegisterNUICallback('buyAnimalVip', function(data, cb)
    local precio = tonumber(data.price)
    if precio > 0 then 
        ESX.TriggerServerCallback('Roda_Animals:BuyAnimalVip', function(canbuy)
            if canbuy then
                SetNuiFocus(false, false)
                SendNUIMessage({
                    action = 'close'
                })
                TriggerServerEvent('Roda_Animals:SaveAnimal', data.model, data.nombre)
            else
                ESX.ShowNotification('No tienes dinero suficiente')
            end
        end, precio)
    else
        TriggerServerEvent('Roda_Animals:KickHacker')
    end
end)

local spawned = 0
function OpenPedMenu()

    local animals = {}

    ESX.TriggerServerCallback('Roda_Animals:GetAnimals', function(data)
        if data == '[]' then
            return
        else
            for k,v in pairs(data) do
                table.insert(animals, {
                    label = v.label,
                    model = v.model,
                    name = v.name
                })
            end

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pet_list', {
                title    = 'Mis Mascotas',
                align    = 'right',
                elements = animals
            }, function(data2, menu2)
                local v = data2.current
                local elements = {}
                table.insert(elements, {label = 'Llamar a tu mascota', value = 'llamar'})
                if spawned == 1 then
                    table.insert(elements, {label = 'Dar Ordenes', value = 'give_orders'})
                    table.insert(elements, {label = 'Sacrificar a tu mascota', value = 'kill'})
                end
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'options_pet', {
                    title    = 'Mascota: '..v.label,
                    align    = 'right',
                    elements = elements
                }, function(data3, menu3)
                    -- menu3.close()
                    local v2 = data3.current
                    if v2.value == 'llamar' then
                        nombreperro = v.label
                        modeloperro = v.model
                        identifierPerro = v.name
                        SpawnPeds(tonumber(v.model))
                        spawned  = 1
                        menu3.close()
                        menu2.close()
                    elseif v2.value == 'give_orders' then
                        GivePetOrders()
                    elseif v2.value == 'kill' then
                        KillPet(identifierPerro, nombreperro)
                    end
                end, function(data3, menu3)
                    menu3.close()
                end)
            end, function(data2, menu2)
                menu2.close()
            end)
        end

    end)
end


function KillPet(id, nombre)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'kill_pet', {
        title = '¿Estas seguro que quieres matar a tu mascota?',
        align = 'right',
        elements = {
            {label = 'Si', value = 'kill'},
            {label = 'No', value = 'no'}
        }
    }, function(data, menu)
        if data.current.value == 'kill' then
            if spawned == 1 then
                TriggerServerEvent('Roda_Animals:KillDog', id, nombre)
                SetEntityHealth(ped, 0)
                local pedcoordsPuto = GetEntityCoords(ped)

                ESX.ShowNotification('Has sacrificado a tu mascota')

                spawned = 0
                Wait(1000)
                print(pedcoordsPuto.x)
                AddExplosion(pedcoordsPuto.x, pedcoordsPuto.y, pedcoordsPuto.z, 20, 0.5, true, false, 1.0, false)
                Wait(3000)
                DeleteEntity(ped)
                --Close menu all
                ESX.UI.Menu.CloseAll()
            else
                ESX.ShowNotification('No tienes ninguna mascota en pie para sacrificar')
            end
        elseif data.current.value == 'no' then
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterCommand('mascota',function()
    OpenPedMenu()
end)

function SpawnPeds(model)
    if spawned == 0 then
        local playerPed = PlayerPedId()
        local LastPosition = GetEntityCoords(playerPed)
        local GroupHandle = GetPlayerGroup(PlayerId())
        following = true
        ESX.ShowNotification('Llamando a '..nombreperro)
        RequestModel(model)
        while(not HasModelLoaded(model)) do
            Wait(1)
        end

        DoRequestAnimSet('rcmnigel1c')

        TaskPlayAnim(playerPed, 'rcmnigel1c', 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)

        SetTimeout(5000, function()
            ped = CreatePed(28, model, LastPosition.x +1, LastPosition.y +1, LastPosition.z -1, 0, 1, 1)

            SetPedAsGroupLeader(playerPed, GroupHandle)
            SetPedAsGroupMember(ped, GroupHandle)
            SetPedNeverLeavesGroup(ped, true)
            SetPedCanBeTargetted(ped, false)
            SetEntityAsMissionEntity(ped, true, true)

            Wait(5)
            attached()
            Wait(5)
            detached()
        end)
    elseif spawned == 1 then
        ESX.ShowNotification('Ya tienes una mascota fuera, Guarda a '..nombreperro)
    end
end

function DoRequestModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(1)
	end
end

function DoRequestAnimSet(anim)
	RequestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Wait(1)
	end
end

function attached()
	local GroupHandle = GetPlayerGroup(PlayerId())
	SetGroupSeparationRange(GroupHandle, 1.9)
	SetPedNeverLeavesGroup(ped, false)
	FreezeEntityPosition(ped, true)
end

function detached()
	local GroupHandle = GetPlayerGroup(PlayerId())
	SetGroupSeparationRange(GroupHandle, 999999.9)
	SetPedNeverLeavesGroup(ped, true)
	SetPedAsGroupMember(ped, GroupHandle)
	FreezeEntityPosition(ped, false)
end

function GivePetOrders()
		local elements = {}

            table.insert(elements, {label = 'Trae la pelota', value = 'balle'})
            table.insert(elements, {label = 'Ven a Mis pies',  value = 'pies'})
			table.insert(elements, {label = 'Ve a Casa', value = 'acasa'})
            if IsPedInAnyVehicle(PlayerPedId()) then
                table.insert(elements, {label = 'Subirse al coche', value = 'subecoche'})
            end
            if tonumber(modeloperro) == -1788665315 or tonumber(modeloperro) == 1318032802 or tonumber(modeloperro) == 882848737 or tonumber(modeloperro) == 1126154828 or tonumber(modeloperro) ==  351016938  then 
                table.insert(elements, {label = 'Animaciones', value = 'animation'})
            end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_orders', {
			title    = 'Ordenes',
			align    = 'right',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'acasa' then
				local GroupHandle = GetPlayerGroup(PlayerId())
				local coords      = GetEntityCoords(PlayerPedId())

				ESX.ShowNotification(nombreperro..' fue a casa')

				SetGroupSeparationRange(GroupHandle, 1.9)
				SetPedNeverLeavesGroup(ped, false)
				TaskGoToCoordAnyMeans(ped, coords.x + 40, coords.y, coords.z, 5.0, 0, 0, 786603, 0xbf800000)

				Wait(5000)
				DeleteEntity(ped)
				spawned = 0

				ESX.UI.Menu.CloseAll()

            elseif data.current.value == 'animation' then 
                OpenAnimations()
              
			elseif data.current.value == 'pies' then
				local coords = GetEntityCoords(PlayerPedId())
				TaskGoToCoordAnyMeans(ped, coords, 5.0, 0, 0, 786603, 0xbf800000)
				menu.close()
            elseif data.current.value == 'subecoche' then
                local vehicle = GetVehiclePedIsIn(PlayerPedId())
                if IsVehicleSeatFree(vehicle, 1) then
                    SetPedIntoVehicle(ped, vehicle, 1)
                elseif IsVehicleSeatFree(vehicle, 2) then
                    SetPedIntoVehicle(ped, vehicle, 2)
                elseif IsVehicleSeatFree(vehicle, 0) then
                    SetPedIntoVehicle(ped, vehicle, 0)
                end
			elseif data.current.value == 'balle' then
				local pedCoords = GetEntityCoords(ped)
				object = GetClosestObjectOfType(pedCoords, 190.0, GetHashKey('w_am_baseball'))

				if DoesEntityExist(object) then
					balle = true
					objCoords = GetEntityCoords(object)
					TaskGoToCoordAnyMeans(ped, objCoords, 5.0, 0, 0, 786603, 0xbf800000)
					local GroupHandle = GetPlayerGroup(PlayerId())
					SetGroupSeparationRange(GroupHandle, 1.9)
					SetPedNeverLeavesGroup(ped, false)
					menu.close()
				else
					ESX.ShowNotification('No tienes pelotas')
				end
			end
		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent("Roda_Animals:Attack")
AddEventHandler("Roda_Animals:Attack", function()
	local dog_ped = ped
	local bool, other_ped = GetEntityPlayerIsFreeAimingAt(PlayerId())
	other_ped_attacked = other_ped

	if attacking == false then
		if IsEntityAPed(other_ped) then
			if not IsEntityDead(other_ped) then
				SetCanAttackFriendly(dog_ped, true, true)
				TaskPutPedDirectlyIntoMelee(dog_ped, other_ped, 0.0, -1.0, 0.0, 0)
				other_ped_attacked = other_ped
				attacking = true
				following = false
			end
		end
	else
		attacking = false
		other_ped_attacked = nil
		ClearPedTasks(dog_ped)
	end
end)

CreateThread(function()
	while true do
        local sleep = 500
        if spawned == 1 then
            sleep = 0
            if IsPlayerFreeAiming(PlayerId()) and IsControlJustPressed(1, 47) then
                TriggerEvent("Roda_Animals:Attack")
            end
        end
        Wait(sleep)
	end
end)


function PlayAnimation(dict, anim)
    local spawned_ped = ped
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end

    TaskPlayAnim(spawned_ped, dict, anim, 8.0, -8.0, -1, 2, 0.0, 0, 0, 0)
end

function OpenAnimations()
    ESX.UI.Menu.CloseAll()
    local elements = {}
    if tonumber(modeloperro) == -1788665315 or tonumber(modeloperro) == 1318032802 or tonumber(modeloperro) == 882848737 or tonumber(modeloperro) == 1126154828 or tonumber(modeloperro) ==  351016938   then 
        table.insert(elements, {label = 'Cancelar Animaciones', value = 'cancelar'})
        table.insert(elements, {label = 'Sientate', value = 'sentar'})
        table.insert(elements, {label = 'Dormir', value = 'sleep'})

        table.insert(elements, {label = 'Haste el muerto', value = 'morir'})
        table.insert(elements, {label = 'Hacer Caca', value = 'caca'})
        table.insert(elements, {label = 'Ladrar', value = 'ladrar'})
        table.insert(elements, {label = 'Ladrar 2', value = 'ladrar2'})
        table.insert(elements, {label = 'Rascarse', value = 'rascarse'})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animations', {
        title    = 'Animaciones',
        align    = 'right',
        elements = elements
    }, function(data4, menu4)
        if data4.current.value == 'cancelar' then
            DestroyAllProps()
        elseif data4.current.value == 'sentar' then
            PlayAnimation('creatures@rottweiler@amb@world_dog_sitting@idle_a','idle_b')
        elseif data4.current.value == 'sleep' then
            PlayAnimation('creatures@rottweiler@amb@sleep_in_kennel@','sleep_in_kennel')
        elseif data4.current.value == 'morir' then
            PlayAnimation('creatures@rottweiler@move','dead_left')
        elseif data4.current.value == 'ladrar' then
            PlayAnimation('creatures@rottweiler@amb@world_dog_barking@idle_a', 'idle_a')
        elseif data4.current.value == 'ladrar2' then
            PlayAnimation('creatures@rottweiler@indication@', 'indicate_high')
        elseif data4.current.value == 'rascarse' then
            PlayAnimation('creatures@rottweiler@amb@world_dog_sitting@idle_a', 'idle_a')
        elseif data4.current.value == 'caca' then
            PlayAnimation('creatures@rottweiler@move','dump_loop')
            AddPropToPlayer('prop_big_shit_02',51826, 0.0,0.2000,-0.4600,0.0,-20.00, 0.0)
            Wait(3000)
            DestroyAllProps()
        end
    end, function(data4, menu4)
        menu4.close()
    end)        
end

local PlayerProps = {}

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)

    local Player = ped
    local coords = GetEntityCoords(Player)
  
    if not HasModelLoaded(prop1) then
      LoadPropDict(prop1)
    end
  
    prop = CreateObject(GetHashKey(prop1), coords.x, coords.y, coords.z + 0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    table.insert(PlayerProps, prop)
    PlayerHasProp = true
    SetModelAsNoLongerNeeded(prop1)
end

function DestroyAllProps()
    ClearPedTasks(ped)
    for _,v in pairs(PlayerProps) do
      DeleteEntity(v)
    end
    PlayerHasProp = false
end

function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
      RequestModel(GetHashKey(model))
      Wait(10)
    end
end

CreateThread(function()
	while true do
		Wait(30)
        if spawned == 1 then 
            if balle then
                local coords1 = GetEntityCoords(PlayerPedId())
                local coords2 = GetEntityCoords(ped)
                local distance  = GetDistanceBetweenCoords(objCoords, coords2, true)
                local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

                if distance < 0.5 then
                    local boneIndex = GetPedBoneIndex(ped, 17188)
                    AttachEntityToEntity(object, ped, boneIndex, 0.120, 0.010, 0.010, 5.0, 150.0, 0.0, true, true, false, true, 1, true)
                    TaskGoToCoordAnyMeans(ped, coords1, 5.0, 0, 0, 786603, 0xbf800000)
                    balle = false
                    getball = true
                end
            end

            if getball then
                local coords1 = GetEntityCoords(PlayerPedId())
                local coords2 = GetEntityCoords(ped)
                local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

                if distance2 < 1.5 then
                    DetachEntity(object,false,false)
                    Wait(50)
                    SetEntityAsMissionEntity(object)
                    DeleteEntity(object)
                    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_BALL"), 1, false, true)
                    local GroupHandle = GetPlayerGroup(PlayerId())
                    SetGroupSeparationRange(GroupHandle, 999999.9)
                    SetPedNeverLeavesGroup(ped, true)
                    SetPedAsGroupMember(ped, GroupHandle)
                    getball = false
                end
            end
        end
	end
end)
