///restarts the game
// clean up from pause menu
if (sprite_exists(global.pauseSprite)){
    sprite_delete(global.pauseSprite);         //free the pause screen
}
instance_destroy(objSettingsButton);
instance_destroy(objSettingsMenu);

with (objWorld){
    event_perform(ev_create, 0);
}
global.count = 0;
global.countPersistent = 0;  // ?
global.gameStarted = false;
scrSaveGame(false); //save boss progress

//keep in mind scrInitializeGlobals() will reset global.practicing, global.loadGameMenuStart, etc.
var _roomTo, _practiceBuff, _saveNum;
if (global.practicing){
    _roomTo = rPracticeMenu;
}else{
    _roomTo = rMenu;
}
_practiceBuff = global.practiceModeBuffed;
_savenum = global.savenum;

scrInitializeGlobals();

if (_roomTo == rMenu){
    global.loadGameMenuStart = room;
}
global.practiceModeBuffed = _practiceBuff;
global.savenum = _savenum;

scrLoadGame(true);
audio_stop_all();

titleCurMenu = 1;
titleToMenu = 1;
room_goto(_roomTo);
