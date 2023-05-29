local active = false
local type = nil

RegisterNetEvent('sparki_alerts:active')
AddEventHandler('sparki_alerts:active',function(typeA)
    SendNUIMessage({type = 'open'})
    type = typeA
    active = true
    print(type)
end)

RegisterNetEvent('sparki_alerts:disable')
AddEventHandler('sparki_alerts:disable',function()
    print('close')
    SendNUIMessage({type = 'closeUI'})
    active = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if active == true then
            if type == 'green' then
                drawTxt("ALERTA BAJA",2, 1, 0.935, 0.75, 0.50,0,255,0,255)
            elseif type == 'yellow' then
                drawTxt("ALERTA MODERADA",2, 1, 0.935, 0.75, 0.50,229,236,0,255)
            elseif type == 'orange' then
                drawTxt("ALERTA MEDIA",2, 1, 0.935, 0.75, 0.50,255,173,0,255)
            elseif type == 'red' then
                drawTxt("ALERTA ALTA",2, 1, 0.935, 0.75, 0.50,255,0,0,255)
            elseif type == 'black' then
                drawTxt("ALERTA MUY ALTA",2, 1, 0.935, 0.75, 0.50,201,0,255,255)
            end
        end
    end
end)

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end