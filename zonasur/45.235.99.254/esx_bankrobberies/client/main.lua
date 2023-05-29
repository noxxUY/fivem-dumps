Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

ESX                           = nil

local robberyOngoing = false
local timeLeft = 280 --280
local start_timer = false
local CurrentAction             = nil
local PlayerData                = {}
local total = 0
local cashRecieved = 0
local bank_id
local estoy_banco = false
local displayedBlips = {}
local mefui = false

Citizen.CreateThread(function()
    while true do
	Wait(5)
		if robberyOngoing and timeLeft > 0 then
			timeLeft = timeLeft - 1
			Wait(1000)
		end	
	end	
end)	

Citizen.CreateThread(function()
    while true do
	Wait(5)
		if robberyOngoing then
			DrawAdvancedNativeText(1.05, 0.892, 0.005, 0.0028, 0.464, tostring(timeLeft), 255, 0, 0, 255, 0, 0)
			DrawAdvancedNativeText(1.010, 0.892, 0.005, 0.0028, 0.464, "TIEMPO: ", 255, 255, 255, 255, 0, 0)
			
			TriggerEvent("mt:missiontext", 'Dinero Recolectado: ~r~$'..total, 1000)
			
			if timeLeft == 0 then --aqui tengo que pasarles la plata recolectada al ped
				robberyOngoing = false
				ESX.TriggerServerCallback('1974_drogas:check', function(serial)
					if serial then
						TriggerServerEvent("esx_bankrobbery:transfermoney", total, serial)
					end
				end)
				TriggerServerEvent("esx_bankrobbery:endRobbery", bank_id, false)
				TriggerServerEvent('esx_bankrobbery:UpdateCanRob', bank_id)
				TriggerEvent("mt:missiontext", '~g~ YA PUEDES ESCAPAR!!!', 8000)
			end
		end
	end
end)

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj
        end)

        Citizen.Wait(5)
    end

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end) 



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

BankHeists = {
    ["Banco Galicia"] = {

        ["Money"] = 500000,

        ["Bank_Vault"] = {
            ["model"] = -63539571,
            ["x"] = -2958.539,
            ["y"] = 482.2706,
            ["z"] = 15.835 - 1.1,
            ["hStart"] = -2.0,
            ["hEnd"] = -2.0
        },
		
		Stop_Alarm = { x = -2957.83, y = 479.71, z = 14.71 },

        ["Start_Robbing"] = { 
            ["x"] = -2956.5705566406, 
            ["y"] = 481.70111083984, 
            ["z"] = 15.697088241577, 
            ["h"] = 357.9729309082 
        },

        ["Cash_Pile"] = { 
            ["x"] = -2954.1071777344, 
            ["y"] = 484.38818359375, 
            ["z"] = 16.267852783203, 
            ["h"] = 86.886528015137 
        },
		
		["MinPolice"] = 4,
		["Minimo"] = 10000,
		["Maximo"] = 20000,
		["Distancia"] = 18.0,
    },
	
	["Banco Sandy"] = {

        ["Money"] = 500000,

        ["Bank_Vault"] = {
            ["model"] = -63539571,
            ["x"] = -2958.539,
            ["y"] = 482.2706,
            ["z"] = 15.835 - 1.1,
            ["hStart"] = -2.0,
            ["hEnd"] = -2.0
        },
		Stop_Alarm = { x = 1177.82, y = 2711.31, z = 37.1 },
		
        ["Start_Robbing"] = { 
            ["x"] = 1175.97, 
            ["y"] = 2712.89, 
            ["z"] = 38.09, 
            ["h"] = 82.42 
        },

        ["Cash_Pile"] = { 
            ["x"] = 1173.32, 
            ["y"] = 2715.22, 
            ["z"] = 38.91, 
            ["h"] = 177.54 
        },
		
		["MinPolice"] = 4,
		["Minimo"] = 10000,
		["Maximo"] = 20000,
		["Distancia"] = 18.0,
    },

    ["Banco Macro"] = {

        ["Money"] = 500000,

        ["Bank_Vault"] = {
            ["model"] = 2121050683,
            ["x"] = 148.025,
            ["y"] = -1044.364,
            ["z"] = 29.50693 - 1.2,
            ["hStart"] = 250.0,
            ["hEnd"] = 250.0
        },
		
		Stop_Alarm = { x = 145.04, y = -1044.19, z = 28.37 },

        ["Start_Robbing"] = { 
            ["x"] = 146.86993408203, 
            ["y"] = -1046.0607910156, 
            ["z"] = 29.368083953857, 
            ["h"] = 218.72334289551
        },

        ["Cash_Pile"] = { ["x"] = 148.67572021484, ["y"] = -1049.197265625, ["z"] = 29.93883895874, ["h"] = 160.95620727539 },
		
		["MinPolice"] = 4,
		["Minimo"] = 10000,
		["Maximo"] = 20000,
		["Distancia"] = 18.0,

    },

    ["Banco Provincia"] = {

        ["Money"] = 500000,

        ["Bank_Vault"] = {
            ["model"] = 2121050683,
            ["x"] = -352.725,
            ["y"] = -53.564,
            ["z"] = 49.50693 - 1.5,
            ["hStart"] = 250.0,
            ["hEnd"] = 250.0
        },
		
		Stop_Alarm = { x = -355.22, y = -53.46, z = 48.05 },

        ["Start_Robbing"] = { 
            ["x"] = -353.85614013672, 
            ["y"] = -55.297225952148, 
            ["z"] = 49.036598205566, 
            ["h"] = 222.63375854492
        },

        ["Cash_Pile"] = { ["x"] = -352.00219726563, ["y"] = -58.390628814697, ["z"] = 49.60733795166, ["h"] = 160.58137512207 },
		
		["MinPolice"] = 4,
		["Time"] = 3600,
		["Minimo"] = 10000,
		["Maximo"] = 20000,
		["Distancia"] = 18.0,

    },
	
	["Banco Paleto"] = {

        ["Money"] = 500000,

        ["Bank_Vault"] = {
            ["model"] = -1185205679,
            ["x"] = -104.6149,
            ["y"] = 6473.444,
            ["z"] = 30.62,
            ["hStart"] = 45.0,
            ["hEnd"] = 45.0
        },

		Stop_Alarm = { x = -102.17, y = 6468.6, z = 30.63 },

        ["Start_Robbing"] = { 
            ["x"] = -105.61, 
            ["y"] = 6472.01, 
            ["z"] = 31.63, 
            ["h"] = 357.9729309082 
        },

        ["Cash_Pile"] = { 
            ["x"] = -104.335, 
            ["y"] = 6477.186, 
            ["z"] = 31.49143, 
            ["h"] = 205.0 
        },
		
		["MinPolice"] = 4,
		["Minimo"] = 10000,
		["Maximo"] = 20000,
		["Distancia"] = 18.0,

    },
	
	["Banco Santander"] = {

        ["Money"] = 500000,

        ["Bank_Vault"] = {
            ["model"] = -1185205679,
            ["x"] = -104.6149,
            ["y"] = 6473.444,
            ["z"] = 30.62,
            ["hStart"] = 45.0,
            ["hEnd"] = 45.0
        },

		Stop_Alarm = { x=-1213.09, y=-336.063, z=37.790 },

        ["Start_Robbing"] = { 
            ["x"] = -1210.77, 
            ["y"] = -336.558, 
            ["z"] = 37.781, 
            ["h"] = 357.9729309082 
        },
		---1207.35, -337.436, 38.603
        ["Cash_Pile"] = { 
            ["x"] = -1207.35, 
            ["y"] = -337.436, 
            ["z"] = 38.603, 
            ["h"] = 205.0 
        },
		
		["MinPolice"] = 4,
		["Minimo"] = 10000,
		["Maximo"] = 20000,
		["Distancia"] = 18.0,
		
    },
	
	["Banco MAZE BANK"] = {

        ["Money"] = 1000000,

        ["Bank_Vault"] = {
            ["model"] = -1185205679,
            ["x"] = -104.6149,
            ["y"] = 6473.444,
            ["z"] = 30.62,
            ["hStart"] = 45.0,
            ["hEnd"] = 45.0
        },
		
		--x=-1364.00, y=-482.315, z=33.190
		Stop_Alarm = { x=-1364.00, y=-482.315, z=33.190 },
		
		--x=-1370.41, y=-477.342, z=33.190
        ["Start_Robbing"] = { 
            ["x"] = -1370.41,
            ["y"] = -477.342, 
            ["z"] = 33.190, 
            ["h"] = 357.9729309082 
        },
		
		--x=-1358.80, y=-465.810, z=33.190, h = 75.61060333252
        ["Cash_Pile"] = { 
            ["x"] = -1358.80, 
            ["y"] = -465.810, 
            ["z"] = 33.190 - 1, 
            ["h"] = 75.61060333252
        },
		
		["MinPolice"] = 4,
		["Minimo"] = 30000,
		["Maximo"] = 60000,
		["Distancia"] = 35.0,

    },
}

RegisterNetEvent("esx_bankrobbery:alertCops")
AddEventHandler("esx_bankrobbery:alertCops", function(bankId)
    local coords = BankHeists[bankId]["Start_Robbing"]
    ESX.ShowNotification("~r~ALARMA: ~b~"..bankId, "", 10000)
	table.insert(displayedBlips, bankId)
    displayedBlips[bankId] = AddBlipForCoord(coords["x"], coords["y"], coords["z"])
    SetBlipSprite(displayedBlips[bankId], 161)
    SetBlipScale(displayedBlips[bankId], 1.0)
    SetBlipColour(displayedBlips[bankId], 75)
end)

RegisterNetEvent('esx_bankrobbery:killblip')
AddEventHandler('esx_bankrobbery:killblip', function(bankId)
    for i=1, #displayedBlips do
    	RemoveBlip(displayedBlips[bankId])
	end
end)

RegisterNetEvent('esx_bankrobbery:status')
AddEventHandler('esx_bankrobbery:status', function(bool)
    robberyOngoing = bool
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if not robberyOngoing then
            for bank, values in pairs(BankHeists) do
                local StartPosition = values["Start_Robbing"]
                local ped = PlayerPedId()
                local pedcoords = GetEntityCoords(ped)
				local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, StartPosition["x"], StartPosition["y"], StartPosition["z"])

                if distance <= 5.0 then
                    ESX.Game.Utils.DrawText3D(StartPosition, "Presiona [E] para Empezar Robo", 0.4)
                    if distance <= 1.5 then
                        if IsControlJustPressed(0, Keys["E"]) then
							ESX.TriggerServerCallback('esx_bankrobbery:getUpdates', function(result)
								if bank == 'Banco Paleto' or bank == 'Banco Galicia' then
									ESX.TriggerServerCallback("esx_police2job:getCops", function(IsEnough) --esx_policejob:getCops
										if result.cb ~= nil then
											if IsEnough >= values["MinPolice"] then
												TriggerServerEvent("esx_bankrobbery:startRobbery", bank)
											else
												ESX.ShowNotification("No hay suficientes PFA en linea! Minimo: "..values["MinPolice"])
											end
										else
											ESX.ShowNotification("~r~Este banco ya ha sido robado, espera: " ..  math.floor((Config.Time - result.time)  / 60) .. ' minutos')
										end
									end)
								elseif bank == 'Banco Sandy' then
									ESX.TriggerServerCallback("esx_gendarmeria:getCops", function(IsEnough) --esx_policejob:getCops
										if result.cb ~= nil then
											if IsEnough >= values["MinPolice"] then
												TriggerServerEvent("esx_bankrobbery:startRobbery", bank)
											else
												ESX.ShowNotification("No hay suficientes GNA en linea! Minimo: "..values["MinPolice"])
											end
										else
											ESX.ShowNotification("~r~Este banco ya ha sido robado, espera: " ..  math.floor((Config.Time - result.time)  / 60) .. ' minutos')
										end
									end)
								else
									ESX.TriggerServerCallback("esx_seguridad:getSeguridad", function(IsEnough) --esx_policejob:getCops
										if result.cb ~= nil then
											if IsEnough >= values["MinPolice"] then
												TriggerServerEvent("esx_bankrobbery:startRobbery", bank)
											else
												ESX.ShowNotification("No hay suficientes PSG en linea! Minimo: "..values["MinPolice"])
											end
										else
											ESX.ShowNotification("~r~Este banco ya ha sido robado, espera: " ..  math.floor((Config.Time - result.time)  / 60) .. ' minutos')
										end
									end)
								end
							end, bank)                        
						end
					end
				end
			end
		end	
	end
end)

function DrawAdvancedNativeText(x,y,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


RegisterNetEvent("esx_bankrobbery:startRobbery")
AddEventHandler("esx_bankrobbery:startRobbery", function(bankId)
    StartRobbery(bankId)
	bank_id = bankId
	
end)

RegisterNetEvent("esx_bankrobbery:endRobbery")
AddEventHandler("esx_bankrobbery:endRobbery", function(bankId)
    robberyOngoing = false
	timeLeft = 280
	total = 0
	BankHeists[bankId]["Money"] = 500000
end)


RegisterNetEvent("esx_bankrobbery:changeCash")
AddEventHandler("esx_bankrobbery:changeCash", function(bankId, newCash)
    if newCash <= 0 then
        BankHeists[bankId]["Money"] = 0
    end

    BankHeists[bankId]["Money"] = newCash
end)

function StartRobbery(bankId)

    robberyOngoing = true
	
    local CashPosition = BankHeists[bankId]["Cash_Pile"]
	local Stop = BankHeists[bankId].Stop_Alarm

    loadModel("bkr_prop_bkr_cashpile_04")
    loadAnimDict("anim@heists@ornate_bank@grab_cash_heels")

    local CashPile = CreateObject(GetHashKey("bkr_prop_bkr_cashpile_04"), CashPosition["x"], CashPosition["y"], CashPosition["z"], false)
    PlaceObjectOnGroundProperly(CashPile)
    SetEntityRotation(CashPile, 0, 0, CashPosition["h"], 2)
    FreezeEntityPosition(CashPile, true)

	ESX.ShowNotification("~y~Si te vas antes de tiempo el robo se Cancela!")

    Citizen.CreateThread(function()
        while robberyOngoing do
            Citizen.Wait(5)
            local Cash = BankHeists[bankId]["Money"]
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local distanceCheck = GetDistanceBetweenCoords(pedCoords, CashPosition["x"], CashPosition["y"], CashPosition["z"], false)
			
			if distanceCheck > BankHeists[bankId]["Distancia"] then
				robberyOngoing = false
				ESX.ShowNotification("~r~Te fuiste antes de tiempo, el robo se Cancelo!")
				DeleteEntity(CashPile)
				TriggerServerEvent("esx_bankrobbery:endRobbery", bankId, true)
			end	
			if distanceCheck <= 1.5 then
				ESX.Game.Utils.DrawText3D({ x = CashPosition["x"], y = CashPosition["y"], z = CashPosition["z"] + 0.5 }, "Presiona [E] para agarrar la plata: $" .. Cash, 0.4)
                if IsControlJustPressed(0, Keys["E"]) then
                    if Cash > 0 then
                        GrabCash(bankId)
                    else
                        DeleteEntity(CashPile)
                        BankHeists[bankId]["Money"] = 0
                        ESX.ShowNotification("¡Ya Robaste Todo!, la Boveda quedo vacia!")
                    end
                end
			end	
			--[[
			PlayerData = ESX.GetPlayerData()
			if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
				DrawMarker(1, Stop.x, Stop.y, Stop.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(pedCoords,  Stop.x,  Stop.y,  Stop.z,  true) < 1.5 then
					SetTextComponentFormat('STRING')
					AddTextComponentString('Presiona ~INPUT_CONTEXT~ para desactivar ALARMA')
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					
					if IsControlPressed(0,  Keys['E']) then
						DeleteEntity(CashPile)
						TriggerServerEvent("esx_bankrobbery:endRobbery", bankId, false)
						TriggerServerEvent('esx_bankrobbery:UpdateCanRob', bankId)
					end
				end
			end
			]]
        end
    end)

end

function GrabCash(bankId)
    TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)

    Citizen.Wait(7500)

    ClearPedTasks(PlayerPedId())
	
	--BankHeists[bankId]["Minimo"]
	
    cashRecieved = math.random(BankHeists[bankId]["Minimo"], BankHeists[bankId]["Maximo"])
	
	total = total + cashRecieved

    TriggerServerEvent("esx_bankrobbery:grabbedCash", bankId, BankHeists[bankId]["Money"], cashRecieved)
end

RegisterNetEvent("mt:missiontext") -- credits: https://github.com/schneehaze/fivem_missiontext/blob/master/MissionText/missiontext.lua
AddEventHandler("mt:missiontext", function(text, time)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString(text)
		DrawSubtitleTimed(time, 1)
end)

function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

function loadAnimDict(dict)
    Citizen.CreateThread(function()
        while (not HasAnimDictLoaded(dict)) do
            RequestAnimDict(dict)
            
            Citizen.Wait(1)
        end
    end)
end

function loadModel(model)
    Citizen.CreateThread(function()
        while not HasModelLoaded(model) do
            RequestModel(model)
          Citizen.Wait(1)
        end
    end)
end