ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)



RegisterNetEvent('cosasvariadas:kevlar')
AddEventHandler('cosasvariadas:kevlar', function()
	local ped       = PlayerPedId()
	local armor     = GetPedArmour(ped)
	local item      = 'kevlar'
	
	if (armor >= 100) or (armor + 30 > 100) then
		exports['mythic_notify']:DoCustomHudText('cajaroja', ('¡Tu blindaje corporal ya está lleno!'), 5000)
		return
	end

	TriggerServerEvent('removeItem', item)
	
	TriggerEvent('mythic_progressbar:client:progress', {
		name            = 'pesado_armor',
		duration        = 10000,
		label           = 'Aplicando Chaleco Anti-Balas',
		useWhileDead    = false,
		canCancel       = false,
		controlDisables = {
			disableMovement    = true,
			disableCarMovement = true,
			disableMouse       = false,
			disableCombat      = true,
		},
		animation       = {
			animDict = "rcmfanatic3",
			anim     = "kneel_idle_a",
		},
		prop            = {
			model = "prop_bodyarmour_02",
		}
	}, function(status)
		if not status then
			SetPedComponentVariation(ped, 9, 12, 0, 0)
			SetPedArmour(ped, 99)
			exports['mythic_notify']:DoCustomHudText('cajaverde', 'Te equipaste un Chaleco Anti-Balas Pesado!', 4000)
		end
	end)
end)


