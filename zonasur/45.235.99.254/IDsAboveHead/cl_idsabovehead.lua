disPlayerNames = 5 --distance you see IDs at 
keyToToggleIDs = 81 --left alt by default

playerDistances = {}
showIDsAboveHead = false

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function Tron(bool)
	showIDsAboveHead = bool
end

Citizen.CreateThread(function()
    while true do 
        if not IsControlReleased(1, keyToToggleIDs) then
			for id = 0, 128 do
                if NetworkIsPlayerActive(id) then
                    if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        if (playerDistances[id] < disPlayerNames) then
                            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                            if NetworkIsPlayerTalking(id) then
                                DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 247,124,24,2)
                            else
                                DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 255,255,255,2)
                            end
                        end  
                    end
                end
            end
            --showIDsAboveHead = not showIDsAboveHead
			--print("changed")
        end
        Wait(0)
    end
end)

--[[
RegisterCommand('id', function(source, args, rawCommand)
	ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
		if group == "mod" or group == "admin" or group == "superadmin" then
			local duty = exports["tron"]:GetTron()
			if duty then
				showIDsAboveHead = not showIDsAboveHead
				Wait(50)
			else
				ESX.ShowNotification('~r~Debes estar como Tron para activar los ID FIJOS!')
			end	
		end	
	end)
end, false)
]]

Citizen.CreateThread(function()
    while true do
		--local duty = exports["tron"]:GetTron()
		--showIDsAboveHead = duty
        for id = 0, 128 do
            if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                playerDistances[id] = distance
            end
        end
        Citizen.Wait(1000)
    end
end)




Citizen.CreateThread(function()
    while true do
        if showIDsAboveHead then
			for id = 0, 128 do
                if NetworkIsPlayerActive(id) then
                    if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        if (playerDistances[id] < 200) then
                            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                            if NetworkIsPlayerTalking(id) then
                                DrawText3DAdmin(x2, y2, z2+1, GetPlayerServerId(id), 247,124,24,2)
                            else
                                DrawText3DAdmin(x2, y2, z2+1, GetPlayerServerId(id), 255,255,255,2)
                            end
                        end  
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

function DrawText3DAdmin(x,y,z, text, r,g,b,size) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	
	if dist < 20 then
		dist = 20
	elseif dist > 20 then
		dist = 20
	end
	
	local scale = dist*size
	local fov = (1/GetGameplayCamFov())
	local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
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

function DrawText3D(x,y,z, text, r,g,b,size) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	
    local scale = (1/dist)*size
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
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