///scrFinalSudnepStars(centX, centY, rad, points, pointLength, angle, density, obj, index)
var _CenterX = argument[0];
var _CenterY = argument[1];
var _Center = argument[2];
var _PointNum = argument[3];
var _ArmLength = argument[4];
var _AngleOffset = argument[5];
var _NumObjectsPerArm = argument[6];
var _Object = argument[7];
var _OTag = argument[8];

if (_NumObjectsPerArm < 3)
    _NumObjectsPerArm = 3;
if ((_NumObjectsPerArm % 2) == 0)
    _NumObjectsPerArm += 1;
_AngleBetweenArms = (360 / _PointNum);
_AngleBetweenObjects = (_AngleBetweenArms / _NumObjectsPerArm);
_DistBetweenArmObjs = (_ArmLength / floor((_NumObjectsPerArm / 2)));
_AngleOffset -= (90 - (_AngleBetweenObjects / 2));
for (var i = 0; i < _PointNum; i += 1)
{
    for (var j = 0; j < floor((_NumObjectsPerArm / 2)); j += 1)
    {
        AAngle = (((i * _AngleBetweenArms) + (j * _AngleBetweenObjects)) + _AngleOffset);
        ax = (_CenterX + (cos(degtorad(AAngle)) * (_Center + (j * _DistBetweenArmObjs))));
        ay = (_CenterY - (sin(degtorad(AAngle)) * (_Center + (j * _DistBetweenArmObjs))));
        a = instance_create(ax, ay, _Object);
        a.index = _OTag;
        a.xstart = _CenterX;
        a.ystart = _CenterY;
    }
    AAngle = (((i * _AngleBetweenArms) + (floor((_NumObjectsPerArm / 2)) * _AngleBetweenObjects)) + _AngleOffset);
    ax = (_CenterX + (cos(degtorad(AAngle)) * (_Center + _ArmLength)));
    ay = (_CenterY - (sin(degtorad(AAngle)) * (_Center + _ArmLength)));
    a = instance_create(ax, ay, _Object);
    a.index = _OTag;
    a.xstart = _CenterX;
    a.ystart = _CenterY;
    for (j = (floor((_NumObjectsPerArm / 2)) + 1); j < _NumObjectsPerArm; j += 1)
    {
        AAngle = (((i * _AngleBetweenArms) + (j * _AngleBetweenObjects)) + _AngleOffset);
        ax = (_CenterX + (cos(degtorad(AAngle)) * (_Center + (((_NumObjectsPerArm - 1) - j) * _DistBetweenArmObjs))));
        ay = (_CenterY - (sin(degtorad(AAngle)) * (_Center + (((_NumObjectsPerArm - 1) - j) * _DistBetweenArmObjs))));
        a = instance_create(ax, ay, _Object);
        a.index = _OTag;
        a.xstart = _CenterX;
        a.ystart = _CenterY;
    }
}
