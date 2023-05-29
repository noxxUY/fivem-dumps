ESX = nil
  
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(1000)
  end
end)
local gratis = false
local PlayerData              = {}
local BlipList                = {}
local HasAlreadyEnteredMarker = false
local LastZone, CurrentAction = nil, nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local hjoivcdfwrshjuiokdshjk= 2500
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(hjoivcdfwrshjuiokdshjk)
	  local coords = GetEntityCoords(PlayerPedId(), true)
	  local descansa = true
      for k in pairs(Config.Zones3) do
		  if GetDistanceBetweenCoords(Config.Zones3[k].x, Config.Zones3[k].y, Config.Zones3[k].z, coords) < 1 then
			hjoivcdfwrshjuiokdshjk = 1
			descansa = false
              Marker("Presiona ~w~[~r~E~w~] para ser tratado", 27, Config.Zones3[k].x, Config.Zones3[k].y, Config.Zones3[k].z - 0.99)
              if IsControlJustReleased(0, 38) then
				print('uno')
				if Config.Zones3[k].free == 'si' then
					gratis = true
					print('cambia')
				end
				--Citizen.Wait(1000)
                OpenHospitalMenu2()
              end
		  elseif GetDistanceBetweenCoords(Config.Zones3[k].x, Config.Zones3[k].y, Config.Zones3[k].z, coords) < 5 then
			descansa = false
			hjoivcdfwrshjuiokdshjk = 1
              Marker("~w~Ser tratado", 27, Config.Zones3[k].x, Config.Zones3[k].y, Config.Zones3[k].z - 0.99)
          end
	  end
	  if descansa == true then
		hjoivcdfwrshjuiokdshjk = 2500
	  end
  end
end)
local sajhiudusdha= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(sajhiudusdha)
		local coords = GetEntityCoords(PlayerPedId(), true)
		local descansa2 = true
		for k in pairs(Config.Zones4) do
			if GetDistanceBetweenCoords(Config.Zones4[k].x, Config.Zones4[k].y, Config.Zones4[k].z, coords) < 1 then
			  
			  descansa2 = false
				Marker("Presiona ~w~[~r~E~w~] para ser tratado", 27, Config.Zones4[k].x, Config.Zones4[k].y, Config.Zones4[k].z - 0.99)
				sajhiudusdha = 1
				if IsControlJustReleased(0, 38) then
				  print('uno')
				  if Config.Zones4[k].free == 'si' then
					  gratis = true
				  end
				  OpenHospitalMenu()
				end
			elseif GetDistanceBetweenCoords(Config.Zones4[k].x, Config.Zones4[k].y, Config.Zones4[k].z, coords) < 5 then
			  descansa2 = false
			  sajhiudusdha = 1
				Marker("~w~Ser tratado", 27, Config.Zones4[k].x, Config.Zones4[k].y, Config.Zones4[k].z - 0.99)
			end
		end
		if descansa2 == true then
			sajhiudusdha = 2500
		end
	end
  end)
function OpenHospitalMenu()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hospital_confirm', {
		title    = 'Quieres ser tratado?',
		align    = 'bottom-right',
		elements = {
			{label = 'No',  value = 'no'},
			{label = 'Si', value = 'yes'}
		}
	}, function(data, menu)
		menu.close()
		
		if data.current.value == 'yes' then
			ESX.UI.Menu.CloseAll()
			print('si')
			local ma = GetEntityMaxHealth(PlayerPedId())
			if gratis == true then
				gratis = false
			SetEntityHealth(PlayerPedId(), ma)
						SetEntityHealth(GetPlayerPed(-1), 200)
						ESX.ShowNotification('Has sido curado por el Médico del norte, no se te cobrará nada en tu cuenta!')
						return
			end
			
			ESX.TriggerServerCallback('check:mny2', function(hasEnoughMoney)
          if hasEnoughMoney then
			print('si')
			local ma = GetEntityMaxHealth(PlayerPedId())
			SetEntityHealth(PlayerPedId(), ma)
						SetEntityHealth(GetPlayerPed(-1), 200)
            ESX.ShowNotification('Has sido tratado!')
					else
						ESX.ShowNotification('No tienes suficiente dinero')
						
					end--
        end)
        
		elseif data.current.value == 'no' then
			menu.close()
		end
	end, function (data, menu)
		menu.close()
	end)
end
function OpenHospitalMenu2()
	if gratis == true then
		gratis = false
		TriggerEvent('esx_ambulancejfsdfsdob:revive')
            ESX.ShowNotification('Has sido tratado por el Médico del norte, no se te cobrará nada en tu cuenta!')
			return
	end
	ESX.TriggerServerCallback('check:mny', function(hasEnoughMoney)
		if hasEnoughMoney then
			TriggerEvent('esx_ambulancejfsdfsdob:revive')
            ESX.ShowNotification('Has sido tratado!')
		else
			ESX.ShowNotification('No tienes suficiente dinero')
		end
	end)
end
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_doctor_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
        Wait(1)
    end
	
	if Config.EnablePeds then
		for _, item in pairs(Config.Locations) do
			local npc = CreatePed(4, 0xd47303ac, item.x, item.y, item.z, item.heading, false, true)
			
			SetEntityHeading(npc, item.heading)
			FreezeEntityPosition(npc, true)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
		end
	end
end)
Citizen.CreateThread(function()
  RequestModel(GetHashKey("s_m_m_doctor_01"))

  while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
      Wait(1)
  end

if Config.EnablePeds then
  for _, item in pairs(Config.Locations2) do
    local npc = CreatePed(4, 0xd47303ac, item.x, item.y, item.z, item.heading, false, true)
    
    SetEntityHeading(npc, item.heading)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
  end
end
end)
function Draw3DText(x, y, z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

  local scale = (1/dist)*1
  local fov = (1/GetGameplayCamFov())*100
  local scale = 1.9
 
  if onScreen then
      SetTextScale(0.0*scale, 0.18*scale)
      SetTextFont(4)
      SetTextProportional(1)
      -- SetTextScale(0.0, 0.55)
      SetTextColour(0, 0, 0, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(2, 0, 0, 0, 150)
      SetTextDropShadow()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
local factor = (string.len(text)) / 600
  DrawRect(_x,_y+0.0115, 0.01+ factor, 0.025, 41, 11, 41, 68)
  
  end
end



function Marker(hint, type, x, y, z)
  Draw3DText(x, y, z + 1.0, hint)
DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 2.0, 55, 175, 55, 100, true, true, 2, false, false, false, false)
end
