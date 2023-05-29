local fps = GetResourceKvpString('va-rp_fps') or false
fpsWeather = GetResourceKvpString('va-rp_fpsWeaher') or false
fpsTime = GetResourceKvpString('va-rp_fpsTime') or 13

Citizen.CreateThread(function()
    while true do
		local msec = 1000
		if fpsWeather then
			msec = 0
			ClearOverrideWeather()
			ClearWeatherTypePersist()
			SetWeatherTypePersist('EXTRASUNNY')
			SetWeatherTypeNow('EXTRASUNNY')
			SetWeatherTypeNowPersist('EXTRASUNNY')
		end
		Wait(msec)
    end
end)

Citizen.CreateThread(function()
    while true do
		local msec = 700
		if tonumber(fpsTime) then
			msec = 0
			NetworkOverrideClockTime(tonumber(fpsTime), 00, 00)
		end
		Wait(msec)
    end
end)

RegisterCommand("fps",function(source, args)
	if #args == 0 then
		enable_fps_optimization()
	elseif args[1] == "lluvia" then
		fpsWeather = not fpsWeather
		SetResourceKvp("va-rp_fpsWeaher", tostring(fpsWeather))
		if fpsWeather then
			exports['mythic_notify']:DoCustomHudText('inform', ('Deshabilitaste la lluvia.'), 5000)
		else
			exports['mythic_notify']:DoCustomHudText('inform', ('Habilitaste la lluvia.'), 5000)
		end
	elseif args[1] == "tiempo" then
		if tonumber(args[2]) then
			if args[2] == 'NO' or args[2] == 'no' then
				fpsTime = false
				exports['mythic_notify']:DoCustomHudText('inform', ('Deshabilitaste el horario fijado, ahora tendras un horario dinamico.'), 5000)
				return
			end

			if tonumber(args[2]) >= 0 and tonumber(args[2]) <= 24 then
				fpsTime = args[2]
				SetResourceKvp("va-rp_fpsTime", tonumber(args[2]))
				exports['mythic_notify']:DoCustomHudText('inform', ('Cambiaste el horario del dia a '..fpsTime), 5000)
			else
				TriggerEvent('chatMessage', Config.Lang.Prefix.."El tiempo a poner debe ser mayor a 0 y menor a 24.")
			end
		else
			TriggerEvent('chatMessage', getUsage("fps", "tiempo", "hora"))
		end
	end
end)

function enable_fps_optimization()
	fps = not fps
	if fps then
		SetResourceKvp("va-rp_fps", tostring(fps))
		SetTimecycleModifier("cinema")
		exports['mythic_notify']:DoCustomHudText('inform', ('Habilitaste la optimización de FPS.'), 5000)
	else
		SetResourceKvp("va-rp_fps", tostring(fps))
		SetTimecycleModifier("default")
		exports['mythic_notify']:DoCustomHudText('error', ('Deshabilitaste la optimización de FPS.'), 5000)
	end
end

function check_cache_fps_optimization()
	if GetResourceKvpString('va-rp_fps') == "true" then
		SetTimecycleModifier("cinema")
	end
end

--Logs muertes