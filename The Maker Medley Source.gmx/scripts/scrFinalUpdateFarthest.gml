///scrFinalUpdateFarthest()
if (!global.practicing){
    if (buff()){
        global.finalBossBuffFarthest = max(global.finalBossBuffFarthest, scrGetFinalBossCheckpoint());
    }
    global.finalBossFarthest = max(global.finalBossFarthest, global.finalBossBuffFarthest, scrGetFinalBossCheckpoint());
}
