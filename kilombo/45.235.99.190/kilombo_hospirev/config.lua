Config = {}

------------------------------------------------------------------------------------------------------
------------------------------------------ GENERAL STUFF ---------------------------------------------
------------------------------------------------------------------------------------------------------ 
Config.Language = 'es'
Config.UsingESXLegacy = true -- If you are using ESX Legacy, set this to true and uncomment: '@es_extended/imports.lua' in fxmanifest.lua
Config.ReviveInvoice = 4000 -- Invoice for Revive & Heal
Config.HealPlayer = true -- Allow player to heal if is not dead
Config.UseRprogress = true -- Disable if you want to revive instantly https://forum.cfx.re/t/release-standalone-rprogress-customisable-radial-progress-bars/1630655
Config.EMSJobName = 'ambulance'
Config.EMSRequired = 15

------------------------------------------------------------------------------------------------------
-------------------------------------------- PED STUFF -----------------------------------------------
------------------------------------------------------------------------------------------------------ 

Config.PedLocations = {
    {x = -253.29, y = 6314.86, z = 32.43, h = 310.23}, -- Needs heading
    {x = 322.01, y = -590.49, z = 43.28, h = 156.76},
    {x = 1820.59, y= 3678.81, z= 34.27, h = 208.61}
 -- {x = 111.13213213122, y = -333.32332455522, z = 43.414144222222, h = 322.32424455551} *Make sure to add a comma ^^^^
}

-- You can find PED MODEL and hash here: https://wiki.rage.mp/index.php?title=Peds
Config.RequestModel = "s_m_m_scientist_01"
-- ^^ (Hash)
Config.PedModel = 0x4117D39B 

------------------------------------------------------------------------------------------------------
------------------------------------------ 3D TEXT STUFF ---------------------------------------------
------------------------------------------------------------------------------------------------------ 
Config.Text = {
    Scale = 0.32,
    Font = 4,
    Distance = 3.5
}

