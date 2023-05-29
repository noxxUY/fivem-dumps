local holdingUp = false
local store = ''
local blipRobbery = nil

function DrawTxt(x,y, width, height, scale, text, r, g, b, a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then
        SetTextOutline()
    end
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width / 2, y - height / 2 + 0.005)
end

RegisterNetEvent('esx_robosgrandes:currentlyRobbing')
AddEventHandler('esx_robosgrandes:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('esx_robosgrandes:killBlip')
AddEventHandler('esx_robosgrandes:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_robosgrandes:setBlip')
AddEventHandler('esx_robosgrandes:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position)
	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 0.6)
	SetBlipColour(blipRobbery, 3)
	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_robosgrandes:tooFar')
AddEventHandler('esx_robosgrandes:tooFar', function()
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_cancelled'))
end)

RegisterNetEvent('esx_robosgrandes:robberyComplete')
AddEventHandler('esx_robosgrandes:robberyComplete', function(award)
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('esx_robosgrandes:startTimer')
AddEventHandler('esx_robosgrandes:startTimer', function()
	local timer = Stores[store].secondsRemaining
	CreateThread(function()
		while timer > 0 and holdingUp do
			Wait(1000)
			if timer > 0 then
				timer = timer - 1
			end
		end
	end)
	CreateThread(function()
		while holdingUp do
			Wait(0)
			DrawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

CreateThread(function()
	for k,v in pairs(Stores) do
		local blip = AddBlipForCoord(v.position)
		SetBlipSprite(blip, v.blip)
		SetBlipScale(blip, 0.6)
		SetBlipColour (blip, v.bcolor)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.CatRobo)
		EndTextCommandSetBlipName(blip)
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		local playerPos, letSleep = GetEntityCoords(PlayerPedId()), true
		for k,v in pairs(Stores) do
			local distance = #(playerPos - v.position)
			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
                    letSleep = false
					DrawMarker(Config.Marker.Type, v.position, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, 10, false, false, 2, false, false, false, false)
					if distance < 2.0 then
										
						local ped = PlayerPedId()
						local playerCoords = GetEntityCoords(ped)
						-- ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))
					ESX.ShowFloatingHelpNotification(_U('press_to_rob', v.nameOfStore), vector3(playerCoords["x"], playerCoords["y"], playerCoords["z"] + 0.81))

						--[[ if IsControlJustReleased(0, 38) then
							if IsPedArmed(PlayerPedId(), 4) then
								TriggerServerEvent('esx_robosgrandes:robberyStarted', k)
							else
								ESX.ShowNotification(_U('no_threat'))
							end
						end ]]

						--

						if IsControlJustReleased(0, 38) then
							if IsPedArmed(PlayerPedId(), 4) then
								if Stores[k].paramafias then
									local jobList = { 'mafia02', 'mafia03', 'mafia04', 'mafia05', 'mafia06', 'mafia07', 'mafia08', 'mafia09', 'mafia10', 'mafia11', 'mafia12', 'mafia13', 'mafia14', 'mafia15', 'mafia16', 'mafia17', 'mafia18', 'mafia19', 'mafia20', 'mafia21', 'mafia22', 'mafia23', 'mafia24', 'mafia25', 'mafia26', 'mafia27', 'mafia28', 'mafia29', 'mafia30', 'mafia31', 'mafia32', 'mafia33', 'mafia34', 'mafia35', 'mafia36', 'mafia37', 'mafia38', 'mafia39', 'mafia40', 'mafia41', 'mafia42', 'mafia43', 'mafia44', 'mafia45', 'mafia46', 'mafia47', 'mafia48', 'mafia49', 'mafia50'}
									local playerJob = ESX.PlayerData.job.name

									for i=1, #jobList, 1 do
										if playerJob == jobList[i] then
										  jobMatch = true
										  break
										end
									  end
								
									  if jobMatch then
										TriggerServerEvent('esx_robosgrandes:robberyStarted', k)
									  else
										ESX.ShowNotification(_U('no_sosmafia'))
									  end

									  
								else
									TriggerServerEvent('esx_robosgrandes:robberyStarted', k)
								end
							else
								ESX.ShowNotification(_U('no_threat'))
							end
						end


					end
				end
                break
			end
		end
		if holdingUp then
            letSleep = false
			if #(playerPos - Stores[store].position) > Config.MaxDistance then
				TriggerServerEvent('esx_robosgrandes:tooFar', store)
			end
		end
        if letSleep then
            Wait(500)
        end
	end
end)
