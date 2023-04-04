///scrTMM_Autosave(saveX, saveY, saveID, [overrideSetting])
var _player = objPlayer;
if (room == rFinalBoss_3){
    _player = objFinalP3Player;
}
var _override = false;
if (argument_count > 3){
    _override = argument[3];
}

var _saveID = argument[2];
if (_override || (global.refightAutosave || global.autosave || global.farthestRoom <= scrGetRoomNum(room) || ((scrGetRoomNum(room) == scrGetRoomNum(rFinalBoss_1) && buff()) && _saveID > global.finalBossBuffCheckpoint))){
    if (instance_exists(_player)){
        with (_player){
            var _oldX = x;
            var _oldY = y;
            x = argument[0];
            y = argument[1];
            with (instance_create(_oldX, _oldY, objSave)){
                saveID = _saveID;
                event_user(0);
                instance_destroy();
            }
            x = _oldX;
            y = _oldY;
        }
    }
}
