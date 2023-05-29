DP = {}
-- 8x Development | 8xdev.com | Prenses Baran | https://discord.gg/fandgwjNUm
DP.Expressions = {
   ["Angry"] = {"Expression", "mood_angry_1"},
   ["Drunk"] = {"Expression", "mood_drunk_1"},
   ["Stupid"] = {"Expression", "pose_injured_1"},
   ["Electric"] = {"Expression", "electrocuted_1"},
   ["Grumpy"] = {"Expression", "effort_1"},
   ["Grumpy2"] = {"Expression", "mood_drivefast_1"},
   ["Grumpy3"] = {"Expression", "pose_angry_1"},
   ["Happy"] = {"Expression", "mood_happy_1"},
   ["Wounded"] = {"Expression", "mood_injured_1"},
   ["Enjoyable"] = {"Expression", "mood_dancing_low_1"},
   ["Breath"] = {"Expression", "smoking_hold_1"},
   ["Blind"] = {"Expression", "pose_normal_1"},
   ["One eye"] = {"Expression", "pose_aiming_1"},
   ["Shock"] = {"Expression", "shocked_1"},
   ["Shock 2"] = {"Expression", "shocked_2"},
   ["Sleeper"] = {"Expression", "mood_sleeping_1"},
   ["Sleeper2"] = {"Expression", "dead_1"},
   ["Sleeper3"] = {"Expression", "dead_2"},
   ["Smug"] = {"Expression", "mood_smug_1"},
   ["Splendid"] = {"Expression", "mood_aiming_1"},
   ["Stressful"] = {"Expression", "mood_stressed_1"},
   ["Sulking"] = {"Expression", "mood_sulk_1"},
   ["Strange"] = {"Expression", "effort_2"},
   ["Strange2"] = {"Expression", "effort_3"},
}

DP.Walks = {
    ["Alien"] = {"move_m@alien"},
    ["Armored"] = {"anim_group_move_ballistic"},
    ["Arrogant"] = {"move_f@arrogant@a"},
    ["Brave"] = {"move_m@brave"},
    ["Casual"] = {"move_m@casual@a"},
    ["Casual2"] = {"move_m@casual@b"},
    ["Casual3"] = {"move_m@casual@c"},
    ["Casual4"] = {"move_m@casual@d"},
    ["Casual5"] = {"move_m@casual@e"},
    ["Casual6"] = {"move_m@casual@f"},
    ["Chichi"] = {"move_f@chichi"},
    ["Confident"] = {"move_m@confident"},
    ["Cop"] = {"move_m@business@a"},
    ["Cop2"] = {"move_m@business@b"},
    ["Cop3"] = {"move_m@business@c"},
    ["Default Female"] = {"move_f@multiplayer"},
    ["Default Male"] = {"move_m@multiplayer"},
    ["Drunk"] = {"move_m@drunk@a"},
    ["Drunk4"] = {"move_m@drunk@slightlydrunk"},
    ["Drunk2"] = {"move_m@buzzed"},
    ["Drunk3"] = {"move_m@drunk@verydrunk"},
    ["Femme"] = {"move_f@femme@"},
    ["Fire"] = {"move_characters@franklin@fire"},
    ["Fire2"] = {"move_characters@michael@fire"},
    ["Fire3"] = {"move_m@fire"},
    ["Flee"] = {"move_f@flee@a"},
    ["Franklin"] = {"move_p_m_one"},
    ["Gangster"] = {"move_m@gangster@generic"},
    ["Gangster2"] = {"move_m@gangster@ng"},
    ["Gangster3"] = {"move_m@gangster@var_e"},
    ["Gangster4"] = {"move_m@gangster@var_f"},
    ["Gangster5"] = {"move_m@gangster@var_i"},
    ["Grooving"] = {"anim@move_m@grooving@"},
    ["Guard"] = {"move_m@prison_gaurd"},
    ["Handcuffs"] = {"move_m@prisoner_cuffed"},
    ["Heels"] = {"move_f@heels@c"},
    ["Heels2"] = {"move_f@heels@d"},
    ["Hiking"] = {"move_m@hiking"},
    ["Hipster"] = {"move_m@hipster@a"},
    ["Hobo"] = {"move_m@hobo@a"},
    ["Hurry"] = {"move_f@hurry@a"},
    ["Janitor"] = {"move_p_m_zero_janitor"},
    ["Janitor2"] = {"move_p_m_zero_slow"},
    ["Jog"] = {"move_m@jog@"},
    ["Lemar"] = {"anim_group_move_lemar_alley"},
    ["Lester"] = {"move_heist_lester"},
    ["Lester2"] = {"move_lester_caneup"},
    ["Maneater"] = {"move_f@maneater"},
    ["Michael"] = {"move_ped_bucket"},
    ["Money"] = {"move_m@money"},
    ["Muscle"] = {"move_m@muscle@a"},
    ["Posh"] = {"move_m@posh@"},
    ["Posh2"] = {"move_f@posh@"},
    ["Quick"] = {"move_m@quick"},
    ["Runner"] = {"female_fast_runner"},
    ["Sad"] = {"move_m@sad@a"},
    ["Sassy"] = {"move_m@sassy"},
    ["Sassy2"] = {"move_f@sassy"},
    ["Scared"] = {"move_f@scared"},
    ["Sexy"] = {"move_f@sexy@a"},
    ["Shady"] = {"move_m@shadyped@a"},
    ["Slow"] = {"move_characters@jimmy@slow@"},
    ["Swagger"] = {"move_m@swagger"},
    ["Tough"] = {"move_m@tough_guy@"},
    ["Tough2"] = {"move_f@tough_guy@"},
    ["Trash"] = {"clipset@move@trash_fast_turn"},
    ["Trash2"] = {"missfbi4prepp1_garbageman"},
    ["Trevor"] = {"move_p_m_two"},
    ["Wide"] = {"move_m@bag"},
    -- I cant get these to work for some reason, if anyone knows a fix lmk
    --["Caution"] = {"move_m@caution"},
    --["Chubby"] = {"anim@move_m@chubby@a"},
    --["Crazy"] = {"move_m@crazy"},
    --["Joy"] = {"move_m@joy@a"},
    --["Power"] = {"move_m@power"},
    --["Sad2"] = {"anim@move_m@depression@a"},
    --["Sad3"] = {"move_m@depression@b"},
    --["Sad4"] = {"move_m@depression@d"},
    --["Wading"] = {"move_m@wading"},
  }

DP.Shared = {
   --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions}
   -- you dont have to specify targetemoteanem, if you do dont it will just play the same animation on both.
   -- targetemote is used for animations that have a corresponding animation to the other player.
   ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", "handshake2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
       SyncOffsetFront = 0.9
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", "handshake", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug 2", "hug2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.05,
   }},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug", "hug", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.13
   }},
   ["bro"] = {"mp_ped_interaction", "hugs_guy_a", "Bro", "bro2", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["bro2"] = {"mp_ped_interaction", "hugs_guy_b", "Bro 2", "bro", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["give"] = {"mp_common", "givetake1_a", "Give", "give2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["give2"] = {"mp_common", "givetake1_b", "Give 2", "give", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball Throw", "baseballthrow"},
   ["baseballthrow"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Baseball", "baseball"},
   ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stickup Scared", "stickupscared", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stickupscared"] = {"missminuteman_1ig_2", "handsup_base", "Stickup", "stickup", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["punch"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Puched", "punched"},
   ["punched"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Punch", "punch"},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Butt", "headbutted"},
   ["headbutted"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Butt 2", "headbutt"},
   ["slap2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Back Slap", "slapped2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["slapped"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "To slap", "slapped", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["slap"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Slap", "slap"},
   ["slapped2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Slap 2", "slap2"},
}

DP.Dances = {
   ["dancef4"] = {"anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1", "Dance (Female) 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Dance (Female) 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance (Female) 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dance (Female)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dance (Female) 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance (Female) 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Dance (Slow) 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dance (Slow) 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Dance (Slow) 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancem"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Dance (Male)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
["dance6"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_center", "Dance 6 ", AnimationOptions =
{
    EmoteLoop = true,      
}},
["drill"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^1", "Drill ", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["drill3"] = {"anim@mp_player_intcelebrationmale@oh_snap", "oh_snap", "Dance New ~b~ Glizzy", AnimationOptions =
{
   EmoteMoving = false,
   EmoteLoop = true,
}},
["danceslow6"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^2", "Dance (Slow) 6 ", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["danceslow5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^5", "Dance (Slow) 5 ", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["dancem5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^2", "Dance (Male) 5 ", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["dancef8"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_female^1", "Dance (Female) 8 ", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
   ["dancem2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Dance (Male) 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancem3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Dance (Male) 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancem4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Dance (Male) 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceup"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dance (Up)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceup2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance (Up) 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Dance (Shy)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance (Shy) 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Dance (Slow)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancecrazy9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Dance (Crazy) 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance2"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Dance 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance3"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Dance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance4"] = {"missfbi3_sniping", "dance_m_default", "Dance 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["drill2"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^2", "Dance New 2 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["dancem6"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^3", "Dance (Male) 6 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["dancem7"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^4", "Dance (Male) 7 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["dancem8"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^5", "Dance (Male) 8 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,    
}},
["danceslow7"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_li_12_v1_male^2", "Dance (Slow) 7 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,    
}},
["danceslow8"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_li_12_v1_male^5", "Dance (Slow) 8 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["danceslow9"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_li_12_v1_male^4", "Dance (Slow) 9 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["danceparty"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_li_12_v1_male^2", "Dance (Party) ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["danceparty2"] = {"anim@amb@nightclub@dancers@crowddance_facedj_transitions@", "trans_dance_facedj_li_to_hi_09_v1_male^4", "Dance (Party) 2 ~b~ Glizzy", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,                      
}},
   ["dancecrazy"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Dance (Crazy)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancecrazy2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Dance (Crazy) 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancecrazy3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Dance (Crazy) 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancecrazy4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dance (Crazy) 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancecrazy5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Dance (Crazy) 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancecrazy6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Dance (Crazy) 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance5"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancecrazy8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Dance (Crazy) 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dancecrazy7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dance (Crazy) 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dance"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["danecerod"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Dance (Rod)", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danecerod2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Dance (Rod) 2", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["danecerod3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Dance (Rod) 3", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["danecehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Dance (Horse)", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danecehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Dance (Horse) 2", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["danecehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Dance (Horse) 3", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
}

DP.Emotes = {
   ["drink"] = {"mp_player_inteat@pnq", "loop", "Drink", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["belt3"] = {"amb@code_human_police_investigate@base", "base", "Belt 3", AnimationOptions =
   {
       EmoteLoop = true,
    }},
    ["belt4"] = {"amb@world_human_cop_idles@female@idle_b", "idle_d", "Belt 4 ~b~ Glizzy", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dj3"] = {"mini@strip_club@idles@dj@base", "base", "DJ 3 ~r~ Glizzy", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,   
    }},
    ["gangsign"] = {"anim@mp_player_intincarphotographybodhi@rps@", "idle_a", "Gang Sign ~b~ Glizzy", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,  
    }},
    ["schair10"] = {"anim@amb@nightclub@peds@", "anim_heists_heist_safehouse_intro_phone_couch_male", "Sit Chair 10 ~b~ Glizzy", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {-0.010, 0.025, -0.019, -0.1, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["idlephone"] = {"anim@amb@nightclub@peds@", "amb_world_human_leaning_female_wall_back_texting_idle_a", "Phone Idle Standing ~b~ Glizzy", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.030, 0.0, 0.030, 0.0, 10.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["graffiti"] = {"switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", "Graffiti ~b~ Glizzy", AnimationOptions =
    {
        Prop = "prop_paint_spray01a",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, -0.070, 0.0, 0.0, 0.0},
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["graffiti2"] = {"switch@franklin@lamar_tagging_wall", "lamar_tagging_exit_loop_lamar", "Graffiti 2 ~b~ Glizzy", AnimationOptions =
    {
        Prop = "prop_spraygun_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, -0.070, 0.0, 0.0, 0.0},
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["kiss3"] = {"anim@mp_player_intcelebrationmale@blow_kiss", "blow_kiss", "Kiss ~b~ Glizzy", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = false,
    }},
    ["respect"] = {"anim@mp_player_intcelebrationmale@bro_love", "bro_love", "Respect ~b~ Glizzy", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = false,
    }},
    ["kiss4"] = {"anim@mp_player_intcelebrationmale@finger_kiss", "finger_kiss", "Kiss 2 ~b~ Glizzy", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = false,
    }},
    ["crazy"] = {"anim@mp_player_intcelebrationmale@freakout", "freakout", "Crazy ~b~ Glizzy", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = false,
    }},
    ["boombox"] = {"missheistdocksprep1hold_cellphone", "static", "Boombox ~b~ Glizzy", AnimationOptions =
    {
        Prop = "prop_boombox_01",
        PropBone = 57005,
        PropPlacement = {0.29, 0.0, -0.012, 0.0, 266.0, 60.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["boombox2"] = {"missfinale_c2mcs_1", "fin_c2_mcs_1_camman", "Boombox 2 ~b~ Glizzy", AnimationOptions =
    {
        Prop = "prop_boombox_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.1, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["peace3"] = {"anim@mp_player_intcelebrationmale@peace", "peace", "Peace 3 ~b~ Glizzy", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["idle2"] = {"random@shop_tattoo", "_idle_b", "Idle Standing 2 ~b~ Glizzy", AnimationOptions =  --// IDLE
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["talkcash"] = {"cellphone@", "cellphone_call_listen_base", "Talk on the Cash ~b~ Glizzy", AnimationOptions =
    {
       Prop = "prop_anim_cash_pile_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.0, -270.8, 180.0, 200.5},
--//  PropPlacement = {0.0üst, 0.0sağ, 0.1alt, -6.8, 10.0, 3.5},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["idle6"] = {"anim@heists@ornate_bank@chat_manager", "poor_clothes", "Idle Standing 6 ~b~ Glizzy", AnimationOptions =  --// IDLE
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["carm"] = {"anim@veh@lowrider@std@ds@arm@base", "sit", "Car Arms ~b~ Glizzy", AnimationOptions =  --// IDLE
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["carm2"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_high", "Car Arms 2 ~b~ Glizzy", AnimationOptions =  --// IDLE
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["carm3"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_high_lowdoor", "Car Arms 3 ~b~ Glizzy", AnimationOptions =  --// IDLE
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["carm4"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_low", "Car Arms 4 ~b~ Glizzy", AnimationOptions =  --// IDLE
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["carm5"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_low_lowdoor", "Car Arms 5 ~b~ Glizzy", AnimationOptions =  --// IDLE
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["carm6"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_lowdoor", "Car Arms 6 ~b~ Glizzy", AnimationOptions =  --// IDLE
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},

   ["think"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Think", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["box"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxing Training", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["box2"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxing Training 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["pee"] = {"misscarsteal2peeing", "peeing_loop", "Pee", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["surrender"] = {"missminuteman_1ig_2", "handsup_base", "Surrender", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["joke"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "Joke", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["doggystyle"] = {"missexile3", "ex03_train_roof_idle", "Doggy Style", AnimationOptions =
   {   
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Rabbit", AnimationOptions =
   {   EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["mad"] = {"anim@mp_fm_event@intro", "beast_transform", "Mad", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000,
   }},
   ["lside"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Lying on side", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Sunbathe", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Sunbathe 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe3"] = {"missfbi3_sniping", "prone_dave", "Sunbathe 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["order"] = {"misscarsteal3pullover", "pull_over_right", "Order", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Idle Standing", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle3"] = {"friends@fra@ig_1", "base_idle", "Idle Standing 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle4"] = {"mp_move@prostitute@m@french", "base_idle", "Idle Standing 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["idle5"] = {"random@countrysiderobbery", "idle_a", "Idle Standing 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle7"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Idle Standing 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle8"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Idle Standing 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle9"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Idle Standing 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle10"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Idle Standing 10", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle11"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Idle Standing 11", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle"] = {"anim@miss@low@fin@vagos@", "idle_ped01", "Gang Idle Standing ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle2"] = {"anim@miss@low@fin@vagos@", "idle_ped02", "Gang Idle Standing 2 ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle3"] = {"anim@miss@low@fin@vagos@", "idle_ped03", "Gang Idle Standing 3 ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle4"] = {"anim@miss@low@fin@vagos@", "idle_ped04", "Gang Idle Standing 4 ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle5"] = {"anim@miss@low@fin@vagos@", "idle_ped05", "Gang Idle Standing 5 ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle6"] = {"anim@miss@low@fin@vagos@", "idle_ped06", "Gang Idle Standing 6 ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle7"] = {"anim@miss@low@fin@vagos@", "idle_ped07", "Gang Idle Standing 7 ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangidle8"] = {"anim@miss@low@fin@vagos@", "idle_ped08", "Gang Idle Standing 8 ~b~ Glizzy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["slippery"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Slippery", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["staydurnk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Staying Drunk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["staydrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Staying Drunk 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["staydrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Staying Drunk 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["rock"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "Rock and Roll", "Rock and Roll"},
   ["joy"] = {"anim@mp_player_intcelebrationfemale@air_synth", "Joy", "Joy"},
   ["discuss"] = {"misscarsteal4@actor", "actor_berating_loop", "Discuss", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["discuss2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Discuss 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["capture"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Capture", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "Kiss", "Blow Kiss"},
   ["kiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Kiss 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000

   }},
   ["ballerina"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Ballerina"},
   ["this"] = {"misscommon@response", "bring_it_on", "This", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["cometome"] = {"mini@triathlon", "want_some_of_this", "Come to me", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["barm9"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Binding Arms 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["belt2"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Belt 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["barm"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Binding Arms", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barm2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Binding Arms 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["barm3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Binding Arms 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barm4"] = {"random@street_race", "_car_b_lookout", "Binding Arms 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barm5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Binding Arms 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barm6"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Binding Arms 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barm7"] = {"random@shop_gunstore", "_idle", "Binding Arms 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barm8"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Binding Arms 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["headrest"] = {"rcmnigel1a_band_groupies", "base_m2", "Headrest", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["huhfuck"] = {"gestures@m@standing@casual", "gesture_damn", "Huh Fuck", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["huhfuck2"] = {"anim@am_hold_up@male", "shoplift_mid", "Huh Fuck 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["staydown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Stay Down", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["surrender2"] = {"random@arrests@busted", "idle_a", "Surrender 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["christno"] = {"anim@mp_player_intcelebrationfemale@face_palm", "Niye", "Christ no", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["christno2"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Christ no 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["christno3"] = {"missminuteman_1ig_2", "tasered_2", "Christ no 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["christno4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Christ no 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["fall"] = {"random@drunk_driver_1", "drunk_fall_over", "To fall"},
   ["fall2"] = {"mp_suicide", "pistol", "To fall 2"},
   ["fall3"] = {"mp_suicide", "pill", "To fall 3"},
   ["fall4"] = {"friends@frf@ig_2", "knockout_plyr", "To fall 4"},
   ["fall5"] = {"anim@gangops@hostage@", "victim_fail", "To fall 5"},
   ["sleep"] = {"mp_sleep", "sleep_loop", "To sleep", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["brawl"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Brawliness"},
   ["brawl2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Brawliness"},
   ["mfinger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Middle finger", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mfinger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Middle finger 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bro"] = {"mp_ped_interaction", "handshake_guy_a", "Bro Greeting", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["bro2"] = {"mp_ped_interaction", "handshake_guy_b", "Bro Greeting 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["wait"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Wait", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait2"] = {"missclothing", "idle_storeclerk", "Wait 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait3"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Wait 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait4"] = {"rcmnigel1cnmt_1c", "base", "Wait 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait5"] = {"rcmjosh1", "idle", "Wait 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait6"] = {"rcmjosh2", "josh_2_intp1_base", "Wait 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait7"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Wait 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait8"] = {"misshair_shop@hair_dressers", "keeper_base", "Wait 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["purse"] = {"move_m@hiking", "idle", "Purse", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hug3"] = {"mp_ped_interaction", "kisses_guy_a", "Hug 3"},
   ["hug4"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 4"},
   ["hug5"] = {"mp_ped_interaction", "hugs_guy_a", "Hug 5"},
   ["examine"] = {"random@train_tracks", "idle_e", "To examine"},
   ["rage"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "Rage", "Rage", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 6000,
   }},
   ["running"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Junctic", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["running2"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Junctic 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["running3"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Junctic 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["kekowalk"] = {"move_m@joy@a", "walk", "Keko Walk :)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["warmup"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Warming up", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["examine2"] = {"rcmextreme3", "idle", "To examine 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["examine3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "To examine 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Knock", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Knock 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["brawl3"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Brawliness 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lap Dance"},
   ["lean"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Lean", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean2"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Lean 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean3"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Lean 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean4"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Lean 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["doggystyle2"] = {"random@street_race", "_car_a_flirt_girl", "Doggy Style 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lbar"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Lean Bar", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lbar2"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Lean Bar 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lbar3"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Lean Bar 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lbar4"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Lean Bar 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lbar5"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Lean Bar 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["larm"] = {"timetable@mime@01_gc", "idle_a", "Lean Arm", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["larm2"] = {"misscarstealfinale", "packer_idle_1_trevor", "Lean Arm 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["larm3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Lean Arm 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["larm4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Lean Arm 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["larm5"] = {"rcmjosh2", "josh_2_intp1_base", "Lean Arm 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Me", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["mechanic"] = {"mini@repair", "fixing_a_ped", "Mechanic", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mechanic2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "Mechanic 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["doctor"] = {"amb@medic@standing@tendtodead@base", "base", "Doctor", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["meditation"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Meditating", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditation2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Meditating 2", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditation3"] = {"rcmepsilonism3", "base_loop", "Meditating 3", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "No", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "No 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pnose"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Picking nose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["no3"] = {"gestures@m@standing@casual", "gesture_no_way", "No 3", AnimationOptions =
   {
       EmoteDuration = 1500,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fatigue"] = {"re@construction", "out_of_breath", "Fatigue", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ground"] = {"random@domestic", "pickup_low", "Lying on the ground"},
   ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Push", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Push 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["show"] = {"gestures@f@standing@casual", "gesture_point", "Usher", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Push-ups", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["applaud"] = {"random@street_race", "grid_girl_race_start", "Applaud", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["show2"] = {"mp_gun_shop_tut", "indicate_right", "Usher 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Soldier Salute", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Soldier Salute 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Soldier Salute 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fear"] = {"random@domestic", "f_distressed_loop", "To be scared", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fear2"] = {"random@homelandsecurity", "knees_loop_girl", "To be scared 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["screw"] = {"misscommon@response", "screw_you", "Screw", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cleartop"] = {"move_m@_idles@shake_off", "shakeoff_1", "Clear Top", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3500,
   }},
   ["wounded"] = {"random@dealgonewrong", "idle_a", "Wounded", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sleep2"] = {"timetable@tracy@sleep@", "idle_c", "To sleep 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["huh"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Huh", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["huh2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Huh 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["sground"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "Sit on the ground", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground2"] = {"rcm_barry3", "barry_3_sit_loop", "Sit on the ground 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "Sit on the ground 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "Sit on the ground 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "Sit on the ground 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "Sit on the ground 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "Sit on the ground 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Sit on the ground 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "Sit on the ground 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground10"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "Sit on the ground 10", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground11"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit on the ground 11", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground12"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Sit on the ground 12", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground13"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Sit on the ground 13", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground14"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Sit on the ground 14", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground15"] = {"timetable@amanda@drunk@base", "base", "Sit on the ground 16", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["schair"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "Sit Chair", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["schair2"] = {"timetable@reunited@ig_10", "base_amanda", "Sit Chair 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["schair3"] = {"timetable@ron@ig_3_couch", "base", "Sit Chair 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["schair4"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "Sit Chair 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["schair6"] = {"timetable@maid@couch@", "base", "Sit Chair 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["schair5"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "Sit Chair 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["shuttle"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Do crunches", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["applaud2"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Applaud 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["applaud3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Applaud 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["applaud4"] = {"amb@world_human_cheering@male_a", "base", "Applaud 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["applaud5"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Applaud 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["applaud6"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Applaud 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Smell", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hgun"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Holding a gun", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stagger"] = {"misscarsteal4@actor", "stumble", "Stagger", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crisis"] = {"stungun@standing", "damage", "Crisis", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe4"] = {"amb@world_human_sunbathe@male@back@base", "base", "Sunbathe 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe5"] = {"amb@world_human_sunbathe@female@back@base", "base", "Sunbathe 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["plane"] = {"missfam5_yoga", "a2_pose", "Plane", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["freeze"] = {"mp_sleep", "bind_pose_180", "To freeze", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["think2"] = {"mp_cp_welcome_tutthink", "b_think", "Think 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["think3"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Think 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think4"] = {"timetable@tracy@ig_8@base", "base", "Think 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["think5"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Think 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ok2"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Ok 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["ok3"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Ok 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ok4"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Ok 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["keyboard"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Keyboard", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["keyboard2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Keyboard 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["keyboard3"] = {"mp_prison_break", "hack_loop", "Keyboard 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["keyboard4"] = {"mp_fbi_heist", "loop", "Keyboard 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["warmup2"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Warming up 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Wave", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Wave 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Wave 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave4"] = {"friends@frj@ig_1", "wave_a", "Wave 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave5"] = {"friends@frj@ig_1", "wave_b", "Wave 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave6"] = {"friends@frj@ig_1", "wave_c", "Wave 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave7"] = {"friends@frj@ig_1", "wave_d", "Wave 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave8"] = {"friends@frj@ig_1", "wave_e", "Wave 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Wave 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whistle"] = {"taxi_hail", "hail_taxi", "To whistle", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "To whistle 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["gesture"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Hand gesture", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hitchhiking"] = {"random@hitch_lift", "idle_f", "Hitchhiking", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fun"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "To enjoy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bequiet"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "Be quiet", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["statue"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Sculpture Posture", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["statue2"] = {"club_intro2-0", "csb_englishdave_dual-0", "Sculpture Posture 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["westside"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "WestSide Sign", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["eastside"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "EastSide Sign", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["eastside2"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base", "idle_a", "Eastside Sign 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["eastside3"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@low@ps@base", "idle_a", "Eastside Sign 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["eastside4"] = {"amb@code_human_in_car_mp_actions@gang_sign_b@std@ds@base", "idle_a", "Eastside Sign 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["v"] = {"amb@code_human_in_car_mp_actions@v_sign@bodhi@rps@base", "idle_a", "V Sign", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["keepit"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Keep it ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leandrink"] = {"amb@world_human_leaning@male@coffee@idle_a", "idle_a", "Inside Leaning ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["plant"] = {"missarmenian3_gardener", "idle_a", "Plant ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["miss"] = {"missfbi1", "ext_t14_leaning_loop", "Miss ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["presson"] = {"rcmjosh2", "stand_lean_back_beckon_b", "Press On ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lbar7"] = {"rcmnigel1aig_1", "base_02_willie", "Lean Bar 7 ", AnimationOptions =
    {
        EmoteLoop = false,
    }},
    ["welcome"] = {"random@shop_tattoo", "_greeting", "Welcome ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["youstop"] = {"anim@amb@casino@peds@", "mini_strip_club_idles_bouncer_stop_stop", "You stopped ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["wait16"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_stretching-noworkfemale", "Wait 16 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["wtest"] = {"anim@amb@range@weapon_test@", "weapon_test_01_amy_skater_01", "Weapon Test ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    ["schair7"] = {"missfbi4leadinoutfbi_4_int", "fbi_4_int_trv_idle_andreas", "Sit Chair 7 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["showgun"] = {"move_weapon@pistol@copc", "idle", "Show the gun ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["showgun2"] = {"move_weapon@pistol@cope", "idle", "Show the gun 2 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["back"] = {"combat@gestures@rifle@beckon", "0", "Back ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lookaround"] = {"anim@miss@low@fin@lamar@", "idle", "Look around ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sground19"] = {"anim_heist@arcade_combined@", "jimmy@_smoking_base", "Sit on the ground 19 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["hgun5"] = {"random@arrests", "radio_chatter", "Holding a gun 5 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["phone"] = {"cellphone@self@franklin@", "west_coast", "Phone 1 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone2"] = {"cellphone@self@franklin@", "chest_bump", "Phone 2 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone3"] = {"cellphone@self@franklin@", "peace", "Phone 3 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone4"] = {"cellphone@self@michael@", "finger_point", "Phone 4 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone5"] = {"cellphone@self@michael@", "run_chin", "Phone 5 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone6"] = {"cellphone@self@michael@", "stretch_neck", "Phone 6 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone7"] = {"cellphone@self@trevor@", "aggressive_finger", "Phone 7 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone8"] = {"cellphone@self@trevor@", "proud_finger", "Phone 8 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["phone9"] = {"cellphone@self@trevor@", "throat_slit", "Phone 9 ", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["wait17"] = {"missarmenian2", "lamar_impatient_a", "Wait 17 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["surrender3"] = {"misstrevor1", "threaten_ortega_endloop_ort", "Surrender 3 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["come"] = {"swat", "come", "Come ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    ["stop"] = {"swat", "freeze", "Stop ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    ["progress"] = {"swat", "go_fwd", "Progress ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    ["packup"] = {"swat", "rally_point", "Pack up ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    ["understood"] = {"swat", "understood", "Understood ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    ["fakefist"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Fake fist ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    ["what"] = {"missarmenian2", "lamar_impatient_a", "What? ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["schair8"] = {"safe@franklin@ig_13", "base", "Sit Chair 8 ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
   }},
   ["finger"] = {"anim@mp_player_intupperdock", "idle_a", "Finger", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["watch"] = {"amb@code_human_wander_idles_fat@male@idle_a", "idle_a_wristwatch", "Look at the clock", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gather"] = {"amb@prop_human_movie_bulb@idle_a", "idle_a", "Gather", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true, 
   }},
   ["lean5"] = {"amb@prop_human_seat_sunlounger@female@base", "base", "Lean 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true, 
   }}, 
   ["sleep3"] = {"amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", "To sleep 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["strain"] = {"amb@world_human_muscle_flex@arms_at_side@idle_a", "idle_a", "Strain", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["keyboard5"] = {"anim@heists@fleeca_bank@scope_out@cashier_loop", "cashier_loop", "Keyboard", AnimationOptions =
   {
       EmoteLoop = true,
   }}, 
   ["sground16"] = {"anim@heists@narcotics@funding@gang_chat", "gang_chatting_combined", "Sit on the ground 16", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["surrender4"] = {"anim@heists@ornate_bank@hostages@cashier_b@", "flinch_loop_underfire", "Surrender 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sground17"] = {"anim@heists@prison_heistig_5_p1_rashkovsky_idle", "idle_180", "Sit on the ground 17", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["finger2"] = {"anim@mp_player_intcelebrationfemale@finger", "finger", "Finger", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sground18"] = {"anim@mp_rollarcoaster", "hands_up_idle_a_player_one", "Sit on the ground 18", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }}, 
   ["hgun2"] = {"combat@aim_variations@1h@gang", "aim_variation_b", "Holding a gun 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whgun"] = {"combat@damage@injured_pistol@to_writhe", "variation_b", "Wounded Holding a gun", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wounded2"] = {"combat@damage@writhe", "writhe_loop", "Wounded 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }}, 
   ["opensafe"] = {"mini@safe_cracking", "dial_turn_anti_slow", "Opening a Safe", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["lean6"] = {"mini@strip_club@backroom@", "leadin_loop_idle_c_stripper_c", "Lean 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["breast"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Breast", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }}, 
   ["bit"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Between the legs", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["breast2"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Breast 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},    
   ["death"] = {"missarmenian2", "drunk_loop", "Death", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["death2"] = {"missarmenian2", "corpse_search_exit_ped", "Death 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["death3"] = {"anim@gangops@morgue@table@", "body_search", "Death 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["death4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Death 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["death5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Death 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["examine4"] = {"creatures@rottweiler@tricks@", "petting_franklin", "To examine 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crawl"] = {"move_injured_ground", "front_loop", "Crawling", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tumble"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Tumble"},
   ["tumble2"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Tumble 2"},
   ["glide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Glide"},
   ["glide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Glide 2"},
   ["glide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Glide 3"},
   ["baseball"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Baseball"},
   ["finger3"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Finger 4", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["finger4"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Finger 5", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["salute4"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Salute 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute5"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Salute 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["carlock"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Car Locking", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["baseball2"] = {"rcmnigel1d", "swing_a_mark", "Baseball 2"},
   ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["hgun3"] = {"move_m@intimidation@cop@unarmed", "idle", "Holding a gun 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait9"] = {"random@shop_tattoo", "_idle_a", "Wait 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait10"] = {"missbigscore2aig_3", "wait_for_van_c", "Wait 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait11"] = {"rcmjosh1", "idle", "Wait 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait12"] = {"rcmnigel1a", "base", "Wait 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lap Dance 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lap Dance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance4"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lap Dance 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["toslap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "To Slap", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Head Butt"},
   ["snake"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Snake", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["doctor2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Doctor 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["doctor3"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Doctor 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["plane2"] = {"missfbi1", "ledge_loop", "Plane 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["plane3"] = {"missfbi1", "ledge_loop", "Plane 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["spy"] = {"random@paparazzi@peek", "left_peek_a", "Spy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Cough", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["warmup6"] = {"mini@triathlon", "idle_e", "Warming up 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["warmup3"] = {"mini@triathlon", "idle_f", "Warming up 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["warmup4"] = {"mini@triathlon", "idle_d", "Warming up 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["warmup5"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "Warming up 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["joy2"] = {"rcmfanatic1celebrate", "celebrate", "Joy 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["box3"] = {"rcmextreme2", "loop_punching", "Boxing Training 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hero"] = {"rcmbarry", "base", "Hero", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hero2"] = {"rcmbarry", "base", "Hero 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["spell"] = {"rcmbarry", "mind_control_b_loop", "Casting a spell", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["spell2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Casting a spell 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["podium"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Podium Stance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["podium2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Podium Stance 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["podium3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Podium Stance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tense"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Tense Stance", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tense2"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Tense Stance 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tense3"] = {"rcmme_tracey1", "nervous_loop", "Tense Stance 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hand"] = {"mp_arresting", "a_uncuff", "Hand Scratching", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pray"] = {"timetable@amanda@ig_4", "ig_4_base", "To pray", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dj2"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_open_a_dix", "DJ 2 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["hgun4"] = {"random@atmrobberygen", "b_atm_mugging", "Holding a gun 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "To pull", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["bird"] = {"random@peyote@bird", "wakeup", "Bird Movement"},
   ["chicken"] = {"random@peyote@chicken", "wakeup", "Chicken Movement", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dog"] = {"random@peyote@dog", "wakeup", "Dog imitation"},
   ["rabbit3"] = {"random@peyote@rabbit", "wakeup", "Rabbit 2"},
   ["doggystyle3"] = {"missexile3", "ex03_train_roof_idle", "Doggy Style 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["joke2"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "Jokek 2", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 3000,
   }},
   ["sup"] = {"missmic4", "michael_tux_fidget", "Straighten up", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 4000,
   }},
   ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Hands Up", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["pee2"] = {"misscarsteal2peeing", "peeing_loop", "Pee 2", AnimationOptions =
   {
       EmoteStuck = true,
       PtfxAsset = "scr_amb_chop",
       PtfxName = "ent_anim_dog_peeing",
       PtfxNoProp = true,
       PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
       PtfxWait = 3000,
   }},

-----------------------------------------------------------------------------------------------------------
------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
-----------------------------------------------------------------------------------------------------------

   ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
   ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
   ["mechanic5"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Mechanic 5"},
   ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep"},
   ["fun2"] = {"Scenario", "WORLD_HUMAN_CHEERING", "To enjoy 2"},
   ["pullup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Pull-up"},
   ["notepad2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Note Pad 2"},
   ["belt"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Belt"},
   ["rod"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Shaking Rod"},
   ["recordphone"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record Phone"},
   ["strain2"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Strain "},
   ["wait15"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Wait 15"},
   ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Hammer"},
   ["wait14"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Wait 14"},
   ["wait13"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Wait 13"},
   ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Janitor"},
   ["running4"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Junctic 4"},
   ["examine5"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "To examine 5"},
   ["grasscut"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Grass Cutting"},
   ["lean7"] = {"Scenario", "WORLD_HUMAN_LEANING", "Lean 7"},
   ["lbar6"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Lean Bar 6"},
   ["lookaround2"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Look around"},
   ["clean3"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Clean 3"},
   ["doctor4"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Doctor 4"},
   ["guitar3"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Guitar 3"},
   ["notepad"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Note Pad"},
   ["unlock"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Unlock"},
   ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Party"},
   ["message"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Message"},
   ["podium4"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Podium Stance 4"},
   ["podium5"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Podium Stance 5"},
   ["whands"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Washing hands"},
   ["recordphone2"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record Phone 2"},
   -- Sitchair is a litte special, since you want the player to be seated correctly.
   -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"
   ["schair9"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit Chair 9"},
   ["cigarette"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Cigarette"},
   ["joint"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Joint"},
   ["statue3"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Sculpture Posture 3"},
   ["sunbathe6"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Sunbathe 6"},
   ["sunbathe7"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe 7"},
   ["wmachine"] = {"Scenario", "WORLD_HUMAN_WELDING", "Welding machine"},
   ["lookaround3"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Look around 2"},
   ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
   -- CASINO DLC EMOTES (STREAMED)
   ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
   ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
   ["brawl4"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Brawliness 4"},
   ["brawl5"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Brawliness 5"},
   ["200ıq"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "200 IQ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["200ıq2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "200 IQ 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["box5"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxing Training 5", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["box4"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxing Training 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["smell2"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Smell 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["think6"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Think 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pruce"] = {"clothingtie", "try_tie_positive_a", "Spruce", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
   }},
 ["Glizzy1"] = {"glizzy@anims@deadly", "glizzy_anim1", "~p~Glizzy Gang Anim 1", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy2"] = {"glizzy@anims@deadly", "glizzy_anim2", "~p~ Glizzy Gang Anim 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy15"] = {"glizzy@anims@deadly", "glizzy_anim4", "~p~ Glizzy Gang Anim 3", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Glizzy3"] = {"glizzy@anims2@deadly", "glizzy_anim6", "~p~ Glizzy Gang Anim 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy4"] = {"glizzy@anims2@deadly", "glizzy_anim7", "~p~ Glizzy Gang Anim 5", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy5"] = {"deadly@animation@asset@uppr_000_r", "uppr_000_r", "~p~Glizzy Gang Anim 6", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Glizzy6"] = {"glizzy@anims2@deadly", "glizzy_anim9", "~p~ Glizzy Gang Anim 7", AnimationOptions =
   {
       EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["Glizzy7"] = {"glizzy@anims3@deadly", "glizzy_anim10", "~p~ Glizzy Gang Anim 8", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy8"] = {"glizzy@anims3@deadly", "glizzy_anim11", "~p~ Glizzy Gang Anim 9", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy9"] = {"glizzy@anims3@deadly", "glizzy_anim12", "~p~ Glizzy Gang Anim 10", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy10"] = {"glizzy@anims3@deadly", "glizzy_anim13", "~p~ Glizzy Gang Anim 11", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy11"] = {"glizzy@anims3@deadly", "glizzy_anim14", "~p~ Glizzy Gang Anim 12", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy12"] = {"glizzy@anims3@deadly", "glizzy_anim15", "~p~ Glizzy Gang Anim 13", AnimationOptions =
   {
       EmoteMoving = true,
       
   }},
   ["Glizzy13"] = {"glizzy@anims4@deadly", "glizzy_anim16", "~p~ Glizzy Gang Anim 14", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["Glizzy14"] = {"glizzy@anims4@deadly", "glizzy_anim17", "~p~ Glizzy Gang Anim 15", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
}

DP.PropEmotes = {
   ["umbrella"] = {"amb@world_human_drinking@coffee@male@base", "base", "Umbrella", AnimationOptions =
   {
       Prop = "p_amb_brolly_01",
       PropBone = 57005,
       PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
       --
       EmoteLoop = true,
       EmoteMoving = true,
   }},

-----------------------------------------------------------------------------------------------------
------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
-----------------------------------------------------------------------------------------------------

   ["notepad3"] = {"missheistdockssetup1clipboard@base", "base", "Note Pad 3", AnimationOptions =
   {
       Prop = 'prop_notepad_01',
       PropBone = 18905,
       PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
       SecondProp = 'prop_pencil_01',
       SecondPropBone = 58866,
       SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
       -- EmoteLoop is used for emotes that should loop, its as simple as that.
       -- Then EmoteMoving is used for emotes that should only play on the upperbody.
       -- The code then checks both values and sets the MovementType to the correct one
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["box"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
   {
       Prop = "hei_prop_heist_box",
       PropBone = 60309,
       PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose", AnimationOptions =
   {
       Prop = "prop_single_rose",
       PropBone = 18905,
       PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cigarette2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Cigarette", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cigarette3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Cigarette 3", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cigarette4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Cigarette 4", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bong", AnimationOptions =
   {
       Prop = 'hei_heist_sh_bong_01',
       PropBone = 18905,
       PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
   }},
   ["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase", AnimationOptions =
   {
       Prop = "prop_ld_suitcase_01",
       PropBone = 57005,
       PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jobbag"] = {"missheistdocksprep1hold_cellphone", "static", "Brief case", AnimationOptions =
   {
       Prop = "prop_security_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["criminals"] = {"mp_character_creation@customise@male_a", "loop", "Criminal Sign", AnimationOptions =
   {
       Prop = 'prop_police_id_board',
       PropBone = 58868,
       PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lean"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }}, 
   ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
   {
       Prop = 'prop_drink_whisky',
       PropBone = 28422,
       PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer ", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["beer2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer 2 ~b~ Glizzy", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz',
       PropBone = 28422,
       PropPlacement = {0.02, 0.0, -0.08, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["beer3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer 3 ~b~ Glizzy", AnimationOptions =
    {
        Prop = 'prop_cs_beer_bot_40oz_02',
        PropBone = 28422,
        PropPlacement = {0.02, 0.0, -0.08, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["beer4"] = {"amb@world_human_drinking@beer@female@idle_a", "idle_e", "Beer 4 ~b~ Glizzy", AnimationOptions =
    {
        Prop = 'prop_cs_beer_bot_40oz_02',
        PropBone = 28422,
        PropPlacement = {0.0, -0.022, -0.01, 0.1, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
   }},
   ["glass"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Glass", AnimationOptions =
   {
       Prop = 'prop_plastic_cup_02',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
   {
       Prop = 'prop_cs_burger_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["cola"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cola", AnimationOptions =
   {
       Prop = 'prop_ecola_can',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["chocolate"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Chocolate", AnimationOptions =
   {
       Prop = 'prop_choc_ego',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
   }},
   ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Wine", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["glass2"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Glass 2", AnimationOptions =
   {
       Prop = 'prop_champ_flute',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["champagne2"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne 2", AnimationOptions =
   {
       Prop = 'prop_drink_champ',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["puro"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Puro", AnimationOptions =
   {
       Prop = 'prop_cigar_02',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["puro2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Puro 2", AnimationOptions =
   {
       Prop = 'prop_cigar_01',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitar 2", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitar3"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Electro Guitar", AnimationOptions =
   {
       Prop = 'prop_el_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitar4"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Electro Guitar 2", AnimationOptions =
   {
       Prop = 'prop_el_guitar_03',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["book"] = {"cellphone@", "cellphone_text_read_base", "Book", AnimationOptions =
   {
       Prop = 'prop_novel_01',
       PropBone = 6286,
       PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["aquarius"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Aquarius", AnimationOptions =
   {
       Prop = 'prop_snow_flower_02',
       PropBone = 24817,
       PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["bear"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bear", AnimationOptions =
   {
       Prop = 'v_ilev_mr_rasberryclean',
       PropBone = 24817,
       PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["backpack"] = {"move_p_m_zero_rucksack", "idle", "Backpack", AnimationOptions =
   {
       Prop = 'p_michael_backpack_s',
       PropBone = 24818,
       PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["panel"] = {"missfam4", "base", "Panel", AnimationOptions =
   {
       Prop = 'p_amb_clipboard_01',
       PropBone = 36029,
       PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["map"] = {"amb@world_human_tourist_map@male@base", "base", "Map", AnimationOptions =
   {
       Prop = 'prop_tourist_map_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["homeless"] = {"amb@world_human_bum_freeway@male@base", "base", "Homeless", AnimationOptions =
   {
       Prop = 'prop_beggers_sign_03',
       PropBone = 58868,
       PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tmoney"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Throw money", AnimationOptions =
   {
       Prop = 'prop_anim_cash_pile_01',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_xs_celebration",
       PtfxName = "scr_xs_money_rain",
       PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
       PtfxWait = 500,
   }},
   ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Camera", AnimationOptions =
   {
       Prop = 'prop_pap_camera_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
       PtfxAsset = "scr_bike_business",
       PtfxName = "scr_bike_cfid_camera_flash",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
       PtfxWait = 200,
   }},
   ["champagne"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Pop the Champagne", AnimationOptions =
   {
       Prop = 'ba_prop_battle_champ_open',
       PropBone = 28422,
       PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_ba_club",
       PtfxName = "scr_ba_club_champagne_spray",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
       PtfxWait = 500,
   }},
   ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
   {
       Prop = 'p_cs_joint_02',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cigarette"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigarette", AnimationOptions =
   {
       Prop = 'prop_amb_ciggy_01',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["lbag"] = {"missheistdocksprep1hold_cellphone", "static", "Lawyer Bag", AnimationOptions =
   {
       Prop = "prop_ld_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablet", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablet 2", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phonetalk"] = {"cellphone@", "cellphone_call_listen_base", "Talk on the Phone", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phone"] = {"cellphone@", "cellphone_text_read_base", "Play by Phone", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "Clean", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean2"] = {"amb@world_human_maid_clean@", "base", "Clean 2", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
}