///scrBallisticAngle(startX,startY,endX,endY,velocity,grav,trajectory);
var startX=argument0;
var startY=argument1;
var endX=argument2;
var endY=argument3;
var v0=argument4;
var g=argument5;
var trajectory=argument6;
//-1 = high trajectory, 1 = low trajectory
var newAngle=0;
var y1=startY-endY;
var x1=endX-startX;
var fact=g*sqr(x1);
var distfact=2*fact*(fact/(2*sqr(v0))+y1)/sqr(v0);
if(distfact>sqr(x1)) {
    newAngle=darctan2(sqr(v0)*abs(x1),fact*sign(x1));
}else{
    newAngle=darctan2(sqr(v0)*(abs(x1)-trajectory*sqrt(sqr(x1)-distfact)),fact*sign(x1));
}
return newAngle;
