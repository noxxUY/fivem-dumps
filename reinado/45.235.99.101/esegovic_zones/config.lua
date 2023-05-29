--GLOBAL CONFIG
Config = {
    ESXLibrary = "esx:getSharedObject",
    CapturingTime = 120, --in Sec,
    CheckPlayersForCapturing = true, --That will check 3 players to be near to capture, set to false to capture alone
    MinPlayersToCapture = 2, --If you write here 3 there needs to be YOu and 3 MORE player to start capture
    --DISCORD
    DiscordWebhooks = {
        ZoneCaptured = "https://discord.com/api/webhooks/1058765280131686470/aDBRnCHJlxw0wP_2R_gucC-pAMBse_1umxypI8wBjJ7CeLR_6g_qJbBovixLkNXNPBF-",
        TryingToCapture = "https://discord.com/api/webhooks/1058765376315469916/pROEWKhEwYp_lnzNay-gj5_j-kWgKFExMKeijDU3Pb5wGud9kdewvhc0_hO1HvUMVSAI",
    },
    DiscordBotName = "ReinadoRP",
    DiscordHeader = "Capturando Zonas",
    --REWARD TIME
    RewardTime = 600,  --in sec (900 sec = 15min)
    --LINK FOR BLIPS: https://docs.fivem.net/docs/game-references/blips/
    --BLIPS COLORS
    BlipRadisuFree = 2,  --COLOR GREEN
    BlipRadiusTaken = 1,  --COLOR RED
    --BLIPS ID
    BlipSpiritFree = 197,  --SPIRIT
    BlipSpiritTaken = 303, --SPIRIT
    --REWARDS
    RewardMoneyX = true,  --want to enable money reward ? if not set it to false!
    RewardMoneyY = 50,  --how much money do you want to reward each player from job that is owning a zone?
    RewardItemX = true, --Do you want item rewards ? if not set it to false
    RewardItemY = 5, --How much items do you want to get it as reward for owning zone?
    RewardItems = {  --List of all items you want to player get if RewardItemX is set to true. .. 
        "marihuana"
    },
    Gangs = {
        "mafia02",
        "mafia03",
        "mafia04",
        "mafia05",
        "mafia06",
        "mafia07",
        "mafia08",
        "mafia09",
        "mafia10",
        "mafia11",
        "mafia12",
        "mafia13",
        "mafia14",
        "mafia15",
        "mafia16",
        "mafia17",
        "mafia18",
        "mafia19",
        "mafia20",
        "mafia21",
        "mafia22",
        "mafia23",
        "mafia24",
        "mafia25",
        "mafia26",
        "mafia27",
        "mafia28",
        "mafia29",
        "mafia30",
        "mafia31",
        "mafia32",
        "mafia33",
        "mafia34",
        "mafia35",
        "mafia36",
        "mafia37",
        "mafia38",
        "mafia39",
        "mafia40",
        "mafia41",
        "mafia42",
        "mafia43",
        "mafia44",
        "mafia45",
        "mafia46",
        "mafia47",
        "mafia48",
        "mafia49",
        "mafia50",
        "police"
    },
    Translate = {
        [0] = "~w~[~r~E~w~] ~s~Capturar",
        [1] = "~w~[~r~E~w~] ~s~Unirse a la Captura",
        [5] = " / 3",
        [10] = "LIBRE",
        [11] = "La Zona: ~r~",
        [12] = "Esta controlado por:",
        [13] = "Tiempo para capturar:",
        [14] = "Tu Organización ya está controlando este lugar.",
        [15] = "Si desea capturar, debe haber al menos 3 miembros de tu organización.",
        [16] = "Zona en captura. Tiempo restante: ",
        [20] = "La esta capturando:",
        [21] = "Fallaste captura!",
        [22] = "Organización:",
        [23] = "have captured a zone:",
        [24] = "is trying to capture a zone: "
    }
}