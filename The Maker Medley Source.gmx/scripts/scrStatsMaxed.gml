///scrStatsMaxed()
scrLoadRecord();

var _check = (global.gameClearedEver && 
    global.beelzHardCompleted && global.chaozHardCompleted && 
    global.geezerHardCompleted && 
    global.pvzFastest <= global.pvzTargetTime && global.pvzFastest > 0 && 
    global.undertaleHitLowest == 0 && global.touhouHitLowest == 0 && 
    global.scribbleHardPerfectCompleted
);

return (_check);
