fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'A resource to add bike hire docks around the map'
version '1.0.0'

files {
    'stream/hiredock.ytyp',
}

shared_script { '@es_extended/imports.lua' }

client_scripts {
    'config_bikehire.lua',
    'cl_bikehire.lua',
}

server_scripts {
    'config_bikehire.lua',
    'sv_bikehire.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/hiredock.ytyp'