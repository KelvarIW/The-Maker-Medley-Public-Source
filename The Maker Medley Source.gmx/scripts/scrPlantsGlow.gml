///scrPlantsGlow(current, max)
//Converts glow frame numbers into glow opacity (ranging from [0 -> 0.5])
//glow effect increases from max to peak; decreases from peak to 0
var _cur = argument[0], _peak = argument[1]*0.6; _max = argument[1];
var _alpha = 0;
if (_max == 0){
    show_debug_message("WARNING!: Divide by zero error in scrPlantsGlow for " + object_get_name(object_index));
    exit;
}
if (_cur <= _peak){
    _alpha = (_cur/_peak);
}else{
    _alpha = (1 - ((_cur - _peak) / (_max - _peak)));
}

_alpha /= 2;
return(_alpha);
