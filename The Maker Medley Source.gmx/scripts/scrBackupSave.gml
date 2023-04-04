///scrBackupSave(file)
var _savenum = argument[0];
if (global.fmns){
    if (file_exists_fmns(global.savePath + string(_savenum) + global.saveBackupAppend + "1"))
        file_copy_fmns(global.savePath + string(_savenum) + global.saveBackupAppend + "1", global.savePath + string(_savenum) + global.saveBackupAppend + "2"); //change 1st to 2nd
    if (file_exists_fmns(global.savePath + string(global.savenum)))
        file_copy_fmns(global.savePath + string(global.savenum), global.savePath + string(_savenum) + global.saveBackupAppend + "1"); //duplicate main to 1st
    file_copy_fmns(global.savePath + string(global.savenum), global.saveWorkingPath + string(global.savenum)); //used if the extension doesn't load correctly
}else{
    if (file_exists(global.saveWorkingPath + string(_savenum) + global.saveBackupAppend + "1"))
        file_copy(global.saveWorkingPath + string(_savenum) + global.saveBackupAppend + "1", global.saveWorkingPath + string(_savenum) + global.saveBackupAppend + "2"); //change 1st to 2nd
    if (file_exists(global.saveWorkingPath + string(global.savenum)))
        file_copy(global.saveWorkingPath + string(global.savenum), global.saveWorkingPath + string(_savenum) + global.saveBackupAppend + "1"); //duplicate main to 1st
}
