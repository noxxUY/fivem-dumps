function PlayUrl(name_, url_, volume_, loop_, options)
    if Config.UseExternalxSound then
        exports["xsound"]:PlayUrl(name_, url_, volume_, loop_, options)
        return
    end
    if disableMusic then return end
    SendNUIMessage({
        type = "url",
        name = name_,
        url = url_,
        x = 0,
        y = 0,
        z = 0,
        dynamic = false,
        volume = volume_,
        loop = loop_ or false,
    })

    if soundInfo[name_] == nil then soundInfo[name_] = getDefaultInfo() end

    soundInfo[name_].volume = volume_
    soundInfo[name_].url = url_
    soundInfo[name_].id = name_
    soundInfo[name_].playing = true
    soundInfo[name_].loop = loop_ or false
    soundInfo[name_].isDynamic = false

    globalOptionsCache[name_] = options or {}
end

function PlayUrlPos(name_, url_, volume_, pos, loop_, options)
    if Config.UseExternalxSound then
        exports["xsound"]:PlayUrlPos(name_, url_, volume_, pos, loop_, options)
        return
    end
    if disableMusic then return end
    SendNUIMessage({
        type = "url",
        name = name_,
        url = url_,
        x = pos.x,
        y = pos.y,
        z = pos.z,
        dynamic = true,
        volume = volume_,
        loop = loop_ or false,
    })
    if soundInfo[name_] == nil then soundInfo[name_] = getDefaultInfo() end

    soundInfo[name_].volume = volume_
    soundInfo[name_].url = url_
    soundInfo[name_].position = pos
    soundInfo[name_].id = name_
    soundInfo[name_].playing = true
    soundInfo[name_].loop = loop_ or false
    soundInfo[name_].isDynamic = true

    globalOptionsCache[name_] = options or {}

    local playerPos = GetEntityCoords(PlayerPedId())
    if #(pos - playerPos) < Config.distanceBeforeUpdatingPos then
        isPlayerCloseToMusic = true
    end

    if isPlayerCloseToMusic then
        SendNUIMessage({ type = "unmuteAll" })
        SendNUIMessage({
            type = "position",
            x = playerPos.x,
            y = playerPos.y,
            z = playerPos.z
        })
    end
end

function TextToSpeech(name_, lang, text, volume_, loop_, options)
    if Config.UseExternalxSound then
        exports["xsound"]:TextToSpeech(name_, lang, text, volume_, loop_, options)
        return
    end
    if disableMusic then return end
    local url = string.format("https://translate.google.com/translate_tts?ie=UTF-8&q=%s&tl=%s&total=1&idx=0&client=tw-ob", text, lang)
    PlayUrl(name_, url, volume_, loop_, options)
end

function TextToSpeechPos(name_, lang, text, volume_, pos, loop_, options)
    if Config.UseExternalxSound then
        exports["xsound"]:TextToSpeechPos(name_, lang, text, volume_, pos, loop_, options)
        return
    end
    if disableMusic then return end
    local url = string.format("https://translate.google.com/translate_tts?ie=UTF-8&q=%s&tl=%s&total=1&idx=0&client=tw-ob", text, lang)
    PlayUrlPos(name_, url, volume_, pos, loop_, options)
end