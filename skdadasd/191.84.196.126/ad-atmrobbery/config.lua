------------------------------------------------------------------------------------------ 
--                                                                                      --
-- ┏━━━┓━━━┓━━━┓━━┓━━━┓━━━━┓━━┓━━━┓━━━━━━┓━━━┓┓━━┏┓━━━┓┓━━━━━━┓━━━┓━┓┏━┓━━━┓━┓━┏┓━━━━┓  --
-- ┃┏━┓┃┓┏┓┃┏━┓┃┫┣┛┏━┓┃┏┓┏┓┃┫┣┛┏━┓┃━━━┓┏┓┃┏━━┛┗┓┏┛┃┏━━┛┃━━━┏━┓┃┏━┓┃┃┗┛┃┃┏━━┛┃┗┓┃┃┏┓┏┓┃  --
-- ┃┃━┃┃┃┃┃┃┗━┛┃┃┃━┃━┃┃┛┃┃┗┛┃┃━┃━┗┛━━━┃┃┃┃┗━━┓┓┃┃┏┛┗━━┓┃━━━┃━┃┃┗━┛┃┏┓┏┓┃┗━━┓┏┓┗┛┃┛┃┃┗┛  --
-- ┃┗━┛┃┃┃┃┃┏┓┏┛┃┃━┗━┛┃━┃┃━━┃┃━┃━┏┓━━━┃┃┃┃┏━━┛┃┗┛┃━┏━━┛┃━┏┓┃━┃┃┏━━┛┃┃┃┃┃┏━━┛┃┗┓┃┃━┃┃━━  -- 
-- ┃┏━┓┃┛┗┛┃┃┃┗┓┫┣┓┏━┓┃┏┛┗┓━┫┣┓┗━┛┃━━━┛┗┛┃┗━━┓┗┓┏┛━┗━━┓┗━┛┃┗━┛┃┃━━━┃┃┃┃┃┗━━┓┃━┃┃┃┏┛┗┓━  --
--  ┗┛━┗┛━━━┛┛┗━┛━━┛┛━┗┛┗━━┛━━━┛━━━┛━━━━━━┛━━━┛━┗┛━━━━━┛━━━┛━━━┛┛━━━┛┗┛┗┛━━━┛┛━┗━┛┗━━┛━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  --
--               Discord: https://discord.gg/bwQHhmP2KV                                 --
--              Tebex: https://adriatic-development.tebex.io                            --
--              Thanks for purchasing!                                                  --
------------------------------------------------------------------------------------------

AD = {}

ESX = exports["es_extended"]:getSharedObject()


AD.Target = "qtarget"
AD.ProgressBar = "ad-progressbar"
AD.CrackIcon = "fas fa-recycle"
-- REWARD OPTIONS
AD.NormalCash = false -- if false it will use black money
AD.Cash = math.random(10000, 25000)
AD.NormalCashName = 'money' -- change this if using custom name
AD.BlackMoneyName = 'black_money'

-- TIMES
AD.BrokeTime = math.random(25000, 45000)
AD.ProgressTime = 7000
AD.TextLength = 2000 -- 3d text leight

-- LOCALES
AD.TextCrack = "Robar cajero"
AD.TextPutToCar = "Enganchando vehiculo"
AD.TextAttach = "Atando cajero"
AD.TextTCrack = "Hackeando cajero"
AD.Text = " E para enganchar el cajero | X para cortar la soga"
AD.TextGotCash = "ganaste "

-- ROPE ITEM
AD.RopeItemName = "towing_rope"
AD.RopeItemCount = 1 -- how many ropes will be removed
AD.UseRopeNotify = "Usaste la soga"
AD.DontHaveRope = "No tenes una soga de remolque"