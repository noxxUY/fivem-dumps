local jj={a={a={a={l='no'}}}}
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
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local Blips                   = {}
local piggyBackInProgress = false
local isCarry 				  = false
local hasRope 				  = true
local h = jj.a.a.a.l
local hasUsedRope 			= true
local IsLiftup				= false

ESX                     = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1000)
  end
end)


function OpenActionMenuInteraction(target)
	local canTakeHostage = false
	local h = jj.a.a.a.l
	local elements = {}

	table.insert(elements, {label = ('arrastrar'), value = 'drag'})
	table.insert(elements, {label = ('a cuestas'), value = 'piggyback'})
	table.insert(elements, {label = ('llevar'), value = 'carry'})
	table.insert(elements, {label = ('TH ( apuntar con pistola agarrado del cuello )'), value = 'takehostage'})
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('4 llevar tipos'),
			align    = 'top-left',
			elements = elements
		},function(data, menu)

			local player, distance = ESX.Game.GetClosestPlayer()

			ESX.UI.Menu.CloseAll()	
		
			if data.current.value == 'drag' then			
				TriggerServerEvent('esx_barbie_lyftupp:checkRope')
				ESX.ShowNotification('Estas levantando a la persona...')
				TriggerServerEvent('esx_barbie_lyftupp:lyfteruppn', GetPlayerServerId(player))
				Citizen.Wait(1000)
				if hasRope == true then
					local dict = "anim@heists@box_carry@"
					
					RequestAnimDict(dict)
					while not HasAnimDictLoaded(dict) do
						Citizen.Wait(100)
					end
					
					local player, distance = ESX.Game.GetClosestPlayer()
					local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
					
					if distance ~= -1 and distance <= 3.0 then
						local closestPlayer, distance = ESX.Game.GetClosestPlayer()
						TriggerServerEvent('esx_barbie_lyftupp:lyfter', GetPlayerServerId(closestPlayer))		
						
						TaskPlayAnim(GetPlayerPed(-1), dict, "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
						isCarry = true
					else
						ESX.ShowNotification("Nadie cerca de ti...")
					end
				else
					--ESX.ShowNotification("Du har inget rep att använda...")
				end
				menu.close()
			end
			n=h
			if data.current.value == 'piggyback' then
			
				if not piggyBackInProgress then
					piggyBackInProgress = true
					--IsLiftup = true
					local player = PlayerPedId()	
					lib = 'anim@arena@celeb@flat@paired@no_props@'
					anim1 = 'piggyback_c_player_a'
					anim2 = 'piggyback_c_player_b'
					distans = -0.071
					distans2 = 0.01
					height = 0.45
					spin = 0.0		
					length = 100000
					controlFlagMe = 49
					controlFlagTarget = 33
					animFlagTarget = 1
					local closestPlayer = GetClosestPlayer(3)
					target = GetPlayerServerId(closestPlayer)
				if closestPlayer ~= nil and closestPlayer ~= -1 then
					print("triggering esx_barbie_lyftupp:sync")
					TriggerServerEvent('esx_barbie_lyftupp:sync', closestPlayer, lib, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,n)

					--IsLiftup = true
				else
					print("Ningún jugador cerca para llevar")

				end
		
			else
				piggyBackInProgress = false
				IsLiftup = false
				ClearPedSecondaryTask(GetPlayerPed(-1))
				DetachEntity(GetPlayerPed(-1), true, false)
				local closestPlayer = GetClosestPlayer(3)
				
				target = GetPlayerServerId(closestPlayer)
				if closestPlayer ~= nil and closestPlayer ~= -1 then
				TriggerServerEvent("esx_barbie_lyftupp:stop",target)
				else
				
					print("Ningun jugador cercano")
				end
			end
			menu.close()
		end
		
		if data.current.value == 'carry' then
			if not carryingBackInProgress then
				carryingBackInProgress = true
				--IsLiftup = true
				local player = PlayerPedId()	
				lib = 'missfinale_c2mcs_1'
				anim1 = 'fin_c2_mcs_1_camman'
				lib2 = 'nm'
				anim2 = 'firemans_carry'
				distans = 0.151
				distans2 = 0.27
				height = 0.63
				spin = 0.0		
				length = 100000
				controlFlagMe = 49
				controlFlagTarget = 33
				animFlagTarget = 1
				local closestPlayer = GetClosestPlayer(3)
				target = GetPlayerServerId(closestPlayer)
				if closestPlayer ~= nil and closestPlayer ~= -1 then
					--print("triggering cmg2__animations:sync")
					TriggerServerEvent('cmg2__animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,n)
				else
					print("Ningun jugador cercano")
				end
			else
				carryingBackInProgress = false
				--IsLiftup = false
				ClearPedSecondaryTask(GetPlayerPed(-1))
				DetachEntity(GetPlayerPed(-1), true, false)
				local closestPlayer = GetClosestPlayer(3)
				target = GetPlayerServerId(closestPlayer)
				TriggerServerEvent("cmg2__animations:stop",target)
			end
			menu.close()
		end	
		
		local holdingHostageInProgress = false
		local hostageAllowedWeapons = {
			"WEAPON_PISTOL",
			"WEAPON_PISTOL50",
			"WEAPON_COMBATPISTOL",
	"WEAPON_DOUBLEACTION",
	"WEAPON_KNIFE",
				--Establecer armas para robar.
			}
	if data.current.value == 'takehostage' then
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
	for i=1, #hostageAllowedWeapons do
		if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(hostageAllowedWeapons[i]), false) then
			canTakeHostage = true
			foundWeapon = GetHashKey(hostageAllowedWeapons[i])
			
			break
		end
	end
			if not holdingHostageInProgress and canTakeHostage == true then		
		local player = PlayerPedId()	
		lib = 'anim@gangops@hostage@'
		anim1 = 'perp_idle'
		lib2 = 'anim@gangops@hostage@'
		anim2 = 'victim_idle'
		distans = 0.11 --Higher = closer to camera
		distans2 = -0.241 --higher = left
		height = 0.0
		spin = 0.0		
		length = 100000
		controlFlagMe = 49
		controlFlagTarget = 49
		animFlagTarget = 50
		attachFlag = true 
		local closestPlayer = GetClosestPlayer(2)
		target = GetPlayerServerId(closestPlayer)
		if closestPlayer ~= nil and closestPlayer ~= -1 then
			SetCurrentPedWeapon(GetPlayerPed(-1), foundWeapon, true)
			holdingHostageInProgress = true
			holdingHostage = true 
			--print("triggering cmg3__animations:sync")
			TriggerEvent('esx:showNotification', 'Debes esperar 2 segundos para poder hacer algo al rehén.')
			TriggerServerEvent('cmg3__animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,attachFlag,n)
		else
			--print("[CMG Anim] No player nearby")
			drawNativeNotification("Nadie cerca para secuestrarle!")
		end 
	else
		drawNativeNotification('No tienes ningún arma válida para coger del cuello a alguien!')
	end
	end
	end,function(data, menu)
		menu.close()
		end)
end

RegisterNetEvent('cmg3__animations:syncTarget')
AddEventHandler('cmg3__animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag,animFlagTarget,attach)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	if holdingHostageInProgress then 
		holdingHostageInProgress = false 
	else 
		holdingHostageInProgress = true
	end
	if beingHeldHostage then 
		beingHeldHostage = false 
	else 
		beingHeldHostage = true 
	end  
	--print("triggered cmg3__animations:syncTarget")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	if attach then 
		--print("attaching entity")
		AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	else 
		--print("not attaching entity")
	end
	
	if controlFlag == nil then controlFlag = 0 end
	
	if animation2 == "victim_fail" then 
		SetEntityHealth(GetPlayerPed(-1),0)
		TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false 
		holdingHostageInProgress = false 
	elseif animation2 == "shoved_back" then 
		holdingHostageInProgress = false 
		TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false 
	else
		TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false	
	end
end)

RegisterNetEvent('cmg3__animations:syncMe')
AddEventHandler('cmg3__animations:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	print("triggered cmg3__animations:syncMe")
	ClearPedSecondaryTask(GetPlayerPed(-1))
	RequestAnimDict(animationLib)
	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	--Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	if animation == "perp_fail" then 
		SetPedShootsAtCoord(GetPlayerPed(-1), 0.0, 0.0, 0.0, 0)
		holdingHostageInProgress = false 
	end
	if animation == "shove_var_a" then 
		Wait(900)
		ClearPedSecondaryTask(GetPlayerPed(-1))
		holdingHostageInProgress = false 
	end
end)

RegisterNetEvent('cmg3__animations:cl__stop')
AddEventHandler('cmg3__animations:cl__stop', function()
	holdingHostageInProgress = false
	beingHeldHostage = false 
	holdingHostage = false 
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

function GetPlayers()
    local players = {}

	for _, i in ipairs(GetActivePlayers()) do
        table.insert(players, i)
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end
local tiempo = 0
local jhajaSnowiOntop= 1505
local cargaotiemp = false
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(jhajaSnowiOntop)
		if holdingHostage then
			jhajaSnowiOntop = 1
			

			while tiempo < 2000 and not cargaotiemp do
				cargaotiemp = true
tiempo = tiempo + 50
Citizen.Wait(50)
			end
			if GetEntityHealth(GetPlayerPed(-1)) <= 102 then --You may need to edit this death check for your server
				--print("release this mofo")			
				holdingHostage = false
				holdingHostageInProgress = false 
				--ClearPedSecondaryTask(GetPlayerPed(-1))
				--DetachEntity(GetPlayerPed(-1), true, false)
				local closestPlayer = GetClosestPlayer(2)
				target = GetPlayerServerId(closestPlayer)
				TriggerServerEvent("cmg3__animations:stop",target)
				Wait(100)
				tiempo = 0
				cargaotiemp = false
				releaseHostage()
			end 
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisablePlayerFiring(GetPlayerPed(-1),true)
			local playerCoords = GetEntityCoords(GetPlayerPed(-1))
			DrawText3D(playerCoords.x,playerCoords.y,playerCoords.z,"~y~[~b~G~y~] ~w~~h~EMPUJAR \n  ~y~[~r~H~y~] ~w~~h~MATAR")
			if IsDisabledControlJustPressed(0,47) then --release
				--print("release this mofo")			
				holdingHostage = false
				holdingHostageInProgress = false 
				--ClearPedSecondaryTask(GetPlayerPed(-1))
				--DetachEntity(GetPlayerPed(-1), true, false)
				local closestPlayer = GetClosestPlayer(2)
				target = GetPlayerServerId(closestPlayer)
				TriggerServerEvent("cmg3__animations:stop",target)
				Wait(100)
				tiempo = 0
				cargaotiemp = false
				releaseHostage()
			elseif IsDisabledControlJustPressed(0,74) then --kill 
				--print("kill this mofo")				
				holdingHostage = false
				holdingHostageInProgress = false 	
				--ClearPedSecondaryTask(GetPlayerPed(-1))
				--DetachEntity(GetPlayerPed(-1), true, false)		
				local closestPlayer = GetClosestPlayer(2)
				target = GetPlayerServerId(closestPlayer)
				TriggerServerEvent("cmg3__animations:stop",target)
				tiempo = 0	
				cargaotiemp = false	
				killHostage()
			end
		else
			Citizen.Wait(1500)
			jhajaSnowiOntop = 2500
		end
		if beingHeldHostage then 
			jhajaSnowiOntop= 5
			DisableControlAction(0,21,true) -- disable sprint
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisableControlAction(0,263,true) -- disable melee
			DisableControlAction(0,264,true) -- disable melee
			DisableControlAction(0,257,true) -- disable melee
			DisableControlAction(0,140,true) -- disable melee
			DisableControlAction(0,141,true) -- disable melee
			DisableControlAction(0,142,true) -- disable melee
			DisableControlAction(0,143,true) -- disable melee
			DisableControlAction(0,75,true) -- disable exit vehicle
			DisableControlAction(27,75,true) -- disable exit vehicle  
			DisableControlAction(0,22,true) -- disable jump
			DisableControlAction(0,32,true) -- disable move up
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true) -- disable move down
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true) -- disable move left
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true) -- disable move right
			DisableControlAction(0,271,true)
			--tiempo = 0
			--cargaotiemp = false
		end
		Wait(0)
	end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(0.19, 0.19)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function releaseHostage()
	local player = PlayerPedId()	
	lib = 'reaction@shove'
	anim1 = 'shove_var_a'
	lib2 = 'reaction@shove'
	anim2 = 'shoved_back'
	distans = 0.11 --Higher = closer to camera
	distans2 = -0.241 --higher = left
	height = 0.0
	spin = 0.0		
	length = 100000
	controlFlagMe = 120
	controlFlagTarget = 0
	animFlagTarget = 1
	attachFlag = false
	n=h
	local closestPlayer = GetClosestPlayer(2)
	target = GetPlayerServerId(closestPlayer)
	if closestPlayer ~= nil and closestPlayer ~= -1 then
		--print("triggering cmg3__animations:sync")
		TriggerServerEvent('cmg3__animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,attachFlag,n)
	else
		--print("[CMG Anim] No player nearby")
	end
end 

function killHostage()
	local player = PlayerPedId()	
	lib = 'anim@gangops@hostage@'
	anim1 = 'perp_fail'
	lib2 = 'anim@gangops@hostage@'
	anim2 = 'victim_fail'
	distans = 0.11 --Higher = closer to camera
	distans2 = -0.241 --higher = left
	height = 0.0
	spin = 0.0		
	length = 0.2
	controlFlagMe = 168
	controlFlagTarget = 0
	animFlagTarget = 1
	attachFlag = false
	n=h
	local closestPlayer = GetClosestPlayer(2)
	target = GetPlayerServerId(closestPlayer)
	if closestPlayer ~= nil and closestPlayer ~= -1 then
		--print("triggering cmg3__animations:sync")
		TriggerServerEvent('cmg3__animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,attachFlag,n)
	else
		--print("[CMG Anim] No player nearby")
	end	
end 

function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function LoadAnimationDictionary(animationD)
	while(not HasAnimDictLoaded(animationD)) do
		RequestAnimDict(animationD)
		Citizen.Wait(1)
	end
end

RegisterNetEvent('esx_barbie_lyftupp:upplyft')
AddEventHandler('esx_barbie_lyftupp:upplyft', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	local lPed = GetPlayerPed(-1)
	local dict = "amb@code_human_in_car_idles@low@ps@"
	print('SNOWI-AC // upplyft by ID'..target..' Name ->'..tostring(GetPlayerName(target)))
	if isCarry == false then
		LoadAnimationDictionary("amb@code_human_in_car_idles@generic@ps@base")
		TaskPlayAnim(lPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 8.0, -8, -1, 33, 0, 0, 40, 0)
		
		AttachEntityToEntity(GetPlayerPed(-1), targetPed, 9816, 0.015, 0.38, 0.11, 0.9, 0.30, 90.0, false, false, false, false, 2, false)
		
		isCarry = true
		IsLiftup = true
	else
		DetachEntity(GetPlayerPed(-1), true, false)
		ClearPedTasksImmediately(targetPed)
		ClearPedTasksImmediately(GetPlayerPed(-1))
		
		IsLiftup = false
		isCarry = false
	end
end)



RegisterKeyMapping('menucargar', 'Menu para cargar', 'keyboard', 'Y' )
RegisterCommand('menucargar', function() 
if	not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'action_menu') then
	OpenActionMenuInteraction()
end
end)
RegisterNetEvent('esx_barbie_lyftupp')
AddEventHandler('esx_barbie_lyftupp', function()
  OpenActionMenuInteraction()
end)

RegisterNetEvent('esx_barbie_lyftupp:syncTarget')
AddEventHandler('esx_barbie_lyftupp:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	piggyBackInProgress = true
	--print("triggered esx_barbie_lyftupp:syncTarget")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2__animations:syncTarget')
AddEventHandler('cmg2__animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	--print("triggered cmg2__animations:syncTarget")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)


RegisterNetEvent('esx_barbie_lyftupp:syncMe')
AddEventHandler('esx_barbie_lyftupp:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	--print("triggered esx_barbie_lyftupp:syncMe")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.Wait(length)
end)

RegisterNetEvent('esx_barbie_lyftupp:cl_stop')
AddEventHandler('esx_barbie_lyftupp:cl_stop', function()
	piggyBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

RegisterNetEvent('cmg2__animations:cl__stop')
AddEventHandler('cmg2__animations:cl__stop', function()
	piggyBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)


function GetPlayers()
    local players = {}

	--for i = 0, 255 do
	for _, i in ipairs(GetActivePlayers()) do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
	end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end
local temputo= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(temputo)
		local playerPed = PlayerPedId()
		
		if IsLiftup then
			temputo= 5
			DisableControlAction(2, 56, true)
		else
			Citizen.Wait(2500)
			temputo= 2500
		end
	end
end)
