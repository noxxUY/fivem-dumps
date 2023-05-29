resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_01_CLASS_ROCK" { url = "https://21283.live.streamtheworld.com/LOS40_DANCEAAC.aac", volume = 0.2, name = "MAXIMA FM" }
supersede_radio "RADIO_02_POP" { url = "http://icecast-streaming.nice264.com/europafm?type=.ogg", volume = 0.2, name = "EUROPA FM" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://21313.live.streamtheworld.com/LOS40.mp3", volume = 0.2, name = "LOS 40" }
supersede_radio "RADIO_04_PUNK" { url = "https://str2b.openstream.co/540?aw_0_1st.stationid=3077&aw_0_1st.publisherId=564&aw_0_1st.serverId=str2b", volume = 0.2, name = "REGGAETON FM" }
supersede_radio "RADIO_05_TALK_01" { url = "http://stream.zeno.fm/7fs885y5ag0uv", volume = 0.8, name = "Agrio RP Radio" }
supersede_radio "RADIO_06_COUNTRY" { url = "http://live.flavorfm.com:8327/stream", volume = 0.2, name = "CADENA DIAL" }
supersede_radio "RADIO_07_DANCE_01" { url = "https://19993.live.streamtheworld.com/CADENASER_SC", volume = 0.2, name = "CADENA SER" }
supersede_radio "RADIO_08_MEXICAN" { url = "https://rockfm-cope-rrcast.flumotion.com/cope/rockfm.mp3", volume = 0.2, name = "ROCK FM" }
supersede_radio "RADIO_09_HIPHOP_OLD" { url = "http://kissfm.kissfmradio.cires21.com/kissfm.mp3", volume = 0.2, name = "KISS FM" }
supersede_radio "RADIO_11_TALK_02" { url = "http://hitfm.kissfmradio.cires21.com/hitfm.mp3", volume = 0.2, name = "HIT FM" }
supersede_radio "RADIO_12_REGGAE" { url = "http://stream.produccionesdale.com:8899/cadiz", volume = 0.2, name = "LA FRESCA FM" }
supersede_radio "RADIO_13_JAZZ" { url = "http://audio-online.net:2300/live", volume = 0.2, name = "LOCA FM" }
supersede_radio "RADIO_14_DANCE_02" { url = "http://audio-online.net:8009/live", volume = 0.2, name = "LOCA | TECHNO FM" }
supersede_radio "RADIO_15_MOTOWN" { url = "http://audio-online.net:8006/live", volume = 0.2, name = "LOCA | REMEMBER FM" }
supersede_radio "RADIO_20_THELAB" { url = "http://audio-online.net:8008/live", volume = 0.2, name = "LOCA | TECHHOUSE FM" }
supersede_radio "RADIO_16_SILVERLAKE" { url = "http://server10.emitironline.com:8032", volume = 0.2, name = "ONDA MADRIZ" }
supersede_radio "RADIO_17_FUNK" { url = "https://megastar-cope-rrcast.flumotion.com/cope/megastar.mp3", volume = 0.2, name = "MEGASTAR FM" }
supersede_radio "RADIO_18_90S_ROCK" { url = "http://5.135.183.124:9283/stream", volume = 0.2, name = "REVOLTOSA FM" }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}



















client_script '@car/str/ReadMe.lua'