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
	cabra = {x=2433.19, y=4746.45, z=33.4 } 
}
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(tempvacas)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		if (GetDistanceBetweenCoords(coords, 2441.460, 4755.190, 33.70, true) < 50.0)  then
		
					ESX.Game.Utils.DrawText3D({ x = 2441.06, y = 4755.05, z = 33.85 }, '~y~[E] ~w~Ordeñar vaca', 0.6)		
					ESX.Game.Utils.DrawText3D({ x = 2426.36, y = 4751.15, z = 34.35 }, '~y~[E] ~w~Ordeñar vaca', 0.6)	
					ESX.Game.Utils.DrawText3D({ x = 2434.870, y = 4764.150, z = 33.80 }, '~y~[E] ~w~Ordeñar vaca', 0.6)				
					ESX.Game.Utils.DrawText3D({ x = 2430.76, y = 4773.95, z = 33.85 }, '~y~[E] ~w~Ordeñar vaca', 0.6)			
					ESX.Game.Utils.DrawText3D({ x = peds.cabra.x, y = peds.cabra.y, z = peds.cabra.z }, '~y~[E] ~w~Ordeñar cabriña', 0.6)		
					tempvacas = 0	
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
		if(GetDistanceBetweenCoords(coords, 2441.460, 4755.190, 33.70, true) < 2.0) or (GetDistanceBetweenCoords(coords, 2426.370, 4751.750, 34.20, true) < 2.0) or (GetDistanceBetweenCoords(coords, peds.cabra.x,peds.cabra.y, peds.cabra.z, true) < 2.0) or (GetDistanceBetweenCoords(coords, 2434.870, 4764.150, 33.20, true) < 2.0) or (GetDistanceBetweenCoords(coords, 2430.70, 4773.9750, 33.80, true) < 2.0) then

d = false
tempvaca2 = 1
tempvacaanda = 3000

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
      local zaplata = 0


					if ESX.GetPlayerData().job.name == 'vaca' then

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
		TriggerEvent('esx:showNotification', 'No tienes espacio para mas leche!')
	else
--TriggerServerEvent('smerfikcraft:zlomiarzzbier2')

TriggerEvent('wiadro:postaw')
TriggerEvent('smerfik:zamrozcrft222')
wtrakcie = true
		TriggerEvent('zacznijtekst22')
		TriggerEvent('smerfik:tekstjab22')
		TriggerEvent('smerfik:craftanimacja222')
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
		TriggerEvent('smerfik:odmrozcrft222')
		TriggerServerEvent('cogerleche')
		TriggerEvent('esx:showNotification', 'Recogiste ~y~'.. 25 .. ' leche')
 end
end
RegisterNetEvent('wiadro:postaw')
AddEventHandler('wiadro:postaw', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)
if maitem == false then
	ESX.Game.SpawnObject(model, {
		x = x,
		y = y,
		z = z
	}, function(obj)
		SetEntityHeading(obj, GetEntityHeading(playerPed))
		PlaceObjectOnGroundProperly(obj)
		Citizen.Wait(10000)
		DeleteObject(obj)
	end)
end
end)


RegisterNetEvent('smerfik:zamrozcrft222')
AddEventHandler('smerfik:zamrozcrft222', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('smerfik:odmrozcrft222')
AddEventHandler('smerfik:odmrozcrft222', function()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(PlayerPedId())

	

	TriggerEvent('podlacz:propa22')
	maitem = true

Citizen.Wait(1000)
	wtrakcie = false

end)


RegisterNetEvent('smerfik:craftanimacja222')
AddEventHandler('smerfik:craftanimacja222', function()
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
  
	RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(155)
	end

		local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2441.06, 4755.95, 33.35, -149.404, false, true)
	    FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		while true do
			Citizen.Wait(tempvacaanda)
			TaskPedSlideToCoord(ped, 2441.76, 4755.95, 33.45, -149.404, 10)
		end
end)
Citizen.CreateThread(function()

RequestModel(GetHashKey("a_c_cow"))
while not HasModelLoaded(GetHashKey("a_c_cow")) do
	Wait(155)
end

	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2426.36, 4751.15, 33.35, -349.404, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2426.36, 4751.15, 34.35, -349.404, 10)
	end
end)
Citizen.CreateThread(function()

RequestModel(GetHashKey("a_c_cow"))
while not HasModelLoaded(GetHashKey("a_c_cow")) do
	Wait(155)
end

	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2434.76, 4764.95, 33.35, 149.404, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	while true do
		Citizen.Wait(tempvacaanda)
		TaskPedSlideToCoord(ped, 2434.76, 4764.95, 33.45, 749.404, 10)
	end
end)
Citizen.CreateThread(function()

RequestModel(GetHashKey("a_c_cow"))
while not HasModelLoaded(GetHashKey("a_c_cow")) do
	Wait(155)
end

	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2430.76, 4773.95, 33.45, 749.404, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	while true do
		Citizen.Wait(tempvacaanda)
		TaskPedSlideToCoord(ped, 2430.76, 4773.95, 33.45, 749.404, 10)
	end
end)
Citizen.CreateThread(function()

	RequestModel(GetHashKey("a_c_deer"))
	while not HasModelLoaded(GetHashKey("a_c_deer")) do
		Wait(155)
	end
	
		local ped =  CreatePed(0, GetHashKey("a_c_deer"), peds.cabra.x, peds.cabra.y, peds.cabra.z, 749.404, false, true)
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		while true do
			Citizen.Wait(tempvacaanda)
			TaskPedSlideToCoord(ped, peds.cabra.x, peds.cabra.y, peds.cabra.z, 749.404, 10)
		end
	end)

local tempvestla = 2500
Citizen.CreateThread(function()
	while true do

		Wait(tempvestla)
		local coords  = GetEntityCoords(GetPlayerPed(-1))


if(GetDistanceBetweenCoords(coords, 2512.740, 4761.850, 34.90, true) < 20.0) or (GetDistanceBetweenCoords(coords, 2500.960, 4800.750, 34.740, true) < 5.0) then

	tempvestla = 5
	ESX.Game.Utils.DrawText3D({ x = 2512.870, y = 4761.850, z = 34.90 }, '~y~[E] ~w~Vestuario', 0.6)	
			local coords      = GetEntityCoords(GetPlayerPed(-1))

                        local zaplata = 0

						if(GetDistanceBetweenCoords(coords, 2500.960, 4800.750, 34.740, true) < 3.0) then
							tempvestla = 1
							ESX.ShowAdvancedNotification('Verter la leche', '~y~Granja', '~y~[E] ~w~Verter la leche en la maquina', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 3)
								if IsControlJustReleased(0, Keys['E']) then
                            		if cogiendo == true then
										ESX.ShowNotification('Debes terminar de vender los anteriores Litros para volver a vender!!')
									else  
									skup()
									  
								
									end
									end
								else
									tempvestla = 5

							end
	

								
								if(GetDistanceBetweenCoords(coords, 2512.740, 4761.850, 34.90, true) < 5.0) then
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
	if ESX.GetPlayerData().job.name == 'vaca' then
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
RegisterNetEvent('podlacz:propa22')
AddEventHandler('podlacz:propa22', function()
	local ad = "anim@heists@box_carry@"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

if maitem == false then
		bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, -0.24, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)
		
end
Citizen.Wait(10000)
end)
RegisterNetEvent('sprzedawanie:jablekanim22')
AddEventHandler('sprzedawanie:jablekanim22', function()

	local playerPed = PlayerPedId()
	local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
	FreezeEntityPosition(playerPed, true)
	ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
end)
function skup()
	cogiendo = true
	TriggerServerEvent('smerfikcraft:skup22')

Citizen.Wait(3500)
	Citizen.Wait(13000)
	usos = usos * 0
	print('Usos a 0')
	FreezeEntityPosition(PlayerPedId(), false)
	wtrakcie = false
	cogiendo = false
end
	
RegisterNetEvent('odlacz:propa3')
AddEventHandler('odlacz:propa3', function()
	DetachEntity(bagspawned, 1, 1)
	ClearPedSecondaryTask(PlayerPedId())

end)
RegisterNetEvent('odlacz:propa2')
AddEventHandler('odlacz:propa2', function()
	DeleteObject(bagspawned)

	maitem = false

	FreezeEntityPosition(PlayerPedId(), false)
end)

local blips = {

	{title="Vacas", colour=4, id=141, x = 2438.240, y = 4765.890, z = 35.00},
	{title="Vestuarios de ganaderos lecheros", colour=4, id=366, x = 2512.990, y = 4762.750, z = 34.90},
	{title="Máquina de lácteos", colour=4, id=402, x = 2502.120, y = 4801.250, z = 43.740}

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

local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}
RegisterNetEvent('smerfik:tekstjab22')
AddEventHandler('smerfik:tekstjab22', function()
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
RegisterNetEvent('smerfik:zdejmijznaczek22')
AddEventHandler('smerfik:zdejmijznaczek22', function()
wtrakcie = false
end)
RegisterNetEvent('zacznijtekst22')
AddEventHandler('zacznijtekst22', function()
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

Citizen.Wait(1500)
tekst = 0
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

