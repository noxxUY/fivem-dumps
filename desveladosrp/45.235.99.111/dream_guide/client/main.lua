ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
end)

RegisterNUICallback('focusOff', function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNetEvent("dream_przewodnik:open")
AddEventHandler("dream_przewodnik:open", function()
    SendNUIMessage({
        display = true
    })
    SetNuiFocus(true, true)
end)     

local name = "GUÍA TURÍSTICA"

RegisterNUICallback('przewodnik', function(data)
    local player, distance = ESX.Game.GetClosestPlayer() 

    if (data.type == "szkolajazdy") then
        SetNewWaypoint(Drive.x, Drive.y)
    elseif (data.type == "szpital") then
        SetNewWaypoint(Hospital.x, Hospital.y)
    elseif (data.type == "sklep") then
        SetNewWaypoint(Shop.x, Shop.y)
    elseif (data.type == "komisariat") then
        SetNewWaypoint(Police.x, Police.y)
    elseif (data.type == "salon") then
        SetNewWaypoint(Vehicle.x, Vehicle.y)
    elseif (data.type == "praca1") then
        SetNewWaypoint(Job1.x, Job1.y)
    elseif (data.type == "praca2") then
        SetNewWaypoint(Job2.x, Job2.y)
    elseif (data.type == "praca3") then
        SetNewWaypoint(Job3.x, Job3.y)
    elseif (data.type == "praca4") then
        SetNewWaypoint(Job4.x, Job4.y)
    elseif (data.type == "praca5") then
        SetNewWaypoint(Job5.x, Job5.y)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(6)

        local coords = GetEntityCoords(PlayerPedId())
        
for k,v in pairs(Config.Zones) do
	for i = 1, #v.Pos, 1 do
        if GetDistanceBetweenCoords(coords,  v.Pos[i].x, v.Pos[i].y, v.Pos[i].z,  true) < 10 then
            DrawText3D(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.05, "~b~[E] ~s~~n~".. name .."")
            
        end

        if (GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < 1) then
            if IsControlPressed(0, 54) then
                TriggerEvent("dream_przewodnik:open")
            end
        end
    end
end
    end
end)

function DrawText3D(x,y,z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
  local scale = (1/dist)*2
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov

  if onScreen then
    SetTextScale(0.0, 0.9)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.0, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
  end
end