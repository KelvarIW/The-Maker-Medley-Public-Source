if (global.playerPower != 0 && !collision_point(x, y, objSave, true, true)){
    if (global.playerPower == 1){
        var _canTeleport = (coopTeleportUses > 0);
        if (room == rStage04New_3 && _canTeleport){
            with (objMakerCoopDestination){
                event_user(0);
                if (image_alpha < 1){_canTeleport = false;}
            }
        }
        
        if (_canTeleport){
            x += 112*xScale;
            xprevious = x;
            coopTeleportUses --;
            repeat(10){
                with (instance_create(x, y, objMakerCirclePart)){
                    rad = random_range(2, 4);
                    radDec = 0;
                    color = c_white;
                    fade = -0.1;
                    depth = 1001;
                    speed = random_range(3, 4.75);
                    friction = random_range(0.07, 0.11);
                }
            }
            audio_play_sound(sndMakerCoopTeleport, 0, 0);
        }
    }else if (global.playerPower == 2){
        if (!instance_exists(objMakerTelePlayer)){
            var t_tele = instance_create(x, y, objMakerTelePlayer);
            t_tele.xScale = xScale;
            with (t_tele){
                event_user(0);
                image_index = image_index;
            }
        }
    }
}else if (instance_number(objBullet) < 4){
    var bulletY = y;
    if (global.dotkid) {
        bulletY -= 2*global.grav;
    }
    instance_create(x,bulletY,objBullet);
    audio_play_sound(sndShoot,0,false);
}
