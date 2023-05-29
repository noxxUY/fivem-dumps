ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

local PlayerData = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local totalS = 0
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    RequestAnimDict('mp_arresting')
    RequestAnimDict('anim@amb@business@coc@coc_unpack_cut_left@')
	RequestAnimDict('amb@prop_human_bum_bin@base')
    ApplyDoorLock()
    for i = 1, #Config.allBlips, 1 do
        totalS = totalS + 1
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        RequestAnimDict('mp_arresting')
        RequestAnimDict('anim@amb@business@coc@coc_unpack_cut_left@')
        RequestAnimDict('amb@prop_human_bum_bin@base')
        ApplyDoorLock()
        for i = 1, #Config.allBlips, 1 do
            totalS = totalS + 1
        end
	end
end)









local started = false
local closestZone = 1
local using = false
local maskon = false
local already = false
local Fixed = false
local closestSone = 1
local blipsGone = 0
local pickups = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
    [7] = false,
    [8] = false,
    [9] = false,
    [10] = false,
    [11] = false,
    [12] = false,
    [13] = false,
    [14] = false,
    [15] = false,
    [15] = false,
    [16] = false,
    [17] = false,
    [18] = false,
    [19] = false,
    [20] = false
}
local doorsie = {
    [1] = {locked = true},
    [2] = {locked = true},
    [3] = {locked = true}
}


Citizen.CreateThread(function()
	local blip1 = AddBlipForCoord(Config.StartLoc.x, Config.StartLoc.y, Config.StartLoc.z)
	SetBlipSprite(blip1, 499)
	SetBlipScale(blip1, 0.9)
	SetBlipColour(blip1, 1)
	SetBlipAsShortRange(blip1, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Humane Labs")
	EndTextCommandSetBlipName(blip1)
	
    while true do
        Citizen.Wait(6000)
        if GetDistanceBetweenCoords(Config.doors[1].objCoords.x, Config.doors[1].objCoords.y, Config.doors[1].objCoords.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 100 then
            ApplyDoorLock()
        end
        if GetDistanceBetweenCoords(Config.doors[3].objCoords.x, Config.doors[3].objCoords.y, Config.doors[3].objCoords.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 50 then
            ApplyDoorLock()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if not started then
            if GetDistanceBetweenCoords(Config.StartLoc.x, Config.StartLoc.y, Config.StartLoc.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 3 then
                Citizen.Wait(4)
                local ped = PlayerPedId()
				--[[
                if not using then
                    DrawText3D(Config.StartLoc.x, Config.StartLoc.y, Config.StartLoc.z, Config.Sayings[1])
                end
				]]
				if not using then
					DrawText3D(Config.StartLoc.x, Config.StartLoc.y, Config.StartLoc.z, Config.Sayings[6])
				end
                if IsControlJustReleased(0, 38) and not using then
                    ESX.TriggerServerCallback('esx_humane:canRob', function(can, time)
                        if can == 2 then
							--ESX.TriggerServerCallback('esx_humane:hasPliers', function(bool)
								--if bool then
									using = true
									TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
									FreezeEntityPosition(ped, true)
									exports['progressBars']:startUI(Config.RerouteTime *1000, Config.Sayings[7])
									Citizen.Wait(Config.RerouteTime *1000)
									FreezeEntityPosition(ped, false)
									using = false
									ClearPedTasksImmediately(ped)
									doorsie[1].locked = not doorsie[1].locked
									doorsie[2].locked = not doorsie[2].locked
									TriggerServerEvent('esx_humaneRaid:updatedoor', 1, doorsie[1].locked)
									TriggerServerEvent('esx_humaneRaid:updatedoor', 2, doorsie[2].locked)
									blipsGone = 7
									TriggerServerEvent('esx_humane:StartTheRob')
								--else
									--ESX.ShowNotification('~r~No tienes Alicate por cortar los cables!')
								--end
							--end)
                        elseif can == 1 then
                            using = true
                            local timer = time *60
                            ESX.ShowNotification(Config.Sayings[4]..timer..Config.Sayings[5])
                            Citizen.Wait(2000)
                            using = false
                        elseif can == 3 then
                            using = true
                            ESX.ShowNotification(Config.Sayings[47]..Config.NeededCops..Config.Sayings[48])
                            Citizen.Wait(2000)
                            using = false
                        end
                    end)
                end
            else
                Citizen.Wait(3000)
            end
        else
            Citizen.Wait(4)
            if blipsGone <= 5 then
                local minDistance = 100
                local coords = GetEntityCoords(PlayerPedId())
                for i = 1, #Config.allBlips, 1 do
                    dist = Vdist(Config.allBlips[i].blipCoords.x, Config.allBlips[i].blipCoords.y, Config.allBlips[i].blipCoords.z, coords)
                    if dist < minDistance then
                        minDistance = dist
                        closestSone = i
                    end
                end
			--[[
            elseif blipsGone == 6 then
                local ped = PlayerPedId()
                if GetDistanceBetweenCoords(Config.StartLoc.x, Config.StartLoc.y, Config.StartLoc.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 2 then
                    if not using then
                        DrawText3D(Config.StartLoc.x, Config.StartLoc.y, Config.StartLoc.z, Config.Sayings[6])
                    end
                    if IsControlJustReleased(0, 38) and not using then
                        using = true
                        TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                        FreezeEntityPosition(ped, true)
                        exports['progressBars']:startUI(Config.RerouteTime *1000, Config.Sayings[7])
                        Citizen.Wait(Config.RerouteTime *1000)
                        FreezeEntityPosition(ped, false)
                        using = false
                        ClearPedTasksImmediately(ped)
                        doorsie[1].locked = not doorsie[1].locked
                        doorsie[2].locked = not doorsie[2].locked
                        TriggerServerEvent('esx_humaneRaid:updatedoor', 1, doorsie[1].locked)
                        TriggerServerEvent('esx_humaneRaid:updatedoor', 2, doorsie[2].locked)
                        blipsGone = 7
                        TriggerServerEvent('esx_humane:StartTheRob')
                    end
                end
				]]
            elseif blipsGone == 7 then
                local coords = GetEntityCoords(PlayerPedId())
                local minDistance = 100
                for i = 1, #Config.Locations, 1 do
                    dist = Vdist(Config.Locations[i].Loc.x, Config.Locations[i].Loc.y, Config.Locations[i].Loc.z, coords)
                    if dist < minDistance then
                        minDistance = dist
                        closestZone = i
                    end
                end
            end
        end
    end
end)

function spawnGoodBlips()
    for i = 1, #Config.Locations, 1 do
        if Config.Locations[i].Quality == 'regular' then
            local blip1 = AddBlipForCoord(Config.Locations[i].Loc.x, Config.Locations[i].Loc.y, Config.Locations[i].Loc.z)
            SetBlipSprite(blip1, Config.PickSprite[1])
            SetBlipScale(blip1, 0.9)
            SetBlipColour(blip1, Config.PickColor[1])
            PulseBlip(blip1)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Sayings[8])
            EndTextCommandSetBlipName(blip1)
            Config.Locations[i].DataStore = blip1
        elseif Config.Locations[i].Quality == 'medium' then
            local blip1 = AddBlipForCoord(Config.Locations[i].Loc.x, Config.Locations[i].Loc.y, Config.Locations[i].Loc.z)
            SetBlipSprite(blip1, Config.PickSprite[2])
            SetBlipScale(blip1, 0.9)
            SetBlipColour(blip1, Config.PickColor[2])
            PulseBlip(blip1)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Sayings[9])
            EndTextCommandSetBlipName(blip1)
            Config.Locations[i].DataStore = blip1
        elseif Config.Locations[i].Quality == 'high' then
            local blip1 = AddBlipForCoord(Config.Locations[i].Loc.x, Config.Locations[i].Loc.y, Config.Locations[i].Loc.z)
            SetBlipSprite(blip1, Config.PickSprite[3])
            SetBlipScale(blip1, 0.9)
            SetBlipColour(blip1, Config.PickColor[3])
            PulseBlip(blip1)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Sayings[10])
            EndTextCommandSetBlipName(blip1)
            Config.Locations[i].DataStore = blip1
        end
    end
end

local closestDoor = 1
local near = false
Citizen.CreateThread(function()
    while true do
        if GetDistanceBetweenCoords(Config.doors[1].objCoords.x,Config.doors[1].objCoords.y,Config.doors[1].objCoords.z,  GetEntityCoords(GetPlayerPed(-1)), true) < Config.CloseDoorCheck then
            Citizen.Wait(4)
            local ped = GetPlayerPed(-1)
            local coords = GetEntityCoords(ped)
            near = true
            local minDistance = 100
            for i = 1, #Config.doors, 1 do
                dist = Vdist(Config.doors[i].objCoords.x,Config.doors[i].objCoords.y,Config.doors[i].objCoords.z, coords)
                if dist < minDistance then
                    minDistance = dist
                    closestDoor = i
                end
            end
        elseif GetDistanceBetweenCoords(Config.doors[3].objCoords.x,Config.doors[3].objCoords.y,Config.doors[3].objCoords.z,  GetEntityCoords(GetPlayerPed(-1)), true) < Config.CloseDoorCheck2 then
            Citizen.Wait(4)
            local ped = GetPlayerPed(-1)
            local coords = GetEntityCoords(ped)
            near = true
            local minDistance = 100
            for i = 1, #Config.doors, 1 do
                dist = Vdist(Config.doors[i].objCoords.x,Config.doors[i].objCoords.y,Config.doors[i].objCoords.z, coords)
                if dist < minDistance then
                    minDistance = dist
                    closestDoor = i
                end
            end
        else
            near = false
            Citizen.Wait(5000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if near then
            Citizen.Wait(4)
            local ped = GetPlayerPed(-1)
            local coords = GetEntityCoords(ped)
            dist = Vdist(Config.doors[closestDoor].objCoords.x,Config.doors[closestDoor].objCoords.y,Config.doors[closestDoor].objCoords.z, coords)
            if dist <= Config.MaxDoorDist then
                if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.PoliceJob then
                    if doorsie[closestDoor].locked then
                        if closestDoor == 3 then
                            DrawText3D(Config.doors[closestDoor].objCoords.x - 1.5,Config.doors[closestDoor].objCoords.y + 0.3,Config.doors[closestDoor].objCoords.z, Config.Sayings[11])
                        else
                            DrawText3D(Config.doors[closestDoor].objCoords.x,Config.doors[closestDoor].objCoords.y,Config.doors[closestDoor].objCoords.z + 2, Config.Sayings[11])
                        end
                    else
                        if closestDoor == 3 then
                            DrawText3D(Config.doors[closestDoor].objCoords.x - 1.5,Config.doors[closestDoor].objCoords.y + 0.3,Config.doors[closestDoor].objCoords.z, Config.Sayings[12])
                        else
                            DrawText3D(Config.doors[closestDoor].objCoords.x,Config.doors[closestDoor].objCoords.y,Config.doors[closestDoor].objCoords.z + 2, Config.Sayings[12])
                        end
                    end
                    if IsControlJustReleased(0, 38) then
                        doorsie[closestDoor].locked = not doorsie[closestDoor].locked
                        TriggerServerEvent('esx_humaneRaid:updatedoor', closestDoor, doorsie[closestDoor].locked)
                    end
                else
                    if doorsie[closestDoor].locked then
                        if closestDoor == 3 then
                            DrawText3D(Config.doors[closestDoor].objCoords.x - 1.5,Config.doors[closestDoor].objCoords.y + 0.3,Config.doors[closestDoor].objCoords.z, Config.Sayings[13])
                        else
                            DrawText3D(Config.doors[closestDoor].objCoords.x,Config.doors[closestDoor].objCoords.y,Config.doors[closestDoor].objCoords.z + 2, Config.Sayings[13])
                        end
                    else
                        if closestDoor == 3 then
                            DrawText3D(Config.doors[closestDoor].objCoords.x - 1.5,Config.doors[closestDoor].objCoords.y + 0.3,Config.doors[closestDoor].objCoords.z, Config.Sayings[14])
                        else
                            DrawText3D(Config.doors[closestDoor].objCoords.x,Config.doors[closestDoor].objCoords.y,Config.doors[closestDoor].objCoords.z + 2, Config.Sayings[14])
                        end
                    end
                end
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function ApplyDoorLock()
    local ped = PlayerPedId()
    local closeDoor = GetClosestObjectOfType(Config.doors[1].objCoords.x, Config.doors[1].objCoords.y, Config.doors[1].objCoords.z, 1.0, GetHashKey(Config.doors[1].objName), false, false, false)
    local closeDoor2 = GetClosestObjectOfType(Config.doors[2].objCoords.x, Config.doors[2].objCoords.y, Config.doors[2].objCoords.z, 1.0, GetHashKey(Config.doors[2].objName), false, false, false)
    local closeDoor3 = GetClosestObjectOfType(Config.doors[3].objCoords.x, Config.doors[3].objCoords.y, Config.doors[3].objCoords.z, 1.0, GetHashKey(Config.doors[3].objName), false, false, false)
    FreezeEntityPosition(closeDoor, doorsie[1].locked)
    FreezeEntityPosition(closeDoor2, doorsie[2].locked)
    FreezeEntityPosition(closeDoor3, doorsie[3].locked)
end

RegisterNetEvent('esx_humaneRaid:setState')
AddEventHandler('esx_humaneRaid:setState', function(doorID, state)
	doorsie[doorID].locked = state
    ApplyDoorLock()
end)

function spawnSecurityBlips()
    for i = 1, #Config.allBlips, 1 do
        local blip1 = AddBlipForCoord(Config.allBlips[i].blipCoords.x, Config.allBlips[i].blipCoords.y, Config.allBlips[i].blipCoords.z)
        SetBlipSprite(blip1, Config.BlipSprite)
        SetBlipScale(blip1, Config.BlipSize)
        SetBlipColour(blip1, Config.BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Sayings[15])
        EndTextCommandSetBlipName(blip1)
        Config.allBlips[i].blipCheck = blip1
    end
end


Citizen.CreateThread(function()
	while true do
        if blipsGone == 7 then
            local ped = GetPlayerPed(-1)
            local coords = GetEntityCoords(ped)
            local dist = Vdist(Config.Locations[closestZone].Loc.x, Config.Locations[closestZone].Loc.y, Config.Locations[closestZone].Loc.z, coords)
            if dist <= Config.MaxDist then
                Citizen.Wait(4)
                if not using then
                    if dist <= Config.PickupDist then
                        if not pickups[closestZone] then
                            DrawText3D(Config.Locations[closestZone].Loc.x, Config.Locations[closestZone].Loc.y, Config.Locations[closestZone].Loc.z, Config.Sayings[16])
                        end
                        if IsControlJustReleased(0, 38) and not using then
                            ESX.TriggerServerCallback('esx_humane:checkBlips', function(check)
                                if check then
                                    if not using then
                                        using = true
                                        TriggerServerEvent('esx_humane:pickup', closestZone, Config.Locations[closestZone].Quality)
                                        if Config.Locations[closestZone].AnimType == 1 then
                                            TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                                        elseif Config.Locations[closestZone].AnimType == 2 then
                                            TaskPlayAnim(ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                                        elseif Config.Locations[closestZone].AnimType == 3 then
                                            TaskPlayAnim(ped, 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter', 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                                        end
                                        SetEntityHeading(ped, Config.Locations[closestZone].AnimHeading)
                                        FreezeEntityPosition(ped, true)
                                        if Config.Locations[closestZone].Quality == 'regular' and Config.DoDamageFor1.Damage then
                                            if not maskon then
                                                local health = 0
                                                health = GetEntityHealth(ped)
                                                health = health - Config.DoDamageFor1.Amount
                                                SetEntityHealth(ped, health)
                                                ESX.ShowNotification(Config.Sayings[17])
                                            else
                                                if Config.BreakMask then
                                                    local firstnum = Config.Probability4Mask[1]
                                                    local secondnum = Config.Probability4Mask[2]
                                                    local rannum = math.random(firstnum, secondnum)
                                                    if firstnum == rannum then
                                                        ESX.ShowNotification(Config.Sayings[18])
                                                        maskon = false
                                                    end
                                                end
                                            end
                                        elseif Config.Locations[closestZone].Quality == 'medium' and Config.DoDamageFor2.Damage then
                                            if not maskon then
                                                local health = 0
                                                health = GetEntityHealth(ped)
                                                health = health - Config.DoDamageFor2.Amount
                                                SetEntityHealth(ped, health)
                                                ESX.ShowNotification(Config.Sayings[17])
                                            else
                                                if Config.BreakMask then
                                                    local firstnum = Config.Probability4Mask[1]
                                                    local secondnum = Config.Probability4Mask[2]
                                                    local rannum = math.random(firstnum, secondnum)
                                                    if firstnum == rannum then
                                                        ESX.ShowNotification(Config.Sayings[18])
                                                        maskon = false
                                                    end
                                                end
                                            end
                                        elseif Config.Locations[closestZone].Quality == 'high' and Config.DoDamageFor3.Damage then
                                            if not maskon then
                                                local health = 0
                                                health = GetEntityHealth(ped)
                                                health = health - Config.DoDamageFor3.Amount
                                                SetEntityHealth(ped, health)
                                                ESX.ShowNotification(Config.Sayings[17])
                                            else
                                                if Config.BreakMask then
                                                    local firstnum = Config.Probability4Mask[1]
                                                    local secondnum = Config.Probability4Mask[2]
                                                    local rannum = math.random(firstnum, secondnum)
                                                    if firstnum == rannum then
                                                        ESX.ShowNotification(Config.Sayings[18])
                                                        maskon = false
                                                    end
                                                end
                                            end
                                        end
                                        exports['progressBars']:startUI(Config.DisablePanelTime *1000, Config.Sayings[19])
                                        Citizen.Wait(Config.DisablePanelTime *1000)
                                        FreezeEntityPosition(ped, false)
                                        ClearPedTasksImmediately(ped)
                                        using = false
                                    else
                                        ESX.ShowNotification(Config.Sayings[20])
                                    end
                                else
                                    ESX.ShowNotification(Config.Sayings[20])
                                end
                            end, closestZone)
                        end
                    end
                end
            else
                Citizen.Wait(2000)
            end
        elseif blipsGone <= 5 and started then
            local ped = GetPlayerPed(-1)
            local coords = GetEntityCoords(ped)
            local dist = Vdist(Config.allBlips[closestSone].blipCoords.x, Config.allBlips[closestSone].blipCoords.y, Config.allBlips[closestSone].blipCoords.z, coords)
            if dist < Config.MaxSDist then
                Citizen.Wait(4)
                if not Config.allBlips[closestSone].blipUsed then
                    if not using then
                        DrawText3D(Config.allBlips[closestSone].blipCoords.x, Config.allBlips[closestSone].blipCoords.y, Config.allBlips[closestSone].blipCoords.z, Config.Sayings[21])
                    end
                    if IsControlJustReleased(0, 38) and not using then
                        ESX.TriggerServerCallback('esx_humane:hasPliers', function(has)
                            if has then
                                using = true
                                TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                                SetEntityHeading(ped, Config.allBlips[closestSone].blipheading)
                                FreezeEntityPosition(ped, true)
                                exports['progressBars']:startUI(Config.DisablePanelTime *1000, Config.Sayings[22])
                                Citizen.Wait(Config.DisablePanelTime *1000)
                                using = false
                                FreezeEntityPosition(ped, false)
                                ClearPedTasksImmediately(ped)
                                Config.allBlips[closestSone].blipUsed = true
                                RemoveBlip(Config.allBlips[closestSone].blipCheck)
                                blipsGone = blipsGone + 1
                                if blipsGone == 6 then
                                    ESX.ShowNotification(Config.Sayings[23])
                                else
                                    ESX.ShowNotification(Config.Sayings[24].. totalS-blipsGone ..Config.Sayings[25])
                                end

                                if Config.BreakPliers then
                                    local firstnum = Config.Probabilty4Pliers[1]
                                    local secondnum = Config.Probabilty4Pliers[2]
                                    local rannum = math.random(firstnum, secondnum)
                                    if firstnum == rannum then
                                        TriggerServerEvent('esx_humane:PlierBreak')
                                        ESX.ShowNotification(Config.Sayings[41])
                                    end
                                end
                                if not Fixed then
                                    if Config.AllowTrip and not already then
                                        local firstnum = Config.TripProbability[1]
                                        local secondnum = Config.TripProbability[2]
                                        local rannum = math.random(firstnum, secondnum)
                                        if firstnum == rannum then
                                            already = true
                                            TriggerServerEvent('esx_humane:CallThem')
                                            ESX.ShowNotification(Config.Sayings[26])
                                        end
                                    end
                                end
                            else
                                ESX.ShowNotification(Config.Sayings[27])
                                started = false
                                blipsGone = 0
                                for i = 1, #Config.allBlips, 1 do
                                    if DoesBlipExist(Config.allBlips[i].blipCheck) then
                                        RemoveBlip(Config.allBlips[i].blipCheck)
                                        Config.allBlips[i].blipUsed = false
                                    end
                                end
                            end
                        end)
                    end
                end
            else
                Citizen.Wait(2000)
            end
        else
            Citizen.Wait(5000)
        end
	end
end)

RegisterNetEvent('esx_humane:pickUpOc')
AddEventHandler('esx_humane:pickUpOc', function(zones)
    pickups[zones] = true
    RemoveBlip(Config.Locations[zones].DataStore)
end)

local wasin = false

RegisterNetEvent('esx_humane:robStart')
AddEventHandler('esx_humane:robStart', function()
    local coords = GetEntityCoords(PlayerPedId())
    if Vdist(Config.HumaneLoc.x, Config.HumaneLoc.y, Config.HumaneLoc.z, coords) < 150 then
        started = true
        wasin = true
        blipsGone = 7
        spawnGoodBlips()
        ESX.ShowNotification(Config.Sayings[28])
    end
end)

function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

RegisterNetEvent('esx_humane:usedMask')
AddEventHandler('esx_humane:usedMask', function()
	local playerPed  = PlayerPedId()
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 12844)
	local lib, anim = 'clothingshirt', 'try_shirt_positive_d'
		
	LoadAnim(lib)
	TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2000)
	
	ESX.Game.SpawnObject('p_s_scuba_mask_s', {x = coords.x, y = coords.y, z = coords.z - 3}, function(object)
		mask = object
		AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
		ESX.ShowNotification(Config.Sayings[29])
		maskon = true
		Citizen.Wait(60000 * 10)
		maskon = false
		DeleteObject(mask)
	end)
	--[[
    if Config.Maskapplied.Apply then
        TriggerEvent('skinchanger:getSkin', function(skin)
            local sex = skin.sex
            if sex == 0 then
                TriggerEvent('skinchanger:loadSkin', {
                    mask_1          = Config.Maskapplied.Male
                })
            else
                TriggerEvent('skinchanger:loadSkin', {
                    mask_1          = Config.Maskapplied.Female
                })
            end
        end)
    end
	]]
end)

local polblip = nil

RegisterNetEvent('esx_humane:RobDone')
AddEventHandler('esx_humane:RobDone', function(bool)
    local coords = GetEntityCoords(PlayerPedId())
    if wasin then
        for i = 1, #Config.Locations, 1 do
            if not pickups[i] then
                RemoveBlip(Config.Locations[i].DataStore)
            end
            pickups[i] = false
        end
        started = false
        blipsGone = 0
        if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.PoliceJob then 
            RemoveBlip(polblip)
			if bool then
				ESX.ShowNotification(Config.Sayings[30])
			end	
        else
			if bool then
				ESX.ShowNotification(Config.Sayings[31])
			end	
        end
        maskon = false
        wasin = false
        Fixed = false
        already = false
    end
end)

RegisterCommand("cancelHumane", function(source, args, rawCommand)
    if Config.AdminCancel then
        ESX.TriggerServerCallback('esx_humane:checkAdmin', function(allow)
            if allow == 1 then
                ESX.ShowNotification(Config.Sayings[32])
            elseif allow == 2 then
                ESX.ShowNotification(Config.Sayings[33])
            elseif allow == 3 then
                ESX.ShowNotification(Config.Sayings[34])
            end
        end)
    else
        ESX.ShowNotification(Config.Sayings[35])
    end
end)


RegisterNetEvent('esx_humane:CallCops')
AddEventHandler('esx_humane:CallCops', function()
    local blip1 = AddBlipForCoord(Config.HumaneLoc.x, Config.HumaneLoc.y, Config.HumaneLoc.z)
    SetBlipSprite(blip1, Config.PolRobBlips)
    SetBlipScale(blip1, 0.9)
    SetBlipColour(blip1, Config.PolRobColor)
    PulseBlip(blip1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Sayings[36])
    EndTextCommandSetBlipName(blip1)
    polblip = blip1

    ESX.ShowNotification(Config.Sayings[37])
end)

Citizen.CreateThread(function()
    while true do
        if GetDistanceBetweenCoords(Config.doors[3].objCoords.x,Config.doors[3].objCoords.y,Config.doors[3].objCoords.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 2 and ESX.PlayerData.job and ESX.PlayerData.job.name ~= Config.PoliceJob then
            Citizen.Wait(4)
            local ped = GetPlayerPed(-1)
            DrawText3D(Config.doors[closestDoor].objCoords.x - 1.5,Config.doors[closestDoor].objCoords.y + 0.3,Config.doors[closestDoor].objCoords.z + 0.4, Config.Sayings[38])
            if IsControlJustReleased(0, 38) and not using then
                ESX.TriggerServerCallback('esx_humane:checkLockPick', function(can)
                    if can then
                        using = true
                        TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                        SetEntityHeading(ped, Config.lockpickHeading)
                        FreezeEntityPosition(ped, true)
                        exports['progressBars']:startUI(Config.LockpickTime *1000, Config.Sayings[39])
                        Citizen.Wait(Config.LockpickTime *1000)
                        FreezeEntityPosition(ped, false)
                        ClearPedTasksImmediately(ped)
                        using = false
                        doorsie[closestDoor].locked = not doorsie[closestDoor].locked
                        TriggerServerEvent('esx_humaneRaid:updatedoor', closestDoor, doorsie[closestDoor].locked)
                    else
                        ESX.ShowNotification(Config.Sayings[46])
                    end
                end)
            end
        else
            Citizen.Wait(2000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
		Wait(5)
		if GetDistanceBetweenCoords(Config.Cancelar.x, Config.Cancelar.y, Config.Cancelar.z,  GetEntityCoords(GetPlayerPed(-1)), true) <= 50.0 then
			if started then
				DrawMarker(1, Config.Cancelar.x, Config.Cancelar.y, Config.Cancelar.z-1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(Config.Cancelar.x, Config.Cancelar.y, Config.Cancelar.z,  GetEntityCoords(GetPlayerPed(-1)), true) <= 2.0 then
					DrawText3D(Config.Cancelar.x, Config.Cancelar.y, Config.Cancelar.z, 'Presione ~g~[E]~w~ para Cancelar el Robo!')
					if IsControlJustReleased(0, 38) then				
						started = false
						blipsGone = 0
						ESX.ShowNotification(Config.Sayings[40])
						for i = 1, #Config.allBlips, 1 do
							if DoesBlipExist(Config.allBlips[i].blipCheck) then
								RemoveBlip(Config.allBlips[i].blipCheck)
								Config.allBlips[i].blipUsed = false
							end
						end
						TriggerServerEvent('esx_humane:Cancelar')
					end	
				end
            end
		end
	end
end)

--[[
Citizen.CreateThread(function()
    while true do
        if GetDistanceBetweenCoords(Config.HumaneLoc.x, Config.HumaneLoc.y, Config.HumaneLoc.z,  GetEntityCoords(GetPlayerPed(-1)), true) <= Config.CloseCancel then
            Citizen.Wait(3000)
        else
            if started then
                Citizen.Wait(2000)
                started = false
                blipsGone = 0
                ESX.ShowNotification(Config.Sayings[40])
                for i = 1, #Config.allBlips, 1 do
                    if DoesBlipExist(Config.allBlips[i].blipCheck) then
                        RemoveBlip(Config.allBlips[i].blipCheck)
                        Config.allBlips[i].blipUsed = false
                    end
                end
            else
                Citizen.Wait(3000)
            end
        end
    end
end)
]]

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        if GetDistanceBetweenCoords(Config.AllowTripFixLoc.Loc.x, Config.AllowTripFixLoc.Loc.y, Config.AllowTripFixLoc.Loc.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 2 and blipsGone <= 5 and started and not already and not Fixed then
            Citizen.Wait(4)
            DrawText3D(Config.AllowTripFixLoc.Loc.x, Config.AllowTripFixLoc.Loc.y, Config.AllowTripFixLoc.Loc.z, Config.Sayings[42])
            if IsControlJustReleased(0, 38) and not using then
                using = true
                SetEntityCoords(ped, Config.AllowTripFixLoc.AnimLoc.x, Config.AllowTripFixLoc.AnimLoc.y, Config.AllowTripFixLoc.AnimLoc.z, false, false, false, false)
                SetEntityHeading(ped, Config.AllowTripFixLoc.AnimHeading)
                TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                FreezeEntityPosition(ped, true)
                exports['progressBars']:startUI(Config.TripFixTime *1000, Config.Sayings[43])
                Citizen.Wait(Config.TripFixTime *1000)
                using = false
                Fixed = true
                FreezeEntityPosition(ped, false)
                ClearPedTasksImmediately(ped)
                TriggerServerEvent('esx_humane:TripFix')
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if GetDistanceBetweenCoords(Config.MarkerLoc.x, Config.MarkerLoc.y, Config.MarkerLoc.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 4 then
            Citizen.Wait(5)
            local ped = GetPlayerPed(-1)
            DrawText3D(Config.MarkerLoc.x, Config.MarkerLoc.y, Config.MarkerLoc.z, Config.Sayings[44])
            if IsControlJustReleased(0, 38) and not using then
                SetEntityCoords(ped, Config.MarkerLoc2.x, Config.MarkerLoc2.y, Config.MarkerLoc2.z, false, false, false, false)
                SetEntityHeading(ped, Config.MarkerHead2)
                using = true
                Citizen.Wait(2000)
                using = false
            end
        elseif GetDistanceBetweenCoords(Config.MarkerLoc2.x, Config.MarkerLoc2.y, Config.MarkerLoc2.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 4 then
            Citizen.Wait(5)
            local ped = GetPlayerPed(-1)
            DrawText3D(Config.MarkerLoc2.x, Config.MarkerLoc2.y, Config.MarkerLoc2.z, Config.Sayings[45])
            if IsControlJustReleased(0, 38) and not using then
                SetEntityCoords(ped, Config.MarkerLoc.x, Config.MarkerLoc.y, Config.MarkerLoc.z, false, false, false, false)
                SetEntityHeading(ped, Config.MarkerHead)
                using = true
                Citizen.Wait(2000)
                using = false
            end
        else
            Citizen.Wait(2000)
        end
    end
end)