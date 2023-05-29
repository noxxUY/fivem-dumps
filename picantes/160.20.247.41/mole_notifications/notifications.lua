local lastNotification = ""
local lastNotificationTime = 0
local lastNotificationCount = 0
function MoleShowNotification(msg, job)
    MoleSendNotification({text = msg},job)
end
function MoleShowAdvancedNotification(title, subject, msg, icon, iconType, job)
    local advanceMsg = "<div style='font-family: \"Open Sans\", sans-serif, Roboto;;font-weight:bold'>" .. title .. " - " .. subject .. "</div><div style='font-family: \"Open Sans\", sans-serif, Roboto;'>" .. msg .. "</div>"
    MoleSendNotification({text = advanceMsg},job)
end
function MoleConvertLuaTextIntoHtml(text, job)
    text = text:gsub("~r~", "<span class='red'>") 
    text = text:gsub("~b~", "<span class='blue'>")
    text = text:gsub("~g~", "<span class='green'>")
    text = text:gsub("~y~", "<span class='yellow'>")
    text = text:gsub("~p~", "<span class='purple'>")
    text = text:gsub("~c~", "<span class='grey'>")
    text = text:gsub("~m~", "<span class='darkgrey'>")
    text = text:gsub("~u~", "<span class='black'>")
    text = text:gsub("~o~", "<span class='gold'>")
    text = text:gsub("~s~", "</span>")
    text = text:gsub("~w~", "</span>")
    text = text:gsub("~b~", "<b>")
    text = text:gsub("~n~", "<br>")
    text = "<span style='font-family: \"Open Sans\", sans-serif, Roboto;'>" .. text .. "</span>"
    if(job ~= nil)then
        if(job =='police')then
            text = '👮🏻' .. text
        end
        if(job =='psg')then
            text = '👮🏻' .. text
        end
        if(job =='ambulance')then
            text = '👨‍⚕️' .. text
        end
        if(job =='mechanic')then
            text = '🔧' .. text
        end
        if(job =='taxi')then
            text = '🚕' .. text
        end
    end

    
    return text
end


function MoleSetQueueMax(queue, max)
    local tmp = {
        queue = tostring(queue),
        max = tonumber(max)
    }
    SendNUIMessage({maxNotifications = tmp})
end
function MoleShowProgressBar(time, text) 
	SendNUIMessage({
		type = "ui",
		display = true,
		time = time,
		text = text
	})
end

function MoleDrawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
      SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


function MoleSendNotification(options, job)
    options.animation = options.animation or {}
    options.sounds = options.sounds or {}
    options.docTitle = options.docTitle or {}

    local options = {
        type = options.type or "alert",
        layout = options.layout or "bottomCenter",
        theme = options.theme or "forasteros",
        text = MoleConvertLuaTextIntoHtml(options.text, job) or "Empty Notification",
        timeout = options.timeout or 3500,
        progressBar = true,
        closeWith = options.closeWith or {},
        animation = {
            open = options.animation.open or "animated bounceInRight",
            close = options.animation.close or "animated bounceOutRight"
        },
        sounds = {
            volume = options.sounds.volume or 1,
            conditions = options.sounds.conditions or {},
            sources = options.sounds.sources or {}
        },
        docTitle = {
            conditions = options.docTitle.conditions or {}
        },
        modal = options.modal or false,
        id = options.id or false,
        force = options.force or false,
        queue = options.queue or "global",
        killer = options.killer or false,
        container = options.container or false,
        buttons = options.button or false
    }
    if(job ~= nil) then
        options.type = job .. "_" .. options.type
        options.layout = "centerRight"
        options.timeout = 5000
    end
    if(lastNotification ~=nil and lastNotification.text == options.text and lastNotificationTime > GetGameTimer() - 1000)then
        lastNotificationCount = lastNotificationCount + 1
    end
    if(lastNotification == nil or lastNotification.text ~= options.text or lastNotificationTime <= GetGameTimer() - 1000)then --avoid duplicate notifications
        if(lastNotificationCount > 0) then
            if(lastNotification.text == options.text)then
                options.text = options.text .. " (x" ..lastNotificationCount.. ")"
            end
            lastNotificationCount = 0
        end
        lastNotification = options
        lastNotificationTime = GetGameTimer()
        SendNUIMessage({options = options})
        if(job ~= nil and job ~= '') then
            PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
        end
    end
end

RegisterNetEvent("mole_notifications:SendNotification")
AddEventHandler("mole_notifications:SendNotification", function(options, job)
    MoleSendNotification(options, job)
end)

RegisterNetEvent("mole_notifications:SetQueueMax")
AddEventHandler("mole_notifications:SetQueueMax", function(queue, max)
    MoleSetQueueMax(queue, max)
end)

RegisterNetEvent("mole_notifications:MoleDrawTxt")
AddEventHandler("mole_notifications:MoleDrawTxt", function(x, y, width, height, scale, text, r, g, b, a, outline)
    MoleDrawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
end)
RegisterNetEvent("mole_notifications:MoleShowNotification")
AddEventHandler("mole_notifications:MoleShowNotification", function(msg, job)
    MoleShowNotification(msg, job)
end)
RegisterNetEvent("mole_notifications:MoleShowProgressBar")
AddEventHandler("mole_notifications:MoleShowProgressBar", function(time, text)
    MoleShowProgressBar(time, text)
end)
RegisterNetEvent("mole_notifications:MoleShowAdvancedNotification")
AddEventHandler("mole_notifications:MoleShowAdvancedNotification", function(title, subject, msg, icon, iconType, job)
    MoleShowAdvancedNotification(title, subject, msg, icon, iconType, job)
end)