///scrChangeOriginScaled(oriXFrom, oriYFrom, oriXTo, oriYTo, rotation, xScale, yScale)
// oriXFrom, oriYFrom: actual origin
// oriXTo, oriYTo: desired origin to emulate
// rotation: rotation to account for
// xScale, yScale: scale to account for

var _xScale = argument[5];
var _yScale = argument[6];

var _xDiff, _yDiff, _ang, _coords;
_xDiff =  (argument[0] - argument[2]) * _xScale;
_yDiff = -(argument[1] - argument[3]) * _yScale;
_ang = argument[4];
//calculate rotated coordinates
_coords[0] = (_xDiff * dcos(_ang) - _yDiff * dsin(_ang));
_coords[1] = -(_xDiff * dsin(_ang) + _yDiff * dcos(_ang));
return _coords; //add these coordinates to the position
