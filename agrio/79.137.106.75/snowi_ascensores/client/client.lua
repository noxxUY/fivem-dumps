local menu = false

RegisterNetEvent("MountZONAHsnowiiSnowii:Option")
AddEventHandler("MountZONAHsnowiiSnowii:Option", function(option, coords, distanceAmount, cb)
	cb(Menu.Option(option, coords, distanceAmount))
end)

RegisterNetEvent("MountZONAHsnowiiSnowii:Update")
AddEventHandler("MountZONAHsnowiiSnowii:Update", function()
	Menu.updateSelection()
end)

function GetVehicleInDirectionSphere(coordFrom, coordTo)
    local rayHandle = StartShapeTestCapsule(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 2.0, 10, GetPlayerPed(-1), 7)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    return vehicle
end

RegisterNetEvent("MountZONAHsnowiiSnowiiGetBool:Option")
AddEventHandler("MountZONAHsnowiiSnowiiGetBool:Option", function(option)
	if option == true then
		menu = true
	else
		menu = false
	end
end)

RegisterNetEvent("MountZONAHsnowiiSnowii:UpdateOption")
AddEventHandler("MountZONAHsnowiiSnowii:UpdateOption", function()
    Menu.UpdateOption() 
end)

function DisplayHelpText(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

isInZone ="none"
local tempawit = 2500
incircle = {}
Citizen.CreateThread(function()
    while true do
		Wait(tempawit)
        local coordA = GetEntityCoords(PlayerPedId(), 1)
		local cerca = false
		for k,v in pairs(Config.Zones) do
			if Vdist(v.Marker.x,v.Marker.y,v.Marker.z,coordA) < 5.0 then
				cerca = true
				tempawit = 5
				tempwaitaa = 5
				DrawMarker(v.Type, v.Marker.x, v.Marker.y,v.Marker.z,0, 0,   0,   0,   0,    0,  2.01, 2.01,    0.05, 10, 255,   10,65, true, 0, 0,0)
				if Vdist(v.Marker.x,v.Marker.y,v.Marker.z,coordA) < 1.0 then
				incircle[k] = true
				isInZone = k
			else
				incircle[k] = false
			end
			end
		end
		if cerca == false then
			tempawit = 1500
			tempwaitaa = 1500
		end
    end
end)


function teleport(pos)
    local ped = PlayerPedId()
    Citizen.CreateThread(function()
 
        NetworkFadeOutEntity(ped, true, false)
        Citizen.Wait(250)

        SetEntityCoords(ped, pos.x, pos.y, pos.z, 1, 0, 0, 1)
        NetworkFadeInEntity(ped, 0)

    end)
end
local tempwaitaa= 2500
Citizen.CreateThread(function()
    while true do
		menu = true
		isInAZone = false
		
		for k,v in pairs (incircle) do 
			if v then isInAZone = true end
		end
		
		if not isInAZone then 
			isInZone = "none" 
			--tempwaitaa = 1500
		else
			--tempwaitaa = 1
			for k,v in pairs(Config.Zones[isInZone].canGoTo) do
				
				TriggerEvent("MountZONAHsnowiiSnowii:Option", Locales[Config.Locale][tostring(v)], {Config.Zones[isInZone].Spawn.x, Config.Zones[isInZone].Spawn.y, Config.Zones[isInZone].Spawn.z+0.5}, 1.5, function(cb)
					if(cb) then
						teleport(vector3(Config.Zones[v].Spawn.x,Config.Zones[v].Spawn.y,Config.Zones[v].Spawn.z-0.80))
						TriggerEvent("ZONAHsnowii:fade",150,150,150)
						--Wait(250)
						--TriggerServerEvent("InteractSound_SVZONAHsnowii:PlayWithinDistance", 25, "demo", 0.2)
						-- print("TP to : "..v)
					end
				end)
				
			end
			TriggerEvent("MountZONAHsnowiiSnowii:Update")
		end
		
		Wait(tempawit)
    end
end)

RegisterNetEvent("ZONAHsnowii:fade")
AddEventHandler("ZONAHsnowii:fade", function(timeIn,timeWait,timeOut)
	Citizen.CreateThread(function()
		DoScreenFadeOut(timeIn+1)
		while not IsScreenFadedOut() do
			Wait(0)
		end
		Wait(timeWait+1)
		DoScreenFadeIn(timeOut+1)
	end)
end)