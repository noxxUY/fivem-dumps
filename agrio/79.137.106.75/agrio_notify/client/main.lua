local loadingScreenFinished = false
local openIdcard = false
local statusNotify = false

RegisterNetEvent('co_notify:ShowNotification')
AddEventHandler('co_notify:ShowNotification', function(text, title)
  if statusNotify == true then
    while true do
      Wait(100)
      if statusNotify == false then
        break
      end
    end
  end
  if title == nil then
    title = " "
  end
  SendNUIMessage({
    action = "SendNotification",
    text = UIColors(text),
    title = title
  })
end)

RegisterNetEvent('notify:client:statusNotify')
AddEventHandler('notify:client:statusNotify', function(bool)
  statusNotify = bool
end)

RegisterNetEvent('co_notify:ShowHelpNotification')
AddEventHandler('co_notify:ShowHelpNotification', function(text)
 
  SendNUIMessage({
     action = "SendHelpNotification",
     text = UIColors(text),
  })
  
end)

RegisterNetEvent('co_notify:ShowFloatingHelpNotification')
AddEventHandler('co_notify:ShowFloatingHelpNotification', function(text)
 
  SendNUIMessage({
     action = "SendHelpNotification",
     text = UIColors(text),
  })
  
end)

RegisterNetEvent('co_notify:SendNotification')
AddEventHandler('co_notify:SendNotification', function(options)
  if statusNotify == true then
    while true do
      Wait(100)
      if statusNotify == false then
        break
      end
    end
  end
  SendNUIMessage({
    action = "SendNotification",
    text = options.text,
    type = options.type,
    queue = options.queue,
    timeout = options.timeout,
    layout = options.layout

  })
end)

RegisterNetEvent('co_notify:SetQueueMax')
AddEventHandler('co_notify:SetQueueMax', function(queue, value)
	SendNUIMessage({
    action = "SetQueueMax",
		queue = queue,
		value = value
	})
end)

function UIColors(text)
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
  text = "<span>" .. text .. "</span>"
  return text
end