///scrFinalTransferHP(to, from)
var _to; _to = argument[0];
var _from; _from = argument[1];
if (!global.practicing){
    if (!buff()){
        global.finalBossHP[_to] = global.finalBossHP[_from];
    }else{
        global.finalBossBuffHP[_to] = global.finalBossBuffHP[_from];
    }
}
