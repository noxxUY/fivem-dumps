server_script "H93FWSE7JZ6DKHB.lua"
client_script "H93FWSE7JZ6DKHB.lua"


resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'Manvaril'
description 'Vehicle Door/Window/Seat/Engine/Dome Light NUI script'
version '1.1.3'

ui_page "html/vehui.html"

files {
  "html/vehui.html",
  "html/style.css",
  "html/img/doorFrontLeft.png",
  "html/img/doorFrontRight.png",
  "html/img/doorRearLeft.png",
  "html/img/doorRearRight.png",
  "html/img/frontHood.png",
  "html/img/ignition.png",
  "html/img/rearHood.png",
  "html/img/rearHood2.png",
  "html/img/seatFrontLeft.png",
  "html/img/windowFrontLeft.png",
  "html/img/windowFrontRight.png",
  "html/img/windowRearLeft.png",
  "html/img/windowRearRight.png",
  "html/img/interiorLight.png"
}

client_script {
  'config.lua',
  'client.lua'
}

export {
  'openExternal'
}





