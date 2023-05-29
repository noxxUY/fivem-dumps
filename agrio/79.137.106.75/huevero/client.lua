local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

ESX                           = nil
local PlayerData                = {}
local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local hasAlreadyEnteredMarkerr 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false
local isInJoblistingMarkerr 		 = false
local bet = 0
local wtrakcie = false
local model = "prop_bucket_02a"
local bagModel = "prop_bucket_02a"
local bagspawned = nil
local maitem = false
local tekst = 0
local usos = 0
local cogiendo = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)

end)
local tempvacas = 2500
local peds = {
	gallina1 = {x=-142.06153869629, y=1900.4176025391, z=197.22192382813, h=272.1259765625},
	gallina2 =  {x=-146.30769348145, y=1901.1296386719, z=197.23876953125, h=170.07873535156},
	gallina3 =  {x=-146.46592712402, y=1915.0153808594, z=197.15454101563, h=11.338582038879},
}
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(tempvacas)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		if (GetDistanceBetweenCoords(coords, peds.gallina2.x,peds.gallina2.y, peds.gallina2.z, true) < 50.0)  then
			for i, a in pairs(peds) do
					ESX.Game.Utils.DrawText3D(a, '~b~[E] ~n~Recoger huevos', 0.6)		
					tempvacas = 0	
			end
		else
			tempvacas = 2500
			
	end
	end
end)
print('bacalao')

local tempvaca2 = 2500
Citizen.CreateThread(function()
	while true do

		Wait(tempvaca2)
		local coords      = GetEntityCoords(GetPlayerPed(-1))

local d = true
		if(GetDistanceBetweenCoords(coords, peds.gallina2.x,peds.gallina2.y, peds.gallina2.z, true) < 2.0) or (GetDistanceBetweenCoords(coords, peds.gallina3.x,peds.gallina3.y, peds.gallina3.z, true) < 2.0) or (GetDistanceBetweenCoords(coords, peds.gallina1.x,peds.gallina1.y, peds.gallina1.z, true) < 2.0) then

d = false
tempvaca2 = 1
tempvacaanda = 3000

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
      local zaplata = 0


					if ESX.GetPlayerData().job.name == 'huevero' then

								if IsControlJustReleased(0, Keys['E']) then
									if wtrakcie == false then
                                      zbieranie()
									end
								end
						end
					else
						tempvaca2 = 2500
						tempvacaanda= 25000
		end -- od getdistance
		if d == true then
			Citizen.Wait(3000)

		end
		end -- od while
end)

function contar()
 usos = usos + 1

end
function zbieranie()
	contar()
	if usos >= 5 then
		TriggerEvent('esx:showNotification', 'No tienes espacio para mas huevos!')
	else
TriggerEvent('freezehuevos')
wtrakcie = true
		TriggerEvent('progresoHuevosCount')
		TriggerEvent('progresoHuevos')
		TriggerEvent('animacionCogerHuevo')
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		Citizen.Wait(5000)
		Citizen.Wait(2000)
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		Citizen.Wait(1000)
		TriggerEvent('freezehuevos2')
		TriggerServerEvent('cogerhuevos')
		TriggerEvent('esx:showNotification', 'Recogiste ~b~'.. 25 .. ' huevos')
 end
end



RegisterNetEvent('freezehuevos')
AddEventHandler('freezehuevos', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('freezehuevos2')
AddEventHandler('freezehuevos2', function()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(PlayerPedId())
	maitem = true
Citizen.Wait(1000)
	wtrakcie = false

end)


RegisterNetEvent('animacionCogerHuevo')
AddEventHandler('animacionCogerHuevo', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
Citizen.Wait(2000)
end)



function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end
local tempvacaanda = 25000


Citizen.CreateThread(function()

	RequestModel(GetHashKey("a_c_hen"))
	while not HasModelLoaded(GetHashKey("a_c_hen")) do
		Wait(155)
	end
for k, a in pairs(peds) do
		local ped =  CreatePed(0, GetHashKey("a_c_hen"), a.x, a.y, a.z-1.0, 749.404, false, true)
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		--while true do
	--		Citizen.Wait(tempvacaanda)
	--		TaskPedSlideToCoord(ped, peds.gallina1.x, peds.gallina1.y, peds.gallina1.z, 749.404, 10)
--		end
	end
	end)

local tempvestla = 2500

 coordshuevo = {
	 vestuario = {x=-92.241760253906, y=1886.6900634766, z=197.32312011719},
	 vender= { x=-50.241756439209, y=1911.1384277344, z=195.70544433594}
 }

Citizen.CreateThread(function()
	while true do

		Wait(tempvestla)
		local coords  = GetEntityCoords(GetPlayerPed(-1))


if(GetDistanceBetweenCoords(coords, coordshuevo.vestuario.x, coordshuevo.vestuario.y, coordshuevo.vestuario.z, true) < 20.0) or (GetDistanceBetweenCoords(coords,  coordshuevo.vender.x, coordshuevo.vender.y, coordshuevo.vender.z, true) < 5.0) then

	tempvestla = 5
	ESX.Game.Utils.DrawText3D(coordshuevo.vestuario, '~b~[E] ~n~Vestuario', 0.6)	
			local coords      = GetEntityCoords(GetPlayerPed(-1))

                        local zaplata = 0

						if(GetDistanceBetweenCoords(coords, coordshuevo.vender.x, coordshuevo.vender.y, coordshuevo.vender.z, true) < 3.0) then
							tempvestla = 1
							ESX.ShowAdvancedNotification('Empaquetar huevos', '~y~Granja', '~y~[E] ~w~Empaqueta los huevos!', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 3)
								if IsControlJustReleased(0, Keys['E']) then
                            		if cogiendo == true then
										ESX.ShowNotification('Termina de empaquetar los huevos actuales!!')
									else  
									skup()
									  
								
									end
									end
								else
									tempvestla = 5

							end
	

								
								if(GetDistanceBetweenCoords(coords, coordshuevo.vestuario.x, coordshuevo.vestuario.y, coordshuevo.vestuario.z, true) < 5.0) then
									tempvestla = 1
									if IsControlJustReleased(0, Keys['E']) then
										
									ubrania()
									else
										tempvestla = 5
								end
	
								
						
		end
	else
		tempvestla = 2500
		end
	end
end)
local vestido = false
function ubrania()
	if ESX.GetPlayerData().job.name == 'huevero' then
		if vestido== false then
			vestido=true
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
	if skin.sex == 0 then
				--[[local clothesSkin = {
					 ['tshirt_1'] = 15, ['tshirt_2'] = 0,
					['torso_1'] = 43, ['torso_2'] = 0,
					['arms'] = 36, ['arms_2'] = 0,
					['pants_1'] = 27, ['pants_2'] = 3,
					['helmet_1'] = -1,  ['helmet_2'] = 0,
					['shoes_1'] = 26, ['shoes_2'] = 1
					}--]]
					local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
					   ['torso_1'] = 57, ['torso_2'] = 0,
					   ['arms'] = 74, ['arms_2'] = 0,
					   ['pants_1'] = 89, ['pants_2'] =22,
					   ['helmet_1'] = 89,  ['helmet_2'] = 1,
					   ['shoes_1'] = 71, ['shoes_2'] = 4
					   }
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				else
					--[[local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['torso_1'] = 169, ['torso_2'] = 1,
						['arms'] = 32, ['arms_2'] = 0,
						['pants_1'] = 27, ['pants_2'] = 3,
						['helmet_1'] = -1,  ['helmet_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0
						}--]]
						local clothesSkin = {
							['tshirt_1'] = 7, ['tshirt_2'] = 0,
						   ['torso_1'] = 49, ['torso_2'] = 0,
						   ['arms'] = 85, ['arms_2'] = 0,
						   ['pants_1'] = 92, ['pants_2'] =22,
						   ['helmet_1'] = 88,  ['helmet_2'] = 0,
						   ['shoes_1'] = 25, ['shoes_2'] = 0
						   }
						TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
					end
	end)
else
	vestido = false
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
end
end



function skup()
	cogiendo = true
	TriggerServerEvent('venderHuevos')

Citizen.Wait(3500)
	Citizen.Wait(13000)
	usos = usos * 0
	print('Usos a 0')
	FreezeEntityPosition(PlayerPedId(), false)
	wtrakcie = false
	cogiendo = false
end

local blips = {

	{title="Gallinas", colour=3, id=752, x = peds.gallina1.x, y =  peds.gallina1.y, z =  peds.gallina1.z},
	{title="Vestuarios de ganaderos hueveros", colour=3, id=366, x=-92.241760253906, y=1886.6900634766, z=197.32312011719},
	{title="Venta de huevos", colour=3, id=128, x=-50.241756439209, y=1911.1384277344, z=195.70544433594}
}      
Citizen.CreateThread(function()

   for _, info in pairs(blips) do
	 info.blip = AddBlipForCoord(info.x, info.y, info.z)
	 SetBlipSprite(info.blip, info.id)
	 SetBlipDisplay(info.blip, 4)
	 SetBlipScale(info.blip, 0.70)
	 SetBlipColour(info.blip, info.colour)
	 SetBlipAsShortRange(info.blip, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString(info.title)
	 EndTextCommandSetBlipName(info.blip)
   end

end)

local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}
RegisterNetEvent('progresoHuevos')
AddEventHandler('progresoHuevos', function()
while true do
	Citizen.Wait(5)
	if wtrakcie == true then

	drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~y~[~w~".. tekst .. "%~y~]", 255, 255, 255, 255)

end
end
end)
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
RegisterNetEvent('tofalsehueos')
AddEventHandler('tofalsehueos', function()
wtrakcie = false
end)
RegisterNetEvent('progresoHuevosCount')
AddEventHandler('progresoHuevosCount', function()
	Citizen.Wait(132)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)
tekst = tekst + 1
Citizen.Wait(168)


Citizen.Wait(1500)
tekst = 0
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

