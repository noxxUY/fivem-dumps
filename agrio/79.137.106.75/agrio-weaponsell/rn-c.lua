local NPC = { x=-222.06, y=-2375.79, z=9.32, rotation = 176.27, NetworkSync = true}
cooldowned = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end


	
end)
--BLIPS 
--[[local blips = {
    {title="Traficante de Armas", colour=8, id=567, x = NPC.x, y = NPC.y, z = NPC.z}
}
      
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)]]--
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

--[[function IsJobTrue()
    if PlayerData ~= nil then
        local IsJobTrue = false
        if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
            IsJobTrue = true
        end
        
        return IsJobTrue
    end
end]]--


local coordonate = {
    {-222.02,-2375.7,8.32,"",183.39,0xC99F21C4,"a_m_y_business_01"},
    --{441.06457519531,-978.93707275391,29.689584732056,"Agent Politie",535.77,0x15F8700D,"s_f_y_cop_01"},
   -- {446.60791015625,-988.55383300781,29.689584732056,"Garda Politie",370.77,0x56C96FC6,"s_m_m_prisguard_01"},
   -- {-1570.9993896484,-574.92303466797,107.52293395996,"Registru comertului",381.77,0xC99F21C4,"a_m_y_business_01"}
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for _,v in pairs(coordonate) do
            x = v[1]
            y = v[2]
            z = v[3]
            if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                --DrawText3D(x,y,z+2.10, "~g~"..v[4], 1.2, 1)
               -- DrawText3D(x,y,z+1.95, "~w~Bun venit", 1.0, 1)
            end
        end
    end
end)


--[[Citizen.CreateThread(function()
    modelHash = GetHashKey("csb_g")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    createNPC() 
end)]]--

function createNPC()
    ped = CreatePed(0, modelHash , NPC.x,NPC.y,NPC.z - 1, NPC.rotation, NPC.NetworkSync)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "", 0, true)
end



function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 220
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        local player = PlayerPedId()
        local pcoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(pcoords.x, pcoords.y, pcoords.z, NPC.x, NPC.y, NPC.z, false)
        if distance < 1 then
            DrawText3D(NPC.x, NPC.y, NPC.z,"[E] para vender tu arma")
            if IsControlJustPressed(1, 38) then
                local pweapon = GetSelectedPedWeapon(player)
                -- print(pweapon)
                if pweapon == -1569615261 then
                    exports['mythic_notify']:SendAlert('error', 'No tienes encima ninguna arma.', 3500, { ['background-color'] = '#ff0000', ['color'] = '#ffffff' })
                else
                    if not cooldowned then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_KNUCKLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNUCKLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 3000)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SWITCHBLADE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SWITCHBLADE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_KNIFE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 1625)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_NIGHTSTICK") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HAMMER") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HAMMER"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 1)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_BAT") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BAT"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 1500)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_GOLFCLUB") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GOLFCLUB"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_CROWBAR") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HATCHET") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HATCHET"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_POOLCUE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_POOLCUE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_WRENCH") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_WRENCH"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_FLASHLIGHT") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 5500)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_BOTTLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BOTTLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 1250)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_DAGGER") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_DAGGER"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MACHETE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHETE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 3000)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_BATTLEAXE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BATTLEAXE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_COMBATPISTOL") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_VINTAGEPISTOL") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"))
                            --TriggerServerEvent("agrio-sellw:sellweapon", 0)
         --               elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MACHINEPISTOL") then
                  --          exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
--RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL50") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_REVOLVER") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_REVOLVER_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SNSPISTOL") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SNSPISTOL_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MARKSMANPISTOL") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANPISTOL"))
                            --TriggerServerEvent("agrio-sellw:sellweapon", 0)
                       -- elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HEAVYPISTOL") then
                          --  exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
--RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_DOUBLEACTION") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_DOUBLEACTION"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MICROSMG") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SMG") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SMG_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_ASSAULTSMG") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_COMBATPDW") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MINISMG") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MG") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_GUSENBERG") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_COMBATMG") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_COMBATMG_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) ==  GetHashKey("WEAPON_PUMPSHOTGUN") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SAWNOFFSHOTGUN") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SAWNOFFSHOTGUN"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HEAVYSHOTGUN") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_DBSHOTGUN") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_DBSHOTGUN"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MUSKET") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MUSKET"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("VWEAPON_ASSAULTRIFLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("VWEAPON_ASSAULTRIFLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"))
                       --     TriggerServerEvent("agrio-sellw:sellweapon", 0)
                      --  elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_CARBINERIFLE") then
                       --     exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
--RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_ADVANCEDRIFLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_COMPACTRIFLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SPECIALCARBINE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_BULLPUPRIFLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_SNIPERRIFLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HEAVYSNIPER") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"))
                        TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"))
                        TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MARKSMANRIFLE") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        elseif GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
                            exports['mythic_notify']:SendAlert('error', 'Has vendido tu arma.', 3500, { ['background-color'] = '#00aaff', ['color'] = '#ffffff' })
RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"))
                            TriggerServerEvent("agrio-sellw:sellweapon", 0)
                        else
                            Failed()
                        end
                        cooldowned = true
                        Citizen.Wait(10000)
                        cooldowned = false
                    end
                end
            end
        end
    end
end)