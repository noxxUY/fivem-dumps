local crouched = false

RegisterCommand('crouch', function()
    local ped = PlayerPedId()
    DisableControlAction(0 , 36 , true)
    crouched = not crouched
			
    if not IsPauseMenuActive() then
        if (crouched) then
            CreateThread(function()
                RequestAnimSet("move_ped_crouched")
                while not HasAnimSetLoaded("move_ped_crouched") do
                    Citizen.Wait(100)
                end
                while crouched do
                    SetPedMovementClipset(ped, "move_ped_crouched" , 0.25)
                    Wait(1)
                end
                RemoveAnimDict('move_ped_crouched')
                SetPedMaxMoveBlendRatio(ped, 1.0)
                ResetPedMovementClipset(ped, 0.25)
                ResetPedStrafeClipset(ped)
                SetPedCanPlayAmbientAnims(ped, true)
                SetPedCanPlayAmbientBaseAnims(ped, true)
                ResetPedWeaponMovementClipset(ped)
            end)
        end
    end
end)
RegisterKeyMapping('crouch', 'Crouch', 'keyboard', 'LCONTROL')