///scrGetMusInfo(songID, info)

var _songID = argument[0];
var _info = argument[1];  // 0 = Song Name; 1 = Artist; Description (for post-clear lobby)
var _name = "", _maker = "", _desc = "";

switch (_songID){
    case global.BGMTitle:
        _name = "A Maker's Mission";
        _maker = "2 Mello";
        _desc = "Title";
    break;
    case global.BGMStage1a:
        _name = "Light Action ~ No Yoke in Casablanca";
        _maker = "ShinkoNet";
        _desc = "Stage 1";
    break;
    case global.BGMStage1b:
        _name = "Fly of Beelzebub";
        _maker = "DM DOKURO";
        _desc = "Stage 1 Midboss";
    break;
    case global.BGMBoss1:
        _name =  "Chaoz Airflow";
        _maker = "ParagonX9";
        _desc = "Boss 1";
    break;
    case global.BGMStage2a:
        _name = "Paladin";
        _maker = "EnV";
        _desc = "Stage 2";
    break;
    case global.BGMStage2b:
        _name = "Infestation";
        _maker = "DM DOKURO";
        _desc = '"Flappy Fruit" Minigame';
    break;
    case global.BGMBoss2a:
    case global.BGMBoss2c:
        _name = "Be Gone Mr. Gawne";
        _maker = "Bossfight";
        if (_songID == global.BGMBoss2a){
            _desc = "Boss 2 Theme";
        }else{
            _desc = "Boss 2 Survival";
        }
    break;
    case global.BGMBoss2b:
        _name = "Hitchcock";
        _maker = "n-buna";
        _desc = "Boss 2 Avoidance";
    break;
    case global.BGMStage3Hub:
        _name = "Galaxy Walker";
        _maker = "SYRAPT0R";
        _desc = '"Knockoff Rush" Hub';
    break;
    case global.BGMStage3a:
        _name = "Ultimate Battle";
        _maker = "Laura Shigihara";
        _desc = "Knockoff Plants vs. Zombies";
    break;
    case global.BGMStage3b:
        _name = "Stronger Monsters";
        _maker = "Toby Fox";
        _desc = "Knockoff Undertale";
    break;
    case global.BGMStage3c:
        _name = "Kitten of Great Fortune";
        _maker = "ZUN";
        _desc = "Knockoff Touhou Fight";
    break;
    case global.BGMStage3c2:
        _name = "LUCKY CAT";
        _maker = "Chocolate Fantacy";
        _desc = "Knockoff Touhou Avoidance";
    break;
    case global.BGMStage4:
        _name = "Azure Apex";
        _maker = "Ocular Nebula";
        _desc = "Stage 4";
    break;
    case global.BGMBoss4Main:
        _name = "Where is that Bustling Marketplace Now";
        _maker = "ZUN";
        _desc = "Final Boss Phase 1";
    break;
    case global.BGMBoss4Main2:
        _name = "Commando Steve";
        _maker = "Bossfight";
        _desc = "Final Boss Phase 2";
    break;
    case global.BGMBoss4Main3:
        _name = "ASGORE";
        _maker = "Toby Fox";
        _desc = "Final Boss Phase 3";
    break;
    case global.BGMBoss4Main4:
        _name = "Ernst";
        _maker = "Wataru Ishibashi";
        _desc = "Final Boss Phase 4";
    break; 
    case global.BGMBoss4Avo1:
        _name =  "Ancient Scapes";
        _maker = "Durandal";
        _desc = "Final Boss Avoidance 1";
    break;
    case global.BGMBoss4Avo2:
        _name =  "Tear Rain";
        _maker = "Amateras Records";
        _desc = "Final Boss Avoidance 2";
    break;
    case global.BGMBoss4Avo3:
        _name =  "Sorry for Being an Ordinary Magical Girl";
        _maker = "Mikito-P";
        _desc = "Final Boss Avoidance 3";
    break;
    case global.BGMCredits:
        _name = "Bittersweet (Remastered)";
        _maker = "NoisySundae, MegaSphere ";
        _desc = "Credits";
    break;
}

if (_info == 0){
    return (_name);
}else if (_info == 1){
    return (_maker);
}else{
    return (_desc);
}
