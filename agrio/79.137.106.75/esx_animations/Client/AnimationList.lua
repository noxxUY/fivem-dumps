DP = {}

DP.Expressions = { 
   ["Angry"] = {"Expression", "mood_angry_1"},
   ["Drunk"] = {"Expression", "mood_drunk_1"},
   ["Dumb"] = {"Expression", "pose_injured_1"},
   ["Electrocuted"] = {"Expression", "electrocuted_1"},
   ["Grumpy"] = {"Expression", "effort_1"},
   ["Grumpy2"] = {"Expression", "mood_drivefast_1"},
   ["Grumpy3"] = {"Expression", "pose_angry_1"},
   ["Happy"] = {"Expression", "mood_happy_1"},
   ["Injured"] = {"Expression", "mood_injured_1"},
   ["Joyful"] = {"Expression", "mood_dancing_low_1"},
   ["Mouthbreather"] = {"Expression", "smoking_hold_1"},
   ["Never Blink"] = {"Expression", "pose_normal_1"},
   ["One Eye"] = {"Expression", "pose_aiming_1"},
   ["Shocked"] = {"Expression", "shocked_1"},
   ["Shocked2"] = {"Expression", "shocked_2"},
   ["Sleeping"] = {"Expression", "mood_sleeping_1"},
   ["Sleeping2"] = {"Expression", "dead_1"},
   ["Sleeping3"] = {"Expression", "dead_2"},
   ["Smug"] = {"Expression", "mood_smug_1"},
   ["Speculative"] = {"Expression", "mood_aiming_1"},
   ["Stressed"] = {"Expression", "mood_stressed_1"},
   ["Sulking"] = {"Expression", "mood_sulk_1"},
   ["Weird"] = {"Expression", "effort_2"},
   ["Weird2"] = {"Expression", "effort_3"},
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
  ["Drunk"] = {"move_m@drunk@a"},
  ["Drunk"] = {"move_m@drunk@slightlydrunk"},
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
    ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug", "hug2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
        SyncOffsetFront = 1.05,
    }},
    ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2", "hug", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
        SyncOffsetFront = 1.13
    }},
    ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Besito de parjea", "besar", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 5000,
        SyncOffsetFront = 1.05,
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
    ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball", "baseballthrow"},
    ["baseballthrow"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Baseball Throw", "baseball"},
    ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", "stickupscared", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stickupscared"] = {"missminuteman_1ig_2", "handsup_base", "Stickup Scared", "stickup", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true,
    }},
    ["punch"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Punch", "punched"},
    ["punched"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Punched", "punch"},
    ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt", "headbutted"},
    ["headbutted"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Headbutted", "headbutt"},
    ["slap2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Slap 2", "slapped2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", "slapped", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["slapped"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Slapped", "slap"},
    ["slapped2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Slapped 2", "slap2"},
    ["besarColo"] = {"tigerle@custom@couple@standcuddle_a", "tigerle_couple_standcuddle_a", "Beso en colo", "besarColo2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.35,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 180.0,
    }},
["besarColo2"] = {"tigerle@custom@couple@standcuddle_b", "tigerle_couple_standcuddle_b", "Beso en colo 2", "besarColo", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.35,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 180.0,
    }},
    ["acostarPareja"] = {"tigerle@custom@couple@laying1a", "tigerle_couple_laying1a", "Acostarse en pareja", "acostarPareja2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
["acostarPareja2"] = {"tigerle@custom@couple@laying1b", "tigerle_couple_laying1b", "Acostarse en pareja 2", "acostarPareja", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
    ["besoSentados"] = {"tigerle@custom@couple@kissing2a", "tigerle_couple_kissing2a", "Besar sentados", "besoSentados2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
["besoSentados2"] = {"tigerle@custom@couple@kissing2b", "tigerle_couple_kissing2b", "Besar sentados 2", "besoSentados", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
    ["besarDepie"] = {"tigerle@custom@couple@kissing1a", "tigerle_couple_kissing1a", "Besar de pie", "besarDepie2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},
["besarDepie2"] = {"tigerle@custom@couple@kissing1b", "tigerle_couple_kissing1b", "Besar de pie 2", "besarDepie", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Atatchto = true,
        xPos = 0.0,
        yPos = 0.0,
        zPos = 0.0,
        xRot = 0.0,
        yRot = 0.0,
        zRot = 0.0,
    }},

    
["tumbarPareja"] = {"tigerle@custom@couple@cuddle1a", "tigerle_couple_cuddle1a", "Tumbarse en pareja", "tumbarPareja2", AnimationOptions =
{
    EmoteMoving = false,
    EmoteLoop = true,
    Atatchto = true,
    xPos = 0.0,
    yPos = 0.0,
    zPos = 0.0,
    xRot = 0.0,
    yRot = 0.0,
    zRot = 0.0,
}},
["tumbarPareja2"] = {"tigerle@custom@couple@cuddle1b", "tigerle_couple_cuddle1b", "Tumbarse en pareja", "tumbarPareja", AnimationOptions =
{
    EmoteMoving = false,
    EmoteLoop = true,
    Atatchto = true,
    xPos = 0.0,
    yPos = 0.0,
    zPos = 0.0,
    xRot = 0.0,
    yRot = 0.0,
    zRot = 0.0,
}},

 }
 
DP.Dances = {
   ["dancef"] = {"anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1", "Dance F", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Dance F2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance F3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dance F4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dance F5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance F6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Dance Slow 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dance Slow 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Dance Slow 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Dance 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Dance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Dance 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Upper", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance Upper 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Dance Shy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance Shy 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Dance Slow", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Dance Silly 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Dance 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Dance 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance8"] = {"missfbi3_sniping", "dance_m_default", "Dance 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Dance Silly", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Dance Silly 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Dance Silly 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dance Silly 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Dance Silly 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Dance Silly 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Dance Silly 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Silly 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dance 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dfdance1"] = {"divined@fndances2@new", "dfdance1", "Warehouse Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance2"] = {"divined@fndances2@new", "dfdance2", "Breakdance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance3"] = {"divined@fndances2@new", "dfdance3", "Treadmill", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance4"] = {"divined@fndances2@new", "dfdance4", "Shoot Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance5"] = {"divined@fndances2@new", "dfdance5", "Swim Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance6"] = {"divined@fndances2@new", "dfdance6", "Jumpstyle Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance7"] = {"divined@fndances2@new", "dfdance7", "GOAT Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance8"] = {"divined@fndances2@new", "dfdance8", "Glowstick Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance9"] = {"divined@fndances2@new", "dfdance9", "Crazy Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance10"] = {"divined@fndances2@new", "dfdance10", "Goth Swing", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance11"] = {"divined@fndances2@new", "dfdance11", "Wave Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance12"] = {"divined@fndances2@new", "dfdance12", "Pumpkin Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance13"] = {"divined@fndances2@new", "dfdance13", "Wiggly Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance14"] = {"divined@fndances2@new", "dfdance14", "Indian Shuffle", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance15"] = {"divined@fndances2@new", "dfdance15", "Salton Lake Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance16"] = {"divined@fndances2@new", "dfdance16", "Gwara Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance17"] = {"divined@fndances2@new", "dfdance17", "Zippy Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance18"] = {"divined@fndances2@new", "dfdance18", "Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance19"] = {"divined@fndances2@new", "dfdance19", "String Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dfdance20"] = {"divined@fndances2@new", "dfdance20", "La L", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ddance1"] = {"divined@dances@new", "ddance1", "Divined Dance 1", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance2"] = {"divined@dances@new", "ddance2", "Divined Dance 2", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance3"] = {"divined@dances@new", "ddance3", "Divined Dance 3", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance4"] = {"divined@dances@new", "ddance4", "Divined Dance 4", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance5"] = {"divined@dances@new", "ddance5", "Divined Dance 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance6"] = {"divined@dances@new", "ddance6", "Divined Dance 6", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance7"] = {"divined@dances@new", "ddance7", "Divined Dance 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance8"] = {"divined@dances@new", "ddance8", "Divined Dance 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance9"] = {"divined@dances@new", "ddance9", "Divined Dance 9", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance10"] = {"divined@dances@new", "ddance10", "Divined Dance 10", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance11"] = {"divined@dances@new", "ddance11", "Divined Dance 11", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance12"] = {"divined@dances@new", "ddance12", "Divined Dance 12", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance13"] = {"divined@dances@new", "ddance13", "Divined Dance 13", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["mgangsigns_1"] = {"mikey@gangsigns2@new", "mgangsigns_1", "Gangsign 1", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_2"] = {"mikey@gangsigns2@new", "mgangsigns_2", "Gangsign 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_3"] = {"mikey@gangsigns2@new", "mgangsigns_3", "Gangsign 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_4"] = {"mikey@gangsigns2@new", "mgangsigns_4", "Gangsign 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_5"] = {"mikey@gangsigns2@new", "mgangsigns_5", "Gangsign 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_6"] = {"mikey@gangsigns2@new", "mgangsigns_6", "Gangsign 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_7"] = {"mikey@gangsigns2@new", "mgangsigns_7", "Gangsign 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_8"] = {"mikey@gangsigns2@new", "mgangsigns_8", "Gangsign 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_9"] = {"mikey@gangsigns2@new", "mgangsigns_9", "Gangsign 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dab"] = { "custom@dab", "dab", "Dab", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = true,
   }},
   ["cantsee"] = { "custom@cant_see", "cant_see", "Can't See", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = true,
   }},
   ["sheesh"] = {"custom@sheeeeesh", "sheeeeesh", "Sheesh", AnimationOptions =
   {
     EmoteMoving = true,
     EmoteDuration = 8000,
   }},
   ["copsearch"] = {"custom@police", "police", "Cop Search", AnimationOptions =
   {
     EmoteMoving = false,
     EmoteDuration = 8000,
   }},
   ["sus"] = {"custom@suspect", "suspect", "Suspect", AnimationOptions =
   {
     EmoteMoving = false,
   }},
   ["cdig"] = {"custom@dig", "dig", "Custom Dig", AnimationOptions =
   {
     EmoteMoving = false,
     EmoteDuration = 8000,
   }},
   ["armswirl"] = {"custom@armswirl", "armswirl", "Arm Swirl", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["woowalk"] = {"div@woowalk@test", "woowalk", "Woo Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["drilldance"] = {"div@woowalk@test", "drilldance", "Drill Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["cripwalk2"] = {"div@woowalk@test", "cripwalk2", "Crip Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["sturdy2"] = {"div@woowalk@test", "sturdy2", "Get Sturdy", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["bloodwalk2"] = {"div@woowalk@test", "bloodwalk2", "Blood Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["blixkytwirl2"] = {"div@woowalk@test", "blixkytwirl2", "Blixky Twirl", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["armwave"] = {"custom@armwave", "armwave", "Arm Wave", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["circlecrunch"] = {"custom@circle_crunch", "circle_crunch", "Circle Crunch", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["circlecrunch"] = {"custom@circle_crunch", "circle_crunch", "Circle Crunch", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["whatidk"] = {"custom@what_idk", "what_idk", "What? Don't Know", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["pickfromground"] = {"custom@pickfromground", "pickfromground", "Pick From Ground", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["bellydance"] = {"custom@bellydance", "bellydance", "Belly Dance", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["convulsion"] = {"custom@convulsion", "convulsion", "Convulsion", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose1"] = {"custom@female_pose_1", "female_pose_1", "Pose 1", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose2"] = {"custom@female_pose_2", "female_pose_2", "Pose 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose3"] = {"custom@female_pose_3", "female_pose_3", "Pose 3", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphopslide"] = {"custom@hiphop_slide", "hiphop_slide", "HipHop Slide", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphop1"] = {"custom@hiphop1", "hiphop1", "HipHop 1", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphop2"] = {"custom@hiphop2", "hiphop2", "HipHop 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphop3"] = {"custom@hiphop3", "hiphop3", "HipHop 3", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = false,
   }},
   ["hiphopold"] = {"custom@hiphop90s", "hiphop90s", "HipHop Old", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose4"] = {"custom@male_pose_1", "male_pose_1", "Pose 4", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose5"] = {"custom@male_pose_2", "male_pose_2", "Pose 5", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose6"] = {"custom@male_pose_3", "male_pose_3", "Pose 6", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pluck"] = {"custom@pluck_fruits", "pluck_fruits", "Pluck Fruits", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["waiter"] = {"custom@waiter", "waiter", "Waiter", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},

   -- Custom Dances: Ultra
   ["breakdance"] = {"export@breakdance", "breakdance", "Break Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["gangnamstyle"] = {"custom@gangnamstyle", "gangnamstyle", "Gangnam Style", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["macarena"] = {"custom@makarena", "makarena", "Macarena", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["maraschino"] = {"custom@maraschino", "maraschino", "Maraschino", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["salsa"] = {"custom@salsa", "salsa", "Salsa", AnimationOptions =
   {
      EmoteLoop = true,
   }},

   -- Custom Dances: Divine
   ["ddance1"] = {"divined@dances@new", "ddance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance2"] = {"divined@dances@new", "ddance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance3"] = {"divined@dances@new", "ddance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance4"] = {"divined@dances@new", "ddance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance5"] = {"divined@dances@new", "ddance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance6"] = {"divined@dances@new", "ddance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance7"] = {"divined@dances@new", "ddance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance8"] = {"divined@dances@new", "ddance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance9"] = {"divined@dances@new", "ddance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance10"] = {"divined@dances@new", "ddance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance11"] = {"divined@dances@new", "ddance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance12"] = {"divined@dances@new", "ddance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance13"] = {"divined@dances@new", "ddance13", "Divined Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},

   -- Version Two
   ["divdance1"] = {"divined@dancesv2@new", "divdance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance2"] = {"divined@dancesv2@new", "divdance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance3"] = {"divined@dancesv2@new", "divdance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance4"] = {"divined@dancesv2@new", "divdance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance5"] = {"divined@dancesv2@new", "divdance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance6"] = {"divined@dancesv2@new", "divdance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance7"] = {"divined@dancesv2@new", "divdance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance8"] = {"divined@dancesv2@new", "divdance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance9"] = {"divined@dancesv2@new", "divdance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance10"] = {"divined@dancesv2@new", "divdance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance11"] = {"divined@dancesv2@new", "divdance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance12"] = {"divined@dancesv2@new", "divdance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance13"] = {"divined@dancesv2@new", "divdance13", "Divined Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance14"] = {"divined@dancesv2@new", "divdance14", "Divined Dance 14", AnimationOptions =
   {
      EmoteLoop = true
   }},
   -- Divine Breakdance
   ["divbdance1"] = {"divined@breakdances@new", "divbdance1", "Divined Break Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance2"] = {"divined@breakdances@new", "divbdance2", "Divined Break Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance3"] = {"divined@breakdances@new", "divbdance3", "Divined Break Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance4"] = {"divined@breakdances@new", "divbdance4", "Divined Break Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance5"] = {"divined@breakdances@new", "divbdance5", "Divined Break Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance6"] = {"divined@breakdances@new", "divbdance6", "Divined Break Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance7"] = {"divined@breakdances@new", "divbdance7", "Divined Break Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance8"] = {"divined@breakdances@new", "divbdance8", "Divined Break Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance9"] = {"divined@breakdances@new", "divbdance9", "Divined Break Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance10"] = {"divined@breakdances@new", "divbdance10", "Divined Break Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance11"] = {"divined@breakdances@new", "divbdance11", "Divined Break Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance12"] = {"divined@breakdances@new", "divbdance12", "Divined Break Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance13"] = {"divined@breakdances@new", "divbdance13", "Divined Break Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance14"] = {"divined@breakdances@new", "divbdance14", "Divined Break Dance 14", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance15"] = {"divined@breakdances@new", "divbdance14", "Divined Break Dance 15", AnimationOptions =
   {
      EmoteLoop = true
   }},

   -- Divine Breakdance v3
   ["dbrdance1"] = {"divined@brdancesv2@new", "dbrdance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance2"] = {"divined@brdancesv2@new", "dbrdance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance3"] = {"divined@brdancesv2@new", "dbrdance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance4"] = {"divined@brdancesv2@new", "dbrdance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance5"] = {"divined@brdancesv2@new", "dbrdance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance6"] = {"divined@brdancesv2@new", "dbrdance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance7"] = {"divined@brdancesv2@new", "dbrdance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance8"] = {"divined@brdancesv2@new", "dbrdance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance9"] = {"divined@brdancesv2@new", "dbrdance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance10"] = {"divined@brdancesv2@new", "dbrdance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance11"] = {"divined@brdancesv2@new", "dbrdance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance12"] = {"divined@brdancesv2@new", "dbrdance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},

   --Kayra10: yeniler
   ["gsigndeneme"] = {"pastelblood@animation", "pastelblood_clip", "gsigndeneme", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["gsigndeneme2"] = {"pepitosign4@animation", "pepitosign4_clip", "gsigndeneme2", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["gsigndeneme3"] = {"westsidesign@animation", "westsidesign_clip", "gsigndeneme3", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["gsigndeneme4"] = {"banks@juiceplug", "banks2", "gsigndeneme4", AnimationOptions =
   {
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsigndeneme5"] = {"banks@animation", "banks1", "gsigndeneme5", AnimationOptions =
   {
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsigndeneme6"] = {"nocap5@animation", "nocap5_clip", "gsigndeneme6", AnimationOptions =
   {
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsigndeneme7"] = {"nocap7@animation", "nocap7_clip", "gsigndeneme7", AnimationOptions =
   {
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsigndeneme8"] = {"duoanim2@animation", "duoanim2_clip", "gsigndeneme8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme9"] = {"217@aim2x@animation", "aim2x_clip", "gsigndeneme9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme10"] = {"mvpsign3@animacion", "mvpsign3_clip", "gsigndeneme10", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme11"] = {"cripsgangsign@animation", "cripsgangsign_clip", "gsigndeneme11", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme12"] = {"69nine@animation", "69nine_clip", "gsigndeneme12", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme13"] = {"chillpose@animation", "chillpose_clip", "gsigndeneme13", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme14"] = {"couple1@animation", "couple1_clip", "gsigndeneme14", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme15"] = {"couple2@animation", "couple2_clip", "gsigndeneme15", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme16"] = {"glock@animation", "dk_clip", "gsigndeneme16", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme17"] = {"lean@animation", "dk_clip", "gsigndeneme17", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme18"] = {"pastelgangsign2@animation", "pastelgangsign2_clip", "gsigndeneme18", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme19"] = {"pastelpistol@animation", "pastelpistol_clip", "gsigndeneme19", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme20"] = {"maosnobolso@animation", "maosnobolso_clip", "gsigndeneme20", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme21"] = {"paspose@animation", "paspose_clip", "gsigndeneme21", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme22"] = {"cigarpose@animation", "cigarpose_clip", "gsigndeneme22", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme23"] = {"drunk@animation", "drunk_clip", "gsigndeneme23", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme24"] = {"posepis@animation", "posepis_clip", "gsigndeneme24", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme25"] = {"instapose2@animation", "instapose2_clip", "gsigndeneme25", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme26"] = {"instapose@animation", "instapose_clip", "gsigndeneme26", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme27"] = {"gangpose@animation", "gangpose_clip", "gsigndeneme27", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme28"] = {"simple@animation", "simple_clip", "gsigndeneme28", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme29"] = {"ohgeesy@animation", "ohgeesy_clip", "gsigndeneme29", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme30"] = {"pastel3@animation", "pastel3_clip", "gsigndeneme30", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme31"] = {"pastelpose1@animation", "pastelpose1_clip", "gsigndeneme31", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme32"] = {"pasteldedos2@animation", "pasteldedos2_clip", "gsigndeneme32", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme33"] = {"lukitophoto2@animation", "lukitophoto2_clip", "gsigndeneme33", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme34"] = {"draco@arves", "draco_clip", "gsigndeneme34", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme35"] = {"wristcheck@animation", "wristcheck_clip", "gsigndeneme35", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme36"] = {"crossfinger@animation", "crossfinger_clip", "gsigndeneme36", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme37"] = {"seat1@animation", "seat1_clip", "gsigndeneme37", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme38"] = {"bag@animation", "bag_clip", "gsigndeneme38", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme39"] = {"five@nyck", "five_clip", "gsigndeneme39", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme40"] = {"capper@nyck", "capper_clip", "gsigndeneme40", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme41"] = {"pose@nyck", "pose_clip", "gsigndeneme41", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme42"] = {"pose2@nyck", "pose2_clip", "gsigndeneme42", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme43"] = {"pose3@nyck", "pose3_clip", "gsigndeneme43", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme44"] = {"mafiag@nyck", "mafiag_clip", "gsigndeneme44", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme45"] = {"15idk@animation", "15idk_clip", "gsigndeneme45", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme46"] = {"bkcr@animation", "bkcr_clip", "gsigndeneme46", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme47"] = {"bhw@animation", "bhw_clip", "gsigndeneme47", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme48"] = {"99mafia@animation", "99mafia_clip", "gsigndeneme48", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme49"] = {"krank@animation", "krank_clip", "gsigndeneme49", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme50"] = {"bangin@casual", "girl_clip", "gsigndeneme50", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme51"] = {"bangin@casual", "man_clip", "gsigndeneme51", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme52"] = {"hood@casual", "girl_clip", "gsigndeneme52", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme53"] = {"hood@casual", "male_clip", "gsigndeneme53", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme54"] = {"blooh@animation", "blooh_clip", "gsigndeneme54", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme55"] = {"famf@animation", "famf_clip", "gsigndeneme55", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme56"] = {"fuckb@animation", "fuckb_clip", "gsigndeneme56", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme57"] = {"grabber@animation", "grabber_clip", "gsigndeneme57", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme58"] = {"mfnapk@animation", "mfnapk_clip", "gsigndeneme58", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme59"] = {"neighbour@animation", "neighbour_clip", "gsigndeneme59", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme60"] = {"nonapps@animation", "nonapps_clip", "gsigndeneme60", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme61"] = {"zuna@animation", "zuna_clip", "gsigndeneme61", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme62"] = {"holdhip@animation", "holdhip_clip", "gsigndeneme62", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme63"] = {"holdhipb@animation", "holdhipb_clip", "gsigndeneme63", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme64"] = {"holdass@animation", "holdass_clip", "gsigndeneme64", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme65"] = {"holdassb@animation", "holdassb_clip", "gsigndeneme65", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme66"] = {"coupleseat1@animation", "coupleseat1_clip", "gsigndeneme66", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme67"] = {"coupleseat1b@animation", "coupleseat1b_clip", "gsigndeneme67", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme68"] = {"crshx@fix", "fix", "gsigndeneme68", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme69"] = {"crshx2@fix", "fix", "gsigndeneme69", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme70"] = {"mymsign1@animacion", "mymsign1_clip", "gsigndeneme70", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme71"] = {"mymsign20@animacion", "mymsign20_clip", "gsigndeneme71", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme72"] = {"mymsign30@animacion", "mymsign30_clip", "gsigndeneme72", AnimationOptions =
   {
       EmoteLoop = false,
   }},
   ["gsigndeneme73"] = {"chillimannn@animation", "chillimannn_clip", "gsigndeneme73", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme74"] = {"eastside@marisfreepack", "eastside", "gsigndeneme74", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme75"] = {"duoanim1@animation", "duoanim1_clip", "gsigndeneme75", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme76"] = {"hassanblood@animation", "hb_clip", "gsigndeneme76", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme77"] = {"bloodkiller@marisfreegpack", "bloodkiller", "gsigndeneme77", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme78"] = {"mafiacrip@marisfreegsignpack", "mafiacrip", "gsigndeneme78", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme79"] = {"cripkiller@marisgfreepack", "cripkiller", "gsigndeneme79", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme80"] = {"showback_naybahood@crip", "showback_naybahood", "gsigndeneme80", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme81"] = {"187@animation", "187", "gsigndeneme81", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme82"] = {"rollin60spose2@animation", "rollin60spose2", "gsigndeneme82", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme83"] = {"43_gangster@crip", "43_gangster", "gsigndeneme83", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme84"] = {"cripkiler@marisfreegsigns", "cripkiler", "gsigndeneme84", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme85"] = {"anim@60sv2", "60sv2_clip", "gsigndeneme85", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme86"] = {"anim@sixfingers", "six_clip", "gsigndeneme86", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme87"] = {"anim@nhtnh", "nhtnh_clip", "gsigndeneme87", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme88"] = {"anim@nayba", "nayba_clip", "gsigndeneme88", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme89"] = {"anim@fcktrays", "fcktrays_clip", "gsigndeneme89", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme90"] = {"anim@owe", "owe_clip", "gsigndeneme90", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme91"] = {"sensual1@casual", "girl_clip", "gsigndeneme91", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme92"] = {"sensual1@casual", "man_clip", "gsigndeneme92", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme93"] = {"ygzpose@animation", "dream_clip", "gsigndeneme93", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme94"] = {"downfingers@dreamdel", "dreamdel_clip", "gsigndeneme94", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme95"] = {"woopose@custom_anim", "woo_clip", "gsigndeneme95", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme96"] = {"sekposev3@animation", "v3", "gsigndeneme96", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme97"] = {"sekpose2v3@animation", "v3", "gsigndeneme97", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme98"] = {"sekpose2@animation", "clip", "gsigndeneme98", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme99"] = {"doubleo@animation", "doubleo_clip", "gsigndeneme99", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme100"] = {"missionary@casual", "girl_clip", "gsigndeneme100", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme101"] = {"missionary@casual", "man_clip", "gsigndeneme101", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme102"] = {"leangunanimation", "leangun_clip", "gsigndeneme102", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme103"] = {"whiskaspose1@stand", "whiskaspose1_makebywhiskas", "gsigndeneme103", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme104"] = {"whiskaspose2@stand", "whiskaspose2_makebywhiskas", "gsigndeneme104", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme105"] = {"whiskaspose3@stand", "whiskaspose3_makebywhiskas", "gsigndeneme105", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme106"] = {"holdracks@animation", "rackz_clip", "gsigndeneme106", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme107"] = {"customdeneme@anim", "customdeneme_clip", "gsigndeneme107", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme112"] = {"nhoneanimation", "nhone_clip", "gsigndeneme112", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme113"] = {"ceek2animation", "ceek2_clip", "gsigndeneme113", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme114"] = {"foek1animation", "foek1_clip", "gsigndeneme114", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme115"] = {"drillz@headtilt_anim", "headtilt_clip", "gsigndeneme115", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme116"] = {"drillz@laydown_anim", "laydown_clip", "gsigndeneme116", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme117"] = {"drillz@selfiewall_anim", "selfiewall_clip", "gsigndeneme117", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme118"] = {"drillz@leanfemalesit_anim", "leanfemalesit_clip", "gsigndeneme119", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme119"] = {"drillz@ruby_anim", "ruby_clip", "gsigndeneme119", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme120"] = {"posing1@animation", "posing1_clip", "gsigndeneme120", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme121"] = {"posing2@animation", "posing2_clip", "gsigndeneme121", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme122"] = {"posing3@animation", "posing3_clip", "gsigndeneme122", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme123"] = {"sureno@rabbit1", "rabbit_clip", "gsigndeneme123", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme124"] = {"sureno@thrtn", "thrtn_clip", "gsigndeneme124", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme125"] = {"ney3@animation", "ney_clip", "gsigndeneme125", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme126"] = {"rollz@walkpeace", "walkpeace_clip", "gsigndeneme126", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme127"] = {"ney@animation", "ney_clip", "gsigndeneme127", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme128"] = {"idleney@animation", "idle_clip", "gsigndeneme128", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme129"] = {"leanwoface@animation", "lean_clip", "gsigndeneme129", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme130"] = {"esse@drakowall", "drakowall_clip", "gsigndeneme130", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme131"] = {"nbn@animation", "nbn_clip", "gsigndeneme131", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme132"] = {"wrldmods@trippieredd", "trippieredd", "gsigndeneme132", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme133"] = {"lunyx@random001", "random001", "gsigndeneme133", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme134"] = {"lunyx@random002", "random002", "gsigndeneme134", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme135"] = {"lunyx@random003", "random003", "gsigndeneme135", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme136"] = {"leanganglit@animation", "leanganglit_clip", "gsigndeneme136", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme137"] = {"shlass@animation", "shlass_clip", "gsigndeneme137", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme138"] = {"gangsign1@animation", "gangsign1_clip", "gsigndeneme138", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme139"] = {"doublec@animation", "doublec_clip", "gsigndeneme139", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme140"] = {"handsup@animation", "handsup_clip", "gsigndeneme140", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme141"] = {"holdhands@anim", "holdhands_clip", "gsigndeneme141", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme142"] = {"syx@kiss02a", "kiss02a", "gsigndeneme142", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme143"] = {"syx@kiss02b", "kiss02b", "gsigndeneme143", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme144"] = {"syx@cute01", "cute01", "gsigndeneme144", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme145"] = {"syx@cute02", "cute02", "gsigndeneme145", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme146"] = {"syx@cute03", "cute03", "gsigndeneme146", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme147"] = {"syx@cute04", "cute04", "gsigndeneme147", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme148"] = {"syx@cute05", "cute05", "gsigndeneme148", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme149"] = {"lunyx@rgmp01", "rgmp01", "gsigndeneme149", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme150"] = {"lunyx@rgmp02", "rgmp02", "gsigndeneme150", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme151"] = {"lunyx@rgmp03", "rgmp03", "gsigndeneme151", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme152"] = {"lunyx@rgmp06", "rgmp06", "gsigndeneme152", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme153"] = {"lunyx@rgmp07", "rgmp07", "gsigndeneme153", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme154"] = {"gdkanimationanimation", "gdkanimation_clip", "gsigndeneme154", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme155"] = {"moneyspread1@animation", "moneyspread1_clip", "gsigndeneme155", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme156"] = {"divined@rpack@new", "alchemy", "gsigndeneme156", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme157"] = {"divined@rpack@new", "badmood", "gsigndeneme157", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme158"] = {"divined@rpack@new", "bunnyhop", "gsigndeneme158", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme159"] = {"divined@rpack@new", "burpee", "gsigndeneme159", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme160"] = {"divined@rpack@new", "callme", "gsigndeneme160", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme161"] = {"divined@rpack@new", "coronet", "gsigndeneme161", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme162"] = {"divined@rpack@new", "dcry", "gsigndeneme162", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme163"] = {"divined@rpack@new", "hailcab", "gsigndeneme163", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme164"] = {"divined@rpack@new", "kepler", "gsigndeneme164", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme165"] = {"divined@rpack@new", "mindblown", "gsigndeneme165", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme166"] = {"divined@rpack@new", "uproar", "gsigndeneme166", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme167"] = {"divined@rpack@new", "yeet", "gsigndeneme167", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme168"] = {"rollz@twofingers", "twofingers_clip", "gsigndeneme168", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme169"] = {"rollz@leanmiddle", "leanmiddle_clip", "gsigndeneme169", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme170"] = {"anim@playboyig", "playboy_clip", "gsigndeneme170", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme171"] = {"anim@doublerabbit", "rabbit_clip", "gsigndeneme171", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme172"] = {"nhcanimation", "nhc_clip", "gsigndeneme172", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme173"] = {"gangisgn1animation", "gangisgn1_clip", "gsigndeneme173", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme174"] = {"gangsign2animation", "gangsign2_clip", "gsigndeneme174", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme175"] = {"drillz@femalefuckoff_anim", "fuckoff_clip", "gsigndeneme175", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme176"] = {"drillz@fucktheopps_anim", "fucktheopps_clip", "gsigndeneme176", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme177"] = {"drillz@fuckyou_anim", "fuckyou_clip", "gsigndeneme177", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme178"] = {"drillz@oneleg_anim", "oneleg_clip", "gsigndeneme178", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme179"] = {"drillz@thebirdfemale_anim", "thebird_clip", "gsigndeneme179", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme180"] = {"f13ganganimation", "f13gang_clip", "gsigndeneme180", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme181"] = {"cosmocrippah", "crippah_clip", "gsigndeneme181", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme182"] = {"anim@sureno", "sureno_clip", "gsigndeneme182", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme183"] = {"anim@guttagang", "gutta_clip", "gsigndeneme183", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gsigndeneme184"] = {"anim@fog_rifle_relaxed", "rifle_relaxed_clip", "gsigndeneme184", AnimationOptions =
   {
	   EmoteLoop = true,
	   EmoteMoving = false,
   }},
   ["gsigndeneme185"] = {"anim@stack_pointman", "pointman_clip", "gsigndeneme185", AnimationOptions =
   {
	   EmoteLoop = true,
	   EmoteMoving = false,
   }},
   ["gsigndeneme186"] = {"anim@stack_two_man", "two_man_clip", "gsigndeneme186", AnimationOptions =
   {
	   EmoteLoop = true,
	   EmoteMoving = false,
   }},
   ["gsigndeneme187"] = {"anim@stack_three_man", "three_man_clip", "gsigndeneme187", AnimationOptions =
   {
	   EmoteLoop = true,
	   EmoteMoving = false,
   }},
   ["gsigndeneme188"] = {"anim@highlow_low_lean", "low_lean_clip", "gsigndeneme188", AnimationOptions =
   {
	   EmoteLoop = true,
	   EmoteMoving = false,
   }},
   ["gsigndeneme189"] = {"anim@highlow_high_lean", "high_lean_clip", "gsigndeneme189", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme190"] = {"anim@gang_pistol_westside", "pistol_westside_clip", "gsigndeneme190", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme191"] = {"anim@gang_one", "gang_one_clip", "gsigndeneme191", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme192"] = {"anim@gang_two", "gang_two_clip", "gsigndeneme192", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme193"] = {"anim@model_car_fancy", "car_fancy_clip", "gsigndeneme193", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme194"] = {"anim@model_stretched_leg", "stretched_leg_clip", "gsigndeneme194", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme195"] = {"anim@car_sitting_fuckyou", "sitting_fuckyou_clip", "gsigndeneme195", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme196"] = {"anim@car_sitting_cute", "sitting_cute_clip", "gsigndeneme196", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme197"] = {"anim@model_bike", "bike_clip", "gsigndeneme197", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme198"] = {"anim@model_bike_two", "bike_two_clip", "gsigndeneme198", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme199"] = {"anim@peace_selfie", "peace_clip", "gsigndeneme199", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme200"] = {"anim@stance_folded_arms", "folded_arms_clip", "gsigndeneme200", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme201"] = {"anim@stance_kneeling_cute", "kneeling_cute_clip", "gsigndeneme201", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme202"] = {"anim@sit_cute_window", "cute_window_clip", "gsigndeneme202", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme203"] = {"anim@car_cute_sit", "cute_sit_clip", "gsigndeneme203", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme204"] = {"anim@selfie_peacesign_cute", "peacesign_cute_clip", "gsigndeneme204", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme205"] = {"anim@female_smoke_01", "f_smoke_01_clip", "gsigndeneme205", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme206"] = {"anim@female_lean_01", "f_lean_01_clip", "gsigndeneme206", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme207"] = {"anim@female_selfie_1st_01", "f_selfie_1st_01_clip", "gsigndeneme207", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme208"] = {"anim@female_model_01", "f_model_01_clip", "gsigndeneme208", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme209"] = {"anim@female_model_02", "f_model_02_clip", "gsigndeneme209", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme210"] = {"anim@female_model_03", "f_model_03_clip", "gsigndeneme210", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme211"] = {"anim@selfie_knees_cute", "knees_cute_clip", "gsigndeneme211", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme212"] = {"anim@sw_sit_chill", "sit_chill_clip", "gsigndeneme212", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme213"] = {"anim@sw_chill_pose", "chill_pose_clip", "gsigndeneme213", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme214"] = {"anim@stance_handgun", "handgun_clip", "gsigndeneme214", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme215"] = {"anim@stance_handgun", "handgun_clip", "gsigndeneme215", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = true,
   }},
   ["gsigndeneme216"] = {"anim@shooter_stance", "stance_clip", "gsigndeneme216", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme217"] = {"anim@shooter_stance", "stance_clip", "gsigndeneme217", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = true,
   }},
   ["gsigndeneme218"] = {"thot_pose", "thot_clip", "gsigndeneme218", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme219"] = {"anim@fuck_you_selfie", "fuck_you_selfie_clip", "gsigndeneme219", AnimationOptions =
   {
	  EmoteLoop = true,
	  EmoteMoving = false,
   }},
   ["gsigndeneme220"] = {"lunyx@random@v3@pose001", "random@v3@pose001", "gsigndeneme220", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme221"] = {"lunyx@random@v3@pose002", "random@v3@pose002", "gsigndeneme221", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme222"] = {"lunyx@random@v3@pose003", "random@v3@pose003", "gsigndeneme222", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme223"] = {"lunyx@random@v3@pose004", "random@v3@pose004", "gsigndeneme223", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme224"] = {"lunyx@random@v3@pose005", "random@v3@pose005", "gsigndeneme224", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme225"] = {"lunyx@random@v3@pose006", "random@v3@pose006", "gsigndeneme225", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme226"] = {"lunyx@random@v3@pose007", "random@v3@pose007", "gsigndeneme226", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   
   ["gsigndeneme227"] = {"lunyx@random@v3@pose008", "random@v3@pose008", "gsigndeneme227", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme228"] = {"lunyx@random@v3@pose009", "random@v3@pose009", "gsigndeneme228", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme229"] = {"lunyx@random@v3@pose010", "random@v3@pose010", "gsigndeneme229", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme230"] = {"lunyx@random@v3@pose011", "random@v3@pose011", "gsigndeneme230", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme231"] = {"lunyx@random@v3@pose012", "random@v3@pose012", "gsigndeneme231", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme232"] = {"lunyx@random@v3@pose013", "random@v3@pose013", "gsigndeneme232", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme233"] = {"lunyx@random@v3@pose014", "random@v3@pose014", "gsigndeneme233", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme234"] = {"lunyx@random@v3@pose015", "random@v3@pose015", "gsigndeneme234", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme235"] = {"lunyx@random@v3@pose016", "random@v3@pose016", "gsigndeneme235", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme236"] = {"lunyx@random@v3@pose017", "random@v3@pose017", "gsigndeneme236", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme237"] = {"lunyx@random@v3@pose018", "random@v3@pose018", "gsigndeneme237", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme238"] = {"lunyx@random@v3@pose019", "random@v3@pose019", "gsigndeneme238", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme239"] = {"lunyx@random@v3@pose020", "random@v3@pose020", "gsigndeneme239", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme240"] = {"testanim@alina", "testanim_clip", "gsigndeneme240", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme241"] = {"hoe@anim", "hoe_clip", "gsigndeneme241", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme242"] = {"hoe2@anim", "hoe2_clip", "gsigndeneme242", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme243"] = {"expertmode@anim", "expertmode_clip", "gsigndeneme243", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme244"] = {"pose1@anim", "pose1_clip", "gsigndeneme244", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme245"] = {"expertmode2@anim", "expertmode2_clip", "gsigndeneme245", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme246"] = {"1foot@anim", "1foot_clip", "gsigndeneme246", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme247"] = {"car1@anim", "car1_clip", "gsigndeneme247", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme248"] = {"car2@anim", "car2_clip", "gsigndeneme248", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme249"] = {"selfie@anim", "selfie_clip", "gsigndeneme249", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme250"] = {"selfie2@anim", "selfie2_clip", "gsigndeneme250", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme251"] = {"randompose1@anim", "randompose1_clip", "gsigndeneme251", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme252"] = {"randompose2@anim", "randompose2_clip", "gsigndeneme252", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme253"] = {"stripper1@anim", "stripper1_clip", "gsigndeneme253", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme254"] = {"strip2@anim", "strip2_clip", "gsigndeneme254", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme255"] = {"pose5@anim", "pose5_clip", "gsigndeneme255", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme256"] = {"slavepose@anim", "slavepose_clip", "gsigndeneme256", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme257"] = {"gangsign50@animation", "gangsign50_clip", "gsigndeneme257", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme258"] = {"stanleylebougla@animation", "stanleylebougla_clip", "gsigndeneme258", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme259"] = {"217aim2xanimation", "aim2x_clip", "gsigndeneme259", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme260"] = {"dollie_mods@follow_me_001", "follow_me_001", "gsigndeneme260", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme261"] = {"dollie_mods@follow_me_002", "follow_me_002", "gsigndeneme261", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme262"] = {"tattooshowinn@animation", "tattooshowinn_clip", "gsigndeneme262", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme263"] = {"amb@world_human_hang_out_street@male_a@base", "base", "gsigndeneme263", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme264"] = {"amb@world_human_hang_out_street@male_a@enter", "enter", "gsigndeneme264", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme265"] = {"amb@world_human_hang_out_street@male_a@exit", "exit", "gsigndeneme265", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme256"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "gsigndeneme266", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme267"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_b", "gsigndeneme267", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme268"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_c", "gsigndeneme268", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme269"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_d", "gsigndeneme269", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme270"] = {"amb@world_human_hang_out_street@male_b@base", "base", "gsigndeneme270", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme271"] = {"amb@world_human_hang_out_street@male_b@enter", "enter", "gsigndeneme271", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme272"] = {"amb@world_human_hang_out_street@male_b@exit", "exit", "gsigndeneme272", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme273"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_a", "gsigndeneme273", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme274"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "gsigndeneme274", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme275"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_c", "gsigndeneme275", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme276"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_d", "gsigndeneme276", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme277"] = {"amb@world_human_hang_out_street@male_c@base", "base", "gsigndeneme277", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme278"] = {"amb@world_human_hang_out_street@male_c@enter", "enter", "gsigndeneme278", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme279"] = {"amb@world_human_hang_out_street@male_c@exit", "exit", "gsigndeneme279", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme280"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_a", "gsigndeneme280", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme281"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "gsigndeneme281", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme282"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_c", "gsigndeneme282", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme283"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_d", "gsigndeneme283", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme284"] = {"amb@world_human_hang_out_street@female_arm_side@base", "base", "gsigndeneme284", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme285"] = {"amb@world_human_hang_out_street@female_arm_side@enter", "enter", "gsigndeneme285", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme286"] = {"amb@world_human_hang_out_street@female_arm_side@exit", "exit", "gsigndeneme286", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme287"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_a", "gsigndeneme287", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme288"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_b", "gsigndeneme288", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme289"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_c", "gsigndeneme289", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme290"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_d", "gsigndeneme290", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme291"] = {"amb@world_human_hang_out_street@female_arms_crossed@base", "base", "gsigndeneme291", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme292"] = {"amb@world_human_hang_out_street@female_arms_crossed@enter", "enter", "gsigndeneme292", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme293"] = {"amb@world_human_hang_out_street@female_arms_crossed@exit", "exit", "gsigndeneme293", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme294"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "gsigndeneme294", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme295"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_b", "gsigndeneme295", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme296"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_c", "gsigndeneme296", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme297"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_d", "gsigndeneme297", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme298"] = {"amb@world_human_hang_out_street@female_hold_arm@base", "base", "gsigndeneme298", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme299"] = {"amb@world_human_hang_out_street@female_hold_arm@enter", "enter", "gsigndeneme299", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme300"] = {"amb@world_human_hang_out_street@female_hold_arm@exit", "exit", "gsigndeneme300", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme301"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "gsigndeneme301", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme302"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_b", "gsigndeneme302", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme303"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_c", "gsigndeneme303", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme304"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_d", "gsigndeneme304", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme305"] = {"betrex@sunglasses", "glasses", "gsigndeneme305", AnimationOptions =
   {
       EmoteLoop = false,
   }},
   ["gsigndeneme306"] = {"chouko@freeheart", "freeheart", "gsigndeneme306", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme307"] = {"chouko@nailpose", "nailpose", "gsigndeneme307", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme308"] = {"chid@nyck", "chid_clip", "gsigndeneme308", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme309"] = {"move_m@generic_idles@std", "idle_a", "gsigndeneme309", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme310"] = {"move_m@generic_idles@std", "idle_b", "gsigndeneme310", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme311"] = {"move_m@generic_idles@std", "idle_c", "gsigndeneme311", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme312"] = {"move_m@generic_idles@std", "idle_d", "gsigndeneme312", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme313"] = {"nhyza1@animation", "nhyza1_clip", "gsigndeneme313", AnimationOptions =
   {
       EmoteLoop = false,
   }},
   ["gsigndeneme314"] = {"qpacc@gangsign1", "gangsign1_clip", "gsigndeneme314", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme315"] = {"qpacc@gangsign2", "gangsign2_clip", "gsigndeneme315", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme316"] = {"qpacc@gangsign3", "gangsign3_clip", "gsigndeneme316", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme317"] = {"qpacc@gangsign4", "gangsign4_clip", "gsigndeneme317", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme318"] = {"qpacc@gangsign5", "gangsign5_clip", "gsigndeneme318", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme319"] = {"qpacc@gangsign6", "gangsign6_clip", "gsigndeneme319", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme320"] = {"qpacc@gangsign7", "gangsign7_clip", "gsigndeneme320", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme321"] = {"qpacc@gangsign8", "gangsign8_clip", "gsigndeneme321", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme322"] = {"mymsign25@animacion", "mymsign25_clip", "gsigndeneme322", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme323"] = {"mymsign67@animacion", "mymsign67_clip", "gsigndeneme323", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme324"] = {"cast@sign1@animation", "cast@sign1_clip", "gsigndeneme324", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme325"] = {"cast@sign2@animation", "cast@sign2_clip", "gsigndeneme325", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme326"] = {"crip@animation", "crip_clip", "gsigndeneme326", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme327"] = {"handoverffacefinger@sign@animation", "handoverffacefinger@sign_clip", "gsigndeneme327", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme328"] = {"bendover@sign@animation", "bendover@sign_clip", "gsigndeneme328", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme329"] = {"whitepower@animation", "whitepower_clip", "gsigndeneme329", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme330"] = {"standhand2animation", "standhand2_clip", "gsigndeneme330", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme331"] = {"standhand2@animation", "standhand2_clip", "gsigndeneme331", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme332"] = {"tidselfie01@animation", "tidselfie01_clip", "gsigndeneme332", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme333"] = {"mggyhang1@animation", "mggyhang1_clip", "gsigndeneme333", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme334"] = {"mggyhang2@animation", "mggyhang2_clip", "gsigndeneme334", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme335"] = {"mggyhang3@animation", "mggyhang3_clip", "gsigndeneme335", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme336"] = {"mggypiggypair1@animation", "mggypiggypair1_clip", "gsigndeneme336", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme337"] = {"mggypiggypair2@animation", "mggypiggypair2_clip", "gsigndeneme337", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme338"] = {"mggyselfie1@animation", "mggyselfie1_clip", "gsigndeneme338", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme339"] = {"mggyselfie2@animation", "mggyselfie2_clip", "gsigndeneme339", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme340"] = {"mggyselfie4@animation", "mggyselfie4_clip", "gsigndeneme340", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme341"] = {"custom@animation", "sitting_clip", "gsigndeneme341", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme342"] = {"slave@mchmnk", "slave_clip", "gsigndeneme342", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme343"] = {"mistress@mchmnk", "mistress_clip", "gsigndeneme343", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme344"] = {"coupleero01fr@mchmnk", "coupleero01fr_clip", "gsigndeneme344", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme345"] = {"coupleero01tw@mchmnk", "coupleero01tw_clip", "gsigndeneme345", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme346"] = {"waitingfordaddy@mchmnk", "waitingfordaddy_clip", "gsigndeneme346", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme347"] = {"tidsitting07@animation", "tidsitting07_clip", "gsigndeneme347", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme348"] = {"tidstanding11@animation", "tidstanding11_clip", "gsigndeneme348", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme349"] = {"tidstanding14@animation", "tidstanding14_clip", "gsigndeneme349", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme350"] = {"tidstanding15@animation", "tidstanding15_clip", "gsigndeneme350", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme351"] = {"tidstandingselfie11@animation", "tidstandingselfie11_clip", "gsigndeneme351", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme352"] = {"tidstandingselfie12@animation", "tidstandingselfie12_clip", "gsigndeneme352", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme353"] = {"christiandior@animation", "christiandior_clip", "gsigndeneme353", AnimationOptions =
   {
    Prop = 'p_ld_heist_bag_s_2',
    PropBone = 24817,
    PropPlacement = {-0.75, 0.18, -0.016, 180.0, -90.0, 90.0},
    EmoteMoving = false,
    EmoteLoop = true
   }},
   ["gsigndeneme354"] = {"christiandior2@animation", "christiandior2_clip", "gsigndeneme354", AnimationOptions =
   {
       Prop = "p_ld_heist_bag_s_2",
       PropBone = 57005,
       PropPlacement = {-0.335, -0.345, 0.245, 300.0, 180.0, 30.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsigndeneme355"] = {"christiandior2@animation", "christiandior2_clip", "gsigndeneme355", AnimationOptions =
   {
       Prop = "p_ld_heist_bag_s_2",
       PropBone = 57005,
       PropPlacement = {-0.335, -0.345, 0.245, 300.0, 180.0, 30.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsigndeneme356"] = {"longokillaanimation", "longokilla_clip", "gsigndeneme356", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme357"] = {"cas2animation", "cas2_clip", "gsigndeneme357", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme358"] = {"salutepose@animation", "salutepose_clip", "gsigndeneme358", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme359"] = {"sheshanimation", "shesh_clip", "gsigndeneme359", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme360"] = {"crouchinganimation", "crouching_clip", "gsigndeneme360", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme361"] = {"femalepose6@animation", "femalepose6_clip", "gsigndeneme361", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme362"] = {"femalepose5@animation", "femalepose5_clip", "gsigndeneme362", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme363"] = {"freeanim1animation", "freeanim1_clip", "gsigndeneme363", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme364"] = {"freeanim2animation", "freeanim2_clip", "gsigndeneme364", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme365"] = {"mggycas2@animation", "mggycas2_clip", "gsigndeneme365", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme366"] = {"mggycas1@animation", "mggycas1_clip", "gsigndeneme366", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme367"] = {"mggymirror4@animation", "mggymirror4_clip", "gsigndeneme367", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme368"] = {"mggymirror3@animation", "mggymirror3_clip", "gsigndeneme368", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme369"] = {"mggymirror2@animation", "mggymirror2_clip", "gsigndeneme369", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme370"] = {"mggymirror1@animation", "mggymirror1_clip", "gsigndeneme370", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme371"] = {"bfflookback1@animation", "bfflookback1_clip", "gsigndeneme371", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme372"] = {"bfflookback2@animation", "bfflookback2_clip", "gsigndeneme372", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme373"] = {"bffcasualpose1@animation", "bffcasualpose1_clip", "gsigndeneme373", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme374"] = {"bffcasualpose2@animation", "bffcasualpose2_clip", "gsigndeneme374", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme375"] = {"bfffun1@animation", "bfffun1_clip", "gsigndeneme375", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme376"] = {"bfffun2@animation", "bfffun2_clip", "gsigndeneme376", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme377"] = {"bffhandhold1@animation", "bffhandhold1_clip", "gsigndeneme377", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme378"] = {"bffhandhold2@animation", "bffhandhold2_clip", "gsigndeneme378", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme379"] = {"mggycouplehug1@animation", "mggycouplehug1_clip", "gsigndeneme379", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme380"] = {"mggycouplehug2@animation", "mggycouplehug2_clip", "gsigndeneme380", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gsigndeneme381"] = {"mggycouplehugphone@animation", "mggycouplehugphone_clip", "gsigndeneme381", AnimationOptions =
   {
       EmoteLoop = true,
   }},




   -- Divine: Trendy
   ["banddance"] = {"divined@tdances@new", "dtdance1", "Band Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["bopdance"] = {"divined@tdances@new", "dtdance2", "Bop", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["bboydance"] = {"divined@tdances@new", "dtdance3", "BBoy Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["capoeiramove"] = {"divined@tdances@new", "dtdance4", "Capoeira Move", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["hiphopdance"] = {"divined@tdances@new", "dtdance5", "Hip Hop Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["hipsterdance"] = {"divined@tdances@new", "dtdance6", "Hipster Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["hippiedance"] = {"divined@tdances@new", "dtdance7", "Hippie Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["hiphoptaunt"] = {"divined@tdances@new", "dtdance8", "Hip Hop Taunt", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["hilowave"] = {"divined@tdances@new", "dtdance9", "Hi Lo Wave", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["squaredance"] = {"divined@tdances@new", "dtdance10", "Square Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["hotdance"] = {"divined@tdances@new", "dtdance11", "Hot Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["hulahula"] = {"divined@tdances@new", "dtdance12", "Hula-Hula", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["dabloop"] = {"divined@tdances@new", "dtdance13", "Dab Loop", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["kingdance"] = {"divined@tdances@new", "dtdance14", "The King's Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["linedance"] = {"divined@tdances@new", "dtdance15", "Dance Line", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["magicman"] = {"divined@tdances@new", "dtdance16", "Magic Man", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["marat"] = {"divined@tdances@new", "dtdance17", "Marat", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["maskoff"] = {"divined@tdances@new", "dtdance18", "Mask Off", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["mellow"] = {"divined@tdances@new", "dtdance19", "Mellow", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["showroomdance"] = {"divined@tdances@new", "dtdance20", "Showroom Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["windmillfloss"] = {"divined@tdances@new", "dtdance21", "Windmill Floss", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["woahdance"] = {"divined@tdances@new", "dtdance22", "Woah", AnimationOptions =
   {
      EmoteLoop = true,
   }},

   --  Custom Gangsigns
   ["gsign1"] = {"custom@gsign_01", "gsign_01", "Gang Sign 1", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign2"] = {"custom@gsign_02", "gsign_02", "Gang Sign 2", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign3"] = {"custom@gsign_03", "gsign_03", "Gang Sign 3", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign4"] = {"custom@gsign_04", "gsign_04", "Gang Sign 4", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign5"] = {"custom@gsign_05", "gsign_05", "Gang Sign 5", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign6"] = {"custom@gsign_06", "gsign_06", "Gang Sign 6", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign7"] = {"custom@gsign_07", "gsign_07", "Gang Sign 7", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign8"] = {"custom@gsign_08", "gsign_08", "Gang Sign 8", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign9"] = {"custom@gsign_09", "gsign_09", "Gang Sign 9", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign10"] = {"custom@gsign_10", "gsign_10", "Gang Sign 10", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign11"] = {"custom@gsign_11", "gsign_11", "Gang Sign 11", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign12"] = {"custom@gsign_12", "gsign_12", "Gang Sign 12", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign13"] = {"custom@gsign_13", "gsign_13", "Gang Sign 13", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign14"] = {"custom@gsign_14", "gsign_14", "Gang Sign 14", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign15"] = {"custom@mgsign_01", "mgsign_01", "Gang Sign 15", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign16"] = {"custom@mgsign_02", "mgsign_02", "Gang Sign 16", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign17"] = {"custom@mgsign_03", "mgsign_03", "Gang Sign 17", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign18"] = {"custom@mgsign_04", "mgsign_04", "Crip Sign", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["gsign19"] = {"custom@gsign_26", "gsign_26", "Gang Sign 19", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["gsign20"] = {"custom@gsign_27", "gsign_27", "Gang Sign 20", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["gsign21"] = {"custom@gsign_28", "gsign_28", "Gang Sign 21", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["gsign22"] = {"custom@gsign_29", "gsign_29", "Gang Sign 22", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["gsign23"] = {"custom@gsign_30", "gsign_30", "Gang Sign 23", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["gsign24"] = {"custom@gsign_31", "gsign_31", "Gang Sign 24", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["gsign25"] = {"custom@gsign_32", "gsign_32", "Gang Sign 25", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["gsign26"] = {"custom@gsign_33", "gsign_33", "Gang Sign 26", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["gsign27"] = {"custom@gsign_34", "gsign_34", "Gang Sign 27", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["gsign28"] = {"custom@gsign_35", "gsign_35", "Gang Sign 28", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["gsign29"] = {"custom@gsign_36", "gsign_36", "Gang Sign 29", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["gsign30"] = {"custom@gsign_37", "gsign_37", "Gang Sign 30", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   
   ["fsign"] = {"custom@fsign_1", "fsign_1", "Female Sign 1", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = false,
   }},
   ["cane"] = {"missheistdocksprep1hold_cellphone", "static", "Cane", AnimationOptions =
   {
       Prop = "prop_cs_walking_stick",
       PropBone = 57005,
       PropPlacement = {0.15, 0.05, -0.03, 0.0, 266.0, 180.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["handspocket"] = {"custom@handsinpockets_1", "handsinpockets_1", "Hands in Pocket", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},

   -- Custom Animations: Josh
   ["jdrill"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_male^3", "Drill · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill2"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male^1", "Drill · Male 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill3"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^4", "Drill · Male 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Drill · Male 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill5"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^5", "Drill · Male 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill6"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^5", "Drill · Male 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill7"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_up", "Drill · Solo 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill8"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center", "Drill · Solo 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdrill9"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_down", "Drill · Solo 3", AnimationOptions =
   {
      EmoteLoop = true
   }}, 
   ["jdrill10"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center", "Drill · Solo 4", AnimationOptions =
   {
      EmoteLoop = true
   }}, 
   ["jdrill11"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left_down", "Drill · Solo 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jmonkey1"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center", "Monkey Dance", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jmonkeyd2"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_down", "Monkey Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jmonkeyd3"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_down", "Monkey Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jrightdown"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_down", "Boxing Dance Solo", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jlowdance"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center", "Low Dance · Female ", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jlowdance2"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center", "Low Dance · Female", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jhiphop"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_d@", "ped_a_dance_idle", "Hip Hop Dance", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jhiphop2"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_b@", "ped_a_dance_idle", "Hip Hop Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jhiphop3"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_a@", "ped_a_dance_idle", "Hip Hop Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jpbox"] = {"mp_am_hold_up", "purchase_beerbox_shopkeeper", "Purchase Box", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jch"] = {"amb@code_human_police_investigate@idle_b", "idle_f", "Cop Search", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 7000,
   }},
   ["jgangsign5"] = {"anim@mp_player_intupperdock", "idle_a", "Gang Sign", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jcheckwatch"] = {"amb@code_human_wander_idles_fat@male@idle_a", "idle_a_wristwatch", "Check Watch · Male", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jpicking"] = {"amb@prop_human_movie_bulb@idle_a", "idle_a", "Picking", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jgangaim"] = {"combat@aim_variations@1h@gang", "aim_variation_b", "Gang Aim", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jshowboobs"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Show Boobs", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 6000,
   }},
   ["jcleanleg"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Clean Legs", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 6000,
   }},
   ["jshowboobs2"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Show Boobs 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 6000,
   }},
   ["jlockcar"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Lock Car", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 2500,
   }},
   ["jselfie5"] = {"cellphone@self", "selfie", "Selfie 3", AnimationOptions =
   {
      EmoteMoving = false,
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true
   }},
   ["jselfiewc"] = {"cellphone@self@franklin@", "west_coast", "Selfie West Coast", AnimationOptions =
   {
      EmoteMoving = false,
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true
   }},
   ["jselfie3"] = {"cellphone@self@michael@", "finger_point", "Selfie Finger", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jselfie4"] = {"cellphone@self@franklin@", "chest_bump", "Selfie Chest Bump", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jselfie1"] = {"cellphone@self@trevor@", "throat_slit", "Selfie", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jselfie2"] = {"cellphone@self@trevor@", "proud_finger", "Selfie2", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jkhaby"] = {"missarmenian3@simeon_tauntsidle_b", "areyounotman", "Khaby · Special", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jdepressed"] = {"oddjobs@bailbond_hobodepressed", "base", "Depressed", AnimationOptions =
   {
      EmoteMoving = true,
   }},
   ["jcarsign"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base", "idle_a", "Gang Sign · Car", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 2500,
   }},
   ["jcarsign2"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base", "idle_a", "Gang Signs 2 · Car", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 2500,
   }},
   ["jcarlowrider"] = {"anim@veh@lowrider@low@front_ds@arm@base", "sit", "Lowrider Style · Car", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jcarlowrider2"] = {"anim@veh@lowrider@std@ds@arm@music@mexicanidle_a", "idle", "Lowrider Mexican Style · Car", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jleaningwallback"] = {"anim@amb@casino@peds@", "amb_world_human_leaning_male_wall_back_mobile_idle_a", "Leaning Wall Back · Male", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Reaction Absolutely", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Reaction Anger", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Reaction Why", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactscrew"] = {"random@shop_robbery_reactions@", "screw_you", "Reaction Screw You", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Reaction Shock", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "Reaction Good Choice", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Try New Clothes", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Try New Clothes 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Reaction Easy Now", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactıwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Reaction I will", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Reaction No Way", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Reaction Bye Hard", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreacthello"] = {"gestures@f@standing@casual", "gesture_hello", "Reaction Hello", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Look At Player", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Great", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Fake Punch", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jreactdamn"] = {"missheist_jewel", "damn", "Reaction Damn", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jimtellingyou"] = {"missheist_jewel", "im_telling_you", "I'm telling you", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jreactno"] = {"missheist_jewel", "despair", "Reaction No", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jdontkillme"] = {"missheist_jewel", "manageress_kneel_loop", "Dont Kill Me", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jbangbang"] = {"anim@mp_player_intcelebrationfemale@bang_bang", "bang_bang", "Bang Bang", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Try Shirt Negative", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "Try Shirt Positive", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Try Shoes", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Try Shoes 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["joverhere"] = {"friends@fra@ig_1", "over_here_idle_a", "Over Here", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jwashingface"] = {"missmic2_washing_face", "michael_washing_face", "Washing Face", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jlastday"] = {"misstrevor1", "ortega_outro_loop_ort", "Last Day", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Try Glasses · Female", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jpickup"] = {"pickup_object", "pickup_low", "Pick Up", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "Stretch Long", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jhos"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Hang Out Street · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Hang Out Street 2 · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jguardaim"] = {"guard_reactions", "1hand_aiming_cycle", "Guard Aim", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jgready"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Getting Ready", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Look At Outfits", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 6000,
   }},
   ["jtoilet"] = {"switch@trevor@on_toilet", "trev_on_toilet_loop", "Have A Shit", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jtoilet2"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Have A Shit 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jcovermale2"] = {"amb@code_human_cower@male@base", "base", "Cover · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jvalet"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Valet", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jvalet2"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Valet 2", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jsunbathem"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Sunbathe · Male", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jsunbathem2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Sunbathe 2 · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jleancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Lean Car", AnimationOptions =
   {
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   ["jcheckout"] = {"anim@amb@carmeet@checkout_car@male_a@idles", "idle_b", "Check Out · Female", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jcheckout2"] = {"anim@amb@carmeet@checkout_car@male_c@idles", "idle_a", "Check Out 2 · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jcheckout"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Check Out 3 · Female", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jreadmessages"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Read Messages · Male", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jreadmessages2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Read Messages 2 · Female", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jlistenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Listen Music", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jogger"] = {"move_f@jogger", "idle", "Jogger · Female", AnimationOptions =
   {
      EmoteDuration = 2500,
      EmoteMoving = true,
   }},
   ["jogger2"] = {"move_m@jogger", "idle", "Jogger · Male", AnimationOptions =
   {
      EmoteDuration = 2500,
      EmoteMoving = true,
   }},
   ["jwtf"] = {"mini@triathlon", "wot_the_fuck", "Wot The Fuck", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "U Cant Do That", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jwarmup"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Warmup", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jwarmup2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Warmup 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jwarmup3"] = {"mini@triathlon", "jog_idle_f", "Warmup 3", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jwarmup4"] = {"mini@triathlon", "jog_idle_e", "Warmup 4", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jhmassage"] = {"missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Heart Massage", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jpassout"] = {"missheistfbi3b_ig8_2", "cower_loop_victim", "Pass Out", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jddealer"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Drug Dealer · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jswatch"] = {"amb@world_human_strip_watch_stand@male_c@idle_a", "idle_b", "Watch Strip · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jcheckw"] = {"amb@world_human_bum_wash@male@high@base", "base", "Check Water", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jwaitt"] = {"oddjobs@taxi@", "idle_a", "Wait Taxi", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jnoway"] = {"oddjobs@towingpleadingbase", "base", "No Way", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jtsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Tell Something", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jlfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Looking For Help", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jmstretch"] = {"oddjobs@assassinate@multi@", "idle_a", "Muscle Stretch", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jdj"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdj2"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdj3"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdj4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jlmic"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Listen Music In Car", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 2500,
   }},
   ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Get Off The Car", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Very Sad", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jdgrave"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Digging Grave", AnimationOptions =
   {
      Prop = 'prop_tool_shovel006',
      PropBone = 28422,
      PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jbow3"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Bend Over Wait", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 2500,
   }},
   ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Weeding · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "Look Plan", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteDuration = 5000,
   }},
   ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@base", "base", "Gang Drink", AnimationOptions =
   {
      Prop = 'prop_cs_beer_bot_40oz_03',
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Gang Drink 2", AnimationOptions =
   {
      Prop = 'prop_cs_beer_bot_40oz_03',
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jmleaning"] = {"amb@world_human_leaning@male@wall@back@mobile@base", "base", "Mobile Leaning · Male", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = false,
      EmoteLoop = true
   }},
   ["jthanks"] = {"random@arrests", "thanks_male_05", "Thanks", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Texting · Male", AnimationOptions =
   {
      Prop = "prop_npc_phone_02",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jffb"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "F*ck From Behind", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jsitchair7"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", "Sit Chair 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jsitchair8"] = {"timetable@michael@on_sofabase", "sit_sofa_base", "Sit Chair 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jsitchair9"] = {"timetable@trevor@smoking_meth@base", "base", "Sit Chair 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jsitchair10"] = {"timetable@tracy@ig_7@base", "base", "Sit Chair 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jstandingt"] = {"amb@world_human_bum_standing@twitchy@base", "base", "Standing Twitchy", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jstandingfit"] = {"amb@world_human_jog_standing@male@fitbase", "base", "Standing Fit", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jstandingm"] = {"anim@amb@casino@hangout@ped_male@stand@03b@base", "base", "Standing · Male", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jstandingf"] = {"anim@amb@casino@hangout@ped_female@stand@02a@base", "base", "Standing · Female", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["jgabgtaunt"] = {"switch@franklin@gang_taunt_p1", "gang_taunt_loop_lamar", "Gang Taunt", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true
   }},
   ["jdj5"] = {"mini@strip_club@idles@dj@base", "base", "DJ 5" , AnimationOptions = {
      EmoteMoving = false,
      EmoteLoop = true
   }},
   -- Other
   ["renegade"] = {"custom@renegade", "renegade", "Renegade", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["savage"] = {"custom@savage", "savage", "Savage", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["sayso"] = {"custom@sayso", "sayso", "Say So", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["tslide"] = {"custom@toosie_slide", "toosie_slide", "Tootsie Slide", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["defaultdance"] = {"custom@dancemoves", "dancemoves", "Default Dance", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["discodance"] = {"custom@disco_dance", "disco_dance", "Disco Dance", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["electroshuffle"] = {"custom@electroshuffle_original", "electroshuffle_original", "Electro Shuffle", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["electroshuffle2"] = {"custom@electroshuffle", "electroshuffle", "Electro Shuffle 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["hitit"] = {"custom@hitit", "hitit", "Hit It", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["floss"] = {"custom@floss", "floss", "Floss", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["orangejustice"] = {"custom@orangejustice", "orangejustice", "Orange Justice", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["takel"] = {"custom@take_l", "take_l", "Take the L", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
}

DP.Emotes = {
   ["healthkit"] = {"anim@amb@board_room@supervising@", "dissaproval_01_lo_amy_skater_01", "Health Kit", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["drink"] = {"mp_player_inteat@pnq", "loop", "Drink", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["beast"] = {"anim@mp_fm_event@intro", "beast_transform", "Beast", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000,
   }},
   ["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Chill", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Cloudgaze", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Cloudgaze 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["prone"] = {"missfbi3_sniping", "prone_dave", "Prone", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Pullover", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Idle", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Idle 8"},
   ["idle9"] = {"friends@fra@ig_1", "base_idle", "Idle 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle10"] = {"mp_move@prostitute@m@french", "idle", "Idle 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["idle11"] = {"random@countrysiderobbery", "idle_a", "Idle 11", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Idle 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Idle 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Idle 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Idle 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Idle 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Idle 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Wait 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Idle Drunk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Idle Drunk 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Idle Drunk 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar"},
   ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synth"},
   ["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Argue", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Argue 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Bartender", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Blow Kiss"},
   ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Besito de pareja", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000

   }},
   ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Curtsy"},
   ["bringiton"] = {"misscommon@response", "bring_it_on", "Bring It On", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "Come at me bro", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Cop 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Cop 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crossarms"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Crossarms", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Crossarms 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["crossarms3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Crossarms 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms4"] = {"random@street_race", "_car_b_lookout", "Crossarms 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Crossarms 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Fold Arms 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms6"] = {"random@shop_gunstore", "_idle", "Crossarms 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Fold Arms", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarmsside"] = {"rcmnigel1a_band_groupies", "base_m2", "Crossarms Side", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Damn", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Damn 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Point Down", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["surrender"] = {"random@arrests@busted", "idle_a", "Surrender", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Facepalm 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Facepalm", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Facepalm 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Facepalm 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Fall Over"},
   ["fallover2"] = {"mp_suicide", "pistol", "Fall Over 2"},
   ["fallover3"] = {"mp_suicide", "pill", "Fall Over 3"},
   ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Fall Over 4"},
   ["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Fall Over 5"},
   ["fallasleep"] = {"mp_sleep", "sleep_loop", "Fall Asleep", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Fight Me"},
   ["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Fight Me 2"},
   ["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Finger", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Finger 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Wait 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait5"] = {"missclothing", "idle_storeclerk", "Wait 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Wait 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait7"] = {"rcmnigel1cnmt_1c", "base", "Wait 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait8"] = {"rcmjosh1", "idle", "Wait 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Wait 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Wait 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait11"] = {"misshair_shop@hair_dressers", "keeper_base", "Wait 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hiking"] = {"move_m@hiking", "idle", "Hiking", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug"},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2"},
   ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Hug 3"},
   ["inspect"] = {"random@train_tracks", "idle_e", "Inspect"},
   ["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Jazzhands", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 6000,
   }},
   ["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jog 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jog 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jog 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog5"] = {"move_m@joy@a", "walk", "Jog 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Jumping Jacks", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel2"] = {"rcmextreme3", "idle", "Kneel 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "Kneel 3", AnimationOptions =
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
   ["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Knuckle Crunch", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance"},
   ["lean2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Lean 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Lean 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Lean 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Lean 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "Lean Flirt", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Lean Bar 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Lean Bar 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Lean Bar 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Lean High", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Lean High 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside"] = {"timetable@mime@01_gc", "idle_a", "Leanside", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "Leanside 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "Leanside 5", AnimationOptions =
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
   ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Medic 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Meditiate", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Meditiate 2", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditate3"] = {"rcmepsilonism3", "base_loop", "Meditiate 3", AnimationOptions = -- CHANGE ME
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
   ["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Nose Pick", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "No Way", AnimationOptions =
   {
       EmoteDuration = 1500,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["outofbreath"] = {"re@construction", "out_of_breath", "Out of Breath", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pickup"] = {"random@domestic", "pickup_low", "Pickup"},
   ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Push", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Push 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["point"] = {"gestures@f@standing@casual", "gesture_point", "Point", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Pushup", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["countdown"] = {"random@street_race", "grid_girl_race_start", "Countdown", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Point Right", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salute", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salute 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salute 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared"] = {"random@domestic", "f_distressed_loop", "Scared", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "Scared 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["screwyou"] = {"misscommon@response", "screw_you", "Screw You", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "Shake Off", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3500,
   }},
   ["shot"] = {"random@dealgonewrong", "idle_a", "Shot", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Sleep", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Shrug", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Shrug 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "Sit", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "Sit 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "Sit 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "Sit 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "Sit 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "Sit 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "Sit 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Sit 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "Sit 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "Sit Lean", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit Sad", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Sit Scared", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Sit Scared 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Sit Scared 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "Sit Drunk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "Sit Chair 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair3"] = {"timetable@reunited@ig_10", "base_amanda", "Sit Chair 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair4"] = {"timetable@ron@ig_3_couch", "base", "Sit Chair 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "Sit Chair 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair6"] = {"timetable@maid@couch@", "base", "Sit Chair 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchairside"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "Sit Chair Side", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Sit Up", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clapangry"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Clap Angry", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Slow Clap 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clap"] = {"amb@world_human_cheering@male_a", "base", "Clap", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Slow Clap", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Slow Clap 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Smell", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stumble"] = {"misscarsteal4@actor", "stumble", "Stumble", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stunned"] = {"stungun@standing", "damage", "Stunned", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Sunbathe", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Sunbathe 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["t"] = {"missfam5_yoga", "a2_pose", "T", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["t2"] = {"mp_sleep", "bind_pose_180", "T 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Think 5", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Think", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think3"] = {"timetable@tracy@ig_8@base", "base", "Think 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Think 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Thumbs Up 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Thumbs Up 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Thumbs Up", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Type", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Type 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type3"] = {"mp_prison_break", "hack_loop", "Type 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type4"] = {"mp_fbi_heist", "loop", "Type 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Warmth", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Wave 4", AnimationOptions =
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
   ["wave"] = {"friends@frj@ig_1", "wave_a", "Wave", AnimationOptions =
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
   ["whistle"] = {"taxi_hail", "hail_taxi", "Whistle", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Whistle 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lift"] = {"random@hitch_lift", "idle_f", "Lift", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "LOL", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "LOL 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Gang Sign", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Gang Sign 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["passout"] = {"missarmenian2", "drunk_loop", "Passout", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Passout 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Passout 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Passout 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Passout 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Petting", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crawl"] = {"move_injured_ground", "front_loop", "Crawl", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Flip 2"},
   ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Flip"},
   ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Slide"},
   ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Slide 2"},
   ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Slide 3"},
   ["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Slugger"},
   ["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Flip Off", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Flip Off 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Bow", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Bow 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Key Fob", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Golf Swing"},
   ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Reaching", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait"] = {"random@shop_tattoo", "_idle_a", "Wait", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Wait 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait12"] = {"rcmjosh1", "idle", "Wait 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait13"] = {"rcmnigel1a", "base", "Wait 13", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lapdance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lapdance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt"},
   ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Fish Dance", AnimationOptions =
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
   ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ledge"] = {"missfbi1", "ledge_loop", "Ledge", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["airplane"] = {"missfbi1", "ledge_loop", "Air Plane", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peek"] = {"random@paparazzi@peek", "left_peek_a", "Peek", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Cough", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stretch"] = {"mini@triathlon", "idle_e", "Stretch", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch2"] = {"mini@triathlon", "idle_f", "Stretch 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch3"] = {"mini@triathlon", "idle_d", "Stretch 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "Stretch 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Celebrate", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["punching"] = {"rcmextreme2", "loop_punching", "Punching", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["superhero"] = {"rcmbarry", "base", "Superhero", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["superhero2"] = {"rcmbarry", "base", "Superhero 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Mind Control", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Mind Control 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
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
   ["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Try Clothes", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Try Clothes 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Try Clothes 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Nervous 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Nervous", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Nervous 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["uncuff"] = {"mp_arresting", "a_uncuff", "Uncuff", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Threaten", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Pull", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bird"] = {"random@peyote@bird", "wakeup", "Bird"},
   ["chicken"] = {"random@peyote@chicken", "wakeup", "Chicken", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bark"] = {"random@peyote@dog", "wakeup", "Bark"},
   ["pee"] = {"misscarsteal2peeing", "peeing_loop", "Pee", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Rabbit"},
   ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spider-Man", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "BOI", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 3000,
   }},
   ["adjust"] = {"missmic4", "michael_tux_fidget", "Adjust", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 4000,
   }},
   ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Hands Up", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},

-----------------------------------------------------------------------------------------------------------
------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
-----------------------------------------------------------------------------------------------------------

   ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
   ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
   ["beg"] = {"MaleScenario", "WORLD_HUMAN_BUM_FREEWAY", "Beg"},
   ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Bum Bin"},
   ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep"},
   ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep"},
   ["camera"] = {"MaleScenario", "WORLD_HUMAN_PAPARAZZI", "Camera"},
   ["cheer"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Cheer"},
   ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Chinup"},
   ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Clipboard 2"},
   ["cop"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Cop"},
   ["copbeacon"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Cop Beacon"},
   ["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Film Shocking"},
   ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},
   ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Guard"},
   ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Hammer"},
   ["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Hangout"},
   ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
   ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Janitor"},
   ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Jog"},
   ["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Kneel"},
   ["leafblower"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Leafblower"},
   ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "Lean"},
   ["leanbar"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Lean Bar"},
   ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Lookout"},
   ["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Maid"},
   ["map"] = {"Scenario", "WORLD_HUMAN_TOURIST_MAP", "Map"},
   ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medic"},
   ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musician"},
   ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Notepad 2"},
   ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parking Meter"},
   ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Party"},
   ["phone"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Phone 3"},
   ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prostitue High"},
   ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostitue Low"},
   ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Puddle"},
   ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record"},
   -- Sitchair is a litte special, since you want the player to be seated correctly.
   -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"
   ["sitchair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit Chair"},
   ["smoke"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Smoke"},
   ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue"},
   ["sunbathe3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Sunbathe 3"},
   ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe Back"},
   ["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Weld"},
   ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Window Shop"},
 --  ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
   -- CASINO DLC EMOTES (STREAMED)
   ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
   ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
   ["cutthroat"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Cut Throat"},
   ["cutthroat2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Cut Throat 2"},
   ["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Mind Blown", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Mind Blown 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxing", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxing 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["stink"] = {"anim@mp_player_intcelebrationfemale@stinker", "stink", "Stink", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Think 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Adjust Tie", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
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

   ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Notepad", AnimationOptions =
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
   ["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke 2", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 3", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Smoke 4", AnimationOptions =
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
   ["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase 2", AnimationOptions =
   {
       Prop = "prop_security_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Mugshot", AnimationOptions =
   {
       Prop = 'prop_police_id_board',
       PropBone = 58868,
       PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup", AnimationOptions =
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
       EmoteDuration = 4500
   }},
   ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
   {
       Prop = 'prop_cs_burger_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
       EmoteDuration = 4500
   }},
   ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
       EmoteDuration = 4500
   }},
   ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
   {
       Prop = 'prop_ecola_can',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Ego Bar", AnimationOptions =
   {
       Prop = 'prop_choc_ego',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteDuration = 3500
   }},
   ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Wine", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions =
   {
       Prop = 'prop_champ_flute',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne", AnimationOptions =
   {
       Prop = 'prop_drink_champ',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["cigar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Cigar", AnimationOptions =
   {
       Prop = 'prop_cigar_02',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 600
   }},
   ["cigar2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Cigar 2", AnimationOptions =
   {
       Prop = 'prop_cigar_01',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 600
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
   ["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric", AnimationOptions =
   {
       Prop = 'prop_el_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 2", AnimationOptions =
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
   ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet", AnimationOptions =
   {
       Prop = 'prop_snow_flower_02',
       PropBone = 24817,
       PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Teddy", AnimationOptions =
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
   ["clipboard"] = {"missfam4", "base", "Clipboard", AnimationOptions =
   {
       Prop = 'p_amb_clipboard_01',
       PropBone = 36029,
       PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0}, 
       EmoteMoving = true,
       EmoteLoop = true
   }},
}