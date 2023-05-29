
local in_zone = nil
local prie_dropo = nil
local zone = nil
local blip = nil
local lektuvas = false
AtskridoLektuvas = false
atidaryti = false
PlayerData = {}
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
	Citizen.Wait(1)
	end
end)
	
	RegisterNetEvent("esx:playerLoaded")
	AddEventHandler("esx:playerLoaded", function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


Citizen.CreateThread(function()
	while true do
		
		Citizen.Wait(3000)
		

		if (current_zone == nil) then
			TriggerServerEvent("AirV2:get_zone")
			
			
		elseif (current_zone ~= nil) then
			--print(current_zone.coords.x, current_zone.coords.y, current_zone.coords.z)
			 player = PlayerPedId()
		     playercoords = GetEntityCoords(player)
			 playerdistance = GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, current_zone.coords.x, current_zone.coords.y, current_zone.coords.z, false)
			
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		
		Citizen.Wait(500)
	
		ESX.TriggerServerCallback('AirV2:isActive', function(isActive)
			if isActive > 0  then		
				RemoveBlip(zone)
				RemoveBlip(blip)
			end	
		end)

	end
end)


RegisterNetEvent("rz_client:draw_zone")
AddEventHandler("rz_client:draw_zone", function(source)
	
	current_zone = source
	RemoveBlip(zone)
	zone = AddBlipForRadius(current_zone.coords.x, current_zone.coords.y, current_zone.coords.z, current_zone.radius)
	SetBlipSprite(zone, 9)
	SetBlipAlpha(zone, 100)
	SetBlipColour(zone, current_zone.color)


end)

RegisterNetEvent("rz_client:draw_blip")
AddEventHandler("rz_client:draw_blip", function(draw_route, blip_text, blip_id)


	RemoveBlip(blip)
	blip = AddBlipForCoord(current_zone.coords.x, current_zone.coords.y, current_zone.coords.z)
	SetBlipSprite(blip, blip_id)
	if (draw_route == true) then
		SetBlipRoute(blip, true)
		SetBlipRouteColour(blip, current_zone.color)
	else
		SetBlipRoute(blip, false)
	end
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blip_text)
	EndTextCommandSetBlipName(blip)
	

end)





RegisterNetEvent("AirV2:flare")
AddEventHandler("AirV2:flare", function()       

	lektuvas = false
	
		ESX.TriggerServerCallback('AirV2:isActive', function(isActive, cooldown)

			if cooldown <= 0 then

				if isActive == 0 and not lektuvas then

					ESX.TriggerServerCallback('AirV2:anycops', function(anycops)

						if anycops >= Config.CopsRequired then  
							
							if (playerdistance < current_zone.radius) then

							      TriggerServerEvent('AirV2:atimti')
							     

							    isTaken = 1
				              
					            lektuvas = true
								  
								RequestWeaponAsset(GetHashKey("weapon_flare")) -- flare won't sp
								while not HasWeaponAssetLoaded(GetHashKey("weapon_flare")) do
									   Wait(20)
								end                                             
							    local Dumai = vector3(GetEntityCoords(PlayerPedId()))
								ShootSingleBulletBetweenCoords(Dumai, Dumai - vector3(0.0001, 0.0101, 0.1001),0 , true,GetHashKey("weapon_flare"), PlayerPedId(), true, false, 1)

									
								function setcountdown(x) time = GetGameTimer() + x*100 / 3 + 1000*Config.PlaneArrivalTimeSecons end
								function getcountdown() return math.floor((time-GetGameTimer())/1000) end
									
									
								setcountdown(50)
								
								while getcountdown() > 0  do
											   
								
								Citizen.Wait(1)
								timer = getcountdown()
												 
								drawTxt(Config.plane_flies..timer..Config.seconds)
												
																		  
								end
								
								CrateDrop()	
								imerActivate = false					

							else
								ESX.ShowNotification('Not in zone')
							end	    	

						else
							ESX.ShowNotification(Config.not_enough_cops)
						end

					end)

				else
				    ESX.ShowNotification(Config.already)
				end

			else
				ESX.ShowNotification(Config.Cooldown..math.ceil(cooldown/1000)..Config.seconds)
			end

		end)        	
        	 
end)	



drawTxt = function(text)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.5, 0.80)

end



Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(3000)
	  if isTaken == 1  then

			  local coords = GetEntityCoords(GetPlayerPed(-1))
		     TriggerServerEvent('AirV2:alertcops', coords.x, coords.y, coords.z)


	  end
	end
  end)


  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
	  if isTaken == 1  then

		Citizen.Wait(Config.DeleteBlipAfterMinutes * 60000)
		TriggerServerEvent('AirV2:stopalertcops')
		TriggerServerEvent('AirV2:registerActivity', 0)
		isTaken = 0

	  end
	end
  end)


  RegisterNetEvent('AirV2:removecopblip')
  AddEventHandler('AirV2:removecopblip', function()
		  RemoveBlip(copblip)
  end)  
  RegisterNetEvent('AirV2:setcopblip')
  AddEventHandler('AirV2:setcopblip', function(cx,cy,cz)
		  RemoveBlip(copblip)
	  copblip = AddBlipForCoord(cx,cy,cz)
	  SetBlipSprite(copblip , 161)
	  SetBlipScale(copblipy , 2.0)
		  SetBlipColour(copblip, 8)
		  PulseBlip(copblip)
  end)
  
  RegisterNetEvent('AirV2:setcopnotification')
  AddEventHandler('AirV2:setcopnotification', function()
	  ESX.ShowNotification(Config.in_progress)
  end)

local pilot, aircraft, parachute, crate, pickup, blip, soundID
local requiredModels = {"p_cargo_chute_s", "ex_prop_adv_case_sm", "cuban800", "s_m_m_pilot_02", "prop_box_wood02a_pu"} -- parachute, pickup case, plane, pilot, crate



function CrateDrop()
		
		
for i = 1, #requiredModels do
	RequestModel(GetHashKey(requiredModels[i]))
	while not HasModelLoaded(GetHashKey(requiredModels[i])) do
		Wait(0)
	end
end

local rHeading = math.random(0, 360) + 0.0
local planeSpawnDistance = (planeSpawnDistance and tonumber(planeSpawnDistance) + 0.0) or 400.0 
local theta = (rHeading / 180.0) * 3.14
aircraftX, aircraftY, aircraftZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	
local rPlaneSpawn = vector3(aircraftX, aircraftY, aircraftZ -  400) - vector3(math.cos(theta) * planeSpawnDistance, math.sin(theta) * planeSpawnDistance, -500.0) -- the plan
	
local dx = aircraftX- rPlaneSpawn.x
local dy = aircraftY - rPlaneSpawn.y
local heading = GetHeadingFromVector_2d(dx, dy) 
aircraft = CreateVehicle(GetHashKey("cuban800"), rPlaneSpawn, heading, true, true)
SetEntityHeading(aircraft, heading)
SetVehicleDoorsLocked(aircraft, 2) 
SetEntityDynamic(aircraft, true)
ActivatePhysics(aircraft)
SetVehicleForwardSpeed(aircraft, 60.0)
SetHeliBladesFullSpeed(aircraft) 
SetVehicleEngineOn(aircraft, true, true, false)
ControlLandingGear(aircraft, 3) 
OpenBombBayDoors(aircraft) 
SetEntityProofs(aircraft, true, false, true, false, false, false, false, false)


	
pilot = CreatePedInsideVehicle(aircraft, 1, GetHashKey("s_m_m_pilot_02"), -1, true, true)
SetBlockingOfNonTemporaryEvents(pilot, true)
SetPedRandomComponentVariation(pilot, false)
SetPedKeepTask(pilot, true)
SetPlaneMinHeightAboveTerrain(aircraft, 50) 



TaskVehicleDriveToCoord(pilot, aircraft, vector3(aircraftX, aircraftY, aircraftZ - 400) + vector3(0.0, 0.0, 500.0), 60.0, 0, GetHashKey("cuban800"), 262144, 15.0, -1.0) -- to the dropsite, could be 
local droparea = vector2(aircraftX, aircraftY)
local planeLocation = vector2(GetEntityCoords(aircraft).x, GetEntityCoords(aircraft).y)
while not IsEntityDead(pilot) and #(planeLocation - droparea) > 5.0 do 
	Wait(100)
	planeLocation = vector2(GetEntityCoords(aircraft).x, GetEntityCoords(aircraft).y) 
end




if IsEntityDead(pilot) then 

	TriggerServerEvent('AirV2:stopalertcops')
	TriggerServerEvent('AirV2:registerActivity', 0)
	isTaken = 0
	ESX.ShowNotification(Config.plane_crashed)

	do return end
end



TaskVehicleDriveToCoord(pilot, aircraft, 0.0, 0.0, 500.0, 60.0, 0, GetHashKey("cuban800"), 262144, -1.0, -1.0) 
SetEntityAsNoLongerNeeded(pilot) 
SetEntityAsNoLongerNeeded(aircraft)
local crateSpawn = vector3(aircraftX, aircraftY,  GetEntityCoords(aircraft).z - 5.0)
crate = CreateObject(GetHashKey("prop_box_wood02a_pu"), crateSpawn, true, true, true) 
SetEntityLodDist(crate, 1000) 
ActivatePhysics(crate)
SetDamping(crate, 2, 0.1) 
SetEntityVelocity(crate, 0.0, 0.0, -0.2) 
parachute = CreateObject(GetHashKey("p_cargo_chute_s"), crateSpawn, true, true, true) 
SetEntityLodDist(parachute, 1000)
SetEntityVelocity(parachute, 0.0, 0.0, -0.2)
pickup = CreateObject(GetHashKey("ex_prop_adv_case_sm"), crateSpawn, true, true, true)
ActivatePhysics(pickup)
SetDamping(pickup, 2, 0.0245)
SetEntityVelocity(pickup, 0.0, 0.0, -0.2)
AttachEntityToEntity(parachute, pickup, 0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 2, true) 
AttachEntityToEntity(pickup, crate, 0, 0.0, 0.0, 0.3, 0.0, 0.0, 0.0, false, false, true, false, 2, true) 
while HasObjectBeenBroken(crate) == false do 
	Wait(0)
end
local parachuteCoords = vector3(GetEntityCoords(parachute)) 

DetachEntity(parachute, true, true)

DeleteEntity(parachute)



atidaryti = true
TriggerServerEvent('Dropas:registerTakeDrop', 1)

SetEntityAsNoLongerNeeded(pickup)

while DoesEntityExist(pickup) do 
	Wait(0)
end

for i = 1, #requiredModels do
	Wait(0)
	SetModelAsNoLongerNeeded(GetHashKey(requiredModels[i]))
end

			
	
end	


DropBox = {}		
Citizen.CreateThread(function()
    while true do
        local sleepThread = 750
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
		
        for i = 1, #"ex_prop_adv_case_sm" do
            local entity = GetClosestObjectOfType(playerCoords, 1.7, GetHashKey("ex_prop_adv_case_sm"), false, false, false)
            local entityCoords = GetEntityCoords(entity)
			
			if not DropBox[entity] then
			
                if DoesEntityExist(entity) then

					if (current_zone ~= nil) then
						--print(current_zone.coords.x, current_zone.coords.y, current_zone.coords.z)
						 player = PlayerPedId()
						 playercoords = GetEntityCoords(player)
						 playerdistance = GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, current_zone.coords.x, current_zone.coords.y, current_zone.coords.z, false)
												
						if  (playerdistance < current_zone.radius) then
                          sleepThread = 5
                        
                                        if IsControlJustReleased(0, 38) then
				                        	DropBox[entity] = true
				                        	---ESX.Game.DeleteObject(entity)
				                        	ESX.TriggerServerCallback('Dropas:TakeDrop', function(isActive)
				                        		if isActive == 1  then	
				                        			
                                                      --ESX.Game.SpawnObject('prop_dumpster_01a', playerCoords, function(object)end)
                                                      --ESX.Game.SpawnLocalObject('prop_dumpster_01a', playerCoords, function()end)
				                        			TriggerServerEvent('AirV2:registerActivity', 1)
				                        			TriggerServerEvent('Dropas:registerTakeDrop', 0)
				                        			
                                                  SetEntityAsNoLongerNeeded(entity)
                                                   
                                                   Animation() 

				                        		else

                                                    ESX.ShowNotification('Box Empty')

			                                    end
			                                end)	
                                                           
                                        end

                               DrawText3D(entityCoords,Config.press_e_text)
			                break
					    end
					end
			
                end
			end
				
        end
        Citizen.Wait(sleepThread)
	end	
   
   
end)

DrawText3D = function(coords, text)
    SetDrawOrigin(coords)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    DrawRect(0.0, 0.0125, 0.015 + text:gsub("~.-~", ""):len() / 370, 0.03, 45, 45, 45, 150)
    ClearDrawOrigin()
end




function  Animation()
		TriggerServerEvent('AirV2:loot')
		TriggerEvent('inventory:dropAll')
end 
