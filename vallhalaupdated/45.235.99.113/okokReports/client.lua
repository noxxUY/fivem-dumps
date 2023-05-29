Citizen.CreateThread(function()
	Wait(1000)
	TriggerServerEvent("okokReports:FetchFeedbackTable")
end)

-------------------------- VARS

local oneSync = false
local staff = false
local FeedbackTable = {}
local canFeedback = true
local timeLeft = Config.FeedbackCooldown

-------------------------- COMMANDS

RegisterCommand(Config.FeedbackClientCommand, function(source, args, rawCommand)
	if canFeedback then
		FeedbackMenu(false)
	else
		--exports['mythic_notify'].DoHudText('info', 'No puedes reportar  tan rapido')
		exports['okokNotify']:Alert("REPORT", "NO PUEDES REPORTAR TAN RAPIDO!", 10000, 'warning')
	end
end, false)

RegisterCommand(Config.FeedbackAdminCommand, function(source, args, rawCommand)
	if staff then
		FeedbackMenu(true)
	end
end, false)

-------------------------- MENU

function FeedbackMenu(showAdminMenu)
	SetNuiFocus(true, true)
	if showAdminMenu then
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
		SendNUIMessage({
			action = "OpenAdminFeedback",
		})
	else
		SendNUIMessage({
			action = "ClientFeedback",
		})
	end
end

-------------------------- EVENTS

RegisterNetEvent('okokReports:NewFeedback')
AddEventHandler('okokReports:NewFeedback', function(newFeedback)
	if staff then
		FeedbackTable[#FeedbackTable+1] = newFeedback
		--exports['mythic_notify'].DoHudText('info', 'Hay un nuevo  reporte pone /reports para ver los reportes')
exports['okokNotify']:Alert("REPORT", "Un usuario necesita ayuda!", 20000, 'success')
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
	end
end)

RegisterNetEvent('okokReports:FetchFeedbackTable')
AddEventHandler('okokReports:FetchFeedbackTable', function(feedback, admin, oneS)
	FeedbackTable = feedback
	staff = admin
	oneSync = oneS
end)

RegisterNetEvent('okokReports:FeedbackConclude')
AddEventHandler('okokReports:FeedbackConclude', function(feedbackID, info)
	local feedbackid = FeedbackTable[feedbackID]
	feedbackid.concluded = info

	SendNUIMessage({
		action = "updateFeedback",
		FeedbackTable = FeedbackTable
	})
end)

-------------------------- ACTIONS

RegisterNUICallback("action", function(data)
	if data.action ~= "concludeFeedback" then
		SetNuiFocus(false, false)
	end

	if data.action == "newFeedback" then
		--exports['mythic_notify'].DoHudText('succes', 'El reporte fue enviado hacia el staff')
		
		local feedbackInfo = {subject = data.subject, information = data.information, category = data.category}
		TriggerServerEvent("okokReports:NewFeedback", feedbackInfo)

		local time = Config.FeedbackCooldown * 60
		local pastTime = 0
		canFeedback = false

		while (time > pastTime) do
			Citizen.Wait(1000)
			pastTime = pastTime + 1
			timeLeft = time - pastTime
		end
		canFeedback = true
	elseif data.action == "assistFeedback" then
		if FeedbackTable[data.feedbackid] then
			if oneSync then
				TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
			else
				local playerFeedbackID = FeedbackTable[data.feedbackid].playerid
				local playerID = GetPlayerFromServerId(playerFeedbackID)
				local playerOnline = NetworkIsPlayerActive(playerID)
				if playerOnline then
					SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerFeedbackID))))
					TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
				else
					--exports['mythic_notify'].DoHudText('info', 'El jugador no esta en el server')
					exports['okokNotify']:Alert("REPORT", "El jugador no esta en el servdior!", 20000, 'error')
				end
			end
		end
	elseif data.action == "concludeFeedback" then
		local feedbackID = data.feedbackid
		local canConclude = data.canConclude
		local feedbackInfo = FeedbackTable[feedbackID]
		if feedbackInfo then
			if feedbackInfo.concluded ~= true or canConclude then
				TriggerServerEvent("okokReports:FeedbackConclude", feedbackID, canConclude)
				--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'info', text = 'Estás ayudando a FEEDBACK #"!' })
				exports['okokNotify']:Alert("FEEDBACK", "Feedback #"..feedbackID.." Ayudado!", 20000, 'success')
			end
		end
	end
end)