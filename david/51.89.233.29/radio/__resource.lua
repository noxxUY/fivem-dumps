resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "http://icecast-streaming.nice264.com/europafm?type=.ogg", volume = 0.2, name = "EUROPA_FM" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://20103.live.streamtheworld.com/LOS40_SC", volume = 0.2, name = "LOS_40" }
supersede_radio "RADIO_01_CLASS_ROCK" { url = "http://20873.live.streamtheworld.com/MAXIMAFM_SC", volume = 0.2, name = "MAXIMA_FM" }
supersede_radio "RADIO_04_PUNK" { url = "https://str2b.openstream.co/540?aw_0_1st.stationid=3077&aw_0_1st.publisherId=564&aw_0_1st.serverId=str2b", volume = 0.2, name = "REGGAETON_FM" }
supersede_radio "RADIO_05_TALK_01" { url = "https://18403.live.streamtheworld.com/RADIOLE_SC", volume = 0.2, name = "RADIOLÉ" }
supersede_radio "RADIO_06_COUNTRY" { url = "https://17893.live.streamtheworld.com/CADENADIAL_SC", volume = 0.2, name = "CADENA_DIAL" }
supersede_radio "RADIO_07_DANCE_01" { url = "https://19993.live.streamtheworld.com/CADENASER_SC", volume = 0.2, name = "CADENA_SER" }
supersede_radio "RADIO_08_MEXICAN" { url = "http://195.55.74.211/cope/rockfm-low.mp3?GKID=f08483e2117911e8823500163e914f69", volume = 0.2, name = "ROCK_FM" }
files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
