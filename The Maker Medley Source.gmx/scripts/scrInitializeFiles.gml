///scrInitializeFiles()
if (global.fmns){
    if (!directory_exists_fmns(global.saveDataPath)){
        directory_create_fmns(global.saveDataPath);
    }
    
    // check if there is data from a session where FMNS didn't load
    // Saves
    for (var i=1; i<=global.totalSaves; i++){
        if (file_exists_fmns(global.saveFailsafePath + string(i))){
            scrBackupSave(i);
            file_rename_fmns(global.saveFailsafePath + string(i), global.savePath + string(i));
        }
    }
    
    // config.ini
    if (file_exists_fmns(global.configFailsafePath)){
        file_rename_fmns(global.configFailsafePath, global.configPath);
    }
    
    // TMM_Record
    if (file_exists_fmns(global.recordFailsafePath)){
        file_copy_fmns(global.recordPath, global.recordPath + global.recordBackupAppend);
        file_rename_fmns(global.recordFailsafePath, global.recordPath);
    }
    
    /*  // convert old save files - probably will remove before publishing idk
    if (file_exists_fmns(global.programDir + "Save Data\Save")){
        file_rename_fmns(global.programDir + "Save Data\Save", global.savePath + "1");
    }*/
}
