RegisterNetEvent("poden:toggleNUI")
AddEventHandler("poden:toggleNUI", function(display)
    SendNUIMessage({
    type = "ui",
    display = display
  })
end)