///scrPracticeStart(boss, startWaypoint, endWaypoint);
global.practiceBoss = argument[0];
global.practiceWaypointStart = argument[1];
global.practiceWaypointEnd = argument[2];
global.practicing = true;

var _destRoom = rStage01Purify;
switch(global.practiceBoss){
    case 0:
        _destRoom = rStage01Purify;
        break;
    case 1:
        _destRoom = rChaozB;
        break;
    case 2:
        if (global.practiceWaypointStart <= 1){
            _destRoom = rGeezer01;
        }else{
            _destRoom = rGeezerHitchcock;
            global.hitchAutostart = false;
            if (global.practiceWaypointStart == 4){
                view_yview = 0;
            }
        }
        break;
    case 3:
        _destRoom = rStage03UndertalePractice;
        break;
    case 4:
        _destRoom = rStage03Touhou;
        break;
    case 5:
        if (global.practiceWaypointStart <= 1){
            _destRoom = rFinalBoss_1;
        }else if (global.practiceWaypointStart <= 4){
            _destRoom = rFinalBoss_2;
            if (global.practiceWaypointStart >= 3){
                global.roomSaveTo = 3;
            }
        }else if (global.practiceWaypointStart <= 6){
            _destRoom = rFinalBoss_3;
        }else if (global.practiceWaypointStart <= 9){
            _destRoom = rFinalBoss_4;
            
            if (global.practiceWaypointStart >= 8){
                global.roomSaveTo = 6;
            }else{
                global.roomSaveTo = 5;
            }
        }
        break;
}
global.practPrevBoss = global.practiceBoss;
global.practPrevPhase = max(global.practiceWaypointStart, global.practiceWaypointEnd-1);
global.gameStarted = false;

room_goto(_destRoom);
