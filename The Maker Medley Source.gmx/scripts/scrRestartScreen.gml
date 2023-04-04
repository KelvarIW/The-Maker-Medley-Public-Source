///scrRestartScreen()
audio_stop_sound(global.gameOverMusic);

//stop room sounds
//show_debug_message("prev. count: " + string(global.count));
//show_debug_message("prev. countStored: " + string(global.countStored));
audio_group_stop_all(RoomSounds);
if (keyboard_check(vk_control)){
    fullRestart = true;
    if (global.countStored < 0){
        global.countStored = global.count;
    }
    global.count = 0;
}else{
    if (global.countStored >= 0){
        global.count = global.countStored;
        global.countStored = -1;
    }
}

audio_stop_sound(global.BGMBoss2b); //in case the player resets during the Avoidance transition in the Geezer fight

//Challenge tracking
global.startedBossFromBeginning = false;
global.startedS4FromBeginning = false;
global.challengeMode = false;
global.shieldHitsTaken = 0;

//Practice Mode
if (global.practicing){
    alarm[3] = -1;
    with (objPlayer){
        instance_destroy();
    }
    with (objFinalP3Player){
        instance_destroy();
    }
    scrPracticeStart(global.practiceBoss, global.practiceWaypointStart, global.practiceWaypointEnd);
}else{
    scrSaveGame(false); //save death/time
    scrLoadGame(false); //load the game
}

global.pauseDelay = 1;
//show_debug_message("next count: " + string(global.count));
//show_debug_message("next countStored: " + string(global.countStored));
