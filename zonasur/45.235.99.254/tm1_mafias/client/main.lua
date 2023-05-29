------------------------------
----------LLAMADAS------------
------------------------------
AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent('tm1_mafias:groupcomprobate', true)
end)

TriggerServerEvent('tm1_mafias:groupcomprobate', true)

------------------------------
----------REGISTROS-----------
------------------------------
RegisterNetEvent('tm1_mafias:groupcomprobated')
RegisterNetEvent('tm1_mafias:refreshedMoney')
RegisterNetEvent('tm1_mafias:refreshedGroup')
RegisterNetEvent('tm1_mafias:refreshedSteam')
RegisterNetEvent('tm1_mafias:contador')
RegisterNetEvent('pop_university:setBussinesMan')
------------------------------
----------VARIABLES-----------
------------------------------
group = {
	name = "",
	money = nil,
	rank = nil,
	aprove = nil,
	groupid = nil,
	steam = nil,
	source = nil,
	enclosure = nil,
	slot = nil
}

ISMENUACTIVE = true

BUSSINESMAN = false
WEAPONLEVEL = 0
------------------------------
---------TRADUCCIONES---------
------------------------------
rankLabel = {
	[1] = "SOLDADITO",
	[2] = "MATON",
	[3] = "SICARIO",
	[4] = "CAPO",
	[5] = "MANO DERECHA",
	[6] = "PATRON"
}
grouplabel = {
	[0] = "BANDA",
	[1] = "MAFIA",
	[2] = "FAMILIA",
	[3] = "CARTEL"
}
local forceStop = false
------------------------------
--------HILO PRINCIPAL--------
------------------------------
function drawLevel(r, g, b, a, txt)
	SetTextFont(4)
	SetTextScale(0.7, 0.7)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName("~r~"..txt)
	EndTextCommandDisplayText(0.915, 0.260)
end

function HUD()
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ISMENUACTIVE == true then
			if group.aprove ~= 2 then
				drawTxt(group.name,1, 1, 0.930, 0.260, 0.80,2255, 38, 0,255)
				drawTxt(rankLabel[group.rank],2, 1, 0.930, 0.315, 0.50,50, 168, 148,255)
			   	drawTxt(grouplabel[group.aprove],2, 1, 0.930, 0.340, 0.50,50, 93, 168,255)
				--drawTxt('RADIO: '..radios[group.enclosure],2, 1, 0.930, 0.375, 0.50,50, 93, 168,255)
			else
				drawTxt(group.name,1, 1, 0.930, 0.260, 0.80,255, 255, 0, 255)
				drawTxt(rankLabel[group.rank],2, 1, 0.930, 0.315, 0.50,255, 255, 255,255)
			   	drawTxt(grouplabel[group.aprove],2, 1, 0.930, 0.340, 0.50,255, 255, 255,255)
				--drawTxt('RADIO: '..radios[group.enclosure],2, 1, 0.930, 0.375, 0.50,50, 93, 168,255)
			end		
		end
	end
end)
end


RegisterNetEvent('tm1_mafias:SetKevlar')
AddEventHandler('tm1_mafias:SetKevlar',function(nivel)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
	RequestAnimDict("clothingshirt")
    while not HasAnimDictLoaded("clothingshirt") do
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(PlayerId()), "clothingshirt", "try_shirt_positive_d", 1.0, -1, -1, 50, 0, 0, 0, 0) -- mp_clothing@female@shirt  try_shirt_base    try_shirt_positive_a
        Citizen.Wait(10000)
	ClearPedTasks(GetPlayerPed(-1))
	if nivel == 25 then
		TriggerEvent('skinchanger:change', 'bproof_1', 1)
		TriggerEvent('skinchanger:change', 'bproof_2', 0)
	elseif nivel == 50 then
		TriggerEvent('skinchanger:change', 'bproof_1', 1)
		TriggerEvent('skinchanger:change', 'bproof_2', 4)
	elseif nivel == 75 then
		TriggerEvent('skinchanger:change', 'bproof_1', 1)
		TriggerEvent('skinchanger:change', 'bproof_2', 1)
	elseif nivel == 100 then
		TriggerEvent('skinchanger:change', 'bproof_1', 1)
		TriggerEvent('skinchanger:change', 'bproof_2', 5)
	end
		ESX.ShowNotification("Te has puesto tu chaleco")
		SetPedArmour(GetPlayerPed(-1), nivel)
	end)
end)

function mysqlFinish()
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if forceStop == false then
		else
			break
		end
	end
end)
end 

------------------------------
-----------EVENTOS------------
------------------------------
AddEventHandler('tm1_mafias:groupcomprobated',function(isGroup,name,rank,aprove,id,steam,source,enclosure, slot)
	isInAGroup = isGroup
	group.name = name
	group.rank = rank
	group.groupid = id
	group.steam = steam
	group.source = source
	group.enclosure = enclosure
	group.aprove = aprove
	group.slot = slot
	TriggerServerEvent('tm1_mafias:setGroup',group)
	HUD()
	--mysqlFinish()
	TriggerEvent('tm1_mafias:setInfo',group)
end)

AddEventHandler('tm1_mafias:refreshedMoney',function(id,money)
	if id == group.groupid then
		group.money = money
		TriggerServerEvent('tm1_mafias:setGroup',group)
	end
end)

AddEventHandler('tm1_mafias:refreshedSteam',function(steam,source)
	group.steam = steam
	group.source = source
	TriggerServerEvent('tm1_mafias:setGroup',group)
end)

AddEventHandler('tm1_mafias:contador',function(groupid)
	if groupid == group.groupid then
		TriggerServerEvent('tm1_mafias:addUser',group.groupid)
	end
end)

AddEventHandler('tm1_mafias:contador',function(groupid)
		if groupid == group.groupid then
			TriggerServerEvent('tm1_mafias:addUser',group.groupid)
		end
end)

AddEventHandler('pop_university:setBussinesMan',function()
	BUSSINESMAN = true
end)

AddEventHandler('pop_university:setWeaponLicense',function()
	WEAPONLEVEL = WEAPONLEVEL + 1
end)

AddEventHandler('tm1_mafias:refreshedGroup',function(id,opc,steam)
	--print('Tu org fue actualizada')
	TriggerServerEvent('tm1_mafias:groupcomprobate', false)
	if opc == "Fuck_This_Shit" and steam == group.steam or steam == "DFFDS54" then
		group.name = nil
		group.money = nil
		group.rank = nil
		group.groupid = nil
		group.aprove = nil
		group.enclosure = nil
		group.slot = nil
		TriggerServerEvent('tm1_mafias:setGroup',group)
		--BreakTheSystem()
		TriggerEvent('tm1_mafias:setInfo',group)
	end
end)
------------------------------
----------FUNCIONES-----------
------------------------------
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

function BreakTheSystem()
	Citizen.CreateThread(function ()
		forceStop = true
		Citizen.Wait(1000)
		forceStop = false
	end)
end

local blips = {
	{title="Sociedades Anónimas", colour=2, id=496, x = 1275.0, y = -1721.51, z = 53.66},
}
------------------------------
------------BLIPS-------------
------------------------------
--[[
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
]]