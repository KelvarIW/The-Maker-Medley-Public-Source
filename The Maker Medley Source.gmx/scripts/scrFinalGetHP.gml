///scrFinalGetHP(slot)
var _slot; _slot = argument[0];
var _val; _val =-1;
if (global.practicing){
    _val = global.finalBossHPPracticeTemp;
}else{
    // slot less than 0 = new hp
    if (_slot < 0){ return (global.finalBossHPMax);}
    // grab hp
    if (!buff()){
        _val = global.finalBossHP[_slot];
    }else{
        _val = global.finalBossBuffHP[_slot];
    }
}
_val = min(_val, global.finalBossHPMax);
return _val;
