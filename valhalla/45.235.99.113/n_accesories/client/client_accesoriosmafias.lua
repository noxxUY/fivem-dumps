ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject' , function(obj)
			ESX = obj
		end)
		Citizen.Wait(360)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(160)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded' , function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob' , function(job)
	ESX.PlayerData.job = job
end)

function DrawText3Ds(x , y , z , text)
	local onScreen , _x , _y = World3dToScreen2d(x , y , z)
	local px , py , pz       = table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.32 , 0.32)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255 , 255 , 255 , 255)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x , _y)
	local factor = (string.len(text)) / 500
	DrawRect(_x , _y + 0.0125 , 0.015 + factor , 0.03 , 0 , 0 , 0 , 80)
end

local insideMarker = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'gendarmeria') then
			for k , v in pairs(Config.AttachmentZones.Gendarmeria) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , 57, 76, 41, 100, false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end		
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'losmonos') then
			for k , v in pairs(Config.AttachmentZones.losmonos) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , 50, 50, 204, 100, false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , Config.AttachmentsDraw3DText)
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'psg') then
			for k , v in pairs(Config.AttachmentZones.psg) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia3') then
			for k , v in pairs(Config.AttachmentZones.Mafia3) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia4') then
			for k , v in pairs(Config.AttachmentZones.Mafia4) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia5') then
			for k , v in pairs(Config.AttachmentZones.Mafia5) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia6') then
			for k , v in pairs(Config.AttachmentZones.Mafia6) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia7') then
			for k , v in pairs(Config.AttachmentZones.Mafia7) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'police') then
			for k , v in pairs(Config.AttachmentZones.Police) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , 50, 50, 204, 100, false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~b~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia8') then
			for k , v in pairs(Config.AttachmentZones.Mafia8) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end		
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia9') then
			for k , v in pairs(Config.AttachmentZones.Mafia9) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia10') then
			for k , v in pairs(Config.AttachmentZones.Mafia10) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia11') then
			for k , v in pairs(Config.AttachmentZones.Mafia11) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia12') then
			for k , v in pairs(Config.AttachmentZones.Mafia12) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia13') then
			for k , v in pairs(Config.AttachmentZones.Mafia13) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia14') then
			for k , v in pairs(Config.AttachmentZones.Mafia14) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia15') then
			for k , v in pairs(Config.AttachmentZones.Mafia15) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia16') then
			for k , v in pairs(Config.AttachmentZones.Mafia16) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia17') then
			for k , v in pairs(Config.AttachmentZones.Mafia17) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia18') then
			for k , v in pairs(Config.AttachmentZones.Mafia18) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia19') then
			for k , v in pairs(Config.AttachmentZones.Mafia19) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia20') then
			for k , v in pairs(Config.AttachmentZones.Mafia20) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia21') then
			for k , v in pairs(Config.AttachmentZones.Mafia21) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia22') then
			for k , v in pairs(Config.AttachmentZones.Mafia22) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia23') then
			for k , v in pairs(Config.AttachmentZones.Mafia23) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == 'mafia24') then
			for k , v in pairs(Config.AttachmentZones.Mafia24) do
				local distance = Vdist(coords , v.x , v.y , v.z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.AttachmentsMarker , v.x , v.y , v.z - 0.975 , 0.0 , 0.0 , 0.0 , 0.0 , 0 , 0.0 , Config.AttachmentsMarkerScale.x , Config.AttachmentsMarkerScale.y , Config.AttachmentsMarkerScale.z , Config.AttachmentsMarkerColor.r , Config.AttachmentsMarkerColor.g , Config.AttachmentsMarkerColor.b , Config.AttachmentsMarkerColor.a , false , true , 2 , true , false , false , false)
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.x , v.y , v.z , '~g~[E]~w~ - Menú de accesorios')
					if IsControlJustPressed(0 , Config.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
	end
end)

function WeapSplit(inputstr , del)
	if del == nil then
		del = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr , "([^" .. del .. "]+)") do
		table.insert(t , str)
	end
	return t
end

function PedHasWeapon(hash)
	for k , v in pairs(ESX.GetPlayerData().loadout) do
		if v.name == hash then
			return true
		end
	end
	return false
end

-- Function for Attachment menu:
function AttachmentMenu()
	local elements = {}
	local ped      = PlayerPedId()
	
	for k , v in pairs(Config.WeaponsInArmory) do
		if v.attachment == true then
			table.insert(elements , { label = v.label, weaponhash = v.weaponHash, type = v.type, attachment = v.attachment, flashlight = v.flashlight, scope = v.scope, suppressor = v.suppressor })
		end
	end
	
	ESX.UI.Menu.Open('default' , GetCurrentResourceName() , "esx_policeArmory_attachment_menu" ,
	                 {
		                 title    = "Menú de accesorios",
		                 align    = "bottom-right",
		                 elements = elements
	                 } ,
	                 function(data , menu)
		                 if data.current.weaponhash == data.current.weaponhash then
			                 if GetSelectedPedWeapon(ped) == GetHashKey(data.current.weaponhash) then
				                 ListOfAttachments(data.current.type , data.current.label , data.current.weaponhash , data.current.attachment , data.current.flashlight , data.current.scope , data.current.suppressor)
			                 else
				                 --ESX.ShowNotification(Config.WeaponMustBeInHand)
				                 exports['mythic_notify']:SendAlert('inform' , '¡La arma debe estar en la mano!')
			                 end
		                 end
	                 end , function(data , menu)
				menu.close()
				insideMarker = false
			end , function(data , menu)
			end)
end

-- Function for Attachment List Menu:
function ListOfAttachments(type,name,weaponhash,attachment,flashlight,scope,suppressor)
    local elements = {}

    local ped = PlayerPedId()

    if flashlight then
        local state = HasPedGotWeaponComponent(ped, weaponhash, flashlight)
        local text

        if state then
            text = "Linterna: "..('<span style="color:green;">%s</span>'):format("On")
        else
            text = "Linterna: "..('<span style="color:red;">%s</span>'):format("Off")
        end

        table.insert(elements, {
            label = text,
            value = flashlight,
            state = not state
        })
    end

    if scope then
        local state = HasPedGotWeaponComponent(ped, weaponhash, scope)
        local text

        if state then
            text = "Mira: "..('<span style="color:green;">%s</span>'):format("On")
        else
            text = "Mira: "..('<span style="color:red;">%s</span>'):format("Off")
        end

        table.insert(elements, {
            label = text,
            value = scope,
            state = not state
        })
    end

    if suppressor then
        local state = HasPedGotWeaponComponent(ped, weaponhash, suppressor)
        local text

        if state then
            text = "Silenciador: "..('<span style="color:green;">%s</span>'):format("On")
        else
            text = "Silenciador: "..('<span style="color:red;">%s</span>'):format("Off")
        end

        table.insert(elements, {
            label = text,
            value = suppressor,
            state = not state
        })
    end
	
	ESX.UI.Menu.Open('default' , GetCurrentResourceName() , 'policeArmory_list_of_attachments' , {
		title    = 'MENÚ DE ' .. name,
		align    = 'bottom-right',
		elements = elements
	} , function(data , menu)
		local newData = data.current
		
		if data.current.value == flashlight then
			if data.current.state then
				newData.label = "Linterna: " .. ('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped , weaponhash , data.current.value)
				--ESX.ShowNotification(string.format(Config.FlashlightEquipped,name))
				exports['mythic_notify']:SendAlert('success' , '¡Equipaste una linterna en ' .. name .. '!')
			else
				newData.label = "Linterna: " .. ('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped , weaponhash , data.current.value)
				--ESX.ShowNotification(string.format(Config.FlashlightRemove,name))
				exports['mythic_notify']:SendAlert('error' , '¡Sacaste la linterna de ' .. name .. '!')
			end
		elseif data.current.value == scope then
			if data.current.state then
				newData.label = "Mira: " .. ('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped , weaponhash , data.current.value)
				--ESX.ShowNotification(string.format(Config.ScopeEquipped,name))
				exports['mythic_notify']:SendAlert('success' , '¡Equipaste una mira en ' .. name .. '!')
			else
				newData.label = "Mira: " .. ('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped , weaponhash , data.current.value)
				--ESX.ShowNotification(string.format(Config.ScopeRemove,name))
				exports['mythic_notify']:SendAlert('error' , '¡Sacaste la mira de ' .. name .. '!')
			end
		elseif data.current.value == suppressor then
			if data.current.state then
				newData.label = "Silenciador: " .. ('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped , weaponhash , data.current.value)
				--ESX.ShowNotification(string.format(Config.SuppressorEquipped,name))
				exports['mythic_notify']:SendAlert('success' , '¡Equipaste un silenciador en ' .. name .. '!')
			else
				newData.label = "Silenciador: " .. ('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped , weaponhash , data.current.value)
				--ESX.ShowNotification(string.format(Config.SuppressorRemove,name))
				exports['mythic_notify']:SendAlert('error' , '¡Sacaste un silenciador de ' .. name .. '!')
			end
		end
		
		newData.state = not data.current.state
		menu.update({ value = data.current.value } , newData)
		menu.refresh()
	end , function(data , menu)
		menu.close()
	end)
end

