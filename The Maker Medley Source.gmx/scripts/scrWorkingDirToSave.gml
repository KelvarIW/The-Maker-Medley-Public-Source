///scrWorkingDirToSave()
if (global.fmns){
    if (!directory_exists_fmns(global.saveDataPath)){
        directory_create_fmns(global.saveDataPath);
    }
    if (file_exists_fmns(global.saveWorkingPath + string(global.savenum))){
        file_copy_fmns(global.saveWorkingPath + string(global.savenum), global.savePath + string(global.savenum));
    }
}else{
    file_copy(global.saveWorkingPath + string(global.savenum), global.saveFailsafePath + string(global.savenum));
}
