local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX = nil
local PlayerData = {}
local combos = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
	
	--[[
	if ESX.IsPlayerLoaded() then
		Wait(2000)
		Start()
	end
	]]
end)

function Start()
	ESX.TriggerServerCallback('1974_mc:loadItems', function(items)
		for key, value in pairs(items) do
			AddItem(value.name, value.display, value.price)
		end
	end)
end

--here you can add more points of purchase
local shopsbl = {
	BC = {
		Pos = {x=88.66979, y=286.0436, z=109.20},
	},
	AutoMac = {
		Pos = {x=95.75034, y=284.9870, z=108.97},
	}
}
--########################################

local enableField = false

function toggleField(enable)
    SetNuiFocus(enable, enable)
    enableField = enable

    if enable then
        SendNUIMessage({
            action = 'open'
        }) 
    else
        SendNUIMessage({
            action = 'close'
        }) 
    end
end

AddEventHandler('onResourceStart', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end
    toggleField(false)
end)

RegisterNUICallback('escape', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)

    cb('ok')
end)

RegisterNUICallback('buy', function(data, cb)
    local warenkorb = data.warenkorb
    local totalprice = 0

    for key, value in pairs(warenkorb) do
        totalprice = totalprice + value.price
    end

    local withTax = totalprice + (totalprice * 0.00)
    
    ESX.TriggerServerCallback('1974_mc:canAfford', function(bool)
        if bool then
            ESX.ShowNotification(("MC: Pagaste $%s"):format(withTax))			
        else
            ESX.ShowNotification(("MC: No tienes suficiente dinero $%s!"):format(withTax))
        end
    end, withTax, warenkorb)

    cb('ok')
end)

function AddItem(name, display, price)
    SendNUIMessage({
        action = 'add',
        name = name,
        display = display,
        price = price
    })
end


-- Create DrawText
function DrawText3Ds(x, y, z, text)
	SetTextScale(0.25, 0.25)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
   DrawRect(0.0, 0.0+0.0115, 0.025+ factor, 0.03, 115, 5, 122, 80)
    ClearDrawOrigin()
end

local sleep = 2000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        --bl4ck = false
		for key, value in pairs(shopsbl) do
			local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.Pos.x, value.Pos.y, value.Pos.z))
			if dist < 100.0 then
				DrawMarker(21, vector3(value.Pos.x, value.Pos.y, value.Pos.z + 1), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.4, 0.4, 250, 19, 2, 100, false, true, 2, true, false, false, false)
			end	
			if key == "AutoMac" then
				if dist <= 5 then		 
					--bl4ck = true		
					DrawText3Ds(value.Pos.x, value.Pos.y, value.Pos.z + 1.5, '~y~E~w~ - AUTOMAC')
					if IsControlJustReleased(0, 38) and not enableField then
						if not combos then
							combos = true
							Start()
						end
						if IsPedInAnyVehicle(PlayerPedId(), false) then
							toggleField(true)
						else
							ESX.ShowNotification('~r~Debes venir con un Vehiculo!')
						end
					end
				end
			else
				--local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.Pos.x, value.Pos.y, value.Pos.z))
				if dist <= 2 then		 
					--bl4ck = true		
					DrawText3Ds(value.Pos.x, value.Pos.y, value.Pos.z + 1.5, '~y~E~w~ - MC DONALDS')
					if IsControlJustReleased(0, 38) and not enableField then
						if not combos then
							combos = true
							Start()
						end
						toggleField(true)
					end
				end
			end		
			--[[
			if bl4ck then
				sleep = 7
			elseif not bl4ck then
				sleep = 2000
			end
			]]
		end
	end
end)


Citizen.CreateThread(function()
    for _, coords in pairs(shopsbl) do
		if _ ~= 'AutoMac' then
			local blip = AddBlipForCoord(vector3(coords.Pos.x, coords.Pos.y, coords.Pos.z))
			SetBlipSprite(blip, 124)
			SetBlipScale(blip, 0.7)
			SetBlipColour(blip, 47)
			SetBlipDisplay(blip, 4)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("MC DONALDS")
			EndTextCommandSetBlipName(blip)
		end	
    end
end)
--SCRIPT CUSTOM BY !BL4CK.exe
--DISCORD !BL4CK.exe#0001
--DISCORD: discord.gg/sZpGPQ28E5