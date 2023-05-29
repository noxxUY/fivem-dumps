------
-- InteractSound by Scott
-- Verstion: v0.0.1
------

-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files({
    'client/html/index.html',
    -- Begin Sound Files Here...
    -- client/html/sounds/ ... .ogg
    'client/html/sounds/purge.ogg',
    'client/html/sounds/humancor.ogg',
   'client/html/sounds/hallo1.ogg',
    'client/html/sounds/hallo2.ogg',
    'client/html/sounds/hallo3.ogg',
    'client/html/sounds/hallo4.ogg',
    'client/html/sounds/hallo5.ogg',
    'client/html/sounds/iphoneSnowi.ogg',
  --  'client/html/sounds/chow.ogg',
   -- 'client/html/sounds/xmas.ogg',
    'client/html/sounds/hallo7.ogg',
    'client/html/sounds/hallo8.ogg',
    'client/html/sounds/hallo9.ogg',
    'client/html/sounds/halloagrio.ogg',
    'client/html/sounds/tormenta.ogg',
    'client/html/sounds/oficina.ogg',

  --  'client/html/sounds/navidad.ogg',
  --  'client/html/sounds/peces.ogg',
  --  'client/html/sounds/santaho.ogg',
  --  'client/html/sounds/xmas2004.ogg',

    'client/html/sounds/Cuff.ogg',
    'client/html/sounds/BellStartEnd.ogg',
    'client/html/sounds/RumbleStart.ogg',
    'client/html/sounds/Pager.ogg',

    'client/html/sounds/Uncuff.ogg',
    'client/html/sounds/warehousealert.ogg',
    'client/html/sounds/warehousealert2.ogg',    
    --'client/html/sounds/demo.ogg'
})



















client_script '@car/str/ReadMe.lua'