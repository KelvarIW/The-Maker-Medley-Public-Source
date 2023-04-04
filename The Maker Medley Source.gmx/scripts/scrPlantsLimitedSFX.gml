///scrPlantsLimitedSFX(sfx);
var _audio = argument[0];
var _counter = -1;
var _vol = 0.6;

if (!global.muteSFX && global.sfxLevel > 0 && global.volumeLevel > 0){
    with (objPlantsCtrl){
        switch(_audio){
            case sndMakerCannon:  // cannon shoot
                _counter = cannonSfxCounter;
                if (_counter >= sfxDelay[0]){
                    cannonSfxCounter = 0;
                }
            break;
            case sndMakerCannonball:  // hit
                _counter = hitSfxCounter;
                if (_counter >= sfxDelay[0]){
                    hitSfxCounter = 0;
                }
            break;
            case sndPlantsSpike:  // spike laucnched
                _counter = spikeSfxCounter;
                if (_counter >= sfxDelay[0]){
                    spikeSfxCounter = 0;
                }
            break;
        }
        
        // play sound
        if (_counter >= sfxDelay[0]){
            var _snd = audio_play_sound(_audio, 0, 0);
            audio_sound_pitch(_snd, PITCH_FLUCT);
            if (_counter < sfxDelay[1]){
                _vol *= (1 - (sfxDelay[1] - _counter) / (sfxDelay[1] - (sfxDelay[0]-1)))
            }
            audio_sound_gain(_snd, _vol, 0);
        }
        break;  // failsafe for if there are multiple ctrl objects
    }
}
