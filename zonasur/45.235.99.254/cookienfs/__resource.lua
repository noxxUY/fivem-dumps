resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

files {  
    'cars/**/*.meta',
}

data_file 'HANDLING_FILE' 'cars/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'cars/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'cars/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'cars/**/carvariations.meta'   
