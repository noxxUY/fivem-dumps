GCM = {}
GCM.ServerCallbacks           = {}
GCM.CurrentRequestId          = 0

AddEventHandler('gcm:getSharedObject', function(cb)
	cb(GCM)
end)

-- Functions
	GCM.TriggerServerCallback = function(name, cb, ...)
		GCM.ServerCallbacks[GCM.CurrentRequestId] = cb

		TriggerServerEvent('gcm:triggerServerCallback', name, GCM.CurrentRequestId, ...)

		if GCM.CurrentRequestId < 65535 then
			GCM.CurrentRequestId = GCM.CurrentRequestId + 1
		else
			GCM.CurrentRequestId = 0
		end
	end

-- Sistema de texto 3D
	GCM.Text3D = {}
	GCM.Text3D.Table = {}
	-- GCM.Text3D.Add = function(mType, mPos, red, green, blue, alpha, rangeToShow, bobUpAndDown, mScale, mRot, mDir, faceCamera)
	GCM.Text3D.Add = function(tTexto, tPos, tRange, tScale)
		tRange = tRange ~= nil and tRange or 50.0

		local markerData = {
			text = tTexto,
			pos = tPos,
			range = tRange,
			scale = tScale
		}
		local tableKey = tostring(markerData)
		GCM.Text3D.Table[tableKey] = markerData
	
		return tableKey
	end

	GCM.Text3D.Remove = function(markerKey)
		GCM.Text3D.Table[markerKey].deleteNow = true
	end
	
	GCM.Text3D.In = function(markerKey)
		return GCM.Text3D.Table[markerKey].isInside
	end
	
	local textoWait = 500
	CreateThread(function()
		while true do
			Wait(textoWait)
			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)
			textoWait = 500
			
			for markerKey, marker in pairs(GCM.Text3D.Table) do
				if marker.deleteNow then
					marker = nil
				else
					if #(pedCoords - marker.pos) < marker.range then
						textoWait = 1
						Texto3D(marker.pos, marker.text)
					end
					if #(pedCoords - marker.pos) < marker.scale.x then
						marker.isInside = true
					else
						marker.isInside = false
					end
				end
			end
		end
	end)
--

-- Sistema de Markers
	GCM.Markers = {}
	GCM.Markers.Table = {}

	GCM.Markers.Add = function(mType, mPos, red, green, blue, alpha, rangeToShow, bobUpAndDown, mScale, mRot, mDir, inRange)
		rangeToShow = rangeToShow ~= nil and rangeToShow or 50.0
		mScale = mScale ~= nil and mScale or vec(1, 1, 1)
		mDir = mDir ~= nil and mDir or vec(0, 0, 0)
		mRot = mRot ~= nil and mRot or vec(0, 0, 0)
		bobUpAndDown = bobUpAndDown or false
		-- faceCamera = faceCamera or false
		-- textureDict = textureDict or nil
		-- textureName = textureName or nil
		
		if textureDict ~= nil then
			GCM.Streaming.RequestStreamedTextureDict(textureDict)
		end
		
		local markerData = {
			range = rangeToShow,
			type = mType,
			pos = mPos,
			dir = mDir,
			rot = mRot,
			scale = mScale,
			r = red,
			g = green,
			b = blue,
			a = alpha,
			bob = bobUpAndDown,
			-- faceCam = faceCamera,
			-- dict = textureDict,
			-- name = textureName,
			isInside = false,
			deleteNow = false,
			inRange = inRange
		}
		local tableKey = tostring(markerData)
		GCM.Markers.Table[tableKey] = markerData

		return tableKey
	end

	GCM.Markers.Remove = function(markerKey)
		GCM.Markers.Table[markerKey].deleteNow = true
		local textureDict = GCM.Markers.Table[markerKey].dict
		if textureDict ~= nil then
			SetStreamedTextureDictAsNoLongerNeeded(textureDict)
		end
	end

	GCM.Markers.In = function(markerKey)
		return GCM.Markers.Table[markerKey].isInside
	end

	local markerWait = 500
	CreateThread(function()
		while true do
			Wait(markerWait)
			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)
			markerWait = 500
			
			for markerKey, marker in pairs(GCM.Markers.Table) do
				if marker.deleteNow then
					marker = nil
				else
					if #(pedCoords - marker.pos) < marker.range then
						markerWait = 1
						DrawMarker(marker.type, marker.pos, marker.dir, marker.rot, marker.scale, marker.r, marker.g, marker.b, marker.a, marker.bob, marker.faceCam, 0, 1, marker.dict, marker.name, false)
					end
					if #(pedCoords - marker.pos) < marker.inRange then
						marker.isInside = true
					else
						marker.isInside = false
					end
				end
			end
		end
	end)

--

-- Functions
	GCM.TriggerServerCallback = function(name, cb, ...)
		GCM.ServerCallbacks[GCM.CurrentRequestId] = cb

		TriggerServerEvent('gcm:triggerServerCallback', name, GCM.CurrentRequestId, ...)

		if GCM.CurrentRequestId < 65535 then
			GCM.CurrentRequestId = GCM.CurrentRequestId + 1
		else
			GCM.CurrentRequestId = 0
		end
	end

	function esPedFreemode(playerPed)
		local ped = false
		if IsPedModel(playerPed, 'mp_f_freemode_01')  then
			ped = 'mp_f_freemode_01'
		elseif IsPedModel(playerPed, 'mp_m_freemode_01') then
			ped = 'mp_m_freemode_01'
		end
		return ped
	end

	function printGCM(texto, tipo)
		local color = '^7'
		if tipo == 'success' then
			color = '^2'
		elseif tipo == 'error' then
			color = '^1'
		end
		local textoFinal = '^3[GCMod] '..color..''..texto..'^7'
		print(textoFinal)
	end
	
	exports('esPedFreemode', esPedFreemode)
	exports("printGCM", printGCM)
--

-- Events 
	RegisterNetEvent('gcm:serverCallback')
	AddEventHandler('gcm:serverCallback', function(requestId, ...)
		GCM.ServerCallbacks[requestId](...)
		GCM.ServerCallbacks[requestId] = nil
	end)

	RegisterNetEvent('gcm:Notify')
	AddEventHandler('gcm:Notify', function(text, type)
		Notify(text, type)
	end)
--

function Texto3D(x, y, z, text)
	if (type(x) == 'table' or type(x) == 'vector3') and not text then
		text = y
		z = x.z
		y = x.y
		x = x.x
    end
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local factor = #text / 370
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 121, 121, 121, 20)
end