activeGangs = {}
myGangId = nil
myGangGrade = nil

function getGangID()
	return myGangId
end
function getGangGrade()
	return myGangGrade
end

function getGangName()
	if myGangId ~= nil and activeGangs[myGangId] then
		return activeGangs[myGangId].gangName
	else
		return ''
	end
end

myGangGradeName = ''
RegisterNetEvent('m7_mafias:getGangGradeName')
AddEventHandler('m7_mafias:getGangGradeName', function(name)
	myGangGradeName = name
end)
function getGangGradeName()
	return myGangGradeName 
end

function getMugshot(ped)
	local mugshot = RegisterPedheadshot(ped)

	while not IsPedheadshotReady(mugshot) do
		Citizen.Wait(5)
	end

	return mugshot, GetPedheadshotTxdString(mugshot)
end

RegisterNetEvent('m7_mafias:sendNotfication')
AddEventHandler('m7_mafias:sendNotfication', function(title, subject, msg, icon, iconType)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, false)	
end)

RegisterNetEvent('m7_mafias:sendNotficationFromPlayer')
AddEventHandler('m7_mafias:sendNotficationFromPlayer', function( target , title, subject, msg, iconType)
	target = GetPlayerFromServerId(target)
	local targetPed = GetPlayerPed(target)
	local mugshot, mugshotStr = getMugshot(targetPed)
	SetNotificationTextEntry('STRING') 
	AddTextComponentSubstringPlayerName(msg)
	SetNotificationMessage(mugshotStr, mugshotStr, false, iconType, title, subject)
	DrawNotification(false, false)	
	UnregisterPedheadshot(mugshot)
end)

RegisterNetEvent('m7_mafias:showHelpNotfication')
AddEventHandler('m7_mafias:showHelpNotfication', function(msg)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandDisplayHelp(0, false, true, -1)
end)


Citizen.CreateThread(function()
	while myGangId == nil do
		TriggerServerEvent("m7_mafias:getActiveGang")
		Citizen.Wait(500)
	end
end)


RegisterCommand("gang", function()
	TriggerServerEvent("m7_mafias:getActiveGang")
end)


RegisterNetEvent('m7_mafias:setGang')
AddEventHandler('m7_mafias:setGang', function(gangId , gradeId)
	myGangId = gangId
	myGangGrade = gradeId
	if activeGangs[gangId] ~= nil and activeGangs[gangId].haveGPS == 1 then
		TriggerServerEvent("m7_mafias:forceBlipGangMemberGet",gangId)
	end
	TriggerServerEvent('m7_mafias:getGangGradeName', myGangId,myGangGrade)
	checkActionMenuPressed()
	redrawBlips()
end)

RegisterNetEvent('m7_mafias:changeGangData')
AddEventHandler('m7_mafias:changeGangData', function(gangsData , id)
	if  activeGangs[id] and activeGangs[id] ~= nil then
		activeGangs[id] = gangsData
		if activeGangs[id].haveGPS == 1 then
			TriggerServerEvent("m7_mafias:forceBlipGangMemberGet",id)
		end
	end 
	
	redrawBlips()
end)

RegisterNetEvent('m7_mafias:setGangData')
AddEventHandler('m7_mafias:setGangData', function(gangsData , gangId , gradeId )
	activeGangs = {}
	for _key, gang in pairs(gangsData) do
		activeGangs[gang.id] = gang
	end
	if gangId > -2 and gradeId > -2 then
		myGangId = gangId
		myGangGrade = gradeId
		TriggerServerEvent('m7_mafias:getGangGradeName', myGangId,myGangGrade)
	end
	checkActionMenuPressed()
	redrawBlips()
end)

RegisterNetEvent('m7_mafias:setGangAccountMoney')
AddEventHandler('m7_mafias:setGangAccountMoney', function( gangId , typeTransaction , amount )
	if  activeGangs[gangId] and activeGangs[gangId] ~= nil then
		if typeTransaction == 'add' then
			activeGangs[gangId].accountMoney = math.floor(activeGangs[gangId].accountMoney + amount)
		elseif typeTransaction == 'set' then
			activeGangs[gangId].accountMoney = amount
		else
			activeGangs[gangId].accountMoney = math.floor(activeGangs[gangId].accountMoney - amount)
		end
	end 
end)

RegisterNetEvent('m7_mafias:panicShout')
AddEventHandler('m7_mafias:panicShout', function(targetCoords, gangID, name)
	if myGangId == gangID then
		local alpha = 250
		--local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)
		local gunshotBlip1 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		ESX.ShowNotification("~s~[~b~AYUDA~s~] ~r~" .. name .. "~s~ envió una señal de pánico")

		SetBlipSprite(gunshotBlip1, 161)
		SetBlipScale(gunshotBlip1, 2.0)
		SetBlipColour(gunshotBlip1, 1)
		SetBlipRoute(gunshotBlip1, true)
		SetBlipRouteColour(gunshotBlip1, 3)
		SetBlipDisplay(gunshotBlip1, 2)

		PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(200)
			alpha = alpha - 1
			if alpha == 0 then
				RemoveBlip(gunshotBlip1)
				return
			end
		end
	end
end)
