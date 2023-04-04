///scrIdentAttack(Boss Room, Index)
var _boss = argument[0];
var _index = argument[1];
var _tag = scrGetAttackInfo(_boss, _index, 2);
with (instance_create(0, 0, objMakerIdent)){
    name = scrGetAttackInfo(_boss, _index, 0);
    maker = scrGetAttackInfo(_boss, _index, 1);
    
    if (_tag >= 0){
        topIconSpr = sprMakerTags;
        topIconSubimg = _tag;
        topIconScale = 1;
    }
    botIconSpr = sprTitleMakers;
    botIconSubimg = scrMakerToKidSubimg(maker);
    botIconScale = -1;
    botIconYOff = -2;
    
    persistent = false;
}
