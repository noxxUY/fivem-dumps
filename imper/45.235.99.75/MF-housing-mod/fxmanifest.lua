





fx_version 'adamant'
games { 'rdr3', 'gta5' }

mod 'allhousing'
version '1.0.7'

client_scripts {
  -- NATIVE UI DEPENDENCY
  -- COMMENT OUT IF NOT USING NATIVEUI

  -- SOURCE
  'config.lua',
  'houses.lua', 
  'labels.lua', 

  'src/utils.lua',  

  'src/client/framework/framework_functions.lua',
  'src/client/menus/menus.lua',
  'src/client/menus/menus_native.lua',
  'src/client/menus/menus_esx.lua',

  'src/client/functions.lua',
  'src/client/pepe.lua',
  'src/client/commands.lua',
}

server_scripts {
  -- MYSQL DEPENDENCY
  '@mysql-async/lib/MySQL.lua',

  -- SOURCE
  'config.lua',
  'credentials.lua',
  'houses.lua',  
  'labels.lua', 

  'src/utils.lua',
  
  'src/server/framework/framework_functions.lua',

  'src/server/functions.lua',
  'src/server/main.lua',
}

dependencies {
  -- COMMENT OUT IF NOT USING ESX
  'es_extended',

  -- COMMENT OUT IF NOT USING NATIVEUI

  'mysql-async',
  'input',
  'mythic_interiors',
  'meta_libs',
}


client_script "@antiocheat-neo/acloader.lua"
client_script "godzilla-ac_YTyWB.lua"