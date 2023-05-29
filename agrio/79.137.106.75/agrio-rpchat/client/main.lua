ESX = nil

Citizen.CreateThread(function()
	while esx == nil do
		TriggerEvent('esx:getSharedObject', function(obj) esx = obj end)
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

TriggerEvent("chat:addSuggestion", "/msg", _U("generic_argument_name"), {{name = _U("generic_argument_name"), help = _U("generic_argument_help")}})

RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
	TriggerEvent('esx_rpchat:sendProximityMessage', -1, id, _U('oop_prefix', id), message, { 150, 154, 148 })

    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
		TriggerEvent('esx_rpchat:sendProximityMessage', -1, id, _U('oop_prefix', id), message, { 150, 154, 148 })
    end
end)



--[[local font = 0 
local time = 500 
local msgQueue = {}

RegisterNetEvent('esx_rpchat:drawOnHead')
AddEventHandler('esx_rpchat:drawOnHead', function(text, color, source)
    Display(GetPlayerFromServerId(source), text, color)
end)

function Display(mePlayer, text, color)
	local timer = 0
	if msgQueue[mePlayer] == nil then
		msgQueue[mePlayer] = {}
    end
	table.insert(msgQueue[mePlayer], { txt = text , c= color, tim = 0 })
    while tablelength(msgQueue[mePlayer]) > 0 do
        Wait(0)
        timer = timer + 1
		local coords = GetEntityCoords(GetPlayerPed(mePlayer), false)
		local lineNumber = 1
		for k, v in pairs(msgQueue[mePlayer]) do
			DrawText3D(coords['x'], coords['y'], coords['z']+lineNumber, v.txt, v.c)
			lineNumber = lineNumber + 0.12
			if(v.tim > time)then
				msgQueue[mePlayer][k] = nil
			else
				v.tim= v.tim + 1
			end
		end
    end
end]]--

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end

function DrawText3D(x,y,z, text, color)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.35*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

RegisterNetEvent('esx_rpchat:setGroup')
AddEventHandler('esx_rpchat:setGroup', function(g)
    group = g
end)

RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local target = GetPlayerFromServerId(playerId)
	if target == nil or target == -1 then
		return
	end
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	local distance = #(sourceCoords - targetCoords)
	if target ~= nil and target == player or distance < 12 or (NetworkIsInSpectatorMode() and distance < 20) then
		if title == "me" then
			TriggerEvent('chat:addMessage', {
				template = '<div class="me_box">{0}: <span>'.. message ..'</span></div>',
				args = { "ME · [" .. playerId .. "]", message }
			})
		elseif title == "do" then
			TriggerEvent('chat:addMessage', {
				template = '<div class="do_box">{0}: <span>'.. message ..'</span></div>',
				args = { "DO · [" .. playerId .. "]", message }
			})
		elseif title == "intentar" then
			TriggerEvent('chat:addMessage', {
				template = '<div class="try_box">{0}: <span>'.. message ..'</span></div>',
				args = { "[" .. playerId .. "]", message }
			})
		elseif title == "oop" then
			TriggerEvent('chat:addMessage', {
				template = '<div class="oop_box">{0}: <span>'.. message ..'</span></div>',
				args = { "OOP · [".. playerId .."]", "message" }
			})
		elseif title == "ayuda" then
            TriggerEvent('chat:addMessage', {
                template = '<div class="ayuda_box">{0}: <span>'.. message ..'</span></div>',
				args = { "Ayuda · [".. playerId .."]", "message" }
			})
		elseif title == "id" then
            TriggerEvent('chat:addMessage', {
                template = '<div class="id_box">{0}: <span>'.. message ..'</span></div>',
				args = { "ID · [".. playerId .."]", "message" }
			})
		elseif title == "staff" then
            TriggerEvent('chat:addMessage', {
                template = '<div class="staff_box">{0}: <span>'.. message ..'</span></div>',
				args = { "ADMINISTRACION · [".. playerId .."]", "message" }
			})
		elseif title == "dados" then
            TriggerEvent('chat:addMessage', {
                template = '<div class="dados_box">{0}: <span>'.. message ..'</span></div>',
				args = { "[" .. playerId .. "]", message }
			})
		else
			if message ~= nil then
				TriggerEvent("chat:addMessage", {args = {title, message}, color = color})
			else
				TriggerEvent("chat:addMessage", {args = {title}, color = color})
			end
		end
	end
end)

-- ID
RegisterNetEvent('sendProximityMessageId')
AddEventHandler('sendProximityMessageId', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {51, 255, 255}, "^*[" .. id .."] ^*ID: ".." ^7^r" .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 50000.999 then
    TriggerEvent('chatMessage', "", {51, 255, 255}, "^*[" .. id .."] ^*ID: ".." ^7^r" .. message)
  end
end)


RegisterNetEvent('esx_rpchat:sendProximityMessageRoll')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
    local target = GetPlayerFromServerId(playerId)
    if target == nil or target == -1 then
        return
    end
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    local distance = #(sourceCoords - targetCoords)

end)

RegisterNetEvent('sendProximityMessageRoll')
AddEventHandler('sendProximityMessageRoll', function(id, name, num)

    local target = GetPlayerFromServerId(id)
    if target == nil or target == -1 then
        return
    end
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    local distance = #(sourceCoords - targetCoords)
    if target ~= nil and target == player or distance < 8 or (NetworkIsInSpectatorMode() and distance < 20) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="dados_box">{0}:  <span>'.. num ..'</span></div>',
            args = { "[🎲]  [" .. id .. "]: ha lanzado los dados y ha sacado un" }
        })
    end
end)


-- DISPONIBILIDAD POLICIAL
RegisterNetEvent('sendProximityMessageDispo')
AddEventHandler('sendProximityMessageDispo', function(id, name)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {55, 141, 211}, "^*👮 ¿Habría policía disponible? ".." ^7^r" )
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 50000.999 then
    TriggerEvent('chatMessage', "", {55, 141, 211}, "^*👮 ¿Habría policía disponible? ".." ^7^r" )
  end
end)


--[[RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if target == source then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 15 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	end
end)]]--



Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/ayuda',  _U('ayuda_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/anon',  _U('anon_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/oop',   _U('oop_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/news', _U('news_help'), { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/' .. Config.Command,  'Manda un mensaje privado a compañeros de trabajo.', { { name = 'Mensaje', help = 'Mensaje privado de trabajo' } })
	--TriggerEvent('chat:addSuggestion', '/' .. Config.rCommand,  'Manda un mensaje privado Policía - Emergencias', { { name = 'Mensaje', help = 'Mensaje privado Policía - EMS' } })
	 -- TriggerEvent('chat:addSuggestion', '/me',  'Para realizar acciones.', { { name = 'Mensaje', help = 'Ej: Saca la cartera y paga.' } })
	--  TriggerEvent('chat:addSuggestion', '/do',  'Para simular entornos.', { { name = 'Mensaje', help = 'Ej: Se veria una herida en la pierna.' } })
	  TriggerEvent('chat:addSuggestion', '/ayuda',  'Para solicitar ayuda', { { name = 'Mensaje', help = 'Solicita ayuda o expón tus dudas del juego. Deben contestarse por /msg.' } })
	  --TriggerEvent('chat:addSuggestion', '/bug',  'Para informar de un bug', { { name = 'Mensaje', help = 'Explica el bug y te atenderemos lo antes posible.' } })
	TriggerEvent('chat:addSuggestion', '/dispo',  'Para informarte de la disponibilidad policial', { { name = 'No hay que escribir nada.', help = 'No hay que escribir nada.' } })
	  TriggerEvent('chat:addSuggestion', '/id',  'Para preguntar la id de una persona)', { { name = 'Mensaje', help = 'No abuseis de esto y la persona debe responder por /msg' } })
	  TriggerEvent('chat:addSuggestion', '/poli',  'Para mandar un mensaje policial', { { name = 'Mensaje', help = 'Ej: Recomendamos no acercarse al Badulaque, está habiendo un atraco.' } })
	  --TriggerEvent('chat:addSuggestion', '/ems',  'Para mandar un mensaje de emergencias', { { name = 'Mensaje', help = 'Ej: Ambulancia en camino a 5KM de destino.' } })
	  --TriggerEvent('chat:addSuggestion', '/ls',  'Manda un mensaje como mecánico de Los Santos Customs', { { name = 'Mensaje', help = 'Ej: Talleres Los Santos Customs acaba de abrir, pásate y mejora tu vehículo.' } })
	--TriggerEvent('chat:addSuggestion', '/ws',  'Manda un mensaje como trabajador de Weed Shop', { { name = 'Mensaje', help = 'Ej: Weed Shop acaba de abrir, pásate y mejora tu vehículo.' } })
  
	--TriggerEvent('chat:addSuggestion', '/bennys',  'Manda un mensaje como mecánico de Bennys', { { name = 'Mensaje', help = 'Ej: Talleres Bennys acaba de abrir, pásate y mejora tu vehículo.' } })
	--TriggerEvent('chat:addSuggestion', '/exotics',  'Manda un mensaje como mecánico de Exotics', { { name = 'Mensaje', help = 'Ej: Talleres Exotics acaba de abrir, pásate y mejora tu vehículo.' } })
   -- TriggerEvent('chat:addSuggestion', '/norte',  'Manda un mensaje como mecánico de Norte', { { name = 'Mensaje', help = 'Ej: Talleres Norte acaba de abrir, pásate y mejora tu vehículo.' } })
  
   -- TriggerEvent('chat:addSuggestion', '/bahamas',  'Manda un mensaje como empleado del Bahamas', { { name = 'Mensaje', help = 'Ej: Fiesta en el Bahamas, entrada gratuíta, pásate a tomarte unas copas.' } })
   -- TriggerEvent('chat:addSuggestion', '/unicorn',  'Manda un mensaje como empleado del Unicorn', { { name = 'Mensaje', help = 'Ej: Fiesta en el Unicorn, entrada gratuíta, pásate a tomarte unas copas.' } })
   -- TriggerEvent('chat:addSuggestion', '/tequila',  'Manda un mensaje como empleado del Tequila', { { name = 'Mensaje', help = 'Ej: Fiesta en el Tequila, entrada gratuíta, pásate a tomarte unas copas.' } })
   -- TriggerEvent('chat:addSuggestion', '/yellow',  'Manda un mensaje como empleado del Yellow', { { name = 'Mensaje', help = 'Ej: Fiesta en el Yellow, entrada gratuíta, pásate a tomarte unas copas' } })
   -- TriggerEvent('chat:addSuggestion', '/skybar',  'Manda un mensaje como empleado del Skybar', { { name = 'Mensaje', help = 'Ej: Fiesta en el Skybar, entrada gratuíta, pásate a tomarte unas copas' } })
  
	TriggerEvent('chat:addSuggestion', '/ad',  'Manda un mensaje como empleado', { { name = 'Mensaje', help = 'Ej: Acabamos de abrir, ofertas increibles' } })
  
	  --TriggerEvent('chat:addSuggestion', '/taxi',  'Manda un mensaje como taxista', { { name = 'Mensaje', help = 'Ej: Contamos con los mejores conductores de la ciudad.' } })
	--TriggerEvent('chat:addSuggestion', '/dc',  'Manda un mensaje que no podrá ver la policia. Precio: 1000$.', { { name = 'Mensaje', help = 'Ej: Vendo escopeta. Precio 10000$. Telefono de contacto: 33546.' } })
	TriggerEvent('chat:addSuggestion', '/anuncio',  'Manda un anuncio IC', { { name = 'Mensaje', help = 'Ej: Vendo Blista de color naranja, seminuevo, 5000 km. Tel:45234. No utilizar los anuncios para negociar, sólo para anunciar.' } })
	TriggerEvent('chat:addSuggestion', '/msg',  'Manda un mensaje privado', { { name = 'ID] [Mensaje', help = 'Para enviar mensajes privados, no se debe abusar de esta opción. Para contestar /ayuda es obligatorio el uso de /msg.' } })
	TriggerEvent('chat:addSuggestion', '/report',  'Manda un reporte al staff', { { name = 'Mensaje', help = 'Explica tu reporte, sé lo más preciso posible. Te atenderemos en cuanto podamos' } })	
  end)
  


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
		TriggerEvent('chat:removeSuggestion', '/anon')
		TriggerEvent('chat:removeSuggestion', '/ooc')
		TriggerEvent('chat:removeSuggestion', '/news')
	end
end)