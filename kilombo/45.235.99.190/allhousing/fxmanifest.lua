fx_version 'adamant'
games { 'rdr3', 'gta5' }
lua54 'yes'
mod 'allhousing'
version '1.0.7'

shared_scripts { 
	'@es_extended/imports.lua',
  'config.lua',
  'houses.lua',
  'labels.lua'
}

client_scripts {
  -- NATIVE UI DEPENDENCY
  -- COMMENT OUT IF NOT USING NATIVEUI
  --'@NativeUILua_Reloaded/src/NativeUIReloaded.lua',

  -- SOURCE
  'src/utils.lua',  

  'src/client/framework/framework_functions.lua',
  'src/client/menus/menus.lua',
  'src/client/menus/menus_native.lua',
  'src/client/menus/menus_esx.lua',

  --'src/client/property.lua',

  'src/client/functions.lua',
  'src/client/main.lua',
  'src/client/commands.lua',
}

server_scripts {
  -- MYSQL DEPENDENCY
  '@oxmysql/lib/MySQL.lua',

  -- SOURCE
  'credentials.lua',

  'src/utils.lua',
  
  'src/server/framework/framework_functions.lua',

  'src/server/functions.lua',
  'src/server/main.lua',
}

dependencies {
  -- COMMENT OUT IF NOT USING ESX
  'es_extended',

  -- COMMENT OUT IF NOT USING NATIVEUI
  --'NativeUILua_Reloaded',

  'oxmysql',
  'input',
  'mythic_interiors',
  'meta_libs',
}




