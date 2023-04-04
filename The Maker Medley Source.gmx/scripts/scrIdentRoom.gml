//scrIdentRoom([room])
var _room = room;
if (argument_count > 0){
    _room = argument[0];
}

with (instance_create (0, 0, objMakerIdent)){
    name = scrGetRoomInfo(_room, 0);
    maker = scrGetRoomInfo(_room, 1);

    topIconSpr = sprMakerTags;
    topIconSubimg = scrGetRoomInfo(_room, 4);
    topIconScale = 1;
    
    botIconSpr = sprTitleMakers;
    botIconSubimg = scrGetRoomInfo(_room, 2);
    botIconScale = -1;
    botIconYOff = -2;
}
