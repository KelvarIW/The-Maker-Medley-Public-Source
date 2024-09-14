///scrFinalDecHP(slot, [_amt], [_min])
var _slot; _slot = argument[0];
var _dec; _dec = 1;
if (argument_count > 1)  _dec = argument[1];
var _min; _min = 0;
if (argument_count > 2)  _dec = argument[2];
if (global.practicing){
    global.finalBossHPPracticeTemp = max(global.finalBossHPPracticeTemp - 1, 1);
}else{
    if (!buff()){
        global.finalBossHP[_slot] = max(global.finalBossHP[_slot] - 1, 1);
    }else{
        global.finalBossBuffHP[_slot] = max(global.finalBossBuffHP[_slot] - 1, 1);
    }
}
