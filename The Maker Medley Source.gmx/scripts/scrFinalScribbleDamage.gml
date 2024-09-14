///scrFinalScribbleDamage()
//determine what hp to look at
var _hp;
_hp = scrFinalGetHP(currentHPVal);

if (_hp > 1 || !global.dead){
    if (object_index != objFinalBossChar_4){
        var _phase = 0; //only counting phases where you can damage Mr. Scribble
        switch(object_index){
            case objFinalBossChar_1:
                _phase = 0;
            break;
            case objFinalBossChar_2:
                _phase = 1;
            break;
            case objFinalBossChar_3:
                _phase = 2;
            break;
        }
        scrFinalDecHP(currentHPVal, 1, 1);
        _hp = scrFinalGetHP(currentHPVal);
        
        if (_hp < (global.finalBossHPMax-10) - 20*_phase){
            iframesWhenHit = min(iframesWhenHit + 2, 100);
        }else if (_hp < global.finalBossHPMax - 20*_phase){
            iframesWhenHit = min(iframesWhenHit + 1, 70);
        }
        var _snd = audio_play_sound(sndFinalBossDamage, 0, 0);
        audio_sound_pitch(_snd, PITCH_FLUCT);
    }else{
        scrFinalDecHP(currentHPVal, 1, 0);
        _hp = scrFinalGetHP(currentHPVal);
        
        if (_hp <= 0){
            iframesWhenHit = erasableTransitionTime;
            var _snd = audio_play_sound(sndFinalBossDamage, 0, 0);
            audio_sound_pitch(_snd, PITCH_FLUCT * 0.775);
            audio_sound_gain(_snd, 1.4, 0);
        }else{
            var _snd = audio_play_sound(sndFinalBossDamage, 0, 0);
            audio_sound_pitch(_snd, PITCH_FLUCT);
        }
    }
    iframes = iframesWhenHit;
    storedHit = false;
}
