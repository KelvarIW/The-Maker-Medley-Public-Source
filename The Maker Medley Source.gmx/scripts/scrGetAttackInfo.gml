///scrGetAttackInfo(bossRoom, number, info)
var _name = "";
var _maker = "";
var _tag = 6;  // "Boss/Avoidance"
var _tagAdventure = 0, _tagGimmick = 1, _tagTrap = 2, _tagMeme = 3, _tagSpike = 4, _tagPuzzle = 5, _tagBoss = 6;

var _info = argument[2];  // 0 = name; 1 = maker; 2 = tag
switch(argument[0]){
    case rStage01Purify:
    case rStage03PvZ:
    case rStage03Undertale:
    case rStage03Touhou:
        _name = scrGetRoomInfo(argument[0], 0);
        _maker = scrGetRoomInfo(argument[0], 1);
        _tag = scrGetRoomInfo(argument[0], 4);
    break;
    case rChaozB:
        switch(argument[1]){
            case 0:
                _name = "Chaoz Area (1-BOSS)";
                _maker = "Abstr4kt";
            break;
            case 1:
                _name = "needle for begginer";
                _maker = "zilily";
                _tag = _tagSpike;
            break;
            case 2:
                _name = "Avoidance-R";
                _maker = "kid-purify";
            break;
            case 3:
                _name = "The Final Cosmos";
                _maker = "kurath";
            break;
            case 4:
                _name = "Shoot The Shuriken";
                _maker = "kurath";
            break;
            case 5:
                _name = "Avoid the Tree +friend";
                _maker = "AceEmX2";
            break;
        }
    break;
    case rGeezer01:
        switch(argument[1]){
            case 0:
                _name = "Mega Man Zero";
                _maker = "VovkaZX";
            break;
            case 1:
                _name = "Klamy Pacman";
                _maker = "Klamy";
                _tag = _tagGimmick;
            break;
            case 2:
                _name = "Avoidance-ヒッチコック";
                _maker = "q123";
            break;
            case 3:
                _name = "Now Geezer is Mad!";
                _maker = "Zorgo";
            break;
            case 4:
                _name = "Stupid Idiot Area (2-BOSS)";
                _maker = "Abstr4kt";
            break;
        }
    break;
    case rFinalBoss_1:
    case rFinalBoss_2:
    case rFinalBoss_3:
    case rFinalBoss_4:
        switch(argument[1]){
            case 0:
                _maker = "pieceofcheese87";
            break;
            case 1:
                _maker = "Smartkin";
            break;
            case 2:
                _maker = "Klazen108";
            break;
            case 3:
                _maker = "kadykunde";
            break;
            case 4:
                _maker = "kurath";
            break;
            case 5:
                _maker = "patrickgh3";
            break;
            case 6:
                _maker = "YoYoYoDude1";
            break;
            case 7:
                _maker = "Dribix";
            break;
            case 8:
                _maker = "Tralexium";
            break;
            case 9:
                _maker = "Sudnep";
            break;
        }
        _name = _maker;
    break;
}

if (_info == 0){
    return (_name);
}else if (_info == 1){
    return (_maker);
}else if (_info == 2){
    return (_tag);
}
