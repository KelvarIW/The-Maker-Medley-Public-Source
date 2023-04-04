///scrPlantsEnemyShoot(bulletX, bulletY, target, bulletSpeed);
var _x = argument[0];
var _y = argument[1];
var _target = argument[2];
var _spd = argument[3];

if (instance_exists(_target) && !_target.dead){
    if (_x < _target.x){
        _x = _target.x;
    }
    
    var _bullet;
    _bullet = instance_create(_x, _y, objPlantsEnemyBullet);
    _bullet.row = row;
    _bullet.yBase = (160 + row*64 + 56);
    _bullet.direction = point_direction(_bullet.x, _bullet.y, _target.x, _target.y+16);
    _bullet.speed = _spd;
    return (_bullet);
}
return (noone);
