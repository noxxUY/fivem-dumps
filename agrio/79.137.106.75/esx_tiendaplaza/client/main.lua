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
local PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
		PlayerData = ESX.GetPlayerData()
	end
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local CartPlaces = {
    { x = 233.05, y = -896.98, z = 30.69 },
    { x = 1984.73, y = 3052.06, z = 47.22 },
    { x = 1632.43, y = 2552.56, z = 45.52 },
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        for index, value in pairs(CartPlaces) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, value.x, value.y, value.z)

            if dist < 10 then
                DrawMarker(42, value.x, value.y, value.z, 0, 0, 0, 0, 0, 0, 0.601, 0.6001, 0.50001, 255, 255, 0, 200, 0, 0, 0, 0)
                if dist <= 1.0 then
                    hintToDisplay('Pulsa ~INPUT_CONTEXT~ para ver el catálogo de ~g~comida ~w~/ ~g~bebida~w~.')
                    
                    if IsControlJustPressed(0, Keys['E']) then -- "E"
                        OpenCartMenu()
                    end			
                end
            end

        end
    end
end)

function OpenCartMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'mat_meny',
        {
            title    = 'Comida Rapida ',
            elements = {
				{label = 'Hamburguesa 🍔 (EUR 5)', value = 'sausage_1', item = 'hamburgare', price = 5},
                {label = 'Patatas Fritas 🍟 (EUR 5)', value = 'water_1', item = 'potatis', price = 5},
                {label = 'Café ☕ (EUR 2)', value = 'prop_fib_coffee', item = 'coffe', price = 2},
            }
        },
        function(data, menu)
            local item = data.current.item
            local price = data.current.price
            TriggerServerEvent('esx_didrik_matvagn:buy', item, price)
            TriggerServerEvent('esx:useItem', item)
        end,
    function(data, menu)
        menu.close()
    end)
end

------------------------------------ MAT / PROPS ----------------------------------------

RegisterNetEvent('esx_didrik_hamburgare:onEat')
AddEventHandler('esx_didrik_hamburgare:onEat', function(prop_name)
    if not IsAnimated then
		local prop_name = prop_name or 'prop_cs_burger_01'
    	IsAnimated = true
	    local playerPed = GetPlayerPed(-1)
	    Citizen.CreateThread(function()
	        local x,y,z = table.unpack(GetEntityCoords(playerPed))
	        prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
	        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
	        RequestAnimDict('mp_player_inteat@burger')
	        while not HasAnimDictLoaded('mp_player_inteat@burger') do
	            Wait(0)
	        end
	        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
	        Wait(9000)
	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
	        DeleteObject(prop)
	    end)
	end
end)

---------------------------------------------------------------------------------------------------

RegisterNetEvent('esx_didrik_potatis:onEat')
AddEventHandler('esx_didrik_potatis:onEat', function(prop_name)
    if not IsAnimated then
		local prop_name = prop_name or 'ng_proc_food_ornge1a'
    	IsAnimated = true
	    local playerPed = GetPlayerPed(-1)
	    Citizen.CreateThread(function()
	        local x,y,z = table.unpack(GetEntityCoords(playerPed))
	        prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
	        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
	        RequestAnimDict('mp_player_inteat@burger')
	        while not HasAnimDictLoaded('mp_player_inteat@burger') do
	            Wait(0)
	        end
	        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
	        Wait(3000)
	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
	        DeleteObject(prop)
	    end)
	end
end)

---------------------------- BLIPS ------------------------

local blips = {
    {title="Alimentos / Bebidas", colour=64, id=354, x = 233.05, y = -896.98, z = 30.69},
    {title="Yellow Jack", colour=64, id=431, x = 1984.73, y = 3052.06, z = 47.22},
    {title="Comedor de la prisión", colour=2, id=188,x = 1632.43, y = 2552.56, z = 45.52}

  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

-----------------------------------------------------------------------------------------------------------