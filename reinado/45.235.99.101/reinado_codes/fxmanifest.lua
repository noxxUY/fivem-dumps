server_script "QGF.lua"
client_script "QGF.lua"



fx_version 'adamant'
lua54 'yes'
game 'gta5'

author 'tavO'
description 'Example'

--Client Scripts-- 
client_scripts {
	'client/*.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'shared/shared.lua'
  }
  

--Server Scripts-- 
server_scripts {
  '@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}

files {
    'weapons.meta',
    'weaponanimations.meta',
}

data_file 'WEAPONINFO_FILE_PATCH' 'weapons.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'weaponanimations.meta'