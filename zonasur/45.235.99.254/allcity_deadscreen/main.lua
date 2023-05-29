-- MADE BY KALU AND KASHNAR
-- [ALL CITY]
-- version : 1.00
-- update : 16/06/2018
-- info: 

local isPlayerDead = false
local timeLeft = 60
local start_timer = false
local mododm = false

function SetDM(bool)
	mododm = bool
end

Citizen.CreateThread(function()
    while true do
	--local mododm = exports["DM3"]:GetDM()
	--local mododm2 = exports["1974_pcw2"]:GetDM()
        if IsPlayerDead(PlayerId()) and not mododm then
            if isPlayerDead == false then 
                isPlayerDead = true
                SendNUIMessage({
					setDisplay = true
				})
				start_timer = true
            end
			if timeLeft == 0 then
				SendNUIMessage({
					setDisplay = false
				})	
			end
        else 
            if isPlayerDead == true then
                isPlayerDead = false
				start_timer = false
				timeLeft = 60
                SendNUIMessage({
					setDisplay = false
	})
            end
        end
        Citizen.Wait(100)
    end
end)

Citizen.CreateThread(function()
    while true do
	Wait(0)
		if start_timer and timeLeft > 0 then
			timeLeft = timeLeft - 1
			Wait(1000)
		end	
	end	
end)