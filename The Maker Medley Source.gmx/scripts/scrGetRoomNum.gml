///scrGetRoomNum(room);

var t_room = argument[0];
var t_num = 0;
switch(t_room){
    case rOpening:
        t_num = 0;
        break;
    case rStage01Abstr4ktNew:
        t_num = 2;
        break;
    case rStage01Dice:
        t_num = 3;
        break;
    case rStage01Kurath:
        t_num = 4;
        break;
    case rStage01Zilily:
        t_num = 5;
        break;
    case rStage01Purify:
        t_num = 6;
        break;
    case rStage01Onetwentyeight:
        t_num = 7;
        break;
    case rStage01Patrick:
        t_num = 8;
        break;
    case rStage01Ace:
        t_num = 9;
        break;
    case rChaozB:
        t_num = 10;
        break;
    case rStage1to2Transition:
        t_num = 11;
        break;
    case rStage02Shark1:
        t_num = 13;
        break;
    case rStage02Shark2:
        t_num = 14;
        break;
    case rStage02Erik:
        t_num = 15;
        break;
    case rStage02Klamy:
        t_num = 16;
        break;
    case rStage02Abstr4ktNew:
        t_num = 17;
        break;
    case rStage02Vovka:
        t_num = 18;
        break;
    case rStage02Telejump:
        t_num = 19;
        break;
    case rStage02Flappy:
        t_num = 20;
        break;
    case rGeezer01:
    case rGeezerHitchcock:
        t_num = 21;
        break;
    case rStage03Hub:
    case rStage03PvZ:
    case rStage03Undertale:
    case rStage03Touhou:
        t_num = 22;
        break;
    case rStage04New_1:
        t_num = 24;
        break;
    case rStage04New_2:
        t_num = 25;
        break;
    case rStage04New_3:
        t_num = 26;
        break;
    case rStage04New_4:
        t_num = 27;
        break;
    case rFinalBoss_1:
    case rFinalBoss_2:
    case rFinalBoss_3:
    case rFinalBoss_4:
        t_num = 28;
        break;
    case rTMM_Ending:
        t_num = 29;
        break;
    case rTMM_ClearLobby:
        t_num = 30;
        break;
}

return t_num;
