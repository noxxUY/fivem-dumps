--[[settings = {}
settings.voice = {
    tipos = {
        def = 5.0,
        gri = 12.0,
        sus = 1.0,
        cu = 0
    },
    key = {
        dis = 243,
    }
}
local v = 0
local voiceUP = true
RegisterNetEvent('snowiVoiceShutDown', function(a)
    print(a)
if a == false then
voiceUP = false
elseif a == true then
    voiceUP = true
end end
)
local debugMode = false
RegisterCommand('voiceDebug', function()
if debugMode == true then
debugMode =false
print('Debug voice ->',debugMode)
else debugMode = true
print('Debug voice ->', debugMode)
end end)
AddEventHandler('onClientMapStart', function()
	print('Client map ')
    v = v+1
    --[[if v > 1 then
        return
    end--]]
    --[[TriggerServerEvent('snowiVoice',v)
        
		if settings.voice.tipos.cu == 0 then
			NetworkSetTalkerProximity(settings.voice.tipos.def)
		elseif settings.voice.tipos.cu == 1 then
			NetworkSetTalkerProximity(settings.voice.tipos.gri)
		elseif settings.voice.tipos.cu == 2 then
			NetworkSetTalkerProximity(settings.voice.tipos.sus)
		end
end)

AddEventHandler('playerSpawned', function()
	    NetworkSetTalkerProximity(5.0)
		print('5.0 spawned')
end)


Citizen.CreateThread(function()
	    RequestAnimDict('facials@gen_male@variations@normal')
	    RequestAnimDict('mp_facial')
	    while true do
	        Citizen.Wait(500)
	        local playerID = PlayerId()

	        for _,player in ipairs(GetActivePlayers()) do
	            local boolTalking = NetworkIsPlayerTalking(player)

	            if player ~= playerID then
	                if boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mic_chatter', 'mp_facial')
	                elseif not boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mood_normal_1', 'facials@gen_male@variations@normal')
	                end
                else
                    if boolTalking then
	                    PlayFacialAnim(GetPlayerPed(-1), 'mic_chatter', 'mp_facial')
	                elseif not boolTalking then
	                    PlayFacialAnim(GetPlayerPed(-1), 'mood_normal_1', 'facials@gen_male@variations@normal')
	                end
	            end
	        end
            


	    end
end)

Citizen.CreateThread(function()
		local isTalking = false
		local voicedis = nil
		while true do
			Citizen.Wait(1)
            if voiceUP == true then
			if IsControlJustPressed(1, settings.voice.key.dis) then
                print('Se suponeq ue hablo')
				settings.voice.tipos.cu = (settings.voice.tipos.cu + 1) % 3
				if settings.voice.tipos.cu == 0 then
                    print('Aqui normal')
					NetworkSetTalkerProximity(settings.voice.tipos.def)
					voicedis = 'normal'
				elseif settings.voice.tipos.cu == 1 then
					NetworkSetTalkerProximity(settings.voice.tipos.gri)
					voicedis = 'gri'
				elseif settings.voice.tipos.cu == 2 then
					NetworkSetTalkerProximity(settings.voice.tipos.sus)
					voicedis = 'sus'
				end
                SendNUIMessage({ action = 'setVoiceDistance', value = voiceDistance })
			end
			if settings.voice.tipos.cu == 0 then
				voicedis = 'normal'
			elseif settings.voice.tipos.cu == 1 then
				voicedis = 'gri'
			elseif settings.voice.tipos.cu == 2 then
				voicedis = 'sus'
			end
        else
            if debugMode == true then
                print('Voice no esta activado y no habla / cambia rangos de proximidad', voiceUP)
            end
        end
		end
end)--]]