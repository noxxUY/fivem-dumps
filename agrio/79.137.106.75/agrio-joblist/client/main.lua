local menuIsShowed, hasAlreadyEnteredMarker, isInMarker = false, false, false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function ShowJobListingMenu()
	TriggerServerEvent('InteractSound_SV:PlayOnSource', 'oficina', 0.9)
	ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(jobs)
		local elements = {}

		for i=1, #jobs, 1 do
			table.insert(elements, {
				label = jobs[i].label,
				job   = jobs[i].job
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'joblisting', {
			title    = _U('job_center'),
			align    = 'right',
			elements = elements
		}, function(data, menu)
			TriggerServerEvent('esx_joblisting:setJob', data.current.job)
			ESX.ShowNotification(_U('new_job'))
			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'ayuntamiento', 0.9)
			menu.close()
		end, function(data, menu)
			menu.close()
		end)

	end)
end

AddEventHandler('esx_joblisting:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Blip Sur
Citizen.CreateThread(function()
	for i=1, #Config.Zones, 1 do
		local blip = AddBlipForCoord(Config.Zones[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName("Ayuntamiento - Sur")
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	for i=1, #Config.Zones2, 1 do
		local blip = AddBlipForCoord(Config.Zones2[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName("Ayuntamiento - Norte")
		EndTextCommandSetBlipName(blip)
	end
end)

-- NPC del trabajo Norte 
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_business_04"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_business_04")) do
        Wait(1)
    end
	
	if Config.PrenderNPC then
		for _, item in pairs(Config.Locations1) do
			local npc = CreatePed(4, 0xB7C61032, item.x, item.y, item.z, item.heading, false, true)
			
			SetEntityHeading(npc, item.heading)
			FreezeEntityPosition(npc, true)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while (not HasAnimDictLoaded("anim@amb@nightclub@peds@")) do			
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
            TaskPlayAnim(npc,"anim@amb@nightclub@peds@","rcmme_amanda1_stand_loop_cop",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)	
		end
	end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_business_04"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_business_04")) do
        Wait(1)
    end
	
	if Config.PrenderNPC then
		for _, item in pairs(Config.Locations2) do
			local npc = CreatePed(4, 0xB7C61032, item.x, item.y, item.z, item.heading, false, true)
			
			SetEntityHeading(npc, item.heading)
			FreezeEntityPosition(npc, true)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while (not HasAnimDictLoaded("anim@amb@nightclub@peds@")) do			
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
            TaskPlayAnim(npc,"anim@amb@nightclub@peds@","rcmme_amanda1_stand_loop_cop",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)	
		end
	end
end)


-- Menu Controls
Citizen.CreateThread(function()
    while true do
		s = 1000
    local ped = PlayerPedId()
        Citizen.Wait(1)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.UbicacionX, Config.UbicacionY, Config.UbicacionZ, true) < 2 then
				s = 0
				ESX.ShowFloatingHelpNotification("Presione ~g~[E]~s~ para ver la lista de trabajos", vector3(Config.UbicacionX, Config.UbicacionY, Config.UbicacionZ +1))
                    if IsControlJustReleased(1, 51) then
                        ShowJobListingMenu()
            end
        else
			Citizen.Wait(500)
		end
		Citizen.Wait(s)
    end
 end)

 -- Menu Controls
Citizen.CreateThread(function()
    while true do
		s = 1000
    local ped = PlayerPedId()
        Citizen.Wait(1)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.UbicacionX2, Config.UbicacionY2, Config.UbicacionZ2, true) < 2 then
				s = 0
				ESX.ShowFloatingHelpNotification("Presione ~g~[E]~s~ para ver la lista de trabajos", vector3(Config.UbicacionX2, Config.UbicacionY2, Config.UbicacionZ2 +1))
                    if IsControlJustReleased(1, 51) then
                        ShowJobListingMenu()
            end
        else
			Citizen.Wait(500)
		end
		Citizen.Wait(s)
    end
 end)


 