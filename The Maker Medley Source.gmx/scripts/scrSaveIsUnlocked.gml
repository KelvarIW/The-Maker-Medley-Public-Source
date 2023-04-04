///scrSaveIsUnlocked
if (argument_count >= 2){
    var _room, _save;
    _room = argument[0];
    _save = argument[1];
    if ((_save == 1 || _room == scrGetRoomNum(rStage03Hub)) || (_save <= global.roomProgress[_room] || _room < global.farthestRoom)){
        return true;
    }else{
        return false;
    }
}else{
    return false;
}
