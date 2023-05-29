local distanceToCasinoEntrance = 1000
local distanceToCasinoExit = 1000
local casinoEntranceVector = vector3(935.8314, 46.78986, 81.095)
local casinoExitVector = vector3(1089.653, 205.7790, -48.99)

RMenu.Add('casino_enter', 'casino', RageUI.CreateMenu("", "",0,100,"shopui_title_casino", "shopui_title_casino"))
RMenu:Get('casino_enter', 'casino'):SetSubtitle("~b~ENTRADA")
RMenu.Add('casino_exit', 'casino', RageUI.CreateMenu("", "",0,100,"shopui_title_casino", "shopui_title_casino"))
RMenu:Get('casino_exit', 'casino'):SetSubtitle("~b~SALIDA")

function showCasinoEnter(flag)
    RageUI.Visible(RMenu:Get('casino_enter', 'casino'), flag)
end

function showCasinoExit(flag)
    RageUI.Visible(RMenu:Get('casino_exit', 'casino'), flag)
end

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(casinoEntranceVector)
		
		SetBlipSprite(blip, 439)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 1.3)
		SetBlipColour(blip, 5)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Casino')
		EndTextCommandSetBlipName(blip)
end)

RageUI.CreateWhile(1.0, true, function()
    if RageUI.Visible(RMenu:Get('casino_exit', 'casino')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()           
            RageUI.Button("Salir de Diamond Casino", "",{ RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Hovered) then

                end
                if (Active) then

                end
                if (Selected) then
                    SetEntityCoords(GetPlayerPed(-1),casinoEntranceVector.x,casinoEntranceVector.y,casinoEntranceVector.z)
                    for k,v in pairs(cardObjects) do
                        for _,obj in pairs(v) do
                            DeleteObject(obj)
                        end
                    end	
                end
            end)
        end, function()
            ---Panels
        end)
    end
end, 1)
RageUI.CreateWhile(1.0, true, function()
    if RageUI.Visible(RMenu:Get('casino_enter', 'casino')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()           
            RageUI.Button("Entrar a Diamond Casino", "",{ RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Hovered) then

                end
                if (Active) then

                end
                if (Selected) then
                    SetEntityCoords(GetPlayerPed(-1),casinoExitVector.x,casinoExitVector.y,casinoExitVector.z)
                end
            end)
        end, function()
            ---Panels
        end)
    end
end, 1)

Citizen.CreateThread(function()
    while true do 
        if distanceToCasinoEntrance < 1.5  then 
            showCasinoEnter(true)
        elseif distanceToCasinoEntrance < 2.5 then 
            showCasinoEnter(false)
        end
        if distanceToCasinoExit < 1.5  then 
            showCasinoExit(true)
        elseif distanceToCasinoExit < 2.5 then 
            showCasinoExit(false)
        end
        DrawMarker(27, casinoEntranceVector.x, casinoEntranceVector.y, casinoEntranceVector.z-1.0, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255,255,255, 200, 0, 0, 0, 0)
        DrawMarker(27, casinoExitVector.x, casinoExitVector.y, casinoExitVector.z-1.0, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255,255,255, 200, 0, 0, 0, 0)
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local playerCoords = GetEntityCoords(GetPlayerPed(-1))

        distanceToCasinoEntrance = #(playerCoords-casinoEntranceVector)
        distanceToCasinoExit = #(playerCoords-casinoExitVector)
        Wait(100)
    end
end)