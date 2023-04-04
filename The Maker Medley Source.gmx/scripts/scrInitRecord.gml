///scrInitRecord();
global.farthestRoomEver = 1;
global.beelzFarthest = -1;
global.chaozFarthest = -1;
global.geezerFarthest = -1;
for (var i=8; i>0; i--;){
    global.undertaleEncountered[i] = 0;
}
global.undertaleEncountered[0] = 1;
global.touhouFarthest = -1;
global.finalBossFarthest = -1;
global.finalBossBuffFarthest = -1;

global.beelzHitLowest = -1;
global.chaozHitLowest = -1;
global.beelzHardHitLowest = -1;
global.chaozHardHitLowest = -1;
global.pvzFastest = -1;  // total frames, not seconds
global.undertaleHitLowest = -1;
global.touhouHitLowest = -1;

//we need these "...Beaten" variables saved because these fights do not keep track of your lowest hit count, so we can't use that to tell if this is the first clear
global.geezerBeaten = false;
global.scribbleBeaten = false;

global.geezerPart1Nohit = false;  // once completed, clearing the boss will award global.geezerNohitCompleted
global.geezerNohitCompleted = false;
global.geezerNosaveCompleted = false;
global.geezerPerfectCompleted = false;
global.scribblePerfectCompleted = false;

global.beelzHardCompleted = false;
global.chaozHardCompleted = false;
global.geezerHardCompleted = false;
global.pvzTargetTime = 225 * 50;  // 180 sec + 40 sec  ->  3 min 45 sec
global.stage4SavelessCompleted = false;
global.scribbleHardCompleted = false;
global.scribbleHardPerfectCompleted = false;
global.gameClearedEver = false;

scrLoadRecord();
