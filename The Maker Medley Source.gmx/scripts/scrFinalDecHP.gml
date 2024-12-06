///scrFinalDecHP(slot, [_amt], [_min])
var _slot; _slot = argument[0];
var _dec; _dec = 1;
if (argument_count > 1)  _dec = argument[1];
var _min; _min = 0;
if (argument_count > 2)  _min = argument[2];
if (global.practicing){
    global.finalBossHPPracticeTemp = max(global.finalBossHPPracticeTemp - _dec, _min);
}else{
    if (!buff()){
        global.finalBossHP[_slot] = max(global.finalBossHP[_slot] - _dec, _min);
    }else{
        global.finalBossBuffHP[_slot] = max(global.finalBossBuffHP[_slot] - _dec, _min);
    }
}
