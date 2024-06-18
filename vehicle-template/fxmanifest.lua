fx_version "cerulean"
game "gta5"
author "author name"
description "vehicle template"
version "1.0.0"

files {
    "audio/*.dat151.rel",
    "audio/*.dat54.rel",
    "audio/*.dat10.rel",
    "audio/sfx/*.awc",
    "data/*.meta",
}

data_file "AUDIO_SYNTHDATA" "audio/vehiclename_amp.dat"
data_file "AUDIO_GAMEDATA" "audio/vehiclename_game.dat"
data_file "AUDIO_SOUNDDATA" "audio/vehiclename_sounds.dat"
data_file "AUDIO_WAVEPACK" "audio/sfx"

data_file "HANDLING_FILE" "data/handling.meta"
data_file "VEHICLE_METADATA_FILE" "data/vehicles.meta"
data_file "CARCOLS_FILE" "data/carcols.meta"
data_file "VEHICLE_VARIATION_FILE" "data/carvariations.meta"
data_file "VEHICLE_LAYOUTS_FILE" "vehiclelayouts.meta"

client_script "names.lua"
