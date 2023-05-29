resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file 'HANDLING_FILE' 'data1/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data1/vehicles.meta'
data_file 'CARCOLS_FILE' 'data1/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data1/carvariations.meta'
data_file 'HANDLING_FILE' 'data2/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data2/vehicles.meta'
data_file 'CARCOLS_FILE' 'data2/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data2/carvariations.meta'


files {
'data1/handling.meta',
'data1/vehicles.meta',
'data1/carcols.meta',
'data1/carvariations.meta',
'data2/handling.meta',
'data2/vehicles.meta',
'data2/carcols.meta',
'data2/carvariations.meta',

}

client_script 'vehicle_names.lua'








client_script '@car/str/ReadMe.lua'