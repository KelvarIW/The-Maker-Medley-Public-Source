///scrPlantsSpawnEnemy(row, object, [subtype], [wave]);
/*
Enemies:
    Fruit
    Fruit w/ Brown Block [subtype = 1]
    Fruit w/ Factory Block [subtype = 2]
    Hyper Fruit
    Flying Spike
    Miku
    The Guy
*/

var _inst, _row, _obj, _subtype, _wave;
_row = clamp(argument[0], 0, 5);  // prevent rounding errors
_obj = argument[1];
if (argument_count > 2){
    _subtype = argument[2];
}else{
    _subtype = 0;
}
if (argument_count > 3){
    _wave = argument[3];
}else{
    _wave = -1;
}

if (_obj == objPlantsMiku){
    _row = clamp(roundSane(1 + (3 * _row/5)), 1, 4);  // prevent spawning on the top or bottom rows  (if this happens, one of the cherries will not spawn)
}

_inst = instance_create(704, 192+64*_row, _obj);
_inst.subtype = _subtype;
_inst.row = _row;
_inst.wave = _wave;

var _teleportPart = make_color_rgb(228, 59, 68)
repeat(irandom_range(14, 18)){
    with (instance_create(704, 192+64*_row, objMakerCirclePart)){
        color = _teleportPart;
        curve = random_range(1.3, 2.78);
        visible = false;
    }
}
audio_sound_pitch(audio_play_sound(sndCherry, 0, 0), random_range(0.725, 0.875));
