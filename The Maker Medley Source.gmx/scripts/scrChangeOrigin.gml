///scrChangeOrigin(oriXFrom, oriYFrom, oriXTo, oriYTo, rotation)
// oriXFrom, oriYFrom: actual origin
// oriXTo, oriYTo: desired origin to emulate
// rotation: rotation to account for

var xDiff, yDiff, ang, coords;
xDiff = argument[0] - argument[2];
yDiff = -(argument[1] - argument[3]);
ang = argument[4];
//calculate rotated coordinates
coords[0] = (xDiff * dcos(ang) - yDiff * dsin(ang));
coords[1] = -(xDiff * dsin(ang) + yDiff * dcos(ang));
return coords; //add these coordinates to the position
