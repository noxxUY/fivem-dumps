Citizen.CreateThread(function()
    Wait(50)
    while true do
        miid(0.815, 1.435, 1.0,1.0,0.50, "~b~~r~  ".. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. '', 255, 255, 255, 255)
        Citizen.Wait(1)
    end
end)

function miid(x,y ,width,height,scale, text, r,g,b,a, outline)
SetTextFont(1)
    SetTextProportional(1)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(0, 0, 0, 0, 255)
    SetTextScale(0.30, 0.30)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString("~y~[ID]: ~r~" .. tostring(GetPlayerServerId(PlayerId())))
    DrawText(0.97, 0.94)
end