ESX = nil

ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx_rpchat:sendProximityMessageME')
AddEventHandler('esx_rpchat:sendProximityMessageME' , function(playerId , title , message , color)
	local source                      = PlayerId()
	local target                      = GetPlayerFromServerId(playerId)
	local sourcePed , targetPed       = PlayerPedId() , GetPlayerPed(target)
	local sourceCoords , targetCoords = GetEntityCoords(sourcePed) , GetEntityCoords(targetPed)
	local distance                    = GetDistanceBetweenCoords(sourceCoords , targetCoords , true)
	if target == source then
		TriggerEvent('chat:addMessage' , { template = '<div style="padding: 0.0vw; margin: 0.0vw; "><span class="badge badge-me"><i class="fas fa-user"></i>&nbsp; ACCIÓN PERSONAL</span> ' .. title .. ' ' .. message .. '</div>' } , { args = { title, message }, color = color })
	elseif distance < 20 and distance ~= 0 and distance > 0.1 then
		TriggerEvent('chat:addMessage' , { template = '<div style="padding: 0.0vw; margin: 0.0vw; "><span class="badge badge-me"><i class="fas fa-user"></i>&nbsp; ACCIÓN PERSONAL</span> ' .. title .. ' ' .. message .. '</div>' } , { args = { title, message }, color = color })
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageDO')
AddEventHandler('esx_rpchat:sendProximityMessageDO' , function(playerId , title , message , color)
	local source                      = PlayerId()
	local target                      = GetPlayerFromServerId(playerId)
	local sourcePed , targetPed       = PlayerPedId() , GetPlayerPed(target)
	local sourceCoords , targetCoords = GetEntityCoords(sourcePed) , GetEntityCoords(targetPed)
	local distance                    = GetDistanceBetweenCoords(sourceCoords , targetCoords , true)
	if target == source then
		TriggerEvent('chat:addMessage' , { template = '<div style="padding: 0.0vw; margin: 0.0vw; "><span class="badge badge-do"><i class="fas fa-street-view"></i>&nbsp; ACCIÓN ENTORNO</span> ' .. title .. ' ' .. message .. '</div>' } , { args = { title, message }, color = color })
	elseif distance < 20 and distance ~= 0 and distance > 0.1 then
		TriggerEvent('chat:addMessage' , { template = '<div style="padding: 0.0vw; margin: 0.0vw; "><span class="badge badge-do"><i class="fas fa-street-view"></i>&nbsp; ACCIÓN ENTORNO</span> ' .. title .. ' ' .. message .. '</div>' } , { args = { title, message }, color = color })
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageACA')
AddEventHandler('esx_rpchat:sendProximityMessageACA' , function(playerId , title , message , color)
	local source                      = PlayerId()
	local target                      = GetPlayerFromServerId(playerId)
	local sourcePed , targetPed       = PlayerPedId() , GetPlayerPed(target)
	local sourceCoords , targetCoords = GetEntityCoords(sourcePed) , GetEntityCoords(targetPed)
	local distance                    = GetDistanceBetweenCoords(sourceCoords , targetCoords , true)
	if target == source then
		TriggerEvent('chat:addMessage' , { template = '<div style="padding: 0.6vw; margin: 0.5vw; border-left: 6px solid; border-color: rgba(255, 174, 0, 0.8);"><i class="fas fa-wrench" style="color: rgba(255, 174, 0)"></i>&nbsp; A.C.A <div style= "margin: 0.05vw;"' .. title .. ' ' .. message ..  '</div>', } , { args = { title, message }, color = color })
	elseif distance < 11000 and distance ~= 0 and distance > 0.1 then
		TriggerEvent('chat:addMessage' , { template = '<div style="padding: 0.6vw; margin: 0.5vw; border-left: 6px solid; border-color: rgba(255, 174, 0, 0.8);"><i class="fas fa-wrench" style="color: rgba(255, 174, 0)"></i>&nbsp; A.C.A <div style= "margin: 0.05vw;"' .. title .. ' ' .. message ..  '</div>', } , { args = {  message }, color = color })
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/anon',  _U('anon_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/ooc',   _U('ooc_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/oop', _U('oop_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/news', _U('news_help'), { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/dados', _U('dados_help'), { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
		TriggerEvent('chat:removeSuggestion', '/anon')
		TriggerEvent('chat:removeSuggestion', '/oop')
		TriggerEvent('chat:removeSuggestion', '/ooc')
		TriggerEvent('chat:removeSuggestion', '/news')
	end
end)



local font = 4 -- Font of the text
local time = 550 -- Duration of the display of the text : 500 ~= 13sec
local msgQueue = {}

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
end

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
        SetTextScale(0.0*scale, 0.55*scale)
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


