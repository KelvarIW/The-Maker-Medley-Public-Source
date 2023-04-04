///scrFinalScribbleDamage()
//determine what hp to look at
var _hp;
if (global.practicing){
    _hp = global.finalBossHPPracticeTemp;
}else{
    _hp = global.finalBossHP[currentHPVal];
}

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
        if (global.practicing){
            global.finalBossHPPracticeTemp = max(global.finalBossHPPracticeTemp - 1, 1);
        }else{
            global.finalBossHP[currentHPVal] = max(global.finalBossHP[currentHPVal] - 1, 1);
        }
        _hp = max(_hp - 1, 1);
        
        if (_hp < (global.finalBossHPMax-10) - 20*_phase){
            iframesWhenHit = min(iframesWhenHit + 2, 100);
        }else if (_hp < global.finalBossHPMax - 20*_phase){
            iframesWhenHit = min(iframesWhenHit + 1, 70);
        }
        var _snd = audio_play_sound(sndFinalBossDamage, 0, 0);
        audio_sound_pitch(_snd, PITCH_FLUCT);
    }else{
        if (global.practicing){
            global.finalBossHPPracticeTemp --;
        }else{
            global.finalBossHP[currentHPVal] --;
        }
        _hp --;
        
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
