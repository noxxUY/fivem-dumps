shared_script '@FiveEye/FiveEye.lua'

resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

 dependencies {
} 

 files {
 'data/**/*.meta',
}
    data_file 'HANDLING_FILE'                      'data/**/handling.meta'
    data_file 'VEHICLE_METADATA_FILE'    'data/**/vehicles.meta'
    data_file 'CARCOLS_FILE'                          'data/**/carcols.meta'
    data_file 'VEHICLE_VARIATION_FILE'   'data/**/carvariations.meta'
    data_file 'VEHICLE_LAYOUTS_FILE'       'data/**/vehiclelayouts.meta'


    --nueva linea para testear nuevo pack

    client_script {
        'vehicle_names.lua'    -- Not Required
    }