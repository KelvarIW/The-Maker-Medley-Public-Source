///scrSaveToWorkingDir()
if (global.fmns){
    if (!directory_exists_fmns(global.saveDataPath)){
        directory_create_fmns(global.saveDataPath);
    }
    if (file_exists_fmns(global.savePath + string(global.savenum))){
        file_copy_fmns(global.savePath + string(global.savenum), global.saveWorkingPath + string(global.savenum));
    }else if (file_exists_fmns(global.savePath + string(global.savenum) + global.saveBackupAppend + "1")){
        file_copy_fmns(global.savePath + string(global.savenum) + global.saveBackupAppend + "1", global.saveWorkingPath + string(global.savenum));
    }else if (file_exists_fmns(global.savePath + string(global.savenum) + global.saveBackupAppend + "2")){
        file_copy_fmns(global.savePath + string(global.savenum) + global.saveBackupAppend + "2", global.saveWorkingPath + string(global.savenum));
    }
}else{
    // already uses working dir save
}
