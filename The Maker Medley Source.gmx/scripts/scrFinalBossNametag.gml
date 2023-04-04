///scrFinalBossNametag(x, y, index)
var _x = argument[0];
var _y = argument[1];
var _ind = argument[2];
var _str = scrGetAttackInfo(rFinalBoss_1, _ind, 1);

var _inst = instance_create(_x, _y, objFinalName);
_inst.following = id;
_inst.message = _str;
_inst.depth = (depth-2);
return (_inst);
