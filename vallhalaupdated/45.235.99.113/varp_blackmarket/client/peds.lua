Citizen.CreateThread(function()
    local hash = GetHashKey("mp_m_weapexp_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("mp_m_weapexp_01", "mp_m_weapexp_01", -1203.703857, -1793.917603, 3.00, 116.89, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)