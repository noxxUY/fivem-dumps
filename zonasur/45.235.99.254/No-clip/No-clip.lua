--==--==--==--
-- Config
--==--==--==--
local group

ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
	print('group setted ' .. g)
	group = g
end)

config = {
    controls = {
        -- [[Controls, list can be found here : https://docs.fivem.net/game-references/controls/]]
        openKey = 137, -- [[F2]]
        goUp = 85, -- [[Q]]
        goDown = 48, -- [[Z]]
        turnLeft = 34, -- [[A]]
        turnRight = 35, -- [[D]]
        goForward = 32,  -- [[W]]
        goBackward = 33, -- [[S]]
        changeSpeed = 21, -- [[L-Shift]]
    },

    speeds = {
        -- [[If you wish to change the speeds or labels there are associated with then here is the place.]]
        { label = "Muy Lento", speed = 0},
        { label = "Lento", speed = 0.5},
        { label = "Normal", speed = 2},
        { label = "Rapido", speed = 4},
        { label = "Muy Rapido", speed = 6},
        { label = "Super Rapido", speed = 10},
        { label = "Mega Rapido", speed = 20},
        { label = "Maxima Velocidad", speed = 25}
    },

    offsets = {
        y = 0.5, -- [[How much distance you move forward and backward while the respective button is pressed]]
        z = 0.2, -- [[How much distance you move upward and downward while the respective button is pressed]]
        h = 3, -- [[How much you rotate. ]]
    },

    -- [[Background colour of the buttons. (It may be the standard black on first opening, just re-opening.)]]
    bgR = 0, -- [[Red]]
    bgG = 0, -- [[Green]]
    bgB = 0, -- [[Blue]]
    bgA = 80, -- [[Alpha]]
}

--==--==--==--
-- End Of Config
--==--==--==--

local noclipActive = false -- [[Wouldn't touch this.]]

index = 1 -- [[Used to determine the index of the speeds table.]]


Citizen.CreateThread(function()

    buttons = setupScaleform("instructional_buttons")

    currentSpeed = config.speeds[index].speed

    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, config.controls.openKey) then
			ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
				if group == "mod" or group == "admin" or group == "gm" or group == "sl" or group == "ds" or group == "superadmin" then
					local duty = exports["tron"]:GetTron()
					if duty then
						noclipActive = not noclipActive
	
						if IsPedInAnyVehicle(PlayerPedId(), false) then
							noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
						else
							noclipEntity = PlayerPedId()
						end
						
						SetEntityCollision(noclipEntity, not noclipActive, not noclipActive)
						FreezeEntityPosition(noclipEntity, noclipActive)
						FreezePedCameraRotation(noclipEntity)
						SetEntityInvincible(noclipEntity, noclipActive)
						SetVehicleRadioEnabled(noclipEntity, not noclipActive)
						
						SetEntityVisible(noclipEntity, not noclipActive);
						ResetEntityAlpha(noclipEntity);
						
					else
						ESX.ShowNotification('~r~Debes estar como Tron para NoClip!')
					end	
				end	
			end)	
		end

        if noclipActive then
			
            DrawScaleformMovieFullscreen(buttons)
            local yoff = 0.0
            local zoff = 0.0

            if IsControlJustPressed(1, config.controls.changeSpeed) then
                if index ~= 8 then
                    index = index+1
                    currentSpeed = config.speeds[index].speed
                else
                    currentSpeed = config.speeds[1].speed
                    index = 1
                end
                setupScaleform("instructional_buttons")
            end
				
			DisableControls()

			if IsDisabledControlPressed(0, config.controls.goForward) then
                yoff = config.offsets.y
			end
			
            if IsDisabledControlPressed(0, config.controls.goBackward) then
                yoff = -config.offsets.y
			end
			
            if IsDisabledControlPressed(0, config.controls.turnLeft) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)+config.offsets.h)
			end
			
            if IsDisabledControlPressed(0, config.controls.turnRight) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)-config.offsets.h)
			end
			
            if IsDisabledControlPressed(0, config.controls.goUp) then
                zoff = config.offsets.z
			end
			
            if IsDisabledControlPressed(0, config.controls.goDown) then
                zoff = -config.offsets.z
			end
			
            local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))
            local heading = GetEntityHeading(noclipEntity)	
            SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
            SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
            SetEntityHeading(noclipEntity, heading)
            SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, noclipActive, noclipActive, noclipActive)
			SetEntityAlpha(noclipEntity, 51, false);			
			--SetLocalPlayerVisibleLocally(true);
			SetEntityLocallyVisible(PlayerPedId())			
        end
    end
end)

--==--==--==--
-- End Of Script
--==--==--==--
