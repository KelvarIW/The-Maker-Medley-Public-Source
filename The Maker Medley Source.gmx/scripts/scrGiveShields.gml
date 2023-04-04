///scrGiveShields(num)
var _num = argument[0];
if (global.refightShields || global.farthestRoom <= scrGetRoomNum(room)){
    if (_num > 0 && global.shield < _num && !global.dead && instance_exists(objPlayer)){
        global.shield = argument[0];
        instance_create(objPlayer.x, objPlayer.y, objMakerPShield);
        audio_play_sound(sndMakerShieldCollect, 0, 0);
    }
}
