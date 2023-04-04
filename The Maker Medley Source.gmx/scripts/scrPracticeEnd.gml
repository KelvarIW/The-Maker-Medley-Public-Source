///scrPracticeEnd();
if (global.practicing && !global.dead){
    active = false;
    if (object_is_ancestor(object_index, objAvoPar)){
        audio_sound_gain(bgm, 0, 1000);
    }
    //touhou - avoBGM
    with (objWorld){
        if ((global.practiceBoss == 0 && (global.practiceWaypointEnd == 0 || global.practiceWaypointEnd == 1))){
            alarm[3] = 125;
        }else if (global.practiceBoss == 2 && (global.practiceWaypointEnd == 3)){
            alarm[3] = 76;
        }else{
            event_perform(ev_alarm, 3);
        }
    }
    
    with (objChaozC01f){
        speed = 0;
        acc = false;
    }
    
    global.canPause = true;
    global.canRestart = true;
}
