//kills the player

if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    if (objPlayer.iframes <= 0){  //player is invincible if he has iframes
        if (global.shield > 0){  //shields block hits at the cost of durability
            global.shield --;
            audio_play_sound(sndMakerShieldLost, 0, 0);
            objPlayer.iframes = 50;
            global.shieldHitsTaken ++;
            exit;
        }
        if (global.gameStarted || global.practicing) //normal death
        {
            if (!global.muteMusic)  //play death music
            {
                if (global.deathMusicMode == 1) //instantly pause the current music
                {
                    audio_pause_sound(global.currentMusic);
                }
                else if (global.deathMusicMode == 2)    //fade out the current music
                {                
                    with (objWorld)
                        event_user(0);  //fades out and stops the current music
                }
            }
            
            with (objPlayer)
            {
                (instance_create(x, y-1, objMakerDeathEffect)).scale = image_xscale;
                instance_destroy();
            }
            audio_play_sound(sndMakerDeath,0,false);
            instance_create(0,0,objGameOverText);
            if (global.autoRestart){
                instance_create(view_xview, view_yview, objMakerAutoRestart);
                with (objGameOverText){
                    if (!practiceClearText){
                        fadeIn = true;
                    }
                }
            }
            if (room == rFinalBoss_2){
                with (objMakerCamera){
                    moveCam = false;
                }
            }
            global.dead = true;
            if (global.gameStarted){
                global.death += 1; //increment deaths
                scrSaveGame(false); //save death/time
            }
        }
        else    //death in the difficulty select room, restart the room
        {
            with(objPlayer){
                instance_destroy();
            }
            
            room_restart();
        }
    }
}else if (instance_exists(objPlayer)){
    objPlayer.image_blend = c_red;
}
