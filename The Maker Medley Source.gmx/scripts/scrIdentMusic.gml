///scrIdentMusic(BGM)
var _bgm = argument[0];
with (instance_create(800, 0, objMakerIdent)){
    name = "Song:  " + scrGetMusInfo(_bgm, 0);
    maker = "Artist: " + scrGetMusInfo(_bgm, 1);
    prefixText = false;
    music = _bgm;

    topIconSpr = sprClearDropdownNote;
    topIconSubimg = 0;
    topIconScale = 2;
    topIconYOff = 3;
}
