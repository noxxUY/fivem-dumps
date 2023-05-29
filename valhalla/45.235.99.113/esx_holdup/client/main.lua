local holdingUp   = false
local store       = ""
local blipRobbery = nil
ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject' , function(obj)
			ESX = obj
		end)
		Citizen.Wait(360)
	end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(4)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_holdup:currentlyRobbing')
AddEventHandler('esx_holdup:currentlyRobbing' , function(currentStore)
	holdingUp , store = true , currentStore
end)

RegisterNetEvent('esx_holdup:killBlip')
AddEventHandler('esx_holdup:killBlip' , function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:setBlip')
AddEventHandler('esx_holdup:setBlip' , function(position)
	blipRobbery = AddBlipForCoord(position.x , position.y , position.z)
	
	SetBlipSprite(blipRobbery , 161)
	SetBlipScale(blipRobbery , 2.0)
	SetBlipColour(blipRobbery , 3)
	
	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar' , function()
	holdingUp , store = false , ''
	exports['mythic_notify']:DoCustomHudText('cajaroja' , ('Han dejado de robar la tienda!') , 5000)
end)

RegisterNetEvent('esx_holdup:robberyComplete')
AddEventHandler('esx_holdup:robberyComplete' , function(award)
	holdingUp , store = false , ''
	exports['mythic_notify']:DoCustomHudText('cajaverde' , ('El robo ha salido bien, acabas de recibir $'..award) , 5000)
end)


RegisterNetEvent('esx_holdup:startTimer')
AddEventHandler('esx_holdup:startTimer' , function()
	local timer = Stores[store].secondsRemaining
	
	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)
			
			if timer > 0 then
				timer = timer - 1
			end
		end
	end)
	
	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.94, 1.46, 1.0, 1.0, 0.50, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	while true do
		local msec = 1000
		local playerPos = GetEntityCoords(PlayerPedId() , true)
		
		for k , v in pairs(Stores) do
			local storePos = v.position
			local distance = Vdist(playerPos.x , playerPos.y , playerPos.z , storePos.x , storePos.y , storePos.z)
			
			if distance < Config.Marker.DrawDistance then
				msec = 0
				if not holdingUp then
					DrawMarker(Config.Marker.Type , storePos.x , storePos.y , storePos.z - 1 , 0.0 , 0.0 , 0.0 , 0.0 , 0.0 , 0.0 , Config.Marker.x , Config.Marker.y , Config.Marker.z , Config.Marker.r , Config.Marker.g , Config.Marker.b , Config.Marker.a , false , false , 2 , false , false , false , false)
					
					if distance < 0.5 then
						ESX.Game.Utils.DrawText3D(vector3(storePos.x , storePos.y , storePos.z + 0.4) , "~r~Robo a tienda. ~t~("..v.nameOfStore..")" , 1.0)
						ESX.Game.Utils.DrawText3D(vector3(storePos.x , storePos.y , storePos.z + 0.2) , "Presiona ~r~[E]~s~ para comenzar el robo" , 0.6)
						
						if IsControlJustReleased(0 , 38) then
							if IsPedArmed(PlayerPedId() , 4) then
								TriggerServerEvent('esx_holdup:robberyStarted' , k)
							else
								exports['mythic_notify']:DoCustomHudText('cajaroja' , ('Has intentado robar una tienda sin un arma, ¡ven con un arma la próxima!') , 5000)
							end
						end
					end
				end
			end
		end
		
		if holdingUp then
			msec = 0
			local storePos = Stores[store].position
			if Vdist(playerPos.x , playerPos.y , playerPos.z , storePos.x , storePos.y , storePos.z) > Config.MaxDistance then
				TriggerServerEvent('esx_holdup:tooFar' , store)
			end
		end
		Citizen.Wait(msec)
	end
end)

RegisterNetEvent('esx_holdup:notifyPolice', function()
	local playerData = ESX.GetPlayerData()

	if playerData.job.name == 'police' then
		TriggerEvent('esx_holdup:killBlip')
	end
end)

RegisterNetEvent('esx_holdup:opt:setBlip', function(storeName, position)
	local playerData = ESX.GetPlayerData()

	if playerData.job.name == 'police' then
		TriggerEvent('esx:showNotification', ("Robo en progreso en ~%s~"):format(storeName))
		TriggerEvent('esx_holdup:setBlip', position)
	end
end)

RegisterNetEvent('esx_holdup:opt:kill', function(storeName)
	local playerData = ESX.GetPlayerData()

	if playerData.job.name == 'police' then
		TriggerEvent('esx:showNotification', ("Robo exitoso en %s~s~"):format(storeName))
		TriggerEvent('esx_holdup:killBlip')
	end
end)