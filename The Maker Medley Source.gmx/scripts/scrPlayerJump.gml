if (place_meeting(x, y+(global.grav), objBlock) && !place_meeting(x, y-(global.grav), objBlock)){
    if (!place_meeting(x, y, objWater)){
        repeat(irandom_range(3,5)*image_yscale){
            with (instance_create(x, y+5*image_yscale, objMakerCirclePart)){
                color = c_gray;
                image_alpha = random_range(0.35, 0.55);
                vspeed = random_range(-1.2, -0.67);
                hspeed = random_range(-1.2, 1.2);
                rad = random_range(2, 3.5)*other.image_yscale;
                radDec = rad/20;
            }
        }
    }
}else if (djump == 1 && !place_meeting(x, y, objWater) && !place_meeting(x, y, objWater2) && global.playerJumps != 1){
    repeat(irandom_range(3,5)*image_yscale){
        with (instance_create(x, y+5*image_yscale, objMakerCirclePart)){
            color = c_ltgray;
            image_alpha = random_range(0.56, 0.8);
            vspeed = random_range(1.7, 2.3)*global.grav;
            hspeed = random_range(-2.1, 2.1);
            friction = random_range(0.075, 0.15);
            fade = random_range(-0.05, -0.07);
            rad = random_range(3, 5)*other.image_yscale;
            radDec = rad/40;
        }
    }
}

//Actual jumping
if (place_meeting(x, y+(global.grav), objBlock) || onPlatform || place_meeting(x, y+(global.grav), objWater))
{
    if (image_yscale == 2)
        vspeed = -15.75;
    else
        vspeed = -jump;
    djump = 1;
    reverseCoyoteFrames = 5;
    if (place_meeting(x, y+(global.grav), objWater)){
        audio_sound_pitch(audio_play_sound(sndMakerKidSplash, 0, 0), 1.22 + (PITCH_FLUCT-1));
    }else{
        audio_play_sound(sndJump, 0, 0);  //audio_sound_pitch(audio_play_sound(sndJump, 0, 0), PITCH_FLUCT);
    }
}
else if ((global.playerJumps != 1 && djump > 0) || place_meeting(x,y+(global.grav),objWater2) || global.infJump || global.debugInfJump) // ADDED: single jump only check, and CHANGED djump == 1 to djump > 0
{
    if (image_yscale == 2)
        vspeed = -13;
    else
        vspeed = -jump2;
    sprite_index = sprPlayerJump;
    
    if (place_meeting(x,y+(global.grav),objWater2)){
        audio_sound_pitch(audio_play_sound(sndMakerKidSplash, 0, 0), PITCH_FLUCT);
    }else{
        audio_play_sound(sndDJump, 0, 0);  //audio_sound_pitch(audio_play_sound(sndDJump, 0, 0), PITCH_FLUCT);
    }
    
    if (!place_meeting(x,y+(global.grav),objWater3)) {
        // take away the player's double jump
        // CHANGED: This line used to be djump = 0, but was changed to allow for triple jump.
        if (global.playerJumps == 2) {
            djump = 0;
        } else if (global.playerJumps == 3) {
            djump -= 0.5;
            if (djump == 0){
                repeat(irandom_range(3,5)){
                    instance_create(x, y, objMakerStarPart);
                }
            }
        }
    } else
        djump = 1;  //replenish djump if touching water3
}
