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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while not ESX.IsPlayerLoaded() do
		Citizen.Wait(5)
	end
	Cargo_Estado()
end)

function Cargo_Estado()
    ESX.TriggerServerCallback("skill:get", function(data)
		if data then
            Config.Skills['Stamina']["Current"] = tonumber(data[1].gym)
		end
        RefreshSkills()
    end)
end

RegisterNetEvent("skill:cargo")
AddEventHandler("skill:cargo", function(data)
	if data then
        Config.Skills['Stamina']["Current"] = tonumber(data)
	end
    RefreshSkills()
end)

function RefreshSkills()
    for type, value in pairs(Config.Skills) do
        
        if value["Stat"] then
			--local cantidad = tonumber(value["Current"]) / 2
            StatSetInt(value["Stat"], tonumber(value["Current"]), true)
        end
        
        if ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "skill_menu") then
            SkillMenu()
        end
    end
end

function UpdateSkill(skill, amount)

    if not Config.Skills[skill] then
        print("Skill " .. skill .. " doesn't exist")
        return
    end

    local SkillAmount = tonumber(Config.Skills[skill]["Current"])
    
	if SkillAmount + tonumber(amount) < 99 then
		if SkillAmount + tonumber(amount) < 0 then
			Config.Skills[skill]["Current"] = 0
		elseif SkillAmount + tonumber(amount) > 99 then
			Config.Skills[skill]["Current"] = 99
		else
			Config.Skills[skill]["Current"] = SkillAmount + tonumber(amount)
		end
		RefreshSkills()
		if Config.Notifications then
			if tonumber(amount) > 0 then
				ESX.ShowNotification("~g~+" .. tonumber(amount) .. "% ~s~" .. skill)
			end
		end
		TriggerServerEvent("skill:GymUpdate", tonumber(amount))
	else
		ESX.ShowNotification("~g~YA ESTAS FULL! NO PUEDES SUBIR MAS!")
	end   
end

RegisterCommand('gym', function()
	SkillMenu()
end, false)

function SkillMenu()
    ESX.UI.Menu.CloseAll()
	
    local skills = {}
	
	for type, value in pairs(Config.Skills) do
		table.insert(skills, {
			["label"] = type .. ': <span style="color:#0d7ec0">' .. tonumber(value["Current"]) .."/100</span> %"
		})
	end

	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "skill_menu",
	{
		["title"] = "Estadisticas",
		["align"] = "bottom-right",
		["elements"] = skills

	}, function(data, menu)
	
        
	end, function(data, menu)
		menu.close()
	end)
end

--[[
function OpenSkillMeny()
ESX.TriggerServerCallback('skill:get', function( data )

    ESX.UI.Menu.CloseAll()

    local pP = GetPlayerPed(-1)

    local elements = {}

    if tonumber(data[1].gym) < 25 then
    table.insert(elements, {label = 'Stamina: Baja ['..data[1].gym..']', value = ''})

    elseif tonumber(data[1].gym) < 50 then
    table.insert(elements, {label = 'Stamina: Normal ['..data[1].gym..']', value = ''})

    elseif tonumber(data[1].gym) < 75 then
    table.insert(elements, {label = 'Stamina: Buena ['..data[1].gym..']', value = ''})

    elseif tonumber(data[1].gym) < 100 then
    table.insert(elements, {label = 'Stamina: Maxima ['..data[1].gym..']', value = ''})

    elseif tonumber(data[1].gym) > 100 then
    table.insert(elements, {label = 'Stamina: Maxima ['..data[1].gym..']', value = ''})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Skills',
    {
      title    = 'Stamina',
      align    = 'left',
      elements = elements
    },
    function(data, menu)
    end,
function(data, menu)
  menu.close()
end
  )
  end)
end

Citizen.CreateThread(function()
	while true do
    Wait(5)
		if IsControlJustPressed(0, Keys["F9"]) then
			OpenSkillMeny()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
    Wait(5000)
		ESX.TriggerServerCallback('skill:get', function(data)
			if tonumber(data[1].gym) < 25 then
				RestorePlayerStamina(PlayerId(), 0.1)
			elseif tonumber(data[1].gym) < 50 then
				RestorePlayerStamina(PlayerId(), 0.2)
			elseif tonumber(data[1].gym) < 75 then
				RestorePlayerStamina(PlayerId(), 0.3)
			elseif tonumber(data[1].gym) < 100 then
				RestorePlayerStamina(PlayerId(), 0.4)
			elseif tonumber(data[1].gym) > 100 then
				RestorePlayerStamina(PlayerId(), 0.4)
			end
		end)
    end
end)
]]

