///flips the current gravity

//set gravity
global.grav = -global.grav;

//flip the player
with (objPlayer)
{
    vspeed = 0;
    
    jump = abs(jump) * global.grav;
    jump2 = abs(jump2) * global.grav;
    gravity = abs(gravity) * global.grav;
    
    scrSetPlayerMask();
    
    if !global.dotkid {
        y += 4 * global.grav;
    }
}
