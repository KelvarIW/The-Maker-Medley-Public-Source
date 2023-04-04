///scrWipeSaveFile(file, [delete_backups], [delete invalid backup])
var _savenum = argument[0];
var _backups = true, _invalid = true;
if (argument_count > 1){
    _backups = argument[1];
}
if (argument_count > 2){
    _invalid = argument[2];
}

if (global.fmns){
    file_delete_fmns(global.savePath + string(_savenum));
    if (_backups){
        file_delete_fmns(global.savePath + string(_savenum) + global.saveBackupAppend + "1");
        file_delete_fmns(global.savePath + string(_savenum) + global.saveBackupAppend + "2");
    }
    if (_invalid){
        file_delete_fmns(global.saveInvalidPath + string(_savenum));
    }
}

file_delete(global.saveWorkingPath + string(_savenum));
file_delete(global.saveFailsafePath + string(_savenum));
if (_backups){
    file_delete(global.saveWorkingPath + string(_savenum) + global.saveBackupAppend + "1");
    file_delete(global.saveWorkingPath + string(_savenum) + global.saveBackupAppend + "2");
    file_delete(global.saveFailsafePath + string(_savenum) + global.saveBackupAppend + "1");
    file_delete(global.saveFailsafePath + string(_savenum) + global.saveBackupAppend + "2");
}
if (_invalid){
    file_delete(global.saveFailsafeBackupInvalidPath + string(_savenum));
}

file_delete(global.saveWorkingPath + string(_savenum));

if (!global.fmns){
    //this blank save file will overwrite save data in the program directory, if the extension loads in the future
    file_bin_close(file_bin_open(global.saveFailsafePath + string(_savenum), 1));
}
