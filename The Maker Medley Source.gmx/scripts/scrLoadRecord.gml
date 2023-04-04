///scrLoadRecord()
// move record to working directory
if (global.fmns){
    if (!directory_exists_fmns(global.saveDataPath)){
        directory_create_fmns(global.saveDataPath);
    }
    
    if (file_exists_fmns(global.recordPath)){
        file_copy_fmns(global.recordPath, global.recordWorkingPath);
    }
}

var recordValid = false;
if (file_exists(global.recordWorkingPath)){
    var f = file_text_open_read(global.recordWorkingPath);
    
    recordMap = ds_map_create();
    ds_map_read(recordMap, base64_decode(file_text_read_string(f)));
    
    recordValid = true;
    var _checkVal = undefined;
    var _saveVer = "";
    if (recordMap != noone){  //check if the save map loaded correctly
        _saveVer = ds_map_find_value(recordMap, "version");
        if (!is_undefined(_saveVer)){
            if (scrIsDebugVersion(_saveVer) && !global.debugMode){
                recordValid = false;
            }
        }else{
            recordValid = false;
        }
        
        //Load Stats
        if (recordValid){
            // Practice Mode limits
            _checkVal = ds_map_find_value(recordMap,"farthestRoomEver");
            if (!is_undefined(_checkVal))
                global.farthestRoomEver = _checkVal;
            _checkVal = ds_map_find_value(recordMap,"gameClearedEver");
            if (!is_undefined(_checkVal))
                global.gameClearedEver = _checkVal;
            _checkVal = ds_map_find_value(recordMap,"beelzFarthest");
            if (!is_undefined(_checkVal))
                global.beelzFarthest = _checkVal;
            _checkVal = ds_map_find_value(recordMap,"chaozFarthest");
            if (!is_undefined(_checkVal))
                global.chaozFarthest = _checkVal;
            _checkVal = ds_map_find_value(recordMap,"geezerFarthest");
            if (!is_undefined(_checkVal))
                global.geezerFarthest = _checkVal;
            for (var i=0; i<global.undertaleMax; i++){
                _checkVal = ds_map_find_value(recordMap,"undertaleEncountered[" + string(i) + "]");
                if (!is_undefined(_checkVal))
                    global.undertaleEncountered[i] = _checkVal;
            }
            _checkVal = ds_map_find_value(recordMap,"touhouFarthest");
            if (!is_undefined(_checkVal))
                global.touhouFarthest = _checkVal;
            _checkVal = ds_map_find_value(recordMap,"finalBossFarthest");
            if (!is_undefined(_checkVal))
                global.finalBossFarthest = _checkVal;
            
            // Farthest progress
            _checkVal = ds_map_find_value(recordMap, "Beelz Hit Lowest");
            if (!is_undefined(_checkVal))
                global.beelzHitLowest = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Beelz Hard Hit Lowest");
            if (!is_undefined(_checkVal))
                global.beelzHardHitLowest = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Chaoz Hit Lowest");
            if (!is_undefined(_checkVal))
                global.chaozHitLowest = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Chaoz Hard Hit Lowest");
            if (!is_undefined(_checkVal))
                global.chaozHardHitLowest = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Geezer Beaten");
            if (!is_undefined(_checkVal))
                global.geezerBeaten = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "PvZ Best Time");
            if (!is_undefined(_checkVal))
                global.pvzFastest = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Undertale Hit Lowest");
            if (!is_undefined(_checkVal))
                global.undertaleHitLowest = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Touhou Hit Lowest");
            if (!is_undefined(_checkVal))
                global.touhouHitLowest = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Scribble Beaten");
            if (!is_undefined(_checkVal))
                global.scribbleBeaten = _checkVal;
                
            //Challenges
            _checkVal = ds_map_find_value(recordMap, "Beelz Buffed");
            if (!is_undefined(_checkVal))
                global.beelzHardCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Chaoz Buffed");
            if (!is_undefined(_checkVal))
                global.chaozHardCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Geezer Pre-Nohit");
            if (!is_undefined(_checkVal))
                global.geezerPart1Nohit = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Geezer Nohit");
            if (!is_undefined(_checkVal))
                global.geezerNohitCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Geezer Nosave");
            if (!is_undefined(_checkVal))
                global.geezerNosaveCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Geezer Perfect");
            if (!is_undefined(_checkVal))
                global.geezerPerfectCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Geezer Buffed");
            if (!is_undefined(_checkVal))
                global.geezerHardCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Stage 4 Saveless");
            if (!is_undefined(_checkVal))
                global.stage4SavelessCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Scribble Buffed");
            if (!is_undefined(_checkVal))
                global.scribbleHardCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Scribble Perfect");
            if (!is_undefined(_checkVal))
                global.scribblePerfectCompleted = _checkVal;
            _checkVal = ds_map_find_value(recordMap, "Scribble Buffed Perfect");
            if (!is_undefined(_checkVal))
                global.scribbleHardPerfectCompleted = _checkVal;
        }
    }
    
    ds_map_destroy(recordMap);
    file_text_close(f);
}
