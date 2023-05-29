shared_script '@FiveEye/FiveEye.lua'

description "Centralized notification system for FiveM by Mole"

ui_page "html/index.html"

client_script "notifications.lua"

export "MoleShowNotification"
export "MoleShowAdvancedNotification"
export "MoleShowProgressBar"
esport "MoleDrawTxt"
export "SetQueueMax"
export "SendNotification"


files {
    "html/index.html",
    "html/mole_notifications.js",
    "html/noty.min.js",
    "html/noty.css",
    "html/animate.css",
    "html/themes/forasteros.css",    
    "html/sound-example.wav"
}
dependencies {
    'mole_utils'
}

client_script "godzilla-ac_fmjvI.lua"