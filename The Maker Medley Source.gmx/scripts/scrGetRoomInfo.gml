///scrGetRoomInfo(room, info);
//Used for showing the rooms in the loading menu
var _room = argument[0];
var _info = argument[1]; //what information to get [0 = Level Name; 1 = Maker Name; 2 = Kid Subimg; 3 = Level icon; 4 = Level tag]
var _name = "";
var _maker = "";
var _kid = -1; //index of the maker's Kid sprite
var _icon = 0; //for objLoadGameMenu and objCreditsCtrl
var _tag = -1; //for identifiers

var _tagAdventure = 0, _tagGimmick = 1, _tagTrap = 2, _tagMeme = 3, _tagSpike = 4, _tagPuzzle = 5, _tagBoss = 6;
switch(_room){
    case rOpening:
        _name = "Introduction";  // "IWM Tutorial"
        _maker = "";//"The Elephant Crew";
        _kid = -3; //Elephant icon
        _icon = 0;
        break;
    case rStage01Abstr4ktNew:
        _name = "I Wanna Begin the Game (1-1)";
        _maker = "Abstr4kt";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 1;
        _tag = _tagAdventure;
        break;
    case rStage01Dice:
        _name = "Simple Vines";
        _maker = "DiceIWM";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 2;
        _tag = _tagGimmick;
        break;
    case rStage01Kurath:
        _name = "ZeusKid";
        _maker = "kurath";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 3;
        _tag = _tagGimmick;
        break;
    case rStage01Zilily:
        _name = "A Normal level";
        _maker = "zilily";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 4;
        _tag = _tagSpike;
        break;
    case rStage01Purify:
        _name = "Avoidance-Fly of Beelzebub(60s)";
        _maker = "kid-purify";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 5;
        _tag = _tagBoss;
        break;
    case rStage01Onetwentyeight:
        _name = "Quadrants";
        _maker = "128-Up";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 6;
        _tag = _tagSpike;
        break;
    case rStage01Patrick:
        _name = "Thwomp Buddy";
        _maker = "Patrick";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 7;
        _tag = _tagPuzzle;
        break;
    case rStage01Ace:
        _name = "Flippin Over Coins";
        _maker = "AceEmX2";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 8;
        _tag = _tagGimmick;
        break;
    case rChaozB:
        _name = "Chaoz Airflow";
        _maker = "Mixed";
        _kid = -2; //Medley icon
        _icon = 9;
        _tag = _tagBoss;
        break;
    case rStage1to2Transition:
        _name = "Intermission";  // for the Load Game menu
        _icon = 10;
        break;
    case rStage02Shark1:
        _name = "Not Another Maker Level";
        _maker = "Shark3143";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 11;
        _tag = _tagSpike;
        break;
    case rStage02Shark2:
        _name = "Not Another Maker Level 2";
        _maker = "Shark3143";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 12;
        _tag = _tagGimmick;
        break;
    case rStage02Erik:
        _name = "Teleport Factory";
        _maker = "RandomErik";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 13;
        _tag = _tagGimmick;
        break;
    case rStage02Klamy:
        _name = "Klamy Spiky Situation";
        _maker = "Klamy";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 14;
        _tag = _tagSpike;
        break;
    case rStage02Abstr4ktNew:
        _name = "I Wanna Switch It Up! (3-4)";
        _maker = "Abstr4kt";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 15;
        _tag = _tagGimmick;
        break;
    case rStage02Vovka:
        _name = "Mega Man ZV2";
        _maker = "VovkaZX";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 16;
        _tag = _tagGimmick;  // not a tag in original level
        break;
    case rStage02Telejump:
        _name = "Not Another Telejump";
        _maker = "Thenewgeezer";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 17;
        _tag = _tagGimmick;
        break;
    case rStage02Flappy:
        _name = "Flappy Fruit";
        _maker = "Zorgo";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 18;
        _tag = _tagGimmick;
        break;
    case rGeezer01:
        _name = "Obligatory Geezer";
        _maker = "Mixed";
        _kid = -2; //Medley icon
        _icon = 19;
        _tag = _tagBoss;
        break;
    case rStage03Hub:
        _name = "Knockoff Rush";
        _maker = "Mixed";
        _kid = -2; //Medley icon
        _icon = 20;
        break;
    case rStage03PvZ:
        _name = "Plants vs. Zombies";
        _maker = "Pireh";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 28;
        _tag = _tagPuzzle;
        break;
    case rStage03Undertale:
        _name = "Undertale and bird";
        _maker = "bghj856";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 29;
        _tag = _tagGimmick;
        break;
    case rStage03Touhou:
        _name = "Kitten of Great Fortune";
        _maker = "Carbohydrate";
        _kid = scrMakerToKidSubimg(_maker);
        _icon = 30;
        _tag = _tagBoss;
        break;
    case rStage04New_1:
        _name = "Stage 1A Flashback";
        _maker = "Mixed";
        _kid = -2; //Medley icon
        _icon = 21;
        _tag = _tagAdventure;
        break;
    case rStage04New_2:
        _name = "Stage 1B Flashback";
        _maker = "Mixed";
        _kid = -2; //Medley icon
        _icon = 22;
        _tag = _tagAdventure;
        break;
    case rStage04New_3:
        _name = "Stage 2A Flashback";
        _maker = "Mixed";
        _kid = -2; //Medley icon
        _icon = 23;
        _tag = _tagAdventure;
        break;
    case rStage04New_4:
        _name = "Stage 2B Flashback";
        _maker = "Mixed";
        _kid = -2; //Medley icon
        _icon = 24;
        _tag = _tagAdventure;
        break;
    case rFinalBoss_1:
        _name = "Mr. Scribble";
        _maker = "";  // "The Elephant Crew";
        _kid = -3; //Elephant icon (not used)
        _icon = 25;
        _tag = _tagBoss;
        break;
    case rTMM_Ending:
        _icon = 26;
        break;
    case rTMM_ClearLobby:
        _name = "Animated Lobby";  // "Post-Game Lobby";
        _maker = "Kogami Takara";
        _kid = 18;
        _icon = 27;
        break;
}

if (_info == 0){
    return _name;
}else if (_info == 1){
    return _maker;
}else if (_info == 2){
    return _kid;
}else if (_info == 3){
    return _icon;
}else if (_info == 4){
    return _tag;
}
return (-4);
