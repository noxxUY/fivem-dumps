cachedPlant = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(12200)
        cachedPlant = {}
    end
end)


local options = {
    {
        name = 'ox:option1',
        event = 'interactivo:propJobMiner',
        icon = 'fas fa-magic',
        label = 'Picar Piedra',
        canInteract = function(entity, distance, coords, name, bone)
            return math.random(0,1) < 51
        end
    }
}

local models = { `prop_test_rocks03` }

exports.ox_target:addModel(models, options)



RegisterNetEvent("interactivo:propJobMiner", function()
	local x = GetClosestObjectOfType(playerCoords, 2.0, GetHashKey(prop_test_rocks03), false, false, false)
	if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2954.4988, 2787.4429, 41.4743) < 55 then
		entity = x
			if not cachedPlant[entity] then
				TriggerEvent("mythic_progbar:client:progress", {
					name = "unique_action_name",
					duration = 4600,
					label = "Minando",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					},
					animation = {
						animDict = "amb@world_human_const_drill@male@drill@base",
						anim = "base",
					},
					prop = {
						model = "prop_tool_jackham",
					}
				}, function(status)
					if not status then
					--	ExecuteCommand ("propfix")	
							TriggerServerEvent('interactivo:ObtenerPiedra', 'pingon')
						cachedPlant[entity] = true
					end
				end)
					
				Wait(4700)	
			else
				ESX.ShowNotification('Esta roca esta sin materiales espera un momentosa...')
			end
		else
		print('Estas Lejos amigo')
	end	
end)

---- Fin Farmeo de Piedras


---- LAvado de piedras

for i=1, #Config.Zones do

	
	exports.ox_target:addSphereZone({
    coords = vec3(Config.Zones[i].coords),
    radius = 3,
    debug = drawZones,
		options = {
			{
				name = 'sphere',
				event = 'interactivo:LavandoPiedra',
				icon = 'fa-solid fa-cube',
				label = 'Lavar Piedra'
			}
		}
	})


end


RegisterNetEvent("interactivo:LavandoPiedra", function()

		TriggerEvent("mythic_progbar:client:progress", {
			name = "unique_action_name",
			duration = 2600,
			label = "Lavando",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = true,
				disableCombat = true,
			},
			animation = {
				animDict = "amb@world_human_bum_wash@male@high@idle_a",
				anim = "idle_a",
			},
			prop = {
				model = "prop_rock_5_smash1",
			}
		}, function(status)
			if not status then
				-- Do Something If Event Wasn't 
				
		TriggerServerEvent('interactivo:ObtenerPiedraLavada', 'pingaracho')
			end
		end)
		Wait(2700)	
			

end)

---- Fundir Piedras

for i=1, #Config.Fundicion do

	
	exports.ox_target:addSphereZone({
    coords = vec3(Config.Fundicion[i].coords),
    radius = 3,
    debug = drawZones,
		options = {
			{
				name = 'sphere',
				event = 'interactivo:FundirPiedra',
				icon = 'fa-solid fa-cube',
				label = 'Fundir Piedra'
			}
		}
	})


end


RegisterNetEvent("interactivo:FundirPiedra", function()

		TriggerEvent("mythic_progbar:client:progress", {
			name = "unique_action_name",
			duration = 2600,
			label = "Fundiendo",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = true,
				disableCombat = true,
			},
			animation = {
				animDict = "amb@world_human_bum_wash@male@high@idle_a",
				anim = "idle_a",
			},
			prop = {
				-- model = "prop_rock_5_smash1",
			}
		}, function(status)
			if not status then
				-- Do Something If Event Wasn't 
				
		TriggerServerEvent('interactivo:FundirPiedritas', 'pingaracho')
			end
		end)
		Wait(2700)	
			

end)

-- crear comando
--[[
RegisterCommand('tetones', function()
    TriggerServerEvent('interactivo:ObtenerPiedra', 'pingon')
end)
]]
