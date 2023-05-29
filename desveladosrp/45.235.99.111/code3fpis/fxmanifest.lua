
fx_version 'adamant'
game 'gta5'

 
files {
    'handling.meta',
	'vehicles.meta',
    'carvariations.meta',
    'carcols.meta',
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'



client_script {
    'vehicle_names.lua'    -- Not Required
}