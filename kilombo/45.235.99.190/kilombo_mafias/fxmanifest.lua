fx_version 'bodacious'
game 'gta5'
lua54 'yes'
description 'stand a lone gang system'
version '0.0.3.4'
author 'Erfan Ebrahimi'


shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua'
}

server_scripts {
	'shared/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/admin.lua',
	'server/gangData.lua',
	'server/main.lua',
	'server/vehicle.lua',
	'server/salary.lua',
}

client_scripts {
	'shared/locale.lua',
	'locales/*.lua',
	'client/UI/RMenu.lua',
    'client/UI/menu/RageUI.lua',
    'client/UI/menu/Menu.lua',
    'client/UI/menu/MenuController.lua',
    'client/UI/components/*.lua',
    'client/UI/menu/elements/*.lua',
    'client/UI/menu/items/*.lua',
    'client/UI/menu/panels/*.lua',
    'client/UI/menu/windows/*.lua',
	'config.lua',
	'client/main.lua',
	'client/admin.lua',
	'client/blips.lua',
	'client/gangAction.lua',
	'client/markerAction.lua',
	'client/vehicle.lua'
}

export 'isOwnGangVehicle'
export 'getGangID'
export 'getGangGrade'
export 'getGangName'
export 'getGangGradeName'

server_exports {
	'getGangID',
	'getGangGrade',
	'getGangName',
	'getGangGradeName',
}


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'esxBaseFunction.lua'
}
client_script 'esxBaseFunction.lua'

dependencies {
	'es_extended'
}




