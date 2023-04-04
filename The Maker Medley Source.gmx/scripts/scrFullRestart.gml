///scrFullRestart()
//Restart all screen values
//Triggered with Control + Restart

global.playerPower = 0;
global.playerScale = 1;
global.playerXScale = 1;

global.playerJumps = 2;
global.grav = 1;
global.flappyStarted = false;
fullRestart = false;
bkXScroll = 0;
bkYScroll = 0;

if (room == rStage01Dice || room == rStage02Vovka){
    instance_create(400, 304, objSingleJumpFlash);
    global.playerJumps = 1;
}else if (room == rStage01Onetwentyeight){
    for(var i=0; i<=3; i++){
        global.QuadCoin[i] = 0;
    }
    with (objMakerBlueCoinSaver)
        instance_destroy();
    with (objS1_128ExpandBlock){
        image_alpha = 0;
        if (instance_exists(block)){
            instance_destroy(block);
            block = noone;
        }
    }
}else if (room == rStage02Klamy){
    // will only overwrite save data if player saves
    global.klamySaves = global.klamyMax;
    global.klamySaveCurr = 0;
    // do not change global.saveKlamySaveCurr;
    for(var i=0;i<=global.klamyMax;i++;){
        global.klamySaveCoord[i, 0] = -1; //x
        global.klamySaveCoord[i, 1] = -1; //y
    }
}else if (room == rStage04New_3){
    global.S4KlamySaves = global.S4KlamyMax;
    global.S4KlamySaveCurr = 0;
    // do not change global.saveS4KlamySaveCurr;
    global.klamySaveCoord[3, 0] = -1; //x
    global.klamySaveCoord[3, 1] = -1; //y
}

if (instance_exists(objPlayer) && instance_exists(objPlayerStart)){
    objPlayer.x = objPlayerStart.x + 17;
    objPlayer.y = objPlayerStart.y + 23;
    objPlayer.image_xscale = global.playerScale;
    objPlayer.image_yscale = global.playerScale;
}
global.count = 0;

audio_play_sound(sndMakerRoomRestart, 0, 0);
