///toggles the music on and off
global.muteMusic = !global.muteMusic;

if (!global.muteMusic)  //start playing music if the game is getting unmuted
{
    audio_resume_sound(pausedSong);
    pausedSong = -1;
}
else                    //mute music
{
    audio_stop_sound(global.BGMBoss1);
    audio_stop_sound(global.BGMBoss2b);
    audio_stop_sound(global.BGMStage3c2);
    audio_stop_sound(global.BGMBoss4Avo1);
    audio_stop_sound(global.BGMBoss4Avo2);
    audio_stop_sound(global.BGMBoss4Avo3);
    //audio_stop_sound(sndPlantsMiku);  // only needed if we're treating it like music
    audio_stop_sound(sndPlantsGameOver);  // only needed if we're treating it like music
}
