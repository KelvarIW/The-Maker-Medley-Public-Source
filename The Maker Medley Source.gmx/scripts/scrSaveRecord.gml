///scrSaveRecord()
var saveMap = ds_map_create();
ds_map_add(saveMap,"version", global.gameVersion);

// Unlocked Attacks
ds_map_add(saveMap, "farthestRoomEver", max(global.farthestRoom, global.farthestRoomEver));
if (global.gameClear || max(global.farthestRoom, global.farthestRoomEver) >= scrGetRoomNum(global.endRoom)){global.gameClearedEver = true;}
ds_map_add(saveMap, "gameClearedEver", global.gameClearedEver);
ds_map_add(saveMap, "beelzFarthest", max(global.beelzFarthest, global.SaveFile_beelzFarthest));
ds_map_add(saveMap, "chaozFarthest", max(global.chaozFarthest, global.SaveFile_chaozFarthest));
ds_map_add(saveMap, "geezerFarthest", max(global.geezerFarthest, global.SaveFile_geezerFarthest));
for(var i=0; i<global.undertaleMax; i++){
    ds_map_add(saveMap, "undertaleEncountered[" + string(i) + "]", max(global.undertaleEncountered[i], global.SaveFile_undertaleEncountered[i]));
}
ds_map_add(saveMap, "touhouFarthest", max(global.touhouFarthest, global.SaveFile_touhouFarthest));
ds_map_add(saveMap, "finalBossFarthest", max(global.finalBossFarthest, global.SaveFile_finalBossFarthest));

// Stats
//if (!global.debugMode){
    ds_map_add(saveMap, "Beelz Hit Lowest", global.beelzHitLowest);
    ds_map_add(saveMap, "Beelz Hard Hit Lowest", global.beelzHardHitLowest);
    ds_map_add(saveMap, "Chaoz Hit Lowest", global.chaozHitLowest);
    ds_map_add(saveMap, "Chaoz Hard Hit Lowest", global.chaozHardHitLowest);
    ds_map_add(saveMap, "Geezer Beaten", global.geezerBeaten);
    ds_map_add(saveMap, "PvZ Best Time", global.pvzFastest);
    ds_map_add(saveMap, "Undertale Hit Lowest", global.undertaleHitLowest);
    ds_map_add(saveMap, "Touhou Hit Lowest", global.touhouHitLowest);
    ds_map_add(saveMap, "Scribble Beaten", global.scribbleBeaten);
    
    //Challenges
    ds_map_add(saveMap, "Beelz Buffed", global.beelzHardCompleted);
    ds_map_add(saveMap, "Chaoz Buffed", global.chaozHardCompleted);
    ds_map_add(saveMap, "Geezer Pre-Nohit", global.geezerPart1Nohit);
    ds_map_add(saveMap, "Geezer Nohit", global.geezerNohitCompleted);
    ds_map_add(saveMap, "Geezer Nosave", global.geezerNosaveCompleted);
    ds_map_add(saveMap, "Geezer Perfect", global.geezerPerfectCompleted);
    ds_map_add(saveMap, "Geezer Buffed", global.geezerHardCompleted);
    ds_map_add(saveMap, "Stage 4 Saveless", global.stage4SavelessCompleted);
    ds_map_add(saveMap, "Scribble Buffed", global.scribbleHardCompleted);
    ds_map_add(saveMap, "Scribble Perfect", global.scribblePerfectCompleted);
    ds_map_add(saveMap, "Scribble Buffed Perfect", global.scribbleHardPerfectCompleted);
//}

//Write the map to a file
var f = file_text_open_write(global.recordWorkingPath);
//write map to the save file with base64 encoding
file_text_write_string(f,base64_encode(ds_map_write(saveMap)));

file_text_close(f);
ds_map_destroy(saveMap);

if (global.fmns){
    if (!directory_exists_fmns(global.saveDataPath)){
        directory_create_fmns(global.saveDataPath);
    }
    if (file_exists_fmns(global.recordWorkingPath)){
        file_copy_fmns(global.recordWorkingPath, global.recordPath);
    }
}else{
    file_copy(global.recordWorkingPath, global.recordFailsafePath);
}
