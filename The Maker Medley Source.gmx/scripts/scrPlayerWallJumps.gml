//vine checks
var notOnBlock = (place_free(x,y+(global.grav)));
var onVineL  = ((xScale == -1 || place_meeting(x-1, yprevious, objWalljumpL)) && place_meeting(x-1,y,objWalljumpL) && notOnBlock);
var onVineR  = ((xScale == 1 || place_meeting(x+1, yprevious, objWalljumpR)) && place_meeting(x+1,y,objWalljumpR) && notOnBlock);
var onVineL2 = ((xScale == -1 || place_meeting(x-1, yprevious, objRedVineL)) && place_meeting(x-1,y,objRedVineL) && notOnBlock);
var onVineR2 = ((xScale == 1 || place_meeting(x+1, yprevious, objRedVineR)) && place_meeting(x+1,y,objRedVineR) && notOnBlock);
var onVineL3 = ((xScale == -1 || place_meeting(x-1, yprevious, objIceVineL)) && place_meeting(x-1,y,objIceVineL) && notOnBlock);
var onVineR3 = ((xScale == 1 || place_meeting(x+1, yprevious, objIceVineR)) && place_meeting(x+1,y,objIceVineR) && notOnBlock);
var onVineL4 = ((xScale == -1 || place_meeting(x-1, yprevious, objBlueVineL)) && place_meeting(x-1,y,objBlueVineL) && notOnBlock);
var onVineR4 = ((xScale == 1 || place_meeting(x+1, yprevious, objBlueVineR)) && place_meeting(x+1,y,objBlueVineR) && notOnBlock);
var onVineL5 = ((xScale == -1 || place_meeting(x-1, yprevious, objYellowVineL)) && place_meeting(x-1,y,objYellowVineL) && notOnBlock);
var onVineR5 = ((xScale == 1 || place_meeting(x+1, yprevious, objYellowVineR)) && place_meeting(x+1,y,objYellowVineR) && notOnBlock);
var onVineL6 = ((xScale == -1 || place_meeting(x-1, yprevious, objPurpleVineL)) && place_meeting(x-1,y,objPurpleVineL) && notOnBlock);
var onVineR6 = ((xScale == 1 || place_meeting(x+1, yprevious, objPurpleVineR)) && place_meeting(x+1,y,objPurpleVineR) && notOnBlock);
var onVineL7a= ((xScale == -1 || place_meeting(x-1, yprevious, objWhiteVineL)) && place_meeting(x-1,y,objWhiteVineL) && notOnBlock && global.vine7=0);
var onVineR7a= ((xScale == 1 || place_meeting(x+1, yprevious, objWhiteVineR)) && place_meeting(x+1,y,objWhiteVineR) && notOnBlock && global.vine7=0);
var onVineL7b= ((xScale == -1 || place_meeting(x-1, yprevious, objBlackVineL)) && place_meeting(x-1,y,objBlackVineL) && notOnBlock && global.vine7=1);
var onVineR7b= ((xScale == 1 || place_meeting(x+1, yprevious, objBlackVineR)) && place_meeting(x+1,y,objBlackVineR) && notOnBlock && global.vine7=1);
var onVineL8 = ((xScale == -1 || place_meeting(x-1, yprevious, objFireVineL)) && place_meeting(x-1,y,objFireVineL) && notOnBlock);
var onVineR8 = ((xScale == 1 || place_meeting(x+1, yprevious, objFireVineR)) && place_meeting(x+1,y,objFireVineR) && notOnBlock);

//walljumps
count += 1;

if (onVineL || onVineR){
    if (onVineR){
        xScale = -1;
    }else{
        xScale = 1;
    }
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
    var _pressedAway = ((onVineL && scrButtonCheck(global.rightButton)) || (onVineR && scrButtonCheck(global.leftButton)));
    //pressed away from the vine
    if ((global.vineMode != 2 && scrButtonCheckPressed(global.jumpButton)) || (global.vineMode != 3 && (_pressedAway && scrButtonCheck(global.jumpButton)))){  //jumping off vine
        if (onVineR){
            hspeed = -15;
        }else{
            hspeed = 15;
        }
        repeat(irandom_range(5,8)){instance_create(x, y, objMakerVineLeaf);}
        vspeed = -9 * global.grav;
        audio_play_sound(sndWallJump,0,false);
        audio_sound_pitch(audio_play_sound(sndMakerVineGreenJump, 0, 0), PITCH_FLUCT);
        sprite_index = sprPlayerJump;
        wasOnVine = false;
    }else if (_pressedAway){   //moving off vine
        if (onVineR){
            hspeed = -3;
        }else{
            hspeed = 3;
        }
        sprite_index = sprPlayerFall;
    }
}

if (onVineL5 || onVineR5){  //sticky vine
    gravity=0;
    if (onVineR5)
        xScale = -1;
    else
        xScale = 1;
    
    vspeed = 0;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
    var _pressedAway = ((onVineL5 && scrButtonCheck(global.rightButton)) || (onVineR5 && scrButtonCheck(global.leftButton)));
    //pressed away from the vine
    if ((global.vineMode != 2 && scrButtonCheckPressed(global.jumpButton)) || (global.vineMode != 3 && (_pressedAway && scrButtonCheck(global.jumpButton)))){  //jumping off vine
        if (onVineR5){
            hspeed = -15;
        }else{
            hspeed = 15;
        }
        vspeed = -9*global.grav;
        audio_play_sound(sndWallJump,0,false);
        sprite_index = sprPlayerJump;
        wasOnVine = false;
        
        //IWMaker Effect
        t_vineTouching = instance_place(x + 1, y, objYellowVineR);
        if (t_vineTouching == noone) t_vineTouching = instance_place(x - 1, y, objYellowVineL);
        if (t_vineTouching != noone){
            with (t_vineTouching){
                audio_sound_pitch(audio_play_sound(sndMakerVineYellowJump, 0, 0), PITCH_FLUCT);
                if (sprite_index == sprMakerVineStickL) t_effectX = x + 32;
                else t_effectX = x;
                t_effectY = other.y;
                if (t_effectY < y + 13 && !place_meeting(x, y-1, object_index)) t_effectY = y + 13;
                else if (t_effectY > y + 19 && !place_meeting(x, y+1, object_index)) t_effectY = y + 19;
                t_effect = instance_create(t_effectX, t_effectY, objGeneralNonkiller);
                t_effect.sprite_index = sprMakerVineYellowJump;
                t_effect.image_speed = 14/room_speed;
                t_effect.depth = -11;
                if (sprite_index == sprMakerVineStickR) t_effect.image_xscale = -1;
                t_effect.animOnce = true;
            }
        }
    }else if (_pressedAway){   //moving off vine
        if (onVineR5){
            hspeed = -3;
        }else{
            hspeed = 3;
        }
        sprite_index = sprPlayerFall;
    }
}

//Past here is the custom stuff from jungle adventure

if (onVineL3 || onVineR3)
{
    if (onVineR3)
        xScale = -1;
    else
        xScale = 1;
    
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
   //pressed away from the vine
    if (onVineL3 && scrButtonCheck(global.rightButton)) || (onVineR3 && scrButtonCheck(global.leftButton))
    {
        if (scrButtonCheck(global.jumpButton))  //jumping off vine
        {
            if (onVineR3)
                hspeed = -15;
            else
                hspeed = 15;
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
            wasOnVine = false;
        }
        else    //moving off vine
        {
            if (onVineR3)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
    }
}
if (onVineL2 || onVineR2)
{
    if (onVineR2)
        xScale = -1;
    else
        xScale = 1;
    
        
    vspeed=-2*global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
   //pressed away from the vine
    if (onVineL2 && scrButtonCheck(global.rightButton)) || (onVineR2 && scrButtonCheck(global.leftButton))
    {
        if (scrButtonCheck(global.jumpButton))  //jumping off vine
        {
            if (onVineR2)
                hspeed = -15;
            else
                hspeed = 15;
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
            wasOnVine = false;
        }
        else    //moving off vine
        {
            if (onVineR2)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
    }
}
if (onVineL4 || onVineR4)
{
    if (onVineR4)
        xScale = -1;
    else
        xScale = 1;
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
    //pressed away from the vine
    if (onVineL4 && scrButtonCheck(global.rightButton)) || (onVineR4 && scrButtonCheck(global.leftButton))
    {
        if (scrButtonCheck(global.jumpButton))  //jumping off vine
        {
            if (onVineR4)
                hspeed = -15;
            else
                hspeed = 15;
            if (global.grav==1){
            scrFlipGravNoDjump();
            vspeed = 9;
            }else{
            scrFlipGravNoDjump();
            vspeed = -9;
            }
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
            wasOnVine = false;
        }
        else    //moving off vine
        {
            if (onVineR4)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
    }
}

if (onVineL6 || onVineR6)
{
    if (onVineR6)
        xScale = -1;
    else
        xScale = 1;
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
   //pressed away from the vine
    if (onVineL6 && scrButtonCheck(global.rightButton)) || (onVineR6 && scrButtonCheck(global.leftButton))
    {
        if (scrButtonCheck(global.jumpButton))  //jumping off vine
        {
            if (onVineR6)
                hspeed = -15;
            else
                hspeed = 15;
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
            wasOnVine = false;
        }
        else    //moving off vine
        {
            if (onVineR6)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
        lowGravVine = true
        vinegrav=1;
    }
}

//Messy code
if (place_meeting(x,y+(global.grav),objBlock) || onPlatform) {
    if vinegrav=1 {
        lowGravVine = false
        vinegrav=0;
    }
    if vinespeed=1 {
        maxSpeed=3; vinespeed=0;
    }
}

if (onVineL7a || onVineR7a)
{
    if (onVineR7a)
        xScale = -1;
    else
        xScale = 1;
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
   //pressed away from the vine
    if (onVineL7a && scrButtonCheck(global.rightButton)) || (onVineR7a && scrButtonCheck(global.leftButton))
    {
        if (scrButtonCheck(global.jumpButton))  //jumping off vine
        {
            if (onVineR7a)
                hspeed = -15;
            else
                hspeed = 15;
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
            global.vine7=1;
            wasOnVine = false;
        }
        else    //moving off vine
        {
            if (onVineR7a)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
    }
}
if (onVineL7b || onVineR7b)
{
    if (onVineR7b)
        xScale = -1;
    else
        xScale = 1;
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
    //pressed away from the vine
    if (onVineL7b && scrButtonCheck(global.rightButton)) || (onVineR7b && scrButtonCheck(global.leftButton))
    {
        if (scrButtonCheck(global.jumpButton))  //jumping off vine
        {
            if (onVineR7b)
                hspeed = -15;
            else
                hspeed = 15;
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
            global.vine7=0;
            wasOnVine = false;
        }
        else    //moving off vine
        {
            if (onVineR7b)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
    }
}

if (onVineL8 || onVineR8)
{
    if (onVineR8)
        xScale = -1;
    else
        xScale = 1;
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
    //pressed away from the vine
    if (onVineL8 && scrButtonCheck(global.rightButton)) || (onVineR8 && scrButtonCheck(global.leftButton))
    {
        if (scrButtonCheck(global.jumpButton))  //jumping off vine
        {
            if (onVineR8)
                hspeed = -15;
            else
                hspeed = 15;
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
            wasOnVine = false;
        }
        else    //moving off vine
        {
            if (onVineR8)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
        maxSpeed=6
        vinespeed=1;
    }
}
if vinespeed=1 && count mod 3 = 1{
    instance_create(x,y,objFirePart);
}
