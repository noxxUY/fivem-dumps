--en la zona de minas: x rocas con un máximo extraíble. Se regenera con el tiempo, si llega a 0 no puedes minar.
local clicks = 0
local roca = nil
local npcvender = true --false si no quieres el npc que te lo cambia por dinero

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('minar:recibodatacliente')
AddEventHandler('minar:recibodatacliente',function(data)
    rocas = data
end)

local job = nil
AddEventHandler('playerSpawned', function(spawn)
  TriggerServerEvent('minar:getJob')
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    TriggerServerEvent('minar:getJob')
end)
TriggerServerEvent('minar:getJob')
RegisterNetEvent('minar:setJob')
AddEventHandler('minar:setJob',function(jobu)
  job = jobu
end)

function DrawText3D(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DrawText3Dlittle(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.5*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

 function get3DDistance(x1, y1, z1, x2, y2, z2)
    local a = (x1 - x2) * (x1 - x2)
    local b = (y1 - y2) * (y1 - y2)
    local c = (z1 - z2) * (z1 - z2)
    return math.sqrt(a + b + c)
end

function AbrirMenu()

	local elements = {
		{label = "Sí",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'get_job',
		{
			title  = '¿Quieres que me quede con tus minerales y te de dinero a cambio?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				TriggerServerEvent('minar:quitomin')
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

Citizen.CreateThread(function()
	while true do
        if IsPedDead then
            clicks = 0
            roca = nil
        end
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #rocas, 1 do
            if GetDistanceBetweenCoords(coords.x,coords.y,coords.z,rocas[i].x,rocas[i].y,rocas[i].z) < 75 then
                if rocas[i].vida >= 50 then
    		      DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~g~"..rocas[i].vida.."/"..rocas[i].max)
                elseif rocas[i].vida >= 25 then
                   DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~b~"..rocas[i].vida.."/"..rocas[i].max)
                elseif rocas[i].vida < 25 and rocas[i].vida ~= 0 then
                     DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~y~"..rocas[i].vida.."/"..rocas[i].max)
                elseif rocas[i].vida <= 0 then
                     DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~r~ "..rocas[i].vida.."/"..rocas[i].max)  
                end
            end
		end

        if GetCurrentPedWeapon(GetPlayerPed(-1),"WEAPON_BATTLEAXE",true) then
            if IsControlJustReleased(1,  24) then --click izq

                for i=1, #rocas, 1 do
                    if GetDistanceBetweenCoords(coords.x,coords.y,coords.z,rocas[i].x,rocas[i].y,rocas[i].z) < 1.8 and rocas[i].vida > 0 then
                        roca = i
                    end
                end
                if roca ~= nil then
                    if job == "minero" then
                        click()
                        Citizen.Wait(2)
                    else
                    	DisplayHelpText("Debes ser minero. Vuelve cuando lo seas para trabajar")
                    end
                end
            end
        end

        if get3DDistance(2953.68,2790.68,41.28-1,coords.x,coords.y,coords.z) > 100 then
            local weapon = GetSelectedPedWeapon(GetPlayerPed(-1), true)
            if weapon == GetHashKey("WEAPON_BATTLEAXE") then
            	if job == "minero" then
	                RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BATTLEAXE"))
	                ESX.ShowNotification('Te has alejado de la zona de trabajo, el hacha se ha eliminado')
	            end
            end
        end

        if get3DDistance(2952.0,2748.8,43.48-1,coords.x,coords.y,coords.z) < 100 then
            DrawMarker(1,2952.0,2748.8,43.48-1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.5001, 1555, 132, 23,255, 0, 0, 0,0)
        end
        if get3DDistance(2952.0,2748.8,43.48-1,coords.x,coords.y,coords.z) < 1.5 then
            if job == "minero" then
                DisplayHelpText("Presiona ~INPUT_CONTEXT~ para coger tu herramienta de trabajo")
                if IsControlJustReleased(1,38) then
                    GiveWeaponToPed(GetPlayerPed(-1),"WEAPON_BATTLEAXE",1,false,true)
                end
            else
                DisplayHelpText("Debes ser minero. Vuelve cuando lo seas para trabajar")
            end
        end

        if npcvender then
        	if get3DDistance(1905.96,3718.96,31.76,coords.x,coords.y,coords.z) < 20 then
        		DrawText3Dlittle(1905.96,3718.96,33.76, "Parece que hombre quiere minerales... -E- para interactuar")
        		if IsControlJustReleased(1,38) then
        			AbrirMenu()
        		end
        	end
    	end
	end
end)

function click()
-- Los clicks habrán que equilibrarlos a la dinámica del servidor
    if roca ~= nil then
        if rocas[roca].vida > 0 then
           if clicks >= 50 then 
                clicks = 0
                rocas[roca].vida = rocas[roca].vida - 1
                TriggerServerEvent('minar:doymineral',rocas[roca].data)
                TriggerServerEvent('minar:recibodata',rocas)
                roca = nil
            else
                clicks = clicks + 1 
                roca = nil
            end
        end
    end
end

local blips = {
    {title="Mina", colour=2, id=486, x = 2952.0, y = 2748.8, z = 43.48-1},
    {title="Vendedor de minerales", colour=2, id=486, x = 1905.96,y = 3718.96,z = 31.76},
}
 
Citizen.CreateThread(function()
    Citizen.Wait(0)
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)