///scrPlantsEnemyKillAnim()
// used for the animation that plays when you let an enemy get to the left edge of the screen
if (killing){
    if (killingState < 1){
        killingTimer ++;
        if (killingTimer >= killingDelay){
            killingTimer = 0;
            killingState = 1;
            audio_play_sound(sndPlantsLoseNooo, 0, 0);
            event_user(6);
        }
    }
}
