///buff()
if (!global.practicing){
    return (global.challengeMode);
}else{
    if (global.practiceModeBuffed){  // player is trying to play buffed version
        /*if (global.practiceBoss == 5){  // Mr. Scribble unlocks buffed versions one-by-one  never mind
            global.finalBossBuffCheckpoint = 999
        }else{*/
        return (global.practiceModeBuffed && canBuff());
        //}
    }else{
        return false;
    }
}
