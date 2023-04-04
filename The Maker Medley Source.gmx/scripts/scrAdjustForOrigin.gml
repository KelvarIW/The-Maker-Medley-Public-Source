///scrAdjustForOrigin(oriXFrom, oriYFrom, oriXTo, oriYTo, rotation, [xscale], [yscale])
// based on scrChangeOrigin
// accounts for the sprite position "movement" from using that function

var _xFrom, _xTo, _yFrom, _yTo, rotation;
_xFrom = argument[0];
_xTo = argument[1];
_yFrom = argument[2];
_yTo = argument[3];
rotation = argument[4];

var _xScale, _yScale;
if (argument_count > 5){
    _xScale = argument[5];
}else{
    _xScale = 1;
}
if (argument_count > 6){
    _yScale = argument[6];
}else{
    _yScale = 1;
}

var _coords = scrChangeOriginScaled(_xFrom, _xTo, _yFrom, _yTo, rotation, _xScale, _yScale);
x -= _coords[0];
y -= _coords[1];
