RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////P O L I C I A /////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--

modelos = {
    pfaimpala={
        modelo="pfaimpala",
        tipo="coche"
    },

    pfafocus={
        modelo="pfafocus",
        tipo="coche"
    },

    polmav={
        modelo="POLMAV",
        tipo="heli"
    },
    mwannihilator={
        modelo="mwannihilator",
        tipo="heli"
    },
    pfamondeo={
        modelo="pfamondeo",
        tipo="coche"
    },

    hcbr500rgn={
        modelo="HCBR500RGN",
        tipo="moto"
    },

    anpc_l200={
        modelo="anpc l200",
        tipo="coche"
    },
    pfapolo={
        modelo="pfapolo",
        tipo="coche"
    },
    pfaranger={
        modelo="pfaranger",
        tipo="coche"
    },
    pfasplinter={
        modelo="pfasplinter",
        tipo="coche"
    },
    pfatt={
        modelo="pfatt",
        tipo="coche"
    },
    08evopol={
        modelo="08evopol",
        tipo="coche"
    },
    polgresley={
        modelo="polgresley",
        tipo="coche"
    },
    polgs350={
        modelo="polgs350",
        tipo="coche"
    },
    police2={
        modelo="police2",
        tipo="coche"
    },
    tfft={
        modelo="BARRACKS2",
        tipo="coche"
    },

    bearcatBCSO={
        modelo="Swat BearCa",
        tipo="coche"
    },

}

--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////&&/////////G E N D A R M E R I A////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--

modelosGNA = {
    gnahummer={
        modelo="gnahummer",
        tipo="coche"
    },

    gnaimpala={
        modelo="gnaimpala",
        tipo="coche"
    },

    gnamondeo={
        modelo="gnamondeo",
        tipo="coche"
    },

    gnaranger={
        modelo="gnaranger",
        tipo="coche"
    },

    gnasplinter={
        modelo="gnasplinter",
        tipo="coche"
    },

    centurionlssd={
        modelo="JMBEARCAT",
        tipo="coche"
    },

    heligna={
        modelo="VALKYRIE",
        tipo="heli"
    },

}


--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////S   A   M   E /////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////--

modelosSAME = {
    ambulance={
        modelo="AMBULAN",
        tipo="coche"
    },

    motobm={
        modelo="motobm",
        tipo="moto"
    },

    ghispo2={
        modelo="ghispo2",
        tipo="coche"
    },

    polgs350={
        modelo="AS350",
        tipo="heli"
    },

}

AddEventHandler('esx:enteredVehicle', function(vehicle, plate, seat, displayName, netId)
    -- print('esx:enteredVehicle', 'vehicle', vehicle, 'plate', plate, 'seat', seat, 'displayName', displayName, 'netId', netId)

    local ply = PlayerPedId()

    for k,v in pairs(modelos) do

        if displayName == v.modelo and GetPedInVehicleSeat(vehicle, -1) == ply then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic2' or ESX.PlayerData.job.name == 'mechanic3' then
                prohibido = false
            else
                if v.tipo == "heli" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser policía para usar este helicóptero", 4500, "error")
                elseif v.tipo == "coche" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser policía para usar este vehículo", 4500, "error")
                elseif v.tipo == "moto" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser policía para usar esta moto", 4500, "error")
                end
            end

        end

    end

    for k,v in pairs(modelosSAME) do

        if displayName == v.modelo and GetPedInVehicleSeat(vehicle, -1) == ply then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic2' or ESX.PlayerData.job.name == 'mechanic3' then
                prohibidoSAME = false
            else
                if v.tipo == "heli" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser SAME para usar este helicóptero", 4500, "error")
                elseif v.tipo == "coche" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser SAME para usar este vehículo", 4500, "error")
                elseif v.tipo == "moto" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser SAME para usar esta moto", 4500, "error")
                end
            end

        end

    end

    for k,v in pairs(modelosGNA) do

        if displayName == v.modelo and GetPedInVehicleSeat(vehicle, -1) == ply then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'gna' or ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic2' or ESX.PlayerData.job.name == 'mechanic3' then
                prohibidoGNA = false
            else
                if v.tipo == "heli" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser G.N.A para usar este helicóptero", 4500, "error")
                elseif v.tipo == "coche" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser G.N.A para usar este vehículo", 4500, "error")
                elseif v.tipo == "moto" then
                    TaskLeaveVehicle(ply, vehicle, 16)
                    exports['okokNotify']:Alert("Servidor", "Tenés que ser G.N.A para usar esta moto", 4500, "error")
                end
            end

        end

    end


end)