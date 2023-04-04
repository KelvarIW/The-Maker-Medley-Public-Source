///scrPlayMusic(soundid,loops, [BGM])
///plays a song if it's not already playing
///argument0 - song to play (-1 plays nothing and stops anything currently playing)
///argument1 - whether or not to loop the song
///argument2 - multiply by global.musFadeMultiplier and assign to global.currentMusic

var songID = argument[0];
var loopSong = argument[1];
var isBGM = true;
var _audio = -1;
if (argument_count >= 3)
    isBGM = argument[2];

if (!global.muteMusic)  //check if music isn't supposed to play
{
    if (!isBGM || global.currentMusicID != songID)  //checks if the song to play is already playing
    {
        if (isBGM){
            global.currentMusicID = songID;
            audio_stop_sound(global.currentMusic);
        }
        if (songID != -1){
            if (isBGM){
                _audio = audio_play_sound(songID, 1, loopSong);
                global.currentMusic = _audio;
                audio_sound_gain(_audio, 0.4 * (global.musicLevel/100 * global.volumeLevel/100) * global.musFadeMultiplier, 0);
            }else{
                _audio = audio_play_sound(songID, 1, loopSong);
                audio_sound_gain(_audio, 0.4 * (global.musicLevel/100 * global.volumeLevel/100), 0);
            }
        }
    }
}
return _audio;
