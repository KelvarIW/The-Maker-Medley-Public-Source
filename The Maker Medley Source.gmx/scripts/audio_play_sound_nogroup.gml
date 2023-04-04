///audio_play_sound_nogroup(soundID, priority, loops);
if (!global.muteSFX && global.sfxLevel > 0 && global.volumeLevel > 0){
    var _snd = audio_play_sound(argument[0], argument[1], argument[2]);
    audio_sound_gain(_snd, global.sfxLevel/100 * global.volumeLevel/100, 0);
    return (_snd);
}else{
    return (-4);
}
