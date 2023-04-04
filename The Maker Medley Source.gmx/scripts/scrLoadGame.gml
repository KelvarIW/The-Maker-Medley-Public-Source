/// scrLoadGame(loadFile, [loadRoom])
///loads the game
///loadFile - sets whether or not to read the save file when loading the game
///loadRoom - overwrites the player's spawn location (works with global.roomSaveTo)

var loadFile = argument[0];
var loadRoom = noone;
if (argument_count > 1){
    loadRoom = argument[1];
}

var saveValid = false;
//only load save data from the save file if the script is currently set to (we should only need to load these on first load because the game stores them afterwards)
if (loadFile)
{
    scrSaveToWorkingDir();
    show_debug_message("loading save file " + string(global.savenum));
    
    //load the save map
    var saveMap = noone;
    
    if (global.extraSaveProtection) //use ds_map_secure function
    {
        saveMap = ds_map_secure_load(global.saveWorkingPath + string(global.savenum));
    }
    else    //use text file
    {
        var f = -1;
        if (file_exists(global.saveWorkingPath + string(global.savenum))){
            f = file_text_open_read(global.saveWorkingPath + string(global.savenum));
        }
        
        if (f == -1){
            show_debug_message("couldn't open save file " + string(global.savenum));
        }else{
            saveMap = ds_map_create();
            ds_map_read(saveMap, base64_decode(file_text_read_string(f)));
            
            file_text_close(f);
        }
    }
    
    saveValid = true;   //keeps track of whether or not the save being loaded is valid
    
    var _checkVal = undefined;
    var _saveVer = "";
    if (saveMap != noone)  //check if the save map loaded correctly
    {
        _saveVer = ds_map_find_value(saveMap, "version");
        if (!is_undefined(_saveVer)){
            if (scrIsDebugVersion(_saveVer)){
                scrWipeSaveFile(global.savenum);
                saveValid = false;
                show_debug_message("Save was from debug version");
            }
        }else{
            scrWipeSaveFile(global.savenum);
            saveValid = false;
            show_debug_message("Could not find save game version!");
        }
        
        if (saveValid){
            _checkVal = ds_map_find_value(saveMap,"death");
            if (!is_undefined(_checkVal))
                global.death = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"time");
            if (!is_undefined(_checkVal))
                global.time = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"timeMicro");
            if (!is_undefined(_checkVal))
                global.timeMicro = _checkVal;
            
            /* //Unused data from Engine code
            _checkVal = ds_map_find_value(saveMap,"difficulty");
            if (!is_undefined(_checkVal))
                global.difficulty = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"saveRoom");
            if (!is_undefined(_checkVal))
                global.saveRoom = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"timeMicro");
            if (!is_undefined(_checkVal))
                global.timeMicro = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"savePlayerX");
            if (!is_undefined(_checkVal))
                global.savePlayerX = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"savePlayerY");
            if (!is_undefined(_checkVal))
                global.savePlayerY = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"savePlayerScale");
            if (!is_undefined(_checkVal))
                global.savePlayerScale = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"savePlayerXScale");
            if (!is_undefined(_checkVal))
                global.savePlayerXScale = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"saveGrav");
            if (!is_undefined(_checkVal))
                global.saveGrav = _checkVal;
            
            if (is_string(global.saveRoom))   //check if the saved room loaded properly
            {
                if (!room_exists(asset_get_index(global.saveRoom)))  //check if the room index in the save is valid
                    saveValid = false;
            }
            else
            {
                saveValid = false;
            }
            */
            
            //Game Progress
            for (var i = 0; i < global.stageRooms; i++)
            {
                _checkVal = ds_map_find_value(saveMap,"roomProgress["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.roomProgress[i] = _checkVal;
            }
            _checkVal = ds_map_find_value(saveMap,"farthestRoom");
            if (!is_undefined(_checkVal)){
                global.saveFarthestRoom = _checkVal;
            }
            
            //Boss Progress (stored here as well as in records; highest from either is used and saved to records)
            _checkVal = ds_map_find_value(saveMap,"beelzFarthest");
            if (!is_undefined(_checkVal))
                global.SaveFile_beelzFarthest = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"chaozFarthest");
            if (!is_undefined(_checkVal))
                global.SaveFile_chaozFarthest = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"geezerFarthest");
            if (!is_undefined(_checkVal))
                global.SaveFile_geezerFarthest = _checkVal;
            for (var i=0; i<global.undertaleMax; i++){
                _checkVal = ds_map_find_value(saveMap,"undertaleEncountered[" + string(i) + "]");
                if (!is_undefined(_checkVal))
                    global.SaveFile_undertaleEncountered[i] = _checkVal;
            }
            _checkVal = ds_map_find_value(saveMap,"touhouFarthest");
            if (!is_undefined(_checkVal))
                global.SaveFile_touhouFarthest = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"finalBossFarthest");
            if (!is_undefined(_checkVal))
                global.SaveFile_finalBossFarthest = _checkVal;
            
            //The Maker Medley Info
            _checkVal = ds_map_find_value(saveMap,"KlamySaves");
            if (!is_undefined(_checkVal))
                global.saveKlamySaves = _checkVal;
            _checkVal = ds_map_find_value(saveMap,"S4KlamySaves");
            if (!is_undefined(_checkVal)){
                global.saveS4KlamySaves = _checkVal;
            }
            for(var i=0; i<=3; i++;){
                _checkVal = ds_map_find_value(saveMap,"KlamySaveX["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.saveKlamySaveCoord[i, 0] = _checkVal;
                _checkVal = ds_map_find_value(saveMap,"KlamySaveY["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.saveKlamySaveCoord[i, 1] = _checkVal;
            }
            for(var i=0; i<global.totalSRCoins; i++){
                _checkVal = ds_map_find_value(saveMap,"SRCoin["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.saveSRCoin[i] = _checkVal;
            }
            for(var i=0; i<global.totalQuadCoins; i++){
                _checkVal = ds_map_find_value(saveMap,"QuadCoin["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.saveQuadCoin[i] = _checkVal;
                _checkVal = ds_map_find_value(saveMap,"QuadCoinEverCollected["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.QuadCoinEverCollected[i] = _checkVal;
                //global.saveQuadCoin[i] = ds_map_find_value(saveMap, "QuadCoin[" + string(i) + "]");
                //global.QuadCoinEverCollected[i] = ds_map_find_value(saveMap, "QuadCoinEverCollected[" + string(i) + "]");
            }
            for (var i = 0; i<global.finalBossPhases; i++){
                _checkVal = ds_map_find_value(saveMap,"finalBossHP["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.saveFinalBossHP[i] = min(_checkVal, global.finalBossHPMax);
                _checkVal = ds_map_find_value(saveMap,"finalBossBuffHP["+string(i)+"]");
                if (!is_undefined(_checkVal))
                    global.saveFinalBossBuffHP[i] = min(_checkVal, global.finalBossBuffHPMax);
            }
            
            _checkVal = ds_map_find_value(saveMap,"finalBossBuffCheckpoint");
            if (!is_undefined(_checkVal))
                global.finalBossBuffCheckpoint = min(_checkVal, global.finalBossPhases);
            
            _checkVal = ds_map_find_value(saveMap,"saveGameClear");
            if (!is_undefined(_checkVal))
                global.saveGameClear = _checkVal;
        }
        //destroy the map
        ds_map_destroy(saveMap);
    }
    else
    {
        //save map didn't load correctly, set the save to invalid
        saveValid = false;
    }
    
    if (!saveValid) //check if the save is invalid
    {
        //save is invalid, create a new save
        show_debug_message("Save " + string(global.savenum) + " Invalid!");
        
        var _curMus = global.currentMusic, _curMusID = global.currentMusicID;
        var _savenum = global.savenum;
        scrInitializeGlobals();
        global.savenum = _savenum;
        global.currentMusic = _curMus;
        global.currentMusicID = _curMusID;
        
        scrSaveGame(true);
        room_goto(rMenu);
    }
}

//set game variables and set the player's position
//destroy player characters, if they exist
instance_destroy(objPlayer);
instance_destroy(objFinalP3Player);

global.noPause = false;     //disable no pause mode
global.autosave = false;    //disable autosaving since we're loading the game

global.playerXScale = global.savePlayerXScale;
if (abs(global.playerXScale) != 1){
    global.playerXScale = 1;
}

global.grav = global.saveGrav;

global.farthestRoom = min(global.saveFarthestRoom, scrGetRoomNum(global.endRoom));

//The Maker Medley Settings
global.klamySaves = global.saveKlamySaves;
global.S4KlamySaves = global.saveS4KlamySaves;
global.playerPower = global.savePlayerPower;
global.playerScale = global.savePlayerScale;
global.playerJumps = global.savePlayerJumps;
global.abstr4ktGrav = global.saveAbstr4ktGrav;
for(var i=0;i<=3;i++){
    global.klamySaveCoord[i, 0] = global.saveKlamySaveCoord[i, 0];
    global.klamySaveCoord[i, 1] = global.saveKlamySaveCoord[i, 1];
}
// for "full restart" compatibility
global.klamySaveCurr = global.saveKlamySaveCurr;  
global.S4KlamySaveCurr = global.saveS4KlamySaveCurr;

for (var i=0; i<global.totalSRCoins; i++){
    global.SRCoin[i] = global.saveSRCoin[i];
}
for(var i=0; i<global.totalQuadCoins; i++){
    global.QuadCoin[i] = global.saveQuadCoin[i];
}
for(var i=0; i<global.finalBossPhases; i++){
    global.finalBossHP[i] = global.saveFinalBossHP[i];
}
global.gameClear = global.saveGameClear;

scrLoadRecord();

if (!global.gameStarted && !global.practicing){
    if (object_index == objTitleButton){
        if (index == 0){
            room_goto(rMenu);
        }else if (index == 2 && saveValid){  // ???
            room_goto(rPracticeMenu);
        }
    }
}else{
    if (!room_exists(loadRoom)){
        if (room == rFinalBoss_3){
            if (!instance_exists(objFinalP3Player)){
                instance_create(0, 0, objFinalP3Player);
            }
            with (objFinalP3Player){
                x = global.savePlayerX;
                y = global.savePlayerY;
            }
        }else{
            instance_create(global.savePlayerX, global.savePlayerY, objPlayer);
            with (objPlayer){
                image_xscale = global.playerScale;
                image_yscale = image_xscale;
            }
        }
        var _roomTo = asset_get_index(global.saveRoom);
        if (room_exists(_roomTo)){
            room_goto(_roomTo);
            return (1);
        }else{
            show_debug_message("ERROR: " + string(global.saveRoom) + " does not correspond to a valid room!!!" + "  (Index:  " + string(_roomTo) + "; is string:  " + string(bool(is_string(global.saveRoom))));
            return (0);
        }
    }else{
        /* // let objPlayerStart create the object
        instance_create(global.savePlayerX, global.savePlayerY, objPlayer);
        with (objPlayer){
            image_xscale = global.playerScale;
            image_yscale = image_xscale;
        }*/
        
        room_goto(loadRoom);
        return (1);
    }
}
